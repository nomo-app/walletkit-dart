import 'package:mockito/mockito.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import 'ci-mocked/mocks.mocks.dart';
import 'utils.dart';

abstract class RPCTestConfig {
  Future<EvmRpcInterface> setupRPC();
  Future<void> setupBlockNumber(dynamic response);
  Future<void> setupGasPrice(dynamic response);
  Future<void> setupBalance(dynamic response);
  Future<void> setupTokenCall(dynamic response);
  Future<void> setupEstimateGas(dynamic response);
  Future<void> setupTransactionCount(dynamic response);
  Future<void> setupPriorityFee(dynamic response);
  Future<void> setupTransactionByHash(String hash, Map<String, dynamic> response);
}

class RPCMockTestConfig implements RPCTestConfig {
  late MockJsonRPC mockJsonRPC;
  late EvmRpcInterface evmRpcInterface;

  @override
  Future<EvmRpcInterface> setupRPC() async {
    mockJsonRPC = MockJsonRPC();
    evmRpcInterface = EvmRpcInterface(
      type: ArbitrumNetwork,
      clients: [
        EvmRpcClient.withRPC(mockJsonRPC),
      ],
    );
    return evmRpcInterface;
  }

  @override
  Future<void> setupBlockNumber(dynamic response) async {
    when(mockJsonRPC.call('eth_blockNumber', any))
        .thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupBalance(dynamic response) async {
    when(mockJsonRPC.call('eth_getBalance', any)).thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupTokenCall(dynamic response) async {
    when(mockJsonRPC.call('eth_call', any)).thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupGasPrice(dynamic response) async {
    when(mockJsonRPC.call('eth_gasPrice', any)).thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupEstimateGas(dynamic response) async {
    when(mockJsonRPC.call('eth_estimateGas', any))
        .thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupTransactionCount(dynamic response) async {
    when(mockJsonRPC.call('eth_getTransactionCount', any))
        .thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupPriorityFee(dynamic response) async {
    when(mockJsonRPC.call('eth_maxPriorityFeePerGas', any))
        .thenAnswer((_) async => RPCResponse(1, response));
  }

  @override
  Future<void> setupTransactionByHash(String hash, Map<String, dynamic> response) async {
    when(mockJsonRPC.call('eth_getTransactionByHash', [hash]))
        .thenAnswer((_) async => RPCResponse(1, response));
  }

  Future<void> setupGasResponses({
    String? gasPrice,
    String? priorityFee,
    String? estimateGas,
  }) async {
    if (gasPrice != null) await setupGasPrice(gasPrice);
    if (priorityFee != null) await setupPriorityFee(priorityFee);
    if (estimateGas != null) await setupEstimateGas(estimateGas);
  }
}

class RPCLiveTestConfig implements RPCTestConfig {
  final EVMNetworkType networkType;
  late EvmRpcInterface evmRpcInterface;

  RPCLiveTestConfig({
    required this.networkType,
    List<String>? rpcUrls,
  });

  @override
  Future<EvmRpcInterface> setupRPC() async {
    // Different setup based on network type
    switch (networkType) {
      case ETHEREUM_NETWORK():
        evmRpcInterface = ethereumRPC;
      case ZENIQ_SMART_NETWORK():
        evmRpcInterface = zeniqSmartChainRPC;
      case BNB_NETWORK():
        evmRpcInterface = bnbRPC;
      case POLYGON_NETWORK():
        evmRpcInterface = polygonRPC;
      case TRON_NETWORK():
      //TRON should be handled differently as it is not an EVM network
      case ARBITRUM_NETWORK():
        evmRpcInterface = arbitrumRPC;
      case BASE_NETWORK():
        evmRpcInterface = baseRPC;
      case MOONBEAM_NETWORK():
        evmRpcInterface = moonbeamRPC;
      case AVALANCHE_NETWORK():
        evmRpcInterface = avalancheRPC;
      case OPTIMISM_NETWORK():
        evmRpcInterface = optimismRPC;
      case ZKSYNC_NETWORK():
        evmRpcInterface = zksyncRPC;
    }
    return evmRpcInterface;
  }

  // These methods don't need to do anything in live config
  @override
  Future<void> setupBlockNumber(dynamic response) async {}
  @override
  Future<void> setupGasPrice(dynamic response) async {}
  @override
  Future<void> setupBalance(dynamic response) async {}
  @override
  Future<void> setupTokenCall(dynamic response) async {}
  @override
  Future<void> setupEstimateGas(response) async {}
  @override
  Future<void> setupPriorityFee(response) async {}
  @override
  Future<void> setupTransactionByHash(String hash, Map<String, dynamic> response) async {}
  @override
  Future<void> setupTransactionCount(response) async {}
}

class RPCTestParameters {
  final ERC20Entity? token;

  RPCTestParameters({
    this.token,
  });
}
