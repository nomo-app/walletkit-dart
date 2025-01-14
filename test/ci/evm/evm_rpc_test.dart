@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../rpc_test_config.dart';
import '../../shared_rpc_tests.dart';
import '../../utils.dart';

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

  test('test erc1155 balance of token', () async {
    final balance = await zeniqSmartChainRPC.fetchERC1155BalanceOfToken(
      address: arbitrumTestWallet,
      tokenID: BigInt.from(2),
      contractAddress: "0xB868a4d85c3f7207106145eB41444c5313C97D86",
    );

    print('Balance: $balance');
    expect(balance, isNotNull);
    expect(balance, greaterThanOrEqualTo(BigInt.zero));
  });

  test('test erc1155 batch balance of tokens', () async {
    final balances = await zeniqSmartChainRPC.fetchERC1155BatchBalanceOfTokens(
      accounts: [
        arbitrumTestWallet,
        arbitrumTestWallet,
        arbitrumTestWallet,
        arbitrumTestWallet,
        arbitrumTestWallet
      ],
      tokenIDs: [
        BigInt.from(0),
        BigInt.from(1),
        BigInt.from(2),
        BigInt.from(3),
        BigInt.from(4)
      ],
      contractAddress: "0xB868a4d85c3f7207106145eB41444c5313C97D86",
    );

    print('Balances: $balances');
    expect(balances, isNotNull);
  });

  test('test uri of erc1155 tokens', () async {
    final uri = await ethereumRPC.fetchERC1155UriOfToken(
      tokenID: BigInt.from(1),
      contractAddress: "0x1ca3262009b21F944e6b92a2a88D039D06F1acFa",
    );

    print('URI: $uri');
    expect(uri, isNotNull);
  });

  test("is erc1155", () async {
    bool isERC1155 = false;
    try {
      await ethereumRPC.fetchERC1155BalanceOfToken(
          address: arbitrumTestWallet,
          tokenID: BigInt.from(0),
          contractAddress: "0x1ca3262009b21F944e6b92a2a88D039D06F1acFa");
      isERC1155 = true;
    } catch (e) {
      isERC1155 = false;
    }

    print('isERC1155: $isERC1155');
  });
}
