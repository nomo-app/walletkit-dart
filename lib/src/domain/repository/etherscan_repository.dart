import 'dart:convert';
import 'dart:math';

import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

enum Sorting { asc, desc }

enum TopicOperator { and, or }

class Block {
  final String value;

  Block.number(int number) : value = number.toString();

  Block.latest() : value = 'latest';

  @override
  String toString() => value;
}

abstract class EtherscanRepository {
  final String base;
  final Iterable<String> apiKeys;

  const EtherscanRepository(this.base, this.apiKeys);

  String? get apiKey {
    if (apiKeys.isEmpty) {
      return null;
    }
    Random random = Random();
    int index = random.nextInt(apiKeys.length);
    return apiKeys.elementAt(index);
  }

  Duration get randomWaitTime {
    Random random = Random();
    int index = random.nextInt(4) + 2;
    return Duration(seconds: index);
  }

  Map<String, String> buildRequestHeaders() => {
        'Content-Type': 'application/json',
      };

  Future<T> _fetchEtherscanWithRatelimitRetries<T>(
    final String rawEndpoint, {
    int maxRetries = 10,
  }) async {
    bool useApiKey = false;
    String endpoint = rawEndpoint;

    for (var i = 0; i < maxRetries; i++) {
      if (useApiKey && apiKey != null) {
        endpoint = "$rawEndpoint&apikey=$apiKey";
      } else {
        endpoint = rawEndpoint;
      }

      Logger.logFetch(
        'Fetch of $endpoint ($i of $maxRetries)',
        'EtherscanRepository',
      );

      final response = await HTTPService.client.get(
        Uri.parse(endpoint),
        headers: buildRequestHeaders(),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        int status = int.tryParse(body['status']) ?? -1;

        final result = body['result'];

        if (status == 1) {
          return result;
        }

        if (status == 0) {
          String message = body['message'];

          switch (message) {
            case "NOTOK":
              if (result.contains("API Key") && !useApiKey) {
                useApiKey = true;
              } else {
                useApiKey = false;
              }
              break;
            default:
              return result;
          }
        }
      }
      Logger.log(response.body);

      final waitTime = randomWaitTime;

      await Future.delayed(waitTime);
    }
    throw Exception("Failed to fetch $endpoint");
  }
}

class EtherscanExplorer extends EtherscanRepository {
  final EvmCoinEntity currency;

  const EtherscanExplorer(super.base, super.apiKeys, this.currency);

  String get gasOracleEndpoint => "$base?module=gastracker&action=gasoracle";

  String get txReceiptEndpoint =>
      "$base?module=transaction&action=gettxreceiptstatus";

  String buildEventLogsByAddressEnpoint({
    required String address,
    required Block? fromBlock,
    required Block? toBlock,
    String? topic0,
    TopicOperator? topic0_1_opr,
    TopicOperator? topic0_2_opr,
    TopicOperator? topic0_3_opr,
    String? topic1,
    TopicOperator? topic1_2_opr,
    TopicOperator? topic1_3_opr,
    String? topic2,
    TopicOperator? topic2_3_opr,
    String? topic3,
    int? page,
    int? offset,
  }) =>
      "$base?module=logs&action=getLogs&address=$address"
          .addOptionalParameter('fromBlock', fromBlock)
          .addOptionalParameter('toBlock', toBlock)
          .addOptionalParameter('page', page)
          .addOptionalParameter('offset', offset)
          .addOptionalParameter('topic0', topic0)
          .addOptionalParameter('topic0_1_opr', topic0_1_opr?.name)
          .addOptionalParameter('topic0_2_opr', topic0_2_opr?.name)
          .addOptionalParameter('topic0_3_opr', topic0_3_opr?.name)
          .addOptionalParameter('topic1', topic1)
          .addOptionalParameter('topic1_2_opr', topic1_2_opr?.name)
          .addOptionalParameter('topic1_3_opr', topic1_3_opr?.name)
          .addOptionalParameter('topic2', topic2)
          .addOptionalParameter('topic2_3_opr', topic2_3_opr?.name)
          .addOptionalParameter('topic3', topic3);

  String buildBalanceEndpoint(String address) =>
      "$base?module=account&action=balance&address=$address"
          .addOptionalParameter('tag', 'latest');

  String buildTokenBalanceEndpoint(String address, String contractAddress) =>
      "$base?module=account&action=tokenbalance&address=$address&contractaddress=$contractAddress"
          .addOptionalParameter('tag', 'latest');

  String buildTransactionEndpoint({
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) =>
      "$base?module=account&action=txlist&address=$address"
          .addOptionalParameter('startblock', startblock)
          .addOptionalParameter('endblock', endblock)
          .addOptionalParameter('page', page)
          .addOptionalParameter('offset', offset)
          .addOptionalParameter('sort', sorting?.name);

  String buildERC20TransactionEndpoint({
    required String address,
    required String contractAddress,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) =>
      "$base?module=account&action=tokentx&address=$address&contractaddress=$contractAddress"
          .addOptionalParameter('startblock', startblock)
          .addOptionalParameter('endblock', endblock)
          .addOptionalParameter('page', page)
          .addOptionalParameter('offset', offset)
          .addOptionalParameter('sort', sorting?.name);

  String buildERC721TransactionEndpoint({
    required String address,
    String? contractAddress,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) =>
      "$base?module=account&action=tokennfttx&address=$address"
          .addOptionalParameter('contractaddress', contractAddress)
          .addOptionalParameter('startblock', startblock)
          .addOptionalParameter('endblock', endblock)
          .addOptionalParameter('page', page)
          .addOptionalParameter('offset', offset)
          .addOptionalParameter('sort', sorting?.name);

  ///
  /// Fetch all Transactions for the given [token] on the given [address]
  ///
  Future<List<EtherscanTransaction>> fetchTransactions({
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) async {
    final endpoint = buildTransactionEndpoint(
      address: address,
      startblock: startblock,
      endblock: endblock,
      page: page,
      offset: offset,
      sorting: sorting,
    );

    final txResults = await _fetchEtherscanWithRatelimitRetries(endpoint);
    return [
      for (final tx in txResults)
        EtherscanTransaction.fromJson(
          tx,
          token: currency,
          address: address,
        )
    ];
  }

  ///
  /// Fetch all ERC20 Transactions for a given [token] and [address]
  ///
  Future<List<EtherscanTransaction>> fetchERC20Transactions({
    required String contractAddress,
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) async {
    final endpoint = buildERC20TransactionEndpoint(
      address: address,
      contractAddress: contractAddress,
      startblock: startblock,
      endblock: endblock,
      page: page,
      offset: offset,
      sorting: sorting,
    );

    final txResults = await _fetchEtherscanWithRatelimitRetries(endpoint);
    return [
      for (final tx in txResults)
        EtherscanTransaction.fromJsonErc20(
          tx,
          address: address,
          currency: currency,
        )
    ];
  }

  Future<BigInt> fetchBalance({
    required String address,
  }) async {
    final endpoint = buildBalanceEndpoint(address);
    final result = await _fetchEtherscanWithRatelimitRetries<String>(endpoint);

    final balance = BigInt.tryParse(result);

    if (balance == null) {
      throw Exception('Failed to parse balance: $result');
    }

    return balance;
  }

  Future<BigInt> fetchTokenBalance({
    required String address,
    required String contractAddress,
  }) async {
    final endpoint = buildTokenBalanceEndpoint(address, contractAddress);
    final result = await _fetchEtherscanWithRatelimitRetries<String>(endpoint);

    final balance = BigInt.tryParse(result);

    if (balance == null) {
      throw Exception('Failed to parse balance: $result');
    }

    return balance;
  }

  ///
  /// Fetch the Balance of a [token] given  for a given [address]
  ///
  Future<Amount> fetchBalanceForToken(
    String address,
    CoinEntity token,
  ) async =>
      switch (token) {
        ERC20Entity erc20 => fetchTokenBalance(
            address: address,
            contractAddress: erc20.contractAddress,
          ).then((balance) => Amount(value: balance, decimals: erc20.decimals)),
        CoinEntity coin => fetchBalance(
            address: address,
          ).then((balance) => Amount(value: balance, decimals: coin.decimals)),
      };

  ///
  /// Fetch a list of all ERC721 Tokens for a given [address]
  ///
  Future<List<EtherscanTransaction>> fetchERC721Transactions({
    required String address,
    String? contractAddress,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) async {
    final endpoint = buildERC721TransactionEndpoint(
      address: address,
      contractAddress: contractAddress,
      startblock: startblock,
      endblock: endblock,
      page: page,
      offset: offset,
      sorting: sorting,
    );

    final result =
        await _fetchEtherscanWithRatelimitRetries(endpoint) as List<dynamic>;

    return [
      for (final tx in result)
        EtherscanTransaction.fromJsonErc721(
          tx,
          currency: currency,
          address: address,
        ),
    ];
  }

  ///
  /// Fetch Tx Receipt
  ///
  Future<bool> fetchTransactionStatus(String txHash) async {
    final endpoint = "$txReceiptEndpoint&txhash=$txHash";
    final result = await _fetchEtherscanWithRatelimitRetries(endpoint);

    if (result is! Json) {
      throw Exception("Failed to fetch tx receipt");
    }

    final status = result['status'];

    return status == "1";
  }

  ///
  /// Fetch Event Logs for a given [address]
  ///
  Future<List<EVMTransactionLog>> fetchEventLogsByAddress({
    required String address,
    required Block? fromBlock,
    required Block? toBlock,
    String? topic0,
    TopicOperator? topic0_1_opr,
    TopicOperator? topic0_2_opr,
    TopicOperator? topic0_3_opr,
    String? topic1,
    TopicOperator? topic1_2_opr,
    TopicOperator? topic1_3_opr,
    String? topic2,
    TopicOperator? topic2_3_opr,
    String? topic3,
    int? page,
    int? offset,
  }) async {
    final endpoint = buildEventLogsByAddressEnpoint(
      address: address,
      topic0: topic0,
      topic0_1_opr: topic0_1_opr,
      topic1: topic1,
      topic1_2_opr: topic1_2_opr,
      topic2: topic2,
      topic2_3_opr: topic2_3_opr,
      topic3: topic3,
      fromBlock: fromBlock,
      toBlock: toBlock,
      page: page,
      offset: offset,
    );

    final result = await _fetchEtherscanWithRatelimitRetries(endpoint);

    if (result is! List) {
      throw Exception("Failed to fetch event logs");
    }

    return [
      for (final log in result) EVMTransactionLog.fromJson(log),
    ];
  }

  ///
  /// Fetch Gas Prices
  ///
  Future<EvmNetworkFees> fetchGasPrice() async {
    final result = await _fetchEtherscanWithRatelimitRetries(gasOracleEndpoint);
    if (result is! Json) {
      throw Exception("Failed to fetch gas price");
    }
    final entity = EvmNetworkFees.fromJson(result);

    return entity;
  }

  Future<int?> fetchEstimatedTime(int gasPrice) async {
    final endpoint =
        "$base?module=gastracker&action=gasestimate&gasprice=$gasPrice";
    final result = await _fetchEtherscanWithRatelimitRetries(endpoint);
    if (result is! String) {
      throw Exception("Failed to fetch gas price");
    }
    return int.tryParse(result);
  }
}

Future<List<T>> batchFutures<T>(
  Iterable<Future<T>> futures, {
  int batchSize = 10,
}) async {
  final results = <T>[];
  final batches = [
    for (var i = 0; i < futures.length; i += batchSize)
      futures.skip(i).take(batchSize)
  ];

  for (final batch in batches) {
    final batchResults = await Future.wait(batch);
    results.addAll(batchResults);
  }

  return results;
}

extension URLBuilder on String {
  String addOptionalParameter(String key, dynamic value) {
    if (value == null) {
      return this;
    }
    return "$this&$key=$value";
  }
}

class ZeniqScanExplorer extends EtherscanExplorer {
  const ZeniqScanExplorer(super.base, super.apiKeys, super.currency);

  @override
  String buildTransactionEndpoint({
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) {
    return "$base?module=account&action=txlist&address=$address"
        .addOptionalParameter('start_block', startblock)
        .addOptionalParameter('end_block', endblock)
        .addOptionalParameter('page', page)
        .addOptionalParameter('offset', offset)
        .addOptionalParameter('sort', sorting?.name);
  }

  @override
  String buildERC20TransactionEndpoint({
    required String address,
    required String contractAddress,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) {
    return "$base?module=account&action=tokentx&address=$address&contractaddress=$contractAddress"
        .addOptionalParameter('start_block', startblock)
        .addOptionalParameter('end_block', endblock)
        .addOptionalParameter('page', page)
        .addOptionalParameter('offset', offset)
        .addOptionalParameter('sort', sorting?.name);
  }
}
