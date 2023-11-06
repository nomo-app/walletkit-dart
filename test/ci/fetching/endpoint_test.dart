@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:nomo_common/nomo_common.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test("Get Best Health ElectrumX Endpoints Zeniq", () async {
    final stopwatch = Stopwatch()..start();
    final endpoints = await getBestHealthEndpointsWithRetry(
      endpointPool: ZeniqNetwork.endpoints,
      token: zeniqCoin,
      min: 3,
      maxLatency: Duration(milliseconds: 50),
      maxRetries: 10,
    );

    expect(endpoints, isNotEmpty);
    logEndpoints(endpoints, stopwatch);
  });

  test("Get Best Health ElectrumX Endpoints Bitcoin", () async {
    final stopwatch = Stopwatch()..start();
    final endpoints = await getBestHealthEndpointsWithRetry(
      endpointPool: BitcoinNetwork.endpoints,
      token: btcCoin,
      max: 25,
      maxLatency: Duration(milliseconds: 200),
    );

    expect(endpoints, isNotEmpty);
    logEndpoints(endpoints, stopwatch);
  });

  test("Get Best Health ElectrumX Endpoints Litecoin", () async {
    final stopwatch = Stopwatch()..start();
    final endpoints = await getBestHealthEndpointsWithRetry(
      endpointPool: LitecoinNetwork.endpoints,
      token: ltcCoin,
      maxLatency: Duration(milliseconds: 1000),
      maxRetries: 5,
      max: 25,
      min: 1,
    );

    expect(endpoints, isNotEmpty);
    logEndpoints(endpoints, stopwatch);
  });

  test("Get Best Health ElectrumX Endpoints BitcoinCash", () async {
    final stopwatch = Stopwatch()..start();
    final endpoints = await getBestHealthEndpointsWithRetry(
      endpointPool: BitcoincashNetwork.endpoints,
      token: bchCoin,
      max: 25,
      min: 1,
      maxLatency: Duration(milliseconds: 800),
    );

    expect(endpoints, isNotEmpty);
    logEndpoints(endpoints, stopwatch);
  });
}

void logEndpoints(List<(String, int)> endpoints, Stopwatch stopwatch) {
  stopwatch.stop();
  Logger.logFetch("Endpoints: ${endpoints.length}");
  Logger.logFetch("Fastest endpoint: ${endpoints.first}");
  Logger.logFetch("Slowest endpoint: ${endpoints.last}");
  Logger.logFetch("Elapsed time: ${stopwatch.elapsed}");

  for (var element in endpoints) {
    print("\"" + element.$1 + ":${element.$2}\",");
  }
}
