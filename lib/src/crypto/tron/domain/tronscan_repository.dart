import 'package:walletkit_dart/src/common/http_repository.dart';
import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const _tronScanBaseUrl = "https://apilist.tronscanapi.com/api";

class TronScanRepository extends HTTPRepository {
  const TronScanRepository({
    required super.apiKeys,
  }) : super(baseURL: _tronScanBaseUrl, apiKeyHeader: "TRON-PRO-API-KEY");

  String getBlockEndpoint({
    required int start,
    required int limit,
    String? producer,
    bool descending = true,
    int? startTimestamp,
    int? endTimestamp,
  }) {
    // final sort = descending ? "-" : "+";
    return "$baseURL/block?sort=&start=${start.asQueryString}&limit=${limit.asQueryString}&producer=${producer.asQueryString}&start_timestamp=${startTimestamp.asQueryString}&end_timestamp=${endTimestamp.asQueryString}";
  }

  Future<JSON> getLatestBlock() async {
    final result = await getCall<JSON>(
      getBlockEndpoint(start: 0, limit: 1),
    );

    return result;
  }

  String getTransactionsEndpont({
    required int start,
    required String address,
    int limit = 10,
    int? startTimestamp,
    int? endTimestamp,
    String? type,
    String? method,
    int? block,
    List<String>? tokens,
  }) {
    return "$baseURL/transaction?start=${start.asQueryString}&limit=${limit.asQueryString}&address=${address.asQueryString}&start_timestamp=${startTimestamp.asQueryString}&end_timestamp=${endTimestamp.asQueryString}&type=${type.asQueryString}&method=${method.asQueryString}&block=${block.asQueryString}&tokens=${tokens.asQueryString}";
  }

  Future<Set<EVMTransaction>> getTransactions({
    required String address,
    required TokenEntity token,
    int limit = 10,
    int? startTimestamp,
    int? endTimestamp,
    String? type,
    String? method,
    List<String>? tokens,
  }) async {
    final data = [];

    int? totalLength;
    for (int i = 0; true; i += limit) {
      final endpoint = getTransactionsEndpont(
        start: i,
        address: address,
        limit: limit,
        startTimestamp: startTimestamp,
        endTimestamp: endTimestamp,
        type: type,
        method: method,
        tokens: tokens,
      );

      final result = await getCall<JSON>(endpoint);

      totalLength ??= result['total'] as int;

      final newData = result['data'];

      data.addAll(newData);

      if (data.length >= totalLength) {
        break;
      }
    }

    return {
      for (final item in data) TronTransaction.fromJson(item, token, address),
    }.whereType<TronTransaction>().toSet();
  }

  Future<JSON> getTokenPrice(String symbol) async {
    final endpoint = "$baseURL/token/price?token=${symbol}";

    final result = await getCall<JSON>(endpoint);

    return result;
  }

  Future<JSON> getAccountInfo(String address) async {
    final endpoint = "$baseURL/accountv2?address=${address}";
    final result = await getCall<JSON>(endpoint);

    return result;
  }

  Future<JSON> getCurrentTPS() {
    final endpoint = "$baseURL/system/tps";
    return getCall<JSON>(endpoint);
  }

  Future<JSON> getNodeMap() {
    final endpoint = "$baseURL/nodemap";
    return getCall<JSON>(endpoint);
  }

  Future<JSON> getWalletTokens({
    required String address,
    int asset_type = 0,
  }) {
    final endpoint =
        "$baseURL/account/wallet?address=${address}&asset_type=${asset_type}";
    return getCall<JSON>(endpoint);
  }

  Future<JSON> getTRXTransferList({
    required String address,
    int start = 0,
    int limit = 20,
    int direction = 0,
    bool fee = false,
    int? start_timestamp,
    int? end_timestamp,
  }) {
    final endpoint =
        "$baseURL/transfer/trx?address=${address}?start=${start.asQueryString}&limit=${limit.asQueryString}&direction=${direction.asQueryString}&fee=${fee.asQueryString}?start_timestamp=${start_timestamp.asQueryString}&end_timestamp=${end_timestamp.asQueryString}";

    return getCall<JSON>(endpoint);
  }

  Future<JSON> getTRC10TransferList({
    required String address,
    required String trc10Id,
    int start = 0,
    int limit = 20,
    int direction = 0,
    int? start_timestamp,
    int? end_timestamp,
  }) {
    final endpoint =
        "$baseURL/transfer/token10?address=${address}&trc10Id=${trc10Id}&start=${start.asQueryString}&limit=${limit.asQueryString}&direction=${direction.asQueryString}&start_timestamp=${start_timestamp.asQueryString}&end_timestamp=${end_timestamp.asQueryString}";

    return getCall<JSON>(endpoint);
  }

  Future<Set<EVMTransaction>> getTRC20TransferList({
    required String address,
    required EthBasedTokenEntity trc20,
    int start = 0,
    int limit = 20,
    int direction = 0,
    int? start_timestamp,
    int? end_timestamp,
  }) async {
    final endpoint =
        "$baseURL/transfer/trc20?address=${address}&trc20Id=${trc20.contractAddress}&start=${start.asQueryString}&limit=${limit.asQueryString}&direction=${direction.asQueryString}&start_timestamp=${start_timestamp.asQueryString}&end_timestamp=${end_timestamp.asQueryString}";

    final result = await getCall<JSON>(endpoint);
    final code = result['code'] as int;

    if (code != 200) {
      throw Exception("Failed to fetch TRC20 Transfer List: $result");
    }
    final data = result['data'] as JsonList;

    return {
      for (final item in data) TronTransaction.fromJson(item, trc20, address),
    }.whereType<TronTransaction>().toSet();
  }

  Future<JSON> getUnfreezableBalance(String address) {
    final endpoint = "$baseURL/account/resource/unfreeze?address=${address}";
    return getCall<JSON>(endpoint);
  }

  Future<JSON> getAccountSecurity(String address) {
    final endpoint = "$baseURL/security/account/data?address=${address}";
    return getCall<JSON>(endpoint);
  }

  Future<JSON> getTokenSecurity(String tokenId) {
    final endpoint = "$baseURL/security/token/data?address=${tokenId}";
    return getCall<JSON>(endpoint);
  }
}
