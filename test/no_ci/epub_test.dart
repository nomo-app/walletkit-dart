import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../ci/fetching/fetch_utxo_transactions_test.dart';

void main() {
  ///
  /// Fetches all Transactions and calculates the balance for a given
  ///
  test('Fetch Extended Public Key Wallet', () async {
    const epubKey =
        "xpub692ymxrAm8ZiquZW4AwHmXg8xnSsFeVyzGGTRBBmKVhRvYqwGjfd5yYw8JToejJJrKwKexFXgjnr4thKaSqYBSXKZvuxQtUDHRZsYoVaE8p";

    final (txs, _) = await fetchUTXOTransactions(
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      ePubKey: epubKey,
    );

    reportCoinsAndAddresses(txList: txs, type: ZeniqNetwork);
  });
}
