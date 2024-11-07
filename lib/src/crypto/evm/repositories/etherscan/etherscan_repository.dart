import 'dart:convert';
import 'dart:math';
import 'package:walletkit_dart/src/common/http_client.dart';
import 'package:walletkit_dart/src/common/logger.dart';

class EtherscanRepository {
  final String base;
  final List<String> apiKeys;
  final Map<String, bool> endpointNeedsApiKey = {};
  final Map<String, DateTime> apiKeyExcludedUntil = {};
  final List<String> invalidApiKeys = [];

  final Duration noApiKeyRetryIntervall;
  final Duration apiKeyRetryIntervall;

  EtherscanRepository(
    this.base,
    this.apiKeys, {
    this.noApiKeyRetryIntervall = const Duration(seconds: 5),
    this.apiKeyRetryIntervall = const Duration(seconds: 3),
  });

  String? _getRandomApiKey() {
    if (apiKeys.isEmpty) return null;
    final now = DateTime.now();
    final availableKeys = apiKeys.where((key) {
      if (invalidApiKeys.contains(key)) return false;
      final excludedUntil = apiKeyExcludedUntil[key];

      return excludedUntil == null || now.isAfter(excludedUntil);
    }).toList();
    if (availableKeys.isEmpty) return null;
    return availableKeys[Random().nextInt(availableKeys.length)];
  }

  bool _needsApiKey(String endpoint) {
    return endpointNeedsApiKey[endpoint] ?? false;
  }

  void _setNeedsApiKey(String endpoint, bool needs) {
    endpointNeedsApiKey[endpoint] = needs;
  }

  void _excludeApiKey(String apiKey) {
    Logger.log("Excluding API key $apiKey for 1 hour");
    apiKeyExcludedUntil[apiKey] = DateTime.now().add(Duration(hours: 1));
  }

  Map<String, String> _buildRequestHeaders() =>
      {'Content-Type': 'application/json'};

  String getBaseEtherscanEndpoint(String fullUrl) {
    Uri uri = Uri.parse(fullUrl);

    // Extract the scheme, host, and path
    String baseUrl = '${uri.scheme}://${uri.host}${uri.path}';

    // Get the query parameters
    Map<String, String> queryParams = uri.queryParameters;

    // Check if 'module' and 'action' parameters exist
    if (queryParams.containsKey('module') &&
        queryParams.containsKey('action')) {
      String module = queryParams['module']!;
      String action = queryParams['action']!;

      // Construct the base endpoint
      return '$baseUrl&module=$module&action=$action';
    } else {
      // If 'module' or 'action' is missing, return the original URL
      return fullUrl;
    }
  }

  Future<T> fetchEtherscanWithRatelimitRetries<T>(
    String rawEndpoint, {
    int maxRetries = 10,
  }) async {
    final baseEndpoint = getBaseEtherscanEndpoint(rawEndpoint);

    bool maybeUseApiKey = false;

    for (var i = 0; i < maxRetries; i++) {
      String endpoint = rawEndpoint;
      String? currentApiKey;

      if (_needsApiKey(baseEndpoint)) {
        maybeUseApiKey = false;
        currentApiKey = _getRandomApiKey();
        if (currentApiKey == null) {
          Logger.logError("No available API keys");
          throw Exception("No available API keys");
        }
        endpoint = "$rawEndpoint&apikey=$currentApiKey";
      } else if (maybeUseApiKey) {
        maybeUseApiKey = false;
        currentApiKey = _getRandomApiKey();
        if (currentApiKey != null) {
          endpoint = "$rawEndpoint&apikey=$currentApiKey";
        }
      }

      final response = await HTTPService.client.get(
        Uri.parse(endpoint),
        headers: _buildRequestHeaders(),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        int status = int.tryParse(body['status'] ?? '') ?? -1;
        final result = body['result'];

        if (status == 1) return result;

        if (status == 0) {
          final result_s = result is String ? result : 'empty';
          if (result == null) {
            continue;
          }

          if (result == "Missing/Invalid API Key") {
            _setNeedsApiKey(baseEndpoint, true);
          } else if (result_s.contains('Invalid API Key')) {
            invalidApiKeys.add(currentApiKey!);
            if (_getRandomApiKey() == null) {
              await Future.delayed(noApiKeyRetryIntervall);
            } else {
              maybeUseApiKey = true; // Try again with an API key
            }
          } else if (result_s.contains("Max daily rate limit")) {
            if (currentApiKey != null) {
              _excludeApiKey(currentApiKey);
            }
            if (_getRandomApiKey() == null) {
              await Future.delayed(noApiKeyRetryIntervall);
            } else {
              maybeUseApiKey = true; // Try again with an API key
            }
          } else if (result_s.contains('for higher rate limit')) {
            if (_getRandomApiKey() == null) {
              await Future.delayed(noApiKeyRetryIntervall);
            } else {
              maybeUseApiKey = true; // Try again with an API key
            }
          } else if (result_s.contains("Max calls per sec")) {
            await Future.delayed(apiKeyRetryIntervall);
          } else {
            String message = body['message'];
            if (message != "NOTOK") return result;
          }
        }
      }
    }

    throw Exception("Failed to fetch $rawEndpoint after $maxRetries retries");
  }
}
