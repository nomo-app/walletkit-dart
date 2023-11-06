// import 'package:test/test.dart';
// import 'package:walletkit_dart/src/crypto/derivation.dart';
// import 'package:walletkit_dart/src/domain/entities/default_assets.dart';

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/crypto/wallet_utils.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/domain/entities/hd_wallet_type.dart';

void main() {
  // test("", () {
  //   var token = zeniqCoin;
  //   expect(getDerivationPath(HDWalletType.NO_STRUCTURE, token), "m/0'");
  //   expect(getDerivationPath(HDWalletType.BIP44, token), "m/44'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP49, token), "m/49'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP84, token), "m/84'/0'/0'");

  //   token = btcCoin;
  //   expect(getDerivationPath(HDWalletType.NO_STRUCTURE, token), "m/0'");
  //   expect(getDerivationPath(HDWalletType.BIP44, token), "m/44'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP49, token), "m/49'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP84, token), "m/84'/0'/0'");

  //   token = ltcCoin;
  //   expect(getDerivationPath(HDWalletType.NO_STRUCTURE, token), "m/0'");
  //   expect(getDerivationPath(HDWalletType.BIP44, token), "m/44'/2'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP49, token), "m/49'/2'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP84, token), "m/84'/2'/0'");

  //   token = bchCoin;
  //   expect(getDerivationPath(HDWalletType.NO_STRUCTURE, token), "m/0'");
  //   expect(getDerivationPath(HDWalletType.BIP44, token), "m/44'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP49, token), "m/49'/0'/0'");
  //   expect(getDerivationPath(HDWalletType.BIP84, token), "m/84'/0'/0'");
  // });

  test('Assert that Xpub and Seed lead same Node', () {
    const networkType = BitcoinNetwork;
    final node_seed_ns = deriveMasterNode(
      networkType: networkType,
      walletType: HDWalletType.NO_STRUCTURE,
      seed: helloSeed,
    );
    final node_xpub_ns = deriveMasterNode(
      networkType: networkType,
      walletType: HDWalletType.NO_STRUCTURE,
      ePubKey: helloXpub,
    );

    expect(node_seed_ns.neutered().toBase58(), helloXpub);

    expect(node_seed_ns.publicKey, node_xpub_ns.publicKey);
  });
}
