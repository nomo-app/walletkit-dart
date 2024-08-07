import 'dart:typed_data';

import 'package:dotenv/dotenv.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

///
/// RPC to Test
///

final ethereumRPC = EvmRpcInterface(
  type: EthereumNetwork,
  clients: [EvmRpcClient('https://eth.llamarpc.com')],
);

final zeniqSmartChainRPC = EvmRpcInterface(
  type: ZeniqSmartNetwork,
  clients: [EvmRpcClient('https://smart.zeniq.network:9545')],
);

final polygonRPC = EvmRpcInterface(
  type: PolygonNetwork,
  clients: [EvmRpcClient('https://polygon-bor.publicnode.com')],
);

final bnbRPC = EvmRpcInterface(
  type: BNBNetwork,
  clients: [EvmRpcClient('https://bsc-dataseed.binance.org')],
);

final arbitrumRPC = EvmRpcInterface(
  type: ArbitrumNetwork,
  clients: [EvmRpcClient('https://arbitrum.llamarpc.com')],
);

final baseRPC = EvmRpcInterface(
  type: EthereumNetwork,
  clients: [EvmRpcClient('https://base.llamarpc.com')],
);

final moonbeamRPC = EvmRpcInterface(
  type: MoonbeamNetwork,
  clients: [EvmRpcClient('https://moonbeam-rpc.publicnode.com')],
);

final avalancheRPC = EvmRpcInterface(
  type: AvalancheNetwork,
  clients: [EvmRpcClient('https://api.avax.network/ext/bc/C/rpc')],
);

final optimismRPC = EvmRpcInterface(
  type: OptimismNetwork,
  clients: [EvmRpcClient('https://optimism.llamarpc.com')],
);

final zksyncRPC = EvmRpcInterface(
  type: ZKSyncNetwork,
  clients: [EvmRpcClient('https://zksync-era.blockpi.network/v1/rpc/public')],
);

final tronSolidityRPC = EvmRpcInterface(
  type: TRON_Network,
  clients: [EvmRpcClient('https://api.trongrid.io/jsonrpc')],
);

///
/// Explorers
///

final tronScan = TronScanRepository(
  apiKeys: [
    "a875e9b5-2d45-410c-ade9-49ee456be28a",
    "0eb54755-e150-40d3-8d1a-f8ab389b845a",
  ],
);

final etherscan = EVMExplorer(
  etherscanBaseEndpoint,
  loadListFromEnv("ETHERSCAN_API_KEYS"),
);
final polygonscan = EVMExplorer(polygonScanBaseEndpoint, []);
final bscscan = EVMExplorer(bnbScanBaseEndpoint, []);
final arbitrumscan = EVMExplorer(arbitrumScanBaseEndpoint, []);
final moonbeamscan = EVMExplorer(moonbeamScanBaseEndpoint, []);
final basescan = EVMExplorer(baseScanEndpoint, []);
final optimismscan = EVMExplorer(optimismScanEndpoint, []);
final zksyncscan = EVMExplorer(zksyncAPIEndpoint, []);
final avalancheScan = EVMExplorer(avalancheAPIEndpoint, []);

///
/// Utils
///

Uint8List loadDevSeedFromEnv() {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final rejectSeedString = env["REJECT_SEED"]!.split(",");
  List<int> rejectIntList = rejectSeedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List rejectSeed = Uint8List.fromList(rejectIntList);
  return rejectSeed;
}

Uint8List loadFromEnv(String envName) {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final seedString = env[envName]!.split(",");
  List<int> intList = seedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List seed = Uint8List.fromList(intList);
  return seed;
}

List<String> loadListFromEnv(String key) {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final seedString = env[key]!.split(",");
  return seedString;
}
