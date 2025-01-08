import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../utils.dart';
import '../fetch_utxo_transactions_test.dart';

void main() {
  test('No Structure Transaction with Xpub reject wallet', () async {
    // D65DuQST2rnXaSeyEZQrerjSFCQjd8ZQ5T

    final devSeed = loadFromEnv("DEV_SEED");
    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: DogecoinNetwork,
      seed: devSeed,
      walletTypes: [
        Bip44HDWalletPath("3'"),
      ],
      minEndpoints: 1,
      addressTypes: [AddressType.legacy],
    );

    for (final adr in nodes.addresses) {
      print(adr);
    }

    expect(txList.length, greaterThanOrEqualTo(0));

    reportCoinsAndAddresses(txList: txList, type: DogecoinNetwork);
  });
}
