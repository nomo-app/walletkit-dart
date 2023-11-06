library endpoint_utils;

import 'package:nomo_common/nomo_common.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/predefined_assets.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/domain/repository/electrum_json_rpc_client.dart';
import 'package:walletkit_dart/src/domain/repository/json_rpc_client.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

Future<List<(String, int)>> getBestHealthEndpointsWithRetry({
  required Iterable<(String, int)> endpointPool,
  required TokenEntity token,
  int max = 10,
  int min = 2,
  int maxRetries = 4,
  Duration maxLatency = const Duration(milliseconds: 800),
}) async {
  final selectedEndpoints = <(String, int)>{};
  var retries = 0;
  var lat = maxLatency;

  while (true) {
    final endpoints = await _getBestHealthEndpoints(
      endpoints: endpointPool,
      token: token,
      maxClients: max,
      maxLatency: lat,
    );

    selectedEndpoints.addAll(endpoints);

    if (selectedEndpoints.length >= min || retries >= maxRetries) break;

    retries++;
    lat *= 1.5;
  }

  if (selectedEndpoints.length < min) {
    throw Exception(
      "Could not find enough healthy ElectrumX endpoints for ${token.symbol}",
    );
  }

  Logger.log(
    "Selected ${selectedEndpoints.length} ElectrumX endpoints for ${token.symbol} after $retries retries with maxLatency: ${lat.inMilliseconds}ms",
  );

  return selectedEndpoints.toList();
}

Future<List<(String, int)>> _getBestHealthEndpoints({
  required Iterable<(String, int)> endpoints,
  required TokenEntity token,
  int maxClients = 10,
  Duration maxLatency = const Duration(milliseconds: 1500),
}) async {
  final latencies = await Future.wait([
    for (final entry in endpoints)
      getResponseTimeForHost(
        entry,
        maxLatency: maxLatency,
        token: token,
      ).timeout(
        maxLatency * 100,
        onTimeout: () {
          print("Creat Client Timeout for ${entry}");
          return null;
        },
      )
  ]);

  final latencyMap = {
    for (int i = 0; i < endpoints.length; i++)
      if (latencies[i] != null) endpoints[i]: latencies[i]!
  };

  /// Sort after latency
  final sorted = latencyMap.entries
      .where((entry) => entry.value.$1 <= maxLatency.inMilliseconds)
      .toList()
    ..sort((a, b) => a.value.$1.compareTo(b.value.$1));

  if (sorted.isEmpty) {
    return [];
  }

  final bockheightMap = <int, List<(String, int)>>{};
  for (final entry in sorted) {
    final blockHeight = entry.value.$2;
    bockheightMap[blockHeight] = [
      ...bockheightMap[blockHeight] ?? [],
      entry.key
    ];
  }

  /// Take the Biggest Endpoint List
  final mostForBlockHeight = bockheightMap.values.reduce(
    (a, b) => a.length > b.length ? a : b,
  );

  return mostForBlockHeight.take(maxClients).toList();
}

Future<(double, int)?> getResponseTimeForHost(
  final (String, int) host, {
  required Duration maxLatency,
  required TokenEntity token,
}) async {
  Stopwatch stopwatch = Stopwatch()..start();
  final client = await createElectrumXClient(
    endpoint: host.$1,
    port: host.$2,
    token: token,
  );
  if (client == null) return null;
  final block = await client.getCurrentBlock();
  await client.disconnect();
  stopwatch.stop();

  /// If the block is null the Host doenst provide a valid response
  if (block == null) return null;

  return (stopwatch.elapsed.inMilliseconds.toDouble() / 2, block);
}

Future<List<ElectrumXClient>> createClients({
  required List<(String, int)> endpoints,
  required TokenEntity token,
}) async {
  return (await Future.wait([
    for (final entry in endpoints)
      createElectrumXClient(
        endpoint: entry.$1,
        port: entry.$2,
        token: token,
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          print("Creat Client Timeout for ${entry}");
          return null;
        },
      )
  ]))
      .whereType<ElectrumXClient>()
      .toList();
}

Future<ElectrumXClient?> createElectrumXClient({
  required String endpoint,
  required int port,
  required TokenEntity token,
}) async {
  final tcpJsonRpcClient = TcpJsonRpcClient(
    isZeniq: token == zeniqCoin,
    host: endpoint,
    port: port,
  );
  final success = await tcpJsonRpcClient.connected;
  if (success == false) return null;
  return ElectrumXClient(tcpJsonRpcClient);
}

Future<ElectrumXClient?> createRandomElectrumXClient({
  required List<(String, int)> endpoints,
  required List<(String, int)> excludedEndpoints,
  required TokenEntity token,
}) async {
  endpoints.shuffle();

  for (final endpoint in endpoints) {
    final client = await createElectrumXClient(
      endpoint: endpoint.$1,
      port: endpoint.$2,
      token: token,
    );
    if (client == null) continue;
    endpoints.remove(endpoint);
    excludedEndpoints.add(endpoint);
    return client;
  }

  return null;
}

Future<(T?, ElectrumXClient?, NoWorkingHostsException?)>
    fetchFromRandomElectrumXNode<T>(
  Future<T> Function(ElectrumXClient) fetchFunction, {
  required ElectrumXClient? client,
  required Iterable<(String, int)> endpoints,
  required TokenEntity token,
  Duration timeout = const Duration(milliseconds: 3000),
}) async {
  try {
    if (client == null) throw ClientNullException("Client is null");
    final result = await fetchFunction(client).timeout(timeout);
    return (result, client, null);
  } catch (e, s) {
    if (e is! ClientNullException) {
      Logger.logWarning(
        "ElectrumX fetch failed for initial ${client?.host}. Trying new Hosts. $e $s",
      );
    }

    client?.disconnect();

    /// If the fetch failed, try to fetch with a random client
    final endpoints0 = List.of(endpoints, growable: true)..shuffle();

    final errors = <String>[];

    for (final endpoint in endpoints0) {
      final client = await createElectrumXClient(
        endpoint: endpoint.$1,
        port: endpoint.$2,
        token: token,
      );
      if (client == null) continue;
      try {
        final result = await fetchFunction(client).timeout(timeout);
        return (result, client, null);
      } catch (e, s) {
        client.disconnect();
        errors.add("$e $s");
        Logger.logWarning("ElectrumX fetch failed for ${client.host}: $e");
      }
    }

    return (
      null,
      null,
      NoWorkingHostsException(
        "Could not fetch from any endpoint: $endpoints $errors",
      )
    );
  }
}
