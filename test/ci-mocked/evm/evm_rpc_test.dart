@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import '../../rpc_test_config.dart';
import '../../shared_rpc_tests.dart';

void main() {
  runSharedRPCTests(
      description: "Mocked RPC Tests",
      config: RPCMockTestConfig(),
      params: RPCTestParameters());
}
