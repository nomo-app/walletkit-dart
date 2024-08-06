import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_abi.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

abstract class InternalContract {
  final ContractABI abi;
  final String contractAddress;
  final EvmRpcInterface rpc;

  const InternalContract({
    required this.abi,
    required this.contractAddress,
    required this.rpc,
  });

  Future<String> interact({
    required ContractFunction function,
    required List<dynamic> params,
    required Uint8List seed,
    required String sender,
    EvmFeeInformation? feeInfo,
  }) async {
    final functionData = function.encodeFunction(params).hexToBytes;

    return await rpc.buildAndBroadcastTransaction(
      sender: sender,
      recipient: contractAddress,
      seed: seed,
      feeInfo: feeInfo,
      data: functionData,
      value: BigInt.zero,
    );
  }

  Future<String> read({
    required ContractFunction function,
    BlockNum? atBlock,
    required List<dynamic> params,
  }) async {
    final data = function.encodeFunction(params).hexToBytes;
    return rpc.call(contractAddress: contractAddress, data: data);
  }
}
