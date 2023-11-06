@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../expected_utxo_tx_hashes.dart';
import '../fetch_utxo_transactions_test.dart';

void main() {
  // test('Test Bitcoin Derivation', () async {
  //   final (nsTxList, nsNodes) = await fetchUTXOTransactions(
  //     networkType: BitcoinNetwork,
  //     seed: helloSeed,
  //     walletTypes: [
  //       HDWalletType.NO_STRUCTURE,
  //       HDWalletType.BIP84,
  //       HDWalletType.BIP44,
  //     ],
  //     addressTypes: [AddressType.legacy, AddressType.segwit],
  //   );
  //   TODO: Either remove this test or replace the "print" statements with "expect" statements. Unit-testing with "print" is worthless if nobody knows the expected result.
  //   print(nsNodes.length);
  //   reportAddresses(txList: nsTxList, nodesWithAdress: nsNodes);
  //   reportCoinsAndAddresses(txList: nsTxList, type: BitcoinNetwork);
  // });

  test('No Structure Transaction with Xpub', () async {
    final (legacyTxList, _) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      ePubKey: rejectXpub,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );
    expect(legacyTxList.length, greaterThanOrEqualTo(74));
    final expectedTxHashes = expectedTxHashesBTCReject();
    expectTxHashes(txList: legacyTxList, expectedTxHashes: expectedTxHashes);
    reportCoinsAndAddresses(txList: legacyTxList, type: BitcoinNetwork);
  });

  test('fetch BTC BIP84 Transactions zpub reject wallet', () async {
    final (segwitTxList, segwitNodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      ePubKey: rejectZpub,
      walletTypes: [HDWalletType.BIP84],
      addressTypes: [AddressType.segwit],
    );

    expect(
      segwitNodes.receiveNodes.first.address,
      "bc1qgm60ugxg0xtk7z5n92fdxm2y0nclp78c954wac",
    );

    expect(
      segwitNodes.changeNodes.first.address,
      "bc1q6npruhg5fl07t5mahj0zr9w65cvf45amgttc3p",
    );

    expect(segwitTxList.length, greaterThanOrEqualTo(0));
    reportCoinsAndAddresses(txList: segwitTxList, type: BitcoinNetwork);
  });

  test('fetch BTC BIP84 Transactions seed hello wallet', () async {
    final (segwitTxList, segwitNodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: helloSeed,
      walletTypes: [HDWalletType.BIP84],
      addressTypes: [AddressType.segwit],
    );

    expect(
      segwitNodes.receiveNodes.first.address,
      "bc1qmn0ffnuenr6p537p8348dwad9v6d74rs0hjzaj",
    );

    expect(
      segwitNodes.changeNodes.first.address,
      "bc1ql5nm3ml088js4ac73f9xvxesktmxycmjyeg7zj",
    );

    expect(segwitTxList.length, greaterThanOrEqualTo(0));
    reportCoinsAndAddresses(txList: segwitTxList, type: BitcoinNetwork);
  });

  test('fetch BTC NS Transactions xpub reject wallet', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      ePubKey: rejectXpub,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );

    expect(
      bip44Nodes.receiveNodes.first.address,
      "113G5SRkh8KqMfmqJKphuS1ALjxC3ead3Z",
    );

    expect(
      bip44Nodes.changeNodes.first.address,
      "1FXDxBf5VHNVCq2QbCikxoL8ZkNirDVc6b",
    );

    expect(bip44TxList.length, greaterThanOrEqualTo(74));
    reportCoinsAndAddresses(txList: bip44TxList, type: BitcoinNetwork);
  });

  test('fetch BTC NS Transactions seed hello wallet', () async {
    final (_, bip44Nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: helloSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );

    expect(
      bip44Nodes.receiveNodes.first.address,
      "1EHFTP3A2TEUuz3ir8ZVB9CviC6Qh24Fvv",
    );

    expect(
      bip44Nodes.changeNodes.first.address,
      "1FFk4nj4uvfTYj2GM1Cax9SGvYsC3Gp6A3",
    );
  });

  test('fetch BTC Bip44 Transactions xpub reject wallet', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      ePubKey: rejectXpubBip44,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );

    expect(
      bip44Nodes.receiveNodes.first.address,
      "13fo25T6hc6K2kjXfb3xP39WB8vv4pk33W",
    );

    expect(
      bip44Nodes.changeNodes.first.address,
      "1DaZ6NEUERbMxUgcv8g8RY8bSHLPy99xct",
    );

    expect(bip44TxList.length, greaterThanOrEqualTo(0));
    reportCoinsAndAddresses(txList: bip44TxList, type: BitcoinNetwork);
  });

  test('fetch BTC BIP44 Transactions seed', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: helloSeed,
      walletTypes: [HDWalletType.BIP44],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );

    expect(
      bip44Nodes.receiveNodes.first.address,
      "1N3vGG7PRtRHQ6mzov41y35H3MVXU4AEuz",
    );

    expect(
      bip44Nodes.changeNodes.first.address,
      "14X8xNT3bsjHhe9JyAAfAFmP7iCFZTH3U7",
    );

    expect(bip44TxList.length, greaterThanOrEqualTo(0));
    reportCoinsAndAddresses(txList: bip44TxList, type: BitcoinNetwork);
  });
}
