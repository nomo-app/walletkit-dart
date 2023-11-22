import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/avinoc_staking_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc20_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc721_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/nomoDevToken_contract.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

List<ContractAbi> abiList = [
  contractAbiNomoDevToken,
  contractAbiErc20,
  contractAbiErc721,
  avinocStakingAbi,
];

typedef FunctionArg = ({
  String name,
  String type,
  dynamic value,
});

class FunctionSignature {
  final String name;
  final Map<String, String>? parameters;
  final List<FunctionArg>? args;

  FunctionSignature(this.name, this.parameters, this.args);

  static List<FunctionArg> decodeDataValues(
      Uint8List data, Map<String, String> parameters) {
    final args = <FunctionArg>[];
    int offset = 4;
    parameters.forEach((key, value) {
      final sublist = data.sublist(offset, offset + 32).toHex;

      final arg = switch (value) {
        "address" => "0x" + sublist.substring(24),
        "uint8" => sublist.toInt,
        "int" => sublist.toBigIntFromHex,
        "uint" => sublist.toBigIntFromHex,
        "uint256" => sublist.toBigIntFromHex,
        "string" => sublist,
        "uint256[]" => () {
            final field_length = data
                .sublist(offset, offset + 32)
                .toHex
                .substring(56)
                .toBigIntFromHex
                .toInt();

            offset += 32;

            final length = data
                .sublist(offset, offset + 32)
                .toHex
                .substring(56)
                .toBigIntFromHex
                .toInt();

            offset += 32;

            final values = [
              for (int i = 0; i < length; i++)
                data
                    .sublist(offset + i * field_length,
                        offset + (i + 1) * field_length)
                    .toHex
                    .toBigIntFromHex
            ];

            return values;
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
      return FunctionSignature(
        "unknown",
        null,
        decodeDataValues(data, {}),
      );
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
}
