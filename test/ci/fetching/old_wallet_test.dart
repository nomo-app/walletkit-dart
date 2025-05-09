@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../no_ci/input_simulation_test.dart';

void main() {
  const ePubKeyNS =
      "xpub683UNKpAnv1UrWKFVbkwQNT6Q9pKRbwBgcjfWRtnqmoScCE1XWN5i2SJRV2BciRphX2AW7o2YfCtxe5dr8QSXeuHp2A2SdF72VfnP5gn4UU";
  const ePubKeyBip44LTC =
      "xpub683UNKpAnv1UrPxMgQNgYqNm17KCq1CuZHHjKzxPQytUZgUii2mZnXX2ov2jbLbxVa9xH29fTChsLNyWDajCwTxxBx2DKEdd7Fan7GpGUVg";

  const coinbaseTx = "652a27f226ddfc74642fa4648de388985fc46bdcffd9f8d5f7ad5d4e5fd77944";

  test(
    'Fetch Zeniq Coinbase tx: $coinbaseTx',
    () async {
      final (tx, _) = await fetchUTXOTXByHash(
        coinbaseTx,
        ZeniqNetwork,
        [],
        [AddressType.legacy],
      );
      expect(tx.block, -1);
      expect(tx.hash, "652a27f226ddfc74642fa4648de388985fc46bdcffd9f8d5f7ad5d4e5fd77944");
    },
  );

  test('Fetch Zeniq Txs $ePubKeyNS', () async {
    final (txs, _) = await fetchUTXOTransactionsFromEpubKey(
      ePubKey: ePubKeyNS,
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      purpose: HDWalletPurpose.NO_STRUCTURE,
    );

    expect(txs.length, greaterThanOrEqualTo(79));

    expect(txs.whereType<NotAvaialableUTXOTransaction>().length, equals(0));

    //reportCoinsAndAddresses(txList: txs, type: ZeniqNetwork);
  });

  test('Fetch Litecoin Txs $ePubKeyBip44LTC', () async {
    final (txs, _) = await fetchUTXOTransactionsFromEpubKey(
      ePubKey: ePubKeyBip44LTC,
      addressTypes: [AddressType.legacy, AddressType.segwit],
      networkType: LitecoinNetwork,
      minEndpoints: 1,
      purpose: HDWalletPurpose.BIP44,
    );

    expect(txs.whereType<NotAvaialableUTXOTransaction>().length, equals(0));

    expect(txs.length, greaterThanOrEqualTo(25));

    //reportCoinsAndAddresses(txList: txs, type: LitecoinNetwork);
  });

  // This Test only works if computeUTXO Transactions fails for any tx
  // test('Not Available Txs Cache Test', () async {
  //   final (txs, nodes) = await fetchUTXOTransactions(
  //     ePubKey: ePubKeyNS,
  //     walletTypes: [bitcoinNSHDPath],
  //     addressTypes: [AddressType.legacy],
  //     networkType: ZeniqNetwork,
  //   );

  //   expect(txs.whereType<NotAvaialableUTXOTransaction>().length, equals(1));

  //   final (txs2, _) = await fetchUTXOTransactions(
  //     ePubKey: ePubKeyNS,
  //     walletTypes: [bitcoinNSHDPath],
  //     addressTypes: [AddressType.legacy],
  //     networkType: ZeniqNetwork,
  //     cachedNodes: nodes.toList(),
  //     cachedTransactions: txs,
  //   );

  //   expect(txs2.whereType<NotAvaialableUTXOTransaction>().length, equals(1));

  //   expect(txs2, equals(txs));
  // });
}
