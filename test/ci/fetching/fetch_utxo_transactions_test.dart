@Timeout(Duration(minutes: 5))
import 'dart:math';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import 'expected_utxo_tx_hashes.dart';

void main() {
  group("Fetch Transaction for every Coin with the xpub", () {
    test('fetch BCH transactions xpub dev wallet', () async {
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        networkType: BitcoincashNetwork,
        ePubKey: rejectXpub,
        addressTypes: [AddressType.legacy, AddressType.cashaddr],
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(14));
      final expectedTxHashes = expectedTxHashesBCHReject();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: BitcoincashNetwork);
    });

    test('fetch ZENIQ transactions xpub dev wallet', () async {
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey: rejectXpub,
        addressTypes: [AddressType.legacy],
        networkType: ZeniqNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(301));
      final expectedTxHashes = expectedTxHashesZENIQReject();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: ZeniqNetwork);
    });

    test(
        'fetch BTC transactions xpub69TptoZubWfAZAi5TecLSRUjo8cvu5mq6qnbnD29deEzvdvcmy3sDiEYafmg5GD1Yvmr4uKtJadDEdY5ez6wBFSTawd5chLKHxdjw3uYZXw',
        () async {
      // xpub69T.. reported by P
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey:
            "xpub69TptoZubWfAZAi5TecLSRUjo8cvu5mq6qnbnD29deEzvdvcmy3sDiEYafmg5GD1Yvmr4uKtJadDEdY5ez6wBFSTawd5chLKHxdjw3uYZXw",
        addressTypes: [AddressType.legacy, AddressType.segwit],
        networkType: BitcoinNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(3));
      final expectedTxHashes = expectedTxHashesBTCxpub69T();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: BitcoinNetwork);
    });

    test(
        'fetch ZENIQ transactions xpub68G61RDvXPYULAPVaoK1djUycUqBi6UEYL2CkVZwYNM4FHnCcve7AkgCvmzpCMn48bgxsLgubUfrqznrTadyfkLxeQhtaH7NZ8rhuHfXyS5',
        () async {
      // see issue Nomo-801
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey:
            "xpub68G61RDvXPYULAPVaoK1djUycUqBi6UEYL2CkVZwYNM4FHnCcve7AkgCvmzpCMn48bgxsLgubUfrqznrTadyfkLxeQhtaH7NZ8rhuHfXyS5",
        addressTypes: [AddressType.legacy],
        networkType: ZeniqNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(20));
      final expectedTxHashes = expectedTxHashesZENIQxpub68G61R();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: ZeniqNetwork);
    });

    test(
        'fetch ZENIQ transactions xpub68dxwSLMkhjyHmnpBBXNTDhyUFAaeLVinaDjYXndV9cEn6Dvz5jVMcPRYq6T6XyakjdSnWYmZixUPc6TkYwH64PWPtnj4x3S73F1igAimjr',
        () async {
      // also see issue Nomo-801
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey:
            "xpub68dxwSLMkhjyHmnpBBXNTDhyUFAaeLVinaDjYXndV9cEn6Dvz5jVMcPRYq6T6XyakjdSnWYmZixUPc6TkYwH64PWPtnj4x3S73F1igAimjr",
        addressTypes: [AddressType.legacy],
        networkType: ZeniqNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(4));
      final expectedTxHashes = expectedTxHashesZENIQxpub68dxwS();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: ZeniqNetwork);
    });

    test(
        'fetch ZENIQ transactions xpub69Y1Sk2jpT46Z18PWgpMb2qic9HSqDh6uacrbVu3Vxh7mKhswH15aECHM8hzewP53Vo5L7C6tCXbVXVbhi5qUFxZbmx6hwbiT4aPjoGB7dS',
        () async {
      final (txList, _) = await fetchUTXOTransactionsFromEpubKey(
        ePubKey:
            "xpub69Y1Sk2jpT46Z18PWgpMb2qic9HSqDh6uacrbVu3Vxh7mKhswH15aECHM8hzewP53Vo5L7C6tCXbVXVbhi5qUFxZbmx6hwbiT4aPjoGB7dS",
        addressTypes: [AddressType.legacy],
        networkType: ZeniqNetwork,
        purpose: HDWalletPurpose.NO_STRUCTURE,
      );
      expect(txList.length, greaterThanOrEqualTo(10));
      final expectedTxHashes = expectedTxHashesXPub69Y1Sk2jp();
      expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: txList, type: ZeniqNetwork);
    });

    test('fetch BTC transactions xpub dev wallet', () async {
      final (legacyTxList, _) = await fetchUTXOTransactionsFromEpubKey(
        networkType: BitcoinNetwork,
        ePubKey: rejectXpub,
        purpose: HDWalletPurpose.NO_STRUCTURE,
        addressTypes: [AddressType.legacy, AddressType.segwit],
        minEndpoints: 5,
      );
      expect(legacyTxList.length, greaterThanOrEqualTo(76));
      final expectedTxHashes = expectedTxHashesBTCReject();
      expectTxHashes(txList: legacyTxList, expectedTxHashes: expectedTxHashes);
      reportCoinsAndAddresses(txList: legacyTxList, type: BitcoinNetwork);
    });

    test('fetch BTC Segwit Transactions xpub reject wallet', () async {
      final (segwitTxList, segwitNodes) =
          await fetchUTXOTransactionsFromEpubKey(
        networkType: BitcoinNetwork,
        ePubKey: rejectXpub,
        purpose: HDWalletPurpose.NO_STRUCTURE,
        addressTypes: [AddressType.segwit],
      );

      expect(
        segwitNodes.receiveNodes.first.address,
        "bc1qqpkk4j7ftjswn0ex7smmd6kucnw8l4m9w98yj4",
      );

      expect(
        segwitNodes.changeNodes.first.address,
        "bc1qnays69laz86xuk9fwmgh8mkr5jylvgyqe30vkn",
      );

      expect(segwitTxList.length, greaterThanOrEqualTo(42));
      reportCoinsAndAddresses(txList: segwitTxList, type: BitcoinNetwork);
    });

    // test('fetch LTC transactions xpub dev wallet', () async {
    //   final (txList, _) = await fetchUTXOTransactions(
    //     ePubKey: rejectXpub,
    //     networkType: LitecoinNetwork,
    //     walletTypes: [bitcoinBip44HDPath_LITECOIN],
    //     addressTypes: [AddressType.segwit],
    //     minEndpoints: 1,
    //   );
    //   expect(txList.length, greaterThanOrEqualTo(34));
    //   final expectedTxHashes = expectedTxHashesLitecoinReject();
    //   expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);
    //   reportCoinsAndAddresses(txList: txList, type: LitecoinNetwork);
    // });
  });
}

void reportCoinsAndAddresses({
  required Iterable<UTXOTransaction> txList,
  required UTXONetworkType type,
}) {
  final txSet = txList.map((tx) => tx.id).toSet();
  expect(txList.length, txSet.length); // ensure that there are no duplicates
  print("Found ${txList.length} transactions over all searched addresses");

  final utxoBalance = computeBalanceFromUTXOs(txList: txList);
  final visualBalance = computeBalanceFromVisualList(txList: txList);
  final utxoMap = extractUTXOs(txList: txList.toList());

  for (final vout in utxoMap.keys) {
    final val = vout.value / pow(10, type.coin.decimals).toBI;
    print(
      "Found $val ${type.coin.symbol} at address ${vout.getAddress(type)}",
    );
  }
  final balance = utxoBalance / pow(10, type.coin.decimals).toBI;
  print(
    "Total wallet balance: $balance ${type.coin.name}",
  );
  expect(
    (utxoBalance - visualBalance).abs(),
    greaterThanOrEqualTo(BigInt.zero),
  );
  expect(
    (utxoBalance - visualBalance).abs(),
    lessThanOrEqualTo(
      BigInt.from(0.1 * 1e8),
    ),
  );
}

void reportAddresses({
  required Iterable<NodeWithAddress> nodesWithAdress,
  required Iterable<UTXOTransaction> txList,
}) {
  for (var node in nodesWithAdress) {
    print("${node.addressesList}");
  }
}
