import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/avinoc_staking_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc20_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc721_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/nomoDevToken_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/demoContract.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/crypto/evm/function_argument_decoding.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'dart:math';

List<ContractAbi> abiList = [
  contractAbiNomoDevToken,
  contractAbiErc20,
  contractAbiErc721,
  avinocStakingAbi,
  contractAbiDemoContract,
];

typedef FunctionArg = ({
  String name,
  String type,
  dynamic value,
});

class FunctionSignature extends Equatable {
  final String name;
  final Map<String, String>? parameters;
  final List<FunctionArg>? args;

  FunctionSignature(this.name, this.parameters, this.args);

  @override
  List<Object?> get props => [name, parameters, args];

  static List<FunctionArg> decodeDataValues(
      Uint8List data, Map<String, String> parameters) {
    final args = <FunctionArg>[];
    int offset = 4;
    int max_offset = 4;
    parameters.forEach((key, value) {
      final sublist = data.sublist(offset, offset + 32).toHex;

      final arg = switch (value) {
        "address" => "0x" + sublist.substring(24),
        "uint8" => sublist.toInt,
        "int" => sublist.toBigIntFromHex,
        "uint" => sublist.toBigIntFromHex,
        "uint256" => sublist.toBigIntFromHex,
        "bytes" => () {
            final result = decodeByte(offset, data, max_offset);
            max_offset = result.offset;
            return result.value;
          }.call(),
        "bytes[]" => () {
            final result = decodeBytesArray(offset, max_offset, data);
            max_offset = result.offset;
            return result.value;
          }.call(),
        "uint256[]" => () {
            final result = decodeUint256Array(offset, data);
            offset = result.offset;
            return result.value;
          }.call(),
        "bool" => sublist.toBigIntFromHex == BigInt.from(1) ? true : false,
        _ => "Not implemented type: $value",
      };

      offset += 32;

      args.add((
        name: key,
        type: value,
        value: arg,
      ));
    });

    max_offset = max(max_offset, offset);

    if (max_offset != data.length) {
      throw Exception("offset is not equal to data length");
    }

    return args;
  }

  factory FunctionSignature.fromData(Uint8List data) {
    if (data.length < 4) {
      throw Exception("data length must be at least 4");
    }

    final String functionSignature = hex.encode(data.sublist(0, 4));

    final contractFunctions =
        abiList.expand((element) => element.functions).toList();

    final contractFunction = contractFunctions.firstWhereOrNull((element) {
      String readableFunctionSignature = element.name +
          "(${element.parameters.map((e) => e.type.name).join(",")})";

      Uint8List bytes = Uint8List.fromList(
          hex.decode(hex.encode(readableFunctionSignature.codeUnits)));

      String functionSignatureHash = hex.encode(keccak256(bytes));

      if (functionSignatureHash.substring(0, 8) == functionSignature) {
        return true;
      } else {
        return false;
      }
    });

    if (contractFunction == null) {
      throw Exception("No contract function found");
    }

    final params = Map<String, String>.fromIterable(
      contractFunction.parameters,
      key: (e) => e.name,
      value: (e) => e.type.name,
    );

    return FunctionSignature(
      contractFunction.name,
      params,
      decodeDataValues(data, params),
    );
  }

  static Future<FunctionSignature> fetchFunctionSignature(
      Uint8List data) async {
    final response = await http.get(Uri.parse(
        "https://www.4byte.directory/api/v1/signatures/?hex_signature=0x${hex.encode(data.sublist(0, 4))}"));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      final fetchedFunctionSignature =
          getLowestIdSignature(responseData["results"], data);

      if (fetchedFunctionSignature == null) {
        throw Exception("No function signature found");
      }

      return fetchedFunctionSignature;
    } else {
      throw Exception('Failed to fetch function signature');
    }
  }
}

FunctionSignature? getLowestIdSignature(List<dynamic> results, Uint8List data) {
  results.sort((a, b) => a["id"].compareTo(b["id"]));

  for (final value in results) {
    final fetchedFunctionSignature = value["text_signature"];

    RegExp regex = RegExp(r"^[^(]*\(([^)]*)\)");

    String match = regex.firstMatch(fetchedFunctionSignature)?.group(1) ?? "";

    List<String> types = match.split(",");

    final params = Map<String, String>.fromIterables(
      types.asMap().entries.map((entry) => entry.key.toString()),
      types,
    );

    regex = RegExp(r"\(([^)]*)\)");

    List<FunctionArg> args = <FunctionArg>[];

    try {
      args = FunctionSignature.decodeDataValues(data, params);

      final functionSignature = FunctionSignature(
        fetchedFunctionSignature.replaceAll(regex, ""),
        params,
        args,
      );

      return functionSignature;
    } catch (e) {
      print(e);
    }

    throw Exception("No function signature found");
  }
  return null;
}
