import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../ci/fetching/fetch_utxo_transactions_test.dart';

void main() {
  ///
  /// Fetches all Transactions and calculates the balance for a given
  ///
  test('Fetch Extended Public Key Wallet', () async {
    const epubKey =
        "xpub69H9jhEomWFjJQWsFqR9RyoQz7tbjFGukUsh357dvkfKywxkvPEtVPy9p8mq87GJd94uhWyiuKWRgncwMiZ7sJ3no6EQMMRGFGUE1nRrsK4";

    final (txs, _) = await fetchUTXOTransactions(
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      ePubKey: epubKey,
    );

    reportCoinsAndAddresses(txList: txs, type: ZeniqNetwork);
  });
}
