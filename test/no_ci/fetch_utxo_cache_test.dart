@Timeout(Duration(minutes: 5))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../ci/fetching/expected_utxo_tx_hashes.dart';

void main() {
  test('fetch ZENIQ txs twice - test cache correctness', () async {
    const ePubKey = rejectXpub;

    final stopWatch = Stopwatch();
    stopWatch.start();
    final (txList1, _) = await fetchUTXOTransactionsFromEpubKey(
      ePubKey: ePubKey,
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      purpose: HDWalletPurpose.NO_STRUCTURE,
    );
    final timeFirstFetch = stopWatch.elapsedMilliseconds;
    stopWatch.reset();
    final cacheSimulation = txList1.take(txList1.length ~/ 2).toSet();
    final (txList2, _) = await fetchUTXOTransactionsFromEpubKey(
      ePubKey: ePubKey,
      addressTypes: [AddressType.legacy],
      cachedTransactions: cacheSimulation,
      networkType: ZeniqNetwork,
      purpose: HDWalletPurpose.NO_STRUCTURE,
    );
    final timeSecondFetch = stopWatch.elapsedMilliseconds;

    print(
        "First fetch took $timeFirstFetch Milliseconds - Second fetch took $timeSecondFetch Milliseconds");

    expect(txList2.length, txList1.length);
    final firstBalance = computeBalanceFromUTXOs(txList: txList1);
    final secondBalance = computeBalanceFromUTXOs(txList: txList2);
    expect(secondBalance, firstBalance);

    final expectedTxHashes = expectedTxHashesZENIQReject();
    expectTxHashes(txList: txList1, expectedTxHashes: expectedTxHashes);
    expectTxHashes(txList: txList2, expectedTxHashes: expectedTxHashes);

    expect(timeSecondFetch, lessThan(timeFirstFetch));
  });

  test('fetch ZENIQ txs multiple times - test in-memory-cache performance', () async {
    const ePubKey = rejectXpub;

    for (int i = 1; i <= 4; i++) {
      final stopWatch = Stopwatch();
      stopWatch.start();
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey: ePubKey,
        addressTypes: [AddressType.legacy],
        networkType: ZeniqNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      final timeFetch = stopWatch.elapsedMilliseconds;

      print("Fetch number $i took $timeFetch Milliseconds");

      expect(txList.length, greaterThanOrEqualTo(301));
      final expectedTxHashes = expectedTxHashesZENIQReject();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
    }
  });
}
