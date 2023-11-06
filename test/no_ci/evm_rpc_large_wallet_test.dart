@Timeout(Duration(seconds: 600))
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('fetch ZSC txs huge wallet', () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
    final txList = await rpcInterface.fetchAllTransactionsZSC(
      address: "0x566d65116a24ce5dF9C8ABd271588ebc662688d0",
    );
    expect(txList.length, greaterThanOrEqualTo(1000));
  });

  test(
      'fetch ZSC txs & expect 0x1657dd75352314f7e1f81e6a66c51779ded751f28363ccbcfe5946c3b9b95bae Failed',
      () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
    final txList = await rpcInterface.fetchAllTransactionsZSC(
      address: "0x046Cf00C608478D1B38705465182abF2F3D9d944",
    );

    final tx = txList.singleWhereOrNull(
      (element) =>
          element.hash ==
          "0x1657dd75352314f7e1f81e6a66c51779ded751f28363ccbcfe5946c3b9b95bae",
    );

    expect(tx, isNotNull);

    expect(tx!.status, ConfirmationStatus.failed);
  });
}
