@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../rpc_test_config.dart';
import '../../shared_rpc_tests.dart';

void main() {
  final arbitrumParams = RPCTestParameters(token: arbitrum);
  final ethereumParams = RPCTestParameters(token: usdtToken);
  final zeniqSmartParams = RPCTestParameters(token: avinocZSC);
  final moonbeamParams = RPCTestParameters(token: frax);
  final avalancheParams = RPCTestParameters(token: wrappedETH);
  final optimismParams = RPCTestParameters(token: optimism);
  final zkSyncParams = RPCTestParameters(token: wbtcZKSync);
  final polygonParams = RPCTestParameters(token: cLFi);
  final baseParams = RPCTestParameters(token: mathToken);
  final bnbParams = RPCTestParameters(token: zeniqBSCToken);

  runSharedRPCTests(
      description: "Ethereum Network RPC Tests",
      config: RPCLiveTestConfig(networkType: EthereumNetwork),
      params: ethereumParams);
  runSharedRPCTests(
      description: "Zeniq_Smart_Network RPC Tests",
      config: RPCLiveTestConfig(networkType: ZeniqSmartNetwork),
      params: zeniqSmartParams);
  runSharedRPCTests(
      description: "Arbitrum Network RPC Tests",
      config: RPCLiveTestConfig(networkType: ArbitrumNetwork),
      params: arbitrumParams);
  runSharedRPCTests(
      description: "Moonbeam Network RPC Tests",
      config: RPCLiveTestConfig(networkType: MoonbeamNetwork),
      params: moonbeamParams);
  runSharedRPCTests(
      description: "Avalanche Network RPC Tests",
      config: RPCLiveTestConfig(networkType: AvalancheNetwork),
      params: avalancheParams);
  runSharedRPCTests(
      description: "Optimism Network RPC Tests",
      config: RPCLiveTestConfig(networkType: OptimismNetwork),
      params: optimismParams);
  runSharedRPCTests(
      description: "ZKSync Network RPC Tests",
      config: RPCLiveTestConfig(networkType: ZKSyncNetwork),
      params: zkSyncParams);
  runSharedRPCTests(
      description: "Base Network RPC Tests",
      config: RPCLiveTestConfig(networkType: EthereumNetwork),
      params: baseParams);
  runSharedRPCTests(
      description: "Polygon Network RPC Tests",
      config: RPCLiveTestConfig(networkType: PolygonNetwork),
      params: polygonParams);
  runSharedRPCTests(
      description: "Binance Network RPC Tests",
      config: RPCLiveTestConfig(networkType: BNBNetwork),
      params: bnbParams);
}
