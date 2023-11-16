import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc20_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/nomoDevToken_contract.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

List<ContractAbi> abiList = [
  contractAbiNomoDevToken,
  contractAbiErc20,
  contractAbiErc20,
];

class FunctionSignature {
  final String name;
  final Map<String, String>? parameters;

  FunctionSignature(this.name, this.parameters);

  static FunctionSignature decodeDataField(Uint8List data) {
    if (data.length < 4) {
      return FunctionSignature("no contractSignature found!", {});
    }

    final String functionSignature = hex.encode(data.sublist(0, 4));

    final contractFunctions =
        abiList.expand((element) => element.functions).toList();

    final contractFunction = contractFunctions.firstWhere((element) {
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

    return FunctionSignature(
      contractFunction.name,
      Map.fromIterable(contractFunction.parameters,
          key: (e) => e.name, value: (e) => e.type.name),
    );
  }
}
