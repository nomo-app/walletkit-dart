import 'dart:convert';

import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';

class FourByteRepository {
  static Future<ExternalContractFunction?> fetchSelector(
      String selector) async {
    final response = await HTTPService.client.get(
      Uri.parse(
        "https://www.4byte.directory/api/v1/signatures/?hex_signature=${"0x$selector"}",
      ),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // TODO: Maybe return a List of all Functions so that we can display all possible functions
      final function = getLowestIdFunction(responseData["results"]);

      return function;
    }

    return null;
  }

  static ExternalContractFunction? getLowestIdFunction(List<dynamic> results) {
    results.sort((a, b) => a["id"].compareTo(b["id"]));

    for (final value in results) {
      return ExternalContractFunction.fromJSON(value);
    }
    return null;
  }
}
