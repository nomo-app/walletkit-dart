import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:walletkit_dart/src/common/http_client.dart';

typedef JSON = Map<String, dynamic>;
typedef JSONList = List<Map<String, dynamic>>;

const retryInterval = Duration(seconds: 3);
const timeoutDuration = Duration(seconds: 35);

abstract class HTTPRepository {
  final List<String> apiKeys;
  final String baseURL;
  final String apiKeyHeader;

  const HTTPRepository({
    required this.apiKeys,
    required this.baseURL,
    required this.apiKeyHeader,
  });
  Map<String, String> _getHeaders({String? apiKey}) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      if (apiKey != null) "TRON-PRO-API-KEY": apiKey,
    };
  }

  String? _getApiKey(int i) {
    final index = i % (apiKeys.length + 1);
    if (index == apiKeys.length) {
      return null;
    }
    return apiKeys[index];
  }

  Future<T> getCall<T>(String url) async {
    final uri = Uri.parse(url);
    String? apiKey = _getApiKey(apiKeys.length);
    for (int i = 0; true; i++) {
      try {
        return await _getCall<T>(uri, apiKey: apiKey);
      } on RateLimitException {
        apiKey = _getApiKey(i);
        await Future.delayed(retryInterval);
      } on UnAuthorizedException {
        apiKey = _getApiKey(i);
        await Future.delayed(retryInterval);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<T> _getCall<T>(Uri url, {String? apiKey}) async {
    final response = await HTTPService.client
        .get(
          url,
          headers: _getHeaders(apiKey: apiKey),
        )
        .timeout(timeoutDuration);

    if (response.statusCode != 200) {
      if (response.statusCode == 403) {
        throw RateLimitException("Rate Limit Exceeded");
      }

      if (response.statusCode == 401) throw UnAuthorizedException();

      throw HTTPStatusException(response.statusCode, response.body, url);
    }

    final body = response.body;

    try {
      final json = jsonDecode(body);

      if (json is JSON) {
        final code = json["code"];
        final message = json["message"];
        if (code != null && code != 200) {
          throw HTTPStatusException(code, message, url);
        }
      }

      return json as T;
    } on HTTPStatusException {
      rethrow;
    } catch (e) {
      throw JSONParsingException(body);
    }
  }

  Future<T> postCall<T>(String url, {required JSON data}) async {
    final dataString = jsonEncode(data);
    final uri = Uri.parse(url);

    String? apiKey;
    for (int i = 0; true; i++) {
      try {
        return await _postCall<T>(uri, apiKey: apiKey, data: dataString);
      } on RateLimitException {
        apiKey = _getApiKey(i);
        await Future.delayed(retryInterval);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<T> _postCall<T>(
    Uri url, {
    String? apiKey,
    required String data,
  }) async {
    final response = await HTTPService.client
        .post(
          url,
          headers: _getHeaders(apiKey: apiKey),
          body: data,
        )
        .timeout(timeoutDuration);

    if (response.statusCode != 200) {
      if (response.statusCode == 403) {
        throw RateLimitException("Rate Limit Exceeded");
      }

      throw HTTPStatusException(response.statusCode, response.body, url);
    }

    final body = response.body;

    try {
      final json = jsonDecode(body);

      if (json is JSON) {
        final code = json["code"];
        final message = json["message"];

        if (code is int && code != 200) {
          throw HTTPStatusException(code, message, url);
        }
        if (code is String && code != "SUCCESS") {
          throw HTTPStatusException(400, message, url);
        }
      }

      return json as T;
    } on HTTPStatusException {
      rethrow;
    } catch (e) {
      throw JSONParsingException(body);
    }
  }
}

extension QueryUtil on dynamic {
  String get asQueryString {
    if (this == null) {
      return "";
    }
    return toString();
  }
}

class HTTPStatusException extends HttpException {
  final int statusCode;

  const HTTPStatusException(this.statusCode, super.message, Uri? uri) : super(uri: uri);

  @override
  String toString() {
    return "HTTPStatusException: $statusCode - $message";
  }
}

class JSONParsingException implements Exception {
  final String body;

  const JSONParsingException(this.body);

  @override
  String toString() {
    return "JSONParsingException: $body";
  }
}

class RateLimitException extends HTTPStatusException {
  const RateLimitException(
    String message,
  ) : super(429, message, null);

  @override
  String toString() {
    return "RateLimitException: $message";
  }
}

class UnAuthorizedException extends HTTPStatusException {
  const UnAuthorizedException() : super(401, "Unauthorized", null);

  @override
  String toString() {
    return "UnAuthorizedException: Unauthorized";
  }
}
