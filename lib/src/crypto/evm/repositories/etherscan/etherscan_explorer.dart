import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/transactions/etherscan_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/repositories/etherscan/etherscan_repository.dart';
import 'package:walletkit_dart/src/domain/entities/amount.dart';
import 'package:walletkit_dart/src/domain/entities/coin_entity.dart';
import 'package:walletkit_dart/src/domain/entities/tx_gasFee_entity.dart';

enum Sorting { asc, desc }

class EtherscanExplorer extends EtherscanRepository {
  final EvmCoinEntity currency;

  EtherscanExplorer(super.base, super.apiKeys, this.currency);

  @override
  String get base => "${super.base}?chainid=${currency.chainID}";

  String buildBalanceEndpoint(String address) =>
      "$base&module=account&action=balance&address=$address"
          .addOptionalParameter('tag', 'latest');

  String buildTokenBalanceEndpoint(String address, String contractAddress) =>
      "$base&module=account&action=tokenbalance&address=$address&contractaddress=$contractAddress"
          .addOptionalParameter('tag', 'latest');

  String buildTransactionEndpoint({
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) =>
      "$base&module=account&action=txlist&address=$address"
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
      "$base&module=account&action=tokentx&address=$address&contractaddress=$contractAddress"
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
      "$base&module=account&action=tokennfttx&address=$address"
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

    final txResults = await fetchEtherscanWithRatelimitRetries(endpoint);
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

    final txResults = await fetchEtherscanWithRatelimitRetries(endpoint);
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
    final result = await fetchEtherscanWithRatelimitRetries<String>(endpoint);

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
    final result = await fetchEtherscanWithRatelimitRetries<String>(endpoint);

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
        await fetchEtherscanWithRatelimitRetries(endpoint) as List<dynamic>;

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
  /// Fetch Gas Prices
  ///
  Future<EvmNetworkFees> fetchGasPrice() async {
    final gasOracleEndpoint = "${base}&module=gastracker&action=gasoracle";

    final result = await fetchEtherscanWithRatelimitRetries(gasOracleEndpoint);
    if (result is! Json) {
      throw Exception("Failed to fetch gas price");
    }
    final entity = EvmNetworkFees.fromJson(result);

    return entity;
  }

  Future<int?> fetchEstimatedTime(int gasPrice) async {
    final endpoint =
        "$base&module=gastracker&action=gasestimate&gasprice=$gasPrice";
    final result = await fetchEtherscanWithRatelimitRetries(endpoint);
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
  ZeniqScanExplorer(super.base, super.apiKeys, super.currency);

  @override
  String buildTransactionEndpoint({
    required String address,
    int? startblock,
    int? endblock,
    int? page,
    int? offset,
    Sorting? sorting,
  }) {
    return "$base&module=account&action=txlist&address=$address"
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
    return "$base&module=account&action=tokentx&address=$address&contractaddress=$contractAddress"
        .addOptionalParameter('start_block', startblock)
        .addOptionalParameter('end_block', endblock)
        .addOptionalParameter('page', page)
        .addOptionalParameter('offset', offset)
        .addOptionalParameter('sort', sorting?.name);
  }
}
