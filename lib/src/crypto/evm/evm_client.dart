import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/utxo_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

const erc20TransferSig = "0xa9059cbb";

base class EvmRpcClient {
  final JsonRPC _rpc;

  /// Still needed for some calls
  final Web3Client _web3Client;

  Web3Client get asWeb3 => _web3Client;

  EvmRpcClient(String rpcUrl)
      : _rpc = JsonRPC(rpcUrl, HTTPService.client),
        _web3Client = Web3Client(rpcUrl, HTTPService.client);

  Future<T> _call<T>(String function, {List<dynamic>? args}) async {
    try {
      final response = await _rpc.call(function, args);
      final result = response.result as T;
      return result;
    } on RPCError catch (e, s) {
      Logger.logError(e, s: s, hint: 'EvmRpcClient');
      rethrow;
    } catch (e, s) {
      Logger.logError(e, s: s, hint: 'EvmRpcClient');
      throw Exception(
        e.toString(),
      );
    }
  }

  ///
  /// Returns the balance of the account of given address in wei.
  ///
  Future<BigInt> getBalance(String address) async {
    final response = await _call<String>(
      'eth_getBalance',
      args: [address, 'latest'],
    );
    final balance = response.toBigIntOrNull;
    if (balance == null) throw Exception('Could not parse balance');
    return balance;
  }

  ///
  /// Returns the current block number.
  ///
  Future<int> getBlockNumber() async {
    final response = await _call<String>('eth_blockNumber');
    final blockNumber = response.toBigIntOrNull;
    if (blockNumber == null) throw Exception('Could not parse block number');
    return blockNumber.toInt();
  }

  ///
  /// Returns the Logs
  ///
  Future<JsonList> getLogs({
    required String address,
    required List<String?> topics,
    required dynamic fromBlock,
    required dynamic toBlock,
  }) async {
    final response = await _call<JsonList>(
      'eth_getLogs',
      args: [
        {
          'address': address,
          'topics': topics,
          'fromBlock': dynToHex(fromBlock),
          'toBlock': dynToHex(toBlock),
        }
      ],
    );

    return response;
  }

  ///
  /// sbch_queryTxByAddr
  ///
  Future<JsonList> queryTxByAddr({
    required String address,
    required dynamic startBlock,
    required dynamic endBlock,
    num maxTx = 10000,
  }) async {
    final response = await _call<JsonList>(
      'sbch_queryTxByAddr',
      args: [
        address,
        dynToHex(startBlock),
        dynToHex(endBlock),
        maxTx.toHexWithPrefix,
      ],
    );

    return response;
  }

  ///
  /// Get the transaction receipt
  ///
  Future<Json> getTransactionReceipt(String txHash) async {
    final response = await _call<Json>(
      'eth_getTransactionReceipt',
      args: [txHash],
    );

    return response;
  }

  ///
  /// Get Timestamp for block
  ///
  Future<int> getBlockTimestamp(int blockNumber) async {
    final response = await _call(
      'eth_getBlockByNumber',
      args: [blockNumber.toHexWithPrefix, false],
    );

    if (response
        case {
          "timestamp": String timestamp_s,
        }) {
      final timestamp = timestamp_s.toBigIntOrNull;
      if (timestamp == null) throw Exception('Could not parse timestamp');
      return timestamp.toInt();
    }

    throw UnimplementedError();
  }

  ///
  /// Get Gas Price
  ///
  Future<BigInt> getGasPrice() async {
    final response = await _call<String>('eth_gasPrice');

    final gasPrice = response.toBigIntOrNull;
    if (gasPrice == null) throw Exception('Could not parse gas price');
    return gasPrice;
  }

  ///
  /// Estimate Gas Fee
  ///
  Future<BigInt> estimateGasFee({
    String? from,
    required String to,
    BigInt? amount,
    BigInt? gasPrice,
    String? data,
  }) async {
    final response = await _call<String>(
      'eth_estimateGas',
      args: [
        {
          if (from != null) 'from': from,
          'to': to,
          if (gasPrice != null) 'gasPrice': gasPrice.toHexWithPrefix,
          if (data != null) 'data': data,
          if (amount != null) 'value': amount.toHexWithPrefix,
        }
      ],
    );

    final gasFee = response.toBigIntOrNull;
    if (gasFee == null) throw Exception('Could not parse gas fee');
    return gasFee;
  }
}

dynamic dynToHex(dynamic value) {
  if (value is int) return value.toHexWithPrefix;
  if (value is String) return value;

  throw Exception('Could not convert $value to hex');
}
