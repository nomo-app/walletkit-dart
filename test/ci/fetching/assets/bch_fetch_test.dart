@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../expected_utxo_tx_hashes.dart';
import '../fetch_utxo_transactions_test.dart';

void main() {
  const network = BitcoincashNetwork;
  // final walletTypes = [
  //   HDWalletType.NO_STRUCTURE,
  // ];

  // test('Test BCH Derivation', () async {
  //   final (nsTxList, nsNodes) = await fetchUTXOTransactions(
  //     networkType: network,
  //     seed: helloSeed,
  //     walletTypes: walletTypes,
  //     addressTypes: [AddressType.legacy, AddressType.cashaddr],
  //   );
  //   TODO: Replace the "print" statements with "expect" statements. Unit-testing with "print" is worthless if nobody knows the expected result.
  //   print(nsNodes.length);
  //   reportAddresses(txList: nsTxList, nodesWithAdress: nsNodes);
  //   reportCoinsAndAddresses(txList: nsTxList, type: network);
  // });

  test('CashAddressFormat Test', () async {
    const c = INTERNAL_CHAIN_INDEX;
    const t = BitcoincashNetwork;
    const type = HDWalletType.NO_STRUCTURE;

    final masterNode = deriveMasterNode(
      seed: helloSeed,
      networkType: t,
      walletType: type,
    );
    final addresses = [];
    for (var i = 0; i < 5; i++) {
      final address = deriveChildNode(
        masterNode: masterNode,
        chainIndex: c,
        index: i,
        networkType: t,
        addressTypes: [AddressType.legacy, AddressType.cashaddr],
        walletType: type,
      ).addresses;
      addresses.add(address);
    }
    expect(addresses, [
      {
        AddressType.legacy: '1FFk4nj4uvfTYj2GM1Cax9SGvYsC3Gp6A3',
        AddressType.cashaddr:
            'bitcoincash:qzw9hzykl4qjwtd5xaz5l8c53wrm4j0tasquhxwqn6'
      },
      {
        AddressType.legacy: '18NK7rMZ1dHfVEQNwtNYb5AWveBDYgvwAq',
        AddressType.cashaddr:
            'bitcoincash:qpgdp0tt7cszfhkwulyw9prv5c72573qdsln6jkwsr'
      },
      {
        AddressType.legacy: '1131pDzpWpDTJCedCn7ygwqBZrmu4g6t4',
        AddressType.cashaddr:
            'bitcoincash:qqqqrtn9ta84ufu48ujzx5ygdlfe58caecz9ylvf0s'
      },
      {
        AddressType.legacy: '17X9kvtJuhnrSz3yiC3nSrcNokriyFUBJ1',
        AddressType.cashaddr:
            'bitcoincash:qprcfze65dgee9jafprmmex876a6v442juuasgu687'
      },
      {
        AddressType.legacy: '1Hn2AUKeqEbpLh7tfJWgZwiadBmorPFFwa',
        AddressType.cashaddr:
            'bitcoincash:qzuqtva0zzjsyapmnl9xfay9nlf45knfcge4rnkqaf'
      },
    ]);
  });

  test('Test CashAddress', () async {
    const pubKey =
        "03e6ff629277ef58ac35c6ba6b7e285960837e9b30b5dedc4c96d5e26772fb4d43";
    final pubKeyHash = ripmed160Sha256Hash(pubKey.hexToBytes);

    final address = pubKeyHexToAddress(
      pubKey,
      AddressType.cashaddr,
      BitcoincashNetwork,
    );
    expect(address, "bitcoincash:qz05jrghl5glgmjc49mdzulwcwjgna3qsqpkdfrl9e");

    final legAddress = pubKeyHexToAddress(
      pubKey,
      AddressType.legacy,
      BitcoincashNetwork,
    );
    expect(legAddress, "1FXDxBf5VHNVCq2QbCikxoL8ZkNirDVc6b");

    var decodedPubKeyHash = P2Hash(address).publicKeyScript.sublist(3, 23);
    expect(decodedPubKeyHash, pubKeyHash);

    var decodedPubKeyHash2 = P2Hash(legAddress).publicKeyScript.sublist(3, 23);
    expect(decodedPubKeyHash2, pubKeyHash);
  });

  test('No Structure Transaction with Xpub', () async {
    final (legacyTxList, _) = await fetchUTXOTransactions(
      networkType: network,
      ePubKey: rejectXpub,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.cashaddr, AddressType.legacy],
    );
    expect(legacyTxList.length, greaterThanOrEqualTo(17));

    final expectedTxHashes = expectedTxHashesBCHReject();
    expectTxHashes(txList: legacyTxList, expectedTxHashes: expectedTxHashes);
    reportCoinsAndAddresses(txList: legacyTxList, type: network);
  });

  test('fetch BCH NS Transactions xpub reject wallet', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: network,
      ePubKey: rejectXpub,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.cashaddr],
    );

    expect(
      bip44Nodes.receiveNodes.first.address,
      "113G5SRkh8KqMfmqJKphuS1ALjxC3ead3Z",
    );

    expect(
      bip44Nodes.changeNodes.first.address,
      "1FXDxBf5VHNVCq2QbCikxoL8ZkNirDVc6b",
    );

    expect(bip44TxList.length, greaterThanOrEqualTo(19));
    reportCoinsAndAddresses(txList: bip44TxList, type: network);
  });

  test('fetch BCH Bip44 Transactions xpub reject wallet', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: network,
      ePubKey: rejectXpubBip44,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.cashaddr],
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
    reportCoinsAndAddresses(txList: bip44TxList, type: network);
  });

  test('fetch BCH BIP44 Transactions hello seed', () async {
    final (bip44TxList, bip44Nodes) = await fetchUTXOTransactions(
      networkType: network,
      seed: helloSeed,
      walletTypes: [HDWalletType.BIP44],
      addressTypes: [AddressType.legacy, AddressType.cashaddr],
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
    reportCoinsAndAddresses(txList: bip44TxList, type: network);
  });
}
