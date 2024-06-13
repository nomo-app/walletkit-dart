import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract.dart';
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
    final functionData = function.encodeFunction([rawTx.to, rawTx.value]);

    final encodedFunctionData = functionData.hexToBytes;
    final tx = rawTx.copyWith(
        data: encodedFunctionData, to: contractAddress, value: BigInt.zero);

    final privateKey = derivePrivateKeyETH(seed);
    final signedTx = InternalEVMTransaction.signTransaction(tx, privateKey);

    return client.sendRawTransaction(signedTx.serializedMessageHex);
  }

  Future<String> read({
    required ContractFunction function,
    BlockNum? atBlock,
    required EvmRpcClient client,
    required List<dynamic> params,
  }) async {
    final data = function.encodeFunction(params).hexToBytes;
    return client.call(contractAddress: contractAddress, data: data);
  }
}
