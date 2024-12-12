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
      feeInfo: feeInfo,
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
      feeInfo: feeInfo,
      data: functionData,
      value: value ?? BigInt.zero,
    );
  }

  Future<ExternalContractFunctionWithValuesAndOutputs> read({
    required ExternalContractFunctionWithValues function,
    BlockNum? atBlock,
    required List<FunctionParam>? outputs,
    StateMutability? stateMutability,
  }) async {
    final _stateMutability = stateMutability ?? function.stateMutability;

    if (_stateMutability != StateMutability.pure &&
        _stateMutability != StateMutability.view) {
      throw ArgumentError('Function is not view or pure');
    }

    final _outputs = outputs ?? function.outputTypes;

    if (_outputs == null || _outputs.isEmpty) {
      throw ArgumentError('Outputs must be provided');
    }

    final data = function.buildDataField();

    final String result =
        await rpc.call(contractAddress: contractAddress, data: data);

    final resultBuffer = result.hexToBytesWithPrefix;

    return ExternalContractFunctionWithValuesAndOutputs.decode(
      data: resultBuffer,
      function: function,
      outputs: _outputs,
      stateMutability: stateMutability,
    );
  }

  Future<LocalContractFunctionWithValuesAndOutputs> readSafe({
    required LocalContractFunctionWithValues function,
    BlockNum? atBlock,
  }) async {
    if (function.stateMutability != StateMutability.pure &&
        function.stateMutability != StateMutability.view) {
      throw ArgumentError('Function is not view or pure');
    }

    final data = function.buildDataField();

    final String result =
        await rpc.call(contractAddress: contractAddress, data: data);

    final resultBuffer = result.hexToBytesWithPrefix;

    return LocalContractFunctionWithValuesAndOutputs.decode(
      data: resultBuffer,
      function: function,
    );
  }
}
