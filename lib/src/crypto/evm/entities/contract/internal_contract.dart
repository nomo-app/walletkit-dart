import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/entities/block_number.dart';
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
    required ContractFunctionWithValues function,
    required Uint8List seed,
    required String sender,
    EvmFeeInformation? feeInfo,
    BigInt? value,
    List<AccessListItem>? accessList,
  }) async {
    final functionData = function.buildDataField();

    if (value != null) {
      assert(
        function.stateMutability == StateMutability.payable,
        'Function is not payable and cannot accept a value',
      );
    } else {
      assert(
        function.stateMutability == StateMutability.nonpayable,
        'Function is payable and requires a value to be sent',
      );
    }

    return await rpc.buildAndBroadcastTransaction(
      sender: sender,
      recipient: contractAddress,
      seed: seed,
      feeInfo: feeInfo ?? EvmFeeInformation.zero,
      data: functionData,
      value: value ?? BigInt.zero,
      accessList: accessList,
    );
  }

  Future<RawEvmTransaction> buildTransactionForFunction({
    required ContractFunctionWithValues function,
    required String sender,
    EvmFeeInformation? feeInfo,
    BigInt? value,
  }) async {
    final functionData = function.buildDataField();

    if (value != null) {
      assert(
        function.stateMutability == StateMutability.payable,
        'Function is not payable and cannot accept a value',
      );
    } else {
      assert(
        function.stateMutability == StateMutability.nonpayable,
        'Function is payable and requires a value to be sent',
      );
    }

    return await rpc.buildUnsignedTransaction(
      sender: sender,
      recipient: contractAddress,
      feeInfo: feeInfo ?? EvmFeeInformation.zero,
      data: functionData,
      value: value ?? BigInt.zero,
    );
  }

  Future<ContractFunctionWithValuesAndOutputs> read({
    required ContractFunctionWithValues function,
    BlockNum? atBlock,
  }) async {
    assert(
      function.stateMutability == StateMutability.pure ||
          function.stateMutability == StateMutability.view,
      "Function is not view or pure",
    );

    final data = function.buildDataField();

    final String result =
        await rpc.call(contractAddress: contractAddress, data: data);

    final resultBuffer = result.hexToBytesWithPrefix;

    return ContractFunctionWithValuesAndOutputs.decode(
      data: resultBuffer,
      function: function,
    );
  }
}
