import 'package:walletkit_dart/src/common/http_repository.dart';

const testNode = 'https://api.trongrid.io';

class TronHTTPRepository extends HTTPRepository {
  final List<String> apiKeys;

  const TronHTTPRepository({required this.apiKeys})
      : super(
          apiKeys: apiKeys,
          baseURL: testNode,
          apiKeyHeader: "TRON-PRO-API-KEY",
        );

  Future<JSON> validateAddress(String address) async {
    final result = await postCall<JSON>(
      "$baseURL/wallet/validateaddress",
      data: {
        "address": address,
        "visible": true,
      },
    );

    return result;
  }

  Future<JSON> getBlock() {
    return postCall<JSON>("$baseURL/wallet/getnowblock", data: {});
  }

  Future<JSON> getAccount({required String address, bool visible = true}) {
    return postCall<JSON>(
      "$baseURL/wallet/getaccount",
      data: {
        "address": address,
        "visible": visible,
      },
    );
  }

  Future<JSON> getAccountBalance({required String address}) async {
    final nowBlock = await getBlock();
    final hash = nowBlock["blockID"] as String;
    final number = nowBlock["block_header"]["raw_data"]["number"] as int;

    return postCall<JSON>(
      "$baseURL/wallet/getaccountbalance",
      data: {
        "account_identifier": {"address": address},
        "block_identifier": {"hash": hash, "number": number},
        "visible": true
      },
    );
  }

  Future<JSON> getAllTRC10Tokens() {
    return getCall<JSON>("$baseURL/wallet/getassetissuelist");
  }

  Future<JSON> listNodes() {
    return getCall<JSON>("$baseURL/wallet/listnodes");
  }

  Future<JSON> getTRC10byID(String id) {
    return postCall<JSON>(
      "$baseURL/wallet/getassetissuebyid",
      data: {"value": id},
    );
  }

  Future<JSON> getTransactionById(String id) {
    return postCall<JSON>(
      "$baseURL/wallet/gettransactionbyid",
      data: {"value": id},
    );
  }

  Future<JSON> getAccountInfo({required String address}) {
    return getCall<JSON>(
      "$baseURL/v1/accounts/$address",
    );
  }
}
