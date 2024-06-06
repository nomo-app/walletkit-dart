import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract.dart';
import 'package:walletkit_dart/src/crypto/evm/evm_client.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

abstract class InternalContract {
  final Contract self;
  final Uint8List seed;
  final String contractAddress;
  final EvmRpcClient client;

  InternalContract(this.self, this.seed, this.contractAddress, this.client);

  Future<String> send({
    required ContractFunction function,
    required RawEVMTransaction rawTx,
    required Uint8List seed,
    required String contractAddress,
    required EvmRpcClient client,
  }) async {
    // String functionData = "";
    // final selector = function.functionSelector;
    // functionData += selector;

    // for (var param in function.parameters) {
    //   final encodedParam = switch (param.type) {
    //     FunctionParamType.address => param.type.encodeParameter(rawTx.to),
    //     FunctionParamType.uint256 => param.type.encodeParameter(rawTx.value),
    //     FunctionParamType.uint => param.type.encodeParameter(rawTx.value),
    //     _ => throw UnimplementedError(),
    //   };
    //   functionData += encodedParam;
    // }
    final functionData = function.encodFunction([rawTx.to, rawTx.value]);

    final encodedFunctionData = functionData.hexToBytes;
    final tx = rawTx.copyWith(
        data: encodedFunctionData, to: contractAddress, value: BigInt.zero);

    final privateKey = derivePrivateKeyETH(seed);
    final signedTx = InternalEVMTransaction.signTransaction(tx, privateKey);

    return signedTx.serializedMessageHex;
  }

  // Future<String> read({
  //   required ContractFunction function,
  //   BlockNum? atBlock,
  //   required EvmRpcClient client,
  // }) async {
  //   return client.callRaw(contractAddress: contractAddress, data: data);
  // }
}
