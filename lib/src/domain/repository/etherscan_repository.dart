import 'dart:convert';
import 'dart:math';

import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

abstract class EtherscanRepository {
  final String base;
  final Iterable<String> apiKeys;

  const EtherscanRepository(this.base, this.apiKeys);

  String get _balanceEndpoint => "$base?module=account&action=balance";

  String get _balanceTokenEndpoint =>
      "$base?module=account&action=tokenbalance&tag=latest";

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

  Future<T> _fetchEtherscanWithRatelimitRetries<T>(
    final String rawEndpoint, {
    int maxRetries = 10,
    Duration waitTime = const Duration(seconds: 5),
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

      final response = await HTTPService.client.get(Uri.parse(endpoint));

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

Future<T> _fetchAvaTransactionWithRateLimits<T>(
  final String rawEndpoint,
  final String? apiKey, {
  int maxRetries = 10,
  Duration waitTime = const Duration(seconds: 5),
}) async {
  for (var i = 0; i < maxRetries; i++) {
    final response = await HTTPService.getWithHeaders(
      rawEndpoint,
      headers: {
        'Content-Type': 'application/json',
        if (apiKey != null) 'x-glacier-api-key': apiKey
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final result = body['transactions'];

      return result;
    }

    await Future.delayed(waitTime);
  }
  throw Exception("Failed to fetch $rawEndpoint");
}

class EVMExplorer extends EtherscanRepository {
  const EVMExplorer(super.base, super.apiKeys);

  ///
  /// Fetch all Transactions for the given [token] on the given [address] for Avalanche
  ///
  Future<List<AvalancheTransaction>> fetchAvaTransactions({
    required EvmEntity token,
    required String address,
    int? lastBlock,
  }) async {
    if (lastBlock != null) {
      lastBlock++;
    }

    final txResults = await _fetchAvaTransactionWithRateLimits(
        "$base$address/transactions", apiKey);
    return [
      for (final tx in txResults)
        AvalancheTransaction.fromJson(
          tx,
          token: token,
          address: address,
        )
    ];
  }

  ///
  ///Fetch all ERC20 Transactions for a given [token] and [address] for Avalanche
  ///
  // Future<List<AvalancheTransaction>> fetchAvaERC20Transactions({
  //   required EthBasedTokenEntity token,
  //   required EvmEntity currency,
  //   required String address,
  //   int? lastBlock,
  // }) async {
  //   if (lastBlock != null) {
  //     lastBlock++;
  //   }

  //   final txResults = await _fetchAvaTransactionWithRateLimits(
  //       "$base$address/transactions", apiyKey);
  //   return [
  //     for (final tx in txResults)
  //       AvalancheTransaction.fromJsonErc20(
  //         tx,
  //         token: token,
  //         address: address,
  //         currency: currency,
  //       )
  //   ];
  // }

  ///
  /// Fetch all Transactions for the given [token] on the given [address]
  ///
  Future<List<EtherscanTransaction>> fetchTransactions({
    required EvmEntity token,
    required String address,
    int? lastBlock,
  }) async {
    if (lastBlock != null) {
      lastBlock++;
    }

    final txResults = await _fetchEtherscanWithRatelimitRetries(
        '$base?module=account&action=txlist&address=$address&sort=desc&startblock=$lastBlock');
    return [
      for (final tx in txResults)
        EtherscanTransaction.fromJson(
          tx,
          token: token,
          address: address,
        )
    ];
  }

  ///
  /// Fetch all ERC20 Transactions for a given [token] and [address]
  ///
  Future<List<EtherscanTransaction>> fetchERC20Transactions({
    required EthBasedTokenEntity token,
    required EvmEntity currency,
    required String address,
    int? lastBlock,
  }) async {
    if (lastBlock != null) {
      lastBlock++;
    }

    final txResults = await _fetchEtherscanWithRatelimitRetries(
      '$base?module=account&action=tokentx&address=$address&contractaddress=${token.contractAddress}&sort=desc&startblock=$lastBlock',
    );
    return [
      for (final tx in txResults)
        EtherscanTransaction.fromJsonErc20(
          tx,
          token: token,
          address: address,
          currency: currency,
        )
    ];
  }

  // Future<ConfirmationStatus> fetchTxStatus(String hash) async {
  //   final result = await _fetchEtherscanWithRatelimitRetries(
  //       "$base?module=transaction&action=getstatus&txhash=$hash");

  //   if (result
  //       case {
  //         "status": String status,
  //         "message": String _,
  //       }) {
  //     if (status == "1") {
  //       return ConfirmationStatus.confirmed;
  //     }
  //     return ConfirmationStatus.failed;
  //   }

  //   if (result
  //       case {
  //         "isError": String isError,
  //         "errDescription": String _,
  //       }) {
  //     if (isError == "0") {
  //       return ConfirmationStatus.confirmed;
  //     }
  //     return ConfirmationStatus.failed;
  //   }

  //   throw Exception("Failed to fetch tx status");
  // }

  ///
  /// Fetch all ERC20 Transactions for a given [token] and [address]
  ///
  // Future<Map<String, Set<GenericTransaction>>?> fetchAllERC20Transactions({
  //   required EvmEntity token,
  //   int? lastBlockId,
  // }) async {
  //   // print("lastBlockId " + lastBlockId.toString());
  //   var endpoint = "$_allERC20TransactionEndpoint&address=$address";
  //   if (lastBlockId != null) {
  //     lastBlockId++;
  //     endpoint += "&startblock=$lastBlockId";
  //   }
  //   final result = await _fetchEtherscanWithRatelimitRetries(endpoint);

  //   if (result == null || result.isEmpty) {
  //     return null;
  //   }

  //   Map<String, Set<GenericTransaction>> data = {};

  //   for (Map<String, dynamic> m in result) {
  //     final transaction = GenericTransaction.fromJson(
  //       m,
  //       token,
  //       address,
  //     );
  //     // data[transaction.contractAddress] = {
  //     //   ...?data[transaction.contractAddress],
  //     //   transaction,
  //     // };
  //   }

  //   return data;
  // }

  ///
  /// Fetch the Balance of a [token] given  for a given [address]
  ///
  Future<BigInt> fetchBalance(
    String address,
    TokenEntity token,
  ) async {
    final endpoint = switch (token) {
      EthBasedTokenEntity token =>
        "$_balanceTokenEndpoint&address=$address&contractaddress=${token.contractAddress}",
      _ => "$_balanceEndpoint&address=$address",
    };

    final result = await _fetchEtherscanWithRatelimitRetries(endpoint);
    final balance = BigInt.tryParse(result);

    if (balance == null) {
      throw Exception('Failed to parse balance: $result');
    }

    return balance;
  }

  ///
  /// Fetch a list of all ERC721 Tokens for a given [address]
  ///
  Future<List<ERC721Entity>> fetchEtherscanNFTs({
    required String address,
  }) async {
    var endpoint =
        "$base?module=account&action=tokennfttx&address=$address&startblock=0&sort=asc";

    final rawResult =
        await _fetchEtherscanWithRatelimitRetries(endpoint) as List<dynamic>;
    final result = _extractOwnedNFTsOutOfNFTTransactions(address, rawResult);

    return result.map((json) {
      return ERC721Entity.fromJson(json);
    }).toList();
  }

  ///
  /// Fetch Gas Prices
  ///
  Future<EvmNetworkFees> fetchGasPrice() async {
    final endpoint = "$base?module=gastracker&action=gasoracle";
    final result = await _fetchEtherscanWithRatelimitRetries(endpoint);
    if (result is! Json) {
      throw Exception("Failed to fetch gas price");
    }
    final entity = EvmNetworkFees.fromJson(result);

    return entity;
  }

  ///
  /// Utils
  ///

  List<dynamic> _extractOwnedNFTsOutOfNFTTransactions(
    String ethAddress,
    List<dynamic> nftTransactions,
  ) {
    final Map<String, int> sentAwayTimestamps =
        _extractMapFromTokenIDToTimestamp(nftTransactions, (from, to) {
      return (from.toLowerCase() == ethAddress.toLowerCase() &&
          to.toLowerCase() != ethAddress.toLowerCase());
    });
    final Map<String, int> receivedTimestamps =
        _extractMapFromTokenIDToTimestamp(nftTransactions, (from, to) {
      return to.toLowerCase() == ethAddress.toLowerCase();
    });

    return nftTransactions.where((tx) {
      final String tokenID = tx['tokenID'];
      final int timeStamp = int.parse(tx["timeStamp"]);
      final int? timeOfReceive = receivedTimestamps[tokenID];
      if (timeOfReceive == null) {
        return true; // should never happen
      }
      if (timeStamp != timeOfReceive) {
        return false; // deduplication
      }
      final int? timeOfSend = sentAwayTimestamps[tokenID];
      return timeOfSend == null || timeOfSend <= timeOfReceive;
    }).toList();
  }

  Map<String, int> _extractMapFromTokenIDToTimestamp(
    List<dynamic> nftTransactions,
    bool Function(String, String) filter,
  ) {
    final Map<String, int> map = {};
    for (final tx in nftTransactions) {
      final from = tx["from"];
      final to = tx["to"];
      if (from is String == false || to is String == false) {
        continue;
      }
      if (filter(from, to)) {
        final String tokenID = tx['tokenID'];
        final int timeStamp = int.parse(tx["timeStamp"]);
        if (map.containsKey(tokenID) == false || map[tokenID]! < timeStamp) {
          map[tokenID] = timeStamp;
        }
      }
    }
    return map;
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
