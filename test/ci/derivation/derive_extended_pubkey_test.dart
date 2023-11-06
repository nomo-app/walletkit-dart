import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('derive extended pubkey', () {
    //   final ePubKey = deriveExtendedPubKey(
    //     seed: helloSeed,
    //     walletType: HDWalletType.NO_STRUCTURE,
    //     type: LitecoinNetwork,
    //   );
    //   expect(
    //     ePubKey,
    //     "Ltub2Vqqn6GEu5Q81zcCthUpux3miCtRF7dMHjc7xi8VfDAeUhWf12QiXEkVqTWYKApBMvXqmcU23qyexM1FuNk3jgiXY4w3u1kxd5yj4XiYZH3",
    //   );

    expect(
      deriveExtendedPubKey(
        seed: helloSeed,
        walletType: HDWalletType.BIP84,
        type: LitecoinNetwork,
      ),
      "xpub69BsBUCquKCkUvJczrqfBKDeHTRzNRsdBm61D72VjRPmtiTpzqz98k2wYnQppBb1TLfQp16iMMapaBJ2MSbtsCKRkDti9goSWpUbaAeSKQx",
    );
  });
}
