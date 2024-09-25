import 'dart:typed_data';
import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_decoding.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:collection/collection.dart';

const erc20TransferSig = "a9059cbb";

base class EvmRpcClient {
  final JsonRPC _rpc;
  final Duration rateLimitTimeout;
  final void Function(Object e, StackTrace s, String url)? onRpcError;

  EvmRpcClient(
    String rpcUrl, {
    this.rateLimitTimeout = const Duration(seconds: 30),
    this.onRpcError,
  }) : _rpc = JsonRPC(rpcUrl, HTTPService.client);

  String get rpcUrl => _rpc.url;
  HTTPClient get httpClient => HTTPService.client;

  DateTime? lastFailedTime;

  bool isRateLimited() {
    if (lastFailedTime == null) return false;
    return DateTime.now().difference(lastFailedTime!) < rateLimitTimeout;
  }

  Future<T> _call<T>(String function, {List<dynamic>? args}) async {
    if (isRateLimited()) {
      throw RateLimitingException('RPC $rpcUrl is rate limited');
    }

    try {
      final response = await _rpc.call(function, args);
      final result = response.result as T;
      return result;
    } on RPCError catch (e, s) {
      if (e.errorCode == -32600) {
        lastFailedTime = DateTime.now();
        throw RateLimitingException("Rate limited");
      }

      if (onRpcError != null) {
        onRpcError!(e, s, rpcUrl);
      }

      Logger.logError(e, s: s, hint: 'EvmRpcClient RPCError');
      rethrow;
    } catch (e, s) {
      Logger.logError(e, s: s, hint: 'EvmRpcClient');
      if (onRpcError != null) {
        onRpcError!(e, s, rpcUrl);
      }
      rethrow;
    }
  }

  Future<String> call({
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
          'data': "0x${data.toHex}",
        },
        atBlock?.toBlockParam() ?? 'latest',
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

  Future<RawEvmTransaction> getTransactionByHash(
    String messageHash, [
    int? chainId,
  ]) async {
    final response = await _call<Json>(
      'eth_getTransactionByHash',
      args: [messageHash],
    );

    final type_i = response['type'].toString().toInt;
    final type = TransactionType.fromInt(type_i.toInt());

    return switch (type) {
      TransactionType.Legacy => RawEVMTransactionType0(
          nonce: response['nonce'].toString().toBigInt,
          gasPrice: response['gasPrice'].toString().toBigInt,
          gasLimit: response['gas'].toString().toBigInt,
          to: response['to'],
          value: response['value'].toString().toBigInt,
          data: response['input'].toString().hexToBytesWithPrefixOrNull ??
              Uint8List(0),
          v: response['v'].toString().toInt,
          r: response['r'].toString().toBigInt,
          s: response['s'].toString().toBigInt,
        ),
      _ => throw UnsupportedError('Unsupported transaction type: $type'),
    };
  }

  Future<Json> getBlockByNumber(int blockNumber) async {
    final response = await _call<Json>(
      'eth_getBlockByNumber',
      args: [blockNumber.toHexWithPrefix, false],
    );

    return response;
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

  // Future<BigInt> estimateZkSyncFee({
  //   required String from,
  //   required String to,
  //   String? data,
  // }) async {
  //   final body = [
  //     {
  //       'from': from,
  //       'to': to,
  //       'data': data ?? "0x",
  //     },
  //   ];

  //   final response = await _call('zks_estimateFee', args: body);

  //   final gaslimit = int.parse(
  //     response['gas_limit'].toString().replaceAll("0x", ""),
  //     radix: 16,
  //   );
  //   return BigInt.from(gaslimit);
  // }

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
  /// zeniq_queryTxByAddr
  ///
  Future<JsonList> queryTxByAddr({
    required String address,
    required dynamic startBlock,
    required dynamic endBlock,
    num maxTx = 10000,
  }) async {
    final response = await _call<JsonList>(
      'zeniq_queryTxByAddr',
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
  Future<Json?> getTransactionReceipt(String txHash) async {
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

class RateLimitingException implements Exception {
  final String message;

  RateLimitingException(this.message);

  @override
  String toString() {
    return 'RateLimitingException: $message';
  }
}

class EVMTransactionReceipt {
  final String transactionHash;
  final int transactionIndex;
  final String blockHash;
  final int blockNumber;
  final String from;
  final String? to;
  final int cumulativeGasUsed;
  final int gasUsed;
  final String? contractAddress;
  final List<EVMTransactionLog> logs;
  final Uint8List logsBloom;
  final int? effectiveGasPrice;
  final int type;

  final int? status; // Post Byzantium
  final Uint8List? root; // Pre Byzantium

  const EVMTransactionReceipt({
    required this.transactionHash,
    required this.transactionIndex,
    required this.blockHash,
    required this.blockNumber,
    required this.from,
    required this.to,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.contractAddress,
    required this.logs,
    required this.logsBloom,
    required this.type,
    required this.effectiveGasPrice,
    this.status,
    this.root,
  });

  List<EVMTransactionLog> getLogForTopic(String topic) {
    return logs.where((log) => log.topics.first == topic).toList();
  }

  factory EVMTransactionReceipt.fromJson(Json json) {
    if (json
        case {
          "transactionHash": String transactionHash,
          "transactionIndex": String transactionIndex,
          "to": String? to,
          "from": String from,
          "blockHash": String blockHash,
          "blockNumber": String blockNumber,
          "cumulativeGasUsed": String cumulativeGasUsed,
          "gasUsed": String gasUsed,
          "contractAddress": String? contractAddress,
          "logs": List<dynamic> logs_json,
          "logsBloom": String logsBloom,
        }) {
      final logs =
          logs_json.map((json) => EVMTransactionLog.fromJson(json)).toList();

      final type = (json['type'] as String?)?.toIntOrNull ?? 0;

      final effectiveGasPrice =
          (json['effectiveGasPrice'] as String?)?.toIntOrNull;

      final status = (json['status'] as String?)?.toIntOrNull;

      final root = (json['root'] as String?)?.hexToBytesWithPrefix;

      return EVMTransactionReceipt(
        transactionHash: transactionHash,
        transactionIndex: transactionIndex.toInt,
        blockHash: blockHash,
        blockNumber: blockNumber.toInt,
        from: from,
        to: to,
        cumulativeGasUsed: cumulativeGasUsed.toInt,
        gasUsed: gasUsed.toInt,
        contractAddress: contractAddress,
        logs: logs,
        logsBloom: logsBloom.hexToBytesWithPrefix,
        type: type,
        effectiveGasPrice: effectiveGasPrice,
        status: status,
        root: root,
      );
    }

    throw UnimplementedError();
  }
}

class EVMTransactionLog {
  final String address;
  final List<String> topics;
  final Uint8List data;
  final int blockNumber;
  final String blockHash;
  final int transactionIndex;
  final String transactionHash;
  final int logIndex;
  final bool removed;

  const EVMTransactionLog({
    required this.address,
    required this.topics,
    required this.data,
    required this.blockNumber,
    required this.blockHash,
    required this.transactionIndex,
    required this.transactionHash,
    required this.logIndex,
    required this.removed,
  });

  Uint8List get topicData {
    final topicsData = [for (final topic in topics) topic.hexToBytesWithPrefix];

    return topicsData.fold(
      Uint8List(0),
      (data1, data2) => Uint8List.fromList(
        [...data1, ...data2],
      ),
    );
  }

  factory EVMTransactionLog.fromJson(Json json) {
    if (json
        case {
          "address": String address,
          "topics": List<dynamic> topics_json,
          "data": String data,
          "blockNumber": String blockNumber,
          "blockHash": String blockHash,
          "transactionIndex": String transactionIndex,
          "transactionHash": String transactionHash,
          "logIndex": String logIndex,
          "removed": bool removed,
        }) {
      final topics = topics_json.map((e) => e.toString()).toList();
      return EVMTransactionLog(
        address: address,
        topics: topics,
        data: data.hexToBytesWithPrefix,
        blockNumber: blockNumber.toInt,
        blockHash: blockHash,
        transactionIndex: transactionIndex.toInt,
        transactionHash: transactionHash,
        logIndex: logIndex.toInt,
        removed: removed,
      );
    }

    throw UnimplementedError();
  }

  List<FunctionParamWithValue> decode(
    ContractEvent event,
  ) {
    final eventSignature = event.topicHex;
    final topicEventSignature = topicData.sublist(0, 32).toHex;

    assert(
      eventSignature == topicEventSignature,
      "Event signature does not match",
    );

    final nonIndexParams = decodeDataField(
      data: data,
      params: event.nonIndexedParameters,
    );

    final indexedParams = decodeDataField(
      data: topicData.sublist(32),
      params: event.indexedParameters,
    );

    return [...indexedParams, ...nonIndexParams];
  }
}
