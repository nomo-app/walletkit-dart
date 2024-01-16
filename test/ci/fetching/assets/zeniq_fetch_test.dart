@Timeout(Duration(minutes: 5))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../no_ci/input_simulation_test.dart';
import '../../../no_ci/utils_test.dart';

void main() {
  final devSeed = loadDevSeedFromEnv();

  test('Simulate Zeniq Wallet', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      minEndpoints: 1,
    );
    expect(txList.length, greaterThanOrEqualTo(348));

    final sendTxs = txList
        .where((tx) =>
            tx.transferMethod == TransactionTransferMethod.send ||
            tx.transferMethod == TransactionTransferMethod.own)
        .map((tx) => tx.id);

    final results = await Future.wait([
      for (final tx in sendTxs)
        simulateTx(
          hash: tx,
          nodes: nodes,
          seed: devSeed,
          networkType: ZeniqNetwork,
          addressTypes: [AddressType.legacy],
        ),
    ]);

    final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    expect(validSimulations.length, greaterThanOrEqualTo(250));
    expect(invalidSimulations, isEmpty);
  });
}
