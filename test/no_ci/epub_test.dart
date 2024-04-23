import 'package:collection/collection.dart';
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

    final a = txs.toList().singleWhereOrNull((element) =>
        element.hash ==
        "3ca54c015f3c79bc86c92e50f19f5f8278254c5327a2a05ededab8fe36e79b89");

    reportCoinsAndAddresses(txList: txs, type: ZeniqNetwork);
  });
}
