@Timeout(Duration(minutes: 5))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../no_ci/input_simulation_test.dart';
import '../../utils.dart';

void main() {
  test(
    "Legacy BTC Raw Transaction Test",
    () async {
      final devSeed = loadDevSeedFromEnv();
      final (txList, nodes) = await fetchUTXOTransactions(
        seed: devSeed,
        walletTypes: [bitcoinNSHDPath],
        addressTypes: [AddressType.legacy, AddressType.segwit],
        networkType: BitcoinNetwork,
        minEndpoints: 1,
      );

      print("Simulating Transaction");

      final result = await simulateTx(
        hash:
            "4af086895783260bfb83429d4d88d657688ffac54c4ddf7058da90ae5225a790",
        nodes: nodes,
        seed: devSeed,
        networkType: BitcoinNetwork,
        addressTypes: [AddressType.legacy, AddressType.segwit],
        writeToFile: true,
      );

      print(result);
    },
  );
}
