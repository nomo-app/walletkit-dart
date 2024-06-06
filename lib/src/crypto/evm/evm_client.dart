import 'dart:typed_data';

import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
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

  Future<String> callRaw({
    String? sender,
    required String contractAddress,
    required Uint8List data,
    BlockNum? atBlock,
  }) async {
    final response = await _call<String>(
      'eth_call',
      args: [
        {
          if (sender != null) 'from': sender,
          'to': contractAddress,
          'data': "0x" + data.toHex,
          'Quantity': atBlock?.toBlockParam() ?? 'latest',
        },
      ],
    );

    return response;
  }

  Future<BigInt> getTransactionCount(String address) async {
    final response = await _call<String>(
      'eth_getTransactionCount',
      args: [address, 'latest'],
    );

    final count = response.toBigIntOrNull;
    if (count == null) throw Exception('Could not parse transaction count');
    return count;
  }

  Future<InternalEVMTransaction> getTransactionByHash(
      String messageHash) async {
    final response = await _call<Json>(
      'eth_getTransactionByHash',
      args: [messageHash],
    );

    final v = response['v'].toString().toIntOrNull ?? 0;

    final chainIDV = extractChainId(v);
    return InternalEVMTransaction(
      nonce: response['nonce'].toString().toBigInt,
      gasPrice: response['gasPrice'].toString().toBigInt,
      gasLimit: response['gas'].toString().toBigInt,
      to: response['to'],
      value: response['value'].toString().toBigInt,
      data: response['input'].toString().hexToBytesWithPrefixOrNull,
      chainId: chainIDV.toBigInt,
      v: v,
      r: response['r'].toString().toBigInt,
      s: response['s'].toString().toBigInt,
    );
  }

  Future<String> sendRawTransaction(String rawTx) async {
    try {
      final response = await _call<String>(
        'eth_sendRawTransaction',
        args: [rawTx],
      );

      return response;
    } catch (e) {
      final response = await _call<String>(
        'eth_sendRawTransaction',
        args: [rawTx],
      );
      return response;
    }
  }

  Future<BigInt> estimateZkSyncFee(
      {required String from, required String to, String? data}) async {
    final body = [
      {
        'from': from,
        'to': to,
        'data': data ?? "0x",
      },
    ];

    final response = await _call('zks_estimateFee', args: body);

    final gaslimit = int.parse(
        response['gas_limit'].toString().replaceAll("0x", ""),
        radix: 16);
    return BigInt.from(gaslimit);
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
  Future<JsonListNested> getLogs({
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

    return response.cast<Json>();
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
    final response = await _call<Json?>(
      'eth_getTransactionReceipt',
      args: [txHash],
    );

    return response ?? {};
  }

  ///
  /// Estimate Time to be included in the next block
  ///

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
  Future<BigInt> estimateGasLimit({
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
