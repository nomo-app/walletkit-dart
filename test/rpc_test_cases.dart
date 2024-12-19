import 'package:walletkit_dart/walletkit_dart.dart';

import 'mocks.mocks.dart';

abstract class RPCTestConfig {
  Future<EvmRpcInterface> setupRPC();
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
}
