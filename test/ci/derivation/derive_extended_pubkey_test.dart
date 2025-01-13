import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('derive extended pubkey', () {
    //   final ePubKey = deriveExtendedPubKey(
    //     seed: helloSeed,
    //     walletType: bitcoinNSHDPath,
    //     type: LitecoinNetwork,
    //   );
    //   expect(
    //     ePubKey,
    //     "Ltub2Vqqn6GEu5Q81zcCthUpux3miCtRF7dMHjc7xi8VfDAeUhWf12QiXEkVqTWYKApBMvXqmcU23qyexM1FuNk3jgiXY4w3u1kxd5yj4XiYZH3",
    //   );

    expect(
      deriveExtendedPubKey(
        seed: helloSeed,
        walletPurpose: bitcoinBip84HDPath,
        type: LitecoinNetwork,
      ),
      "xpub69BsBUCquKCkUvJczrqfBKDeHTRzNRsdBm61D72VjRPmtiTpzqz98k2wYnQppBb1TLfQp16iMMapaBJ2MSbtsCKRkDti9goSWpUbaAeSKQx",
    );
  });

  test("Get Node From EpubKey", () {
    const btcPubKey =
        "xpub68bx1dGR2BDKF2Ssy42k6inoJy1ZDNuTXVL3UudD63zU76vhmhX4jyN2doUh3ktHYmPN7x1TCxArK2rCqZ4QzwH562M4h4nUcWcwtSnN3S8";

    var hdNode = deriveMasterNodeFromExtendedKey(btcPubKey);

    expect(
      hdNode.network?.keyPrefixes.public,
      BitcoinNetwork.networkBIP.bip32.public,
    );

    const ltcPubKey =
        "xpub68bx1dGR2BDKFzcmRD9zbYPCrGSbRmnk3pwE4tNc3XAdd2BDfWcskotdUsZTHyVpDzQrUZYBk3FeYzxkJ887XLuujSYp43AKRMcaYzU77hz";

    hdNode = deriveMasterNodeFromExtendedKey(ltcPubKey);

    expect(
      hdNode.network?.keyPrefixes.public,
      LitecoinNetwork.networkBIP.bip32.public,
    );
  });
}
