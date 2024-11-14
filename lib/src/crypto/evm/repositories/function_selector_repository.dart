import 'dart:async';
import 'dart:convert';

import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const _openchainEndpoint = "https://api.openchain.xyz/signature-database/v1";
const _4byteEndpoint = "https://www.4byte.directory/api/v1";

class FunctionSelectorRepository {
  final Map<String, Completer<ExternalContractFunction?>> functionCache = {};

  static final FunctionSelectorRepository _instance =
      FunctionSelectorRepository._();

  FunctionSelectorRepository._();

  factory FunctionSelectorRepository() {
    return _instance;
  }

  Future<ExternalContractFunction?> fetchSelector(
    String selector, {
    bool openChain = true,
    bool fourByte = true,
  }) async {
    assert(openChain || fourByte, "At least one source must be enabled");

    if (fourByte) {
      final fourByteFunction = await fetchSelector4Byte(selector);
      if (fourByteFunction != null) return fourByteFunction;
    }

    if (openChain) {
      final openChainFunction = await fetchSelectorOpenChain(selector);
      if (openChainFunction != null) return openChainFunction;
    }

    return null;
  }

  Future<ExternalContractFunction?> fetchSelector4Byte(
    String selector,
  ) async {
    selector = selector.startsWith("0x") ? selector : "0x$selector";

    final endpoint = "$_4byteEndpoint/signatures/?hex_signature=$selector";
    final uri = Uri.parse(endpoint);

    if (functionCache.containsKey(endpoint)) {
      return await functionCache[endpoint]!.future;
    }

    final future = _4byteRequest(uri, selector);

    final completer = Completer<ExternalContractFunction?>();
    functionCache[endpoint] = completer;

    try {
      final function = await future;
      completer.complete(function);
      return function;
    } catch (e) {
      completer.complete(null);
      return null;
    }
  }

  Future<ExternalContractFunction?> fetchSelectorOpenChain(
    String selector,
  ) async {
    selector = selector.startsWith("0x") ? selector : "0x$selector";

    final endpoint =
        "$_openchainEndpoint/lookup?function=$selector&filter=true";
    final uri = Uri.parse(endpoint);

    if (functionCache.containsKey(endpoint)) {
      return await functionCache[endpoint]!.future;
    }

    final future = _openchainRequest(uri, selector);

    final completer = Completer<ExternalContractFunction?>();
    functionCache[endpoint] = completer;
    try {
      final function = await future;
      completer.complete(function);
      return function;
    } catch (e) {
      completer.complete(null);
      return null;
    }
  }

  Future<ExternalContractFunction?> _openchainRequest(
    Uri uri,
    String selector,
  ) async {
    final response = await HTTPService.client.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json
          case {
            "ok": true,
            "result": {
              "event": Json _,
              "function": Json function_json,
            }
          }) {
        final functions = function_json[selector] as List<dynamic>?;

        if (functions == null || functions.isEmpty) return null;

        final name = functions.first["name"] as String?;

        if (name == null) return null;

        final function =
            ContractFunction.fromTextSignature(textSignature: name);

        if (function == null) return null;

        return function;
      }

      return null;
    }

    return null;
  }

  Future<ExternalContractFunction?> _4byteRequest(
    Uri uri,
    String selector,
  ) async {
    final response = await HTTPService.client.get(uri);
    if (response.statusCode == 200) {
      final contentType = response.headers["content-type"];

      if (contentType != null && !contentType.contains("application/json")) {
        return null;
      }

      final responseData = jsonDecode(response.body);

      // TODO: Maybe return a List of all Functions so that we can display all possible functions
      final function = getLowestIdFunction(responseData["results"]);

      return function;
    }

    return null;
  }

  static ExternalContractFunction? getLowestIdFunction(List<dynamic> results) {
    results.sort((a, b) => a["id"].compareTo(b["id"]));

    for (final {
          "id": int _,
          "created_at": _,
          "text_signature": String text_signature,
          "hex_signature": _,
          "bytes_signature": _,
        } in results) {
      return ContractFunction.fromTextSignature(
        textSignature: text_signature,
      );
    }
    return null;
  }
}
