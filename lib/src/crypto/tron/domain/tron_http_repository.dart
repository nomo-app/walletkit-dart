import 'package:http/http.dart';
import 'package:walletkit_dart/src/common/http_repository.dart';

const testNode = 'https://api.shasta.trongrid.io';

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
}
