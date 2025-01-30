import 'dart:typed_data';
import 'package:dotenv/dotenv.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

///
/// RPC to Test
///

final ethereumRPC = EvmRpcInterface(type: EthereumNetwork, clients: [
  EvmRpcClient('https://eth.llamarpc.com'),
  EvmRpcClient('https://rpc.lokibuilder.xyz/wallet)'),
  EvmRpcClient('https://ethereum-rpc.publicnode.com')
]);

final zeniqSmartChainRPC = EvmRpcInterface(
  type: ZeniqSmartNetwork,
  clients: [EvmRpcClient('https://api.zeniq.network')],
  useQueuedManager: false,
);

final polygonRPC = EvmRpcInterface(
  type: PolygonNetwork,
  clients: [
    EvmRpcClient('https://polygon-bor.publicnode.com'),
    EvmRpcClient('https://polygon.llamarpc.com'),
    EvmRpcClient('https://polygon.drpc.org')
  ],
);

final bnbRPC = EvmRpcInterface(
  type: BNBNetwork,
  clients: [
    EvmRpcClient('https://bsc-dataseed.binance.org'),
    EvmRpcClient('https://bsc-rpc.publicnode.com'),
    EvmRpcClient('https://bsc-pokt.nodies.app')
  ],
);

final arbitrumRPC = EvmRpcInterface(
  type: ArbitrumNetwork,
  clients: [
    EvmRpcClient('https://arbitrum.llamarpc.com'),
    EvmRpcClient('https://endpoints.omniatech.io/v1/arbitrum/one/public'),
    EvmRpcClient('https://arb-pokt.nodies.app')
  ],
);

final baseRPC = EvmRpcInterface(
  type: EthereumNetwork,
  clients: [
    EvmRpcClient('https://base.llamarpc.com'),
    EvmRpcClient('https://base-pokt.nodies.app'),
    EvmRpcClient('https://base-rpc.publicnode.com')
  ],
);

final moonbeamRPC = EvmRpcInterface(
  type: MoonbeamNetwork,
  clients: [
    EvmRpcClient('https://moonbeam-rpc.publicnode.com'),
    EvmRpcClient('https://moonbeam.public.curie.radiumblock.co/http'),
    EvmRpcClient('https://moonbeam.drpc.org')
  ],
);

final avalancheRPC = EvmRpcInterface(
  type: AvalancheNetwork,
  clients: [
    EvmRpcClient('https://api.avax.network/ext/bc/C/rpc'),
    EvmRpcClient('https://avalanche-c-chain-rpc.publicnode.com'),
    EvmRpcClient('https://avax-pokt.nodies.app/ext/bc/C/rpc')
  ],
);

final optimismRPC = EvmRpcInterface(
  type: OptimismNetwork,
  clients: [
    EvmRpcClient('https://optimism.llamarpc.com'),
    EvmRpcClient('https://op-pokt.nodies.app'),
    EvmRpcClient('https://rpc.ankr.com/optimism')
  ],
);

final zksyncRPC = EvmRpcInterface(
  type: ZKSyncNetwork,
  clients: [
    EvmRpcClient('https://zksync-era.blockpi.network/v1/rpc/public'),
    EvmRpcClient('https://mainnet.era.zksync.io'),
    EvmRpcClient('https://1rpc.io/zksync2-era'),
  ],
);

final tronSolidityRPC = EvmRpcInterface(
  type: TRON_Network,
  clients: [EvmRpcClient('https://api.trongrid.io/jsonrpc')],
);

///
/// Explorers
///

final zeniqScan = ZeniqScanExplorer(
  zeniqScanEnpoint,
  [],
  zeniqSmart,
);

final tronScan = TronScanRepository(
  apiKeys: loadListFromEnv("TRONSCAN_API_KEYS"),
);

final etherscan = EtherscanExplorer(
  etherscanBaseEndpoint,
  loadListFromEnv("ETHERSCAN_API_KEYS"),
  ethNative,
);
final polygonscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), polygon);
final bscscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), binanceSmart);
final arbitrumscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), ethArbitrum);
final moonbeamscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), moonbeam);
final basescan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), ethBase);
final optimismscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), ethOptimism);
final zksyncscan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), ethzkSync);
final avalancheScan = EtherscanExplorer(
    etherscanBaseEndpoint, loadListFromEnv("ETHERSCAN_API_KEYS"), avalanche);

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

String loadMnemonicFromEnv(String key) {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  return env[key]!;
}
