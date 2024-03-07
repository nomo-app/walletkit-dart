import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Fetch tx Status', () async {
    final rpc = EvmRpcInterface(PolygonNetwork);

    final polygonScan = EVMExplorer(etherscanBaseEndpoint, [etherscanApiKey]);

    final result = await polygonScan.fetchEstimatedTime(21000);

    final hash =
        "0x83c5e45216b2f135980ab57505551d486fa923f40735324e643f09405c3ee9cb";

    await rpc.client.getTransactionReceipt(hash).then((value) {
      print(value);
    });
  });
}
