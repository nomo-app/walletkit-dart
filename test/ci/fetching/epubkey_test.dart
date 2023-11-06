import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Test Litecoin EPubKey Derivation', () {
    final pubKey = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: HDWalletType.BIP44_LITECOIN,
    );

    expect(pubKey, wkDebugXPUBHello);
  });

  test('Test Bitcoin EPubKey Derivation', () {
    var walletType = HDWalletType.BIP44;
    final pubKey = deriveExtendedPubKey(
      seed: helloSeed,
      type: BitcoinNetwork,
      walletType: walletType,
    );
    expect(pubKey,
        "xpub69BsBUCquKCiiip64fmSF5RPt4XXudBeqAGGdBrMCCUanxaAc9myKLEMHUV5pUNDCXyYpjyhT7RocMXXocxzZMYgLWD3LFLYiWWoUA37i3h");

    walletType = HDWalletType.BIP49;
    final pubKey2 = deriveExtendedPubKey(
      seed: helloSeed,
      type: BitcoinNetwork,
      walletType: walletType,
    );
    expect(pubKey2,
        "ypub6U28V8sm3zkCp7RGmrK2z3pJyaDZw9bRpqn7xFY5Gvy6nyuKVC3qVCAfQwqkQwE7baVsUEpKrxicoNMwL6d3fgbFYLirYeHFjj1pPSHZ7TC");

    walletType = HDWalletType.BIP84;
    final pubKey3 = deriveExtendedPubKey(
      seed: helloSeed,
      type: BitcoinNetwork,
      walletType: walletType,
    );
    expect(pubKey3,
        "zpub6nrPnoYgCgHiBWgrfaQubVQedPitFfrd1z8SmtpGVS9Xzv6HWAKGNsMDbCKzoztrGcu2JxHqGgHvLkX9nqRvTfgdUuHZKWSR4GbtMJKTXpj");

    walletType = HDWalletType.NO_STRUCTURE;
    final pubKey4 = deriveExtendedPubKey(
      seed: helloSeed,
      type: BitcoinNetwork,
      walletType: walletType,
    );
    expect(pubKey4,
        "xpub69BsBUCquKCgn1u6cum7syZewx5J2fyJE479qzDRJtB6hSHkhLsPZZW2SBfPfJaidDtE9g6wyH7ZFv8bWTkwuLeRJx3H2Kray9AsvY8EJAP");
  });

  test('Test Litecoin Epubkey Derivation ', () {
    var walletType = HDWalletType.BIP44;
    final pubKey = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: walletType,
    );
    expect(pubKey,
        "xpub69BsBUCquKCiiip64fmSF5RPt4XXudBeqAGGdBrMCCUanxaAc9myKLEMHUV5pUNDCXyYpjyhT7RocMXXocxzZMYgLWD3LFLYiWWoUA37i3h");

    walletType = HDWalletType.BIP49;
    final pubKey2 = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: walletType,
    );
    expect(pubKey2,
        "xpub69BsBUCquKCixpE9wVXQmxiooc57zXbvujFuAreBtvbDjt66EXtGs8WXPjtAR2aCBwP4imDmQJN4v5kNcQD2sSueg12RxjTmTzxAzwjB4rT");

    walletType = HDWalletType.BIP84;
    final pubKey3 = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: walletType,
    );
    expect(pubKey3,
        "xpub69BsBUCquKCkUvJczrqfBKDeHTRzNRsdBm61D72VjRPmtiTpzqz98k2wYnQppBb1TLfQp16iMMapaBJ2MSbtsCKRkDti9goSWpUbaAeSKQx");

    walletType = HDWalletType.NO_STRUCTURE;
    final pubKey4 = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: walletType,
    );
    expect(pubKey4,
        "xpub69BsBUCquKCgn1u6cum7syZewx5J2fyJE479qzDRJtB6hSHkhLsPZZW2SBfPfJaidDtE9g6wyH7ZFv8bWTkwuLeRJx3H2Kray9AsvY8EJAP");

    walletType = HDWalletType.BIP44_LITECOIN;
    final pubKey5 = deriveExtendedPubKey(
      seed: helloSeed,
      type: LitecoinNetwork,
      walletType: walletType,
    );
    expect(pubKey5,
        "xpub69BsBUCquKCgooMeNw2a3hW6NBZ9Kwn4kYUxYSjygK6YTa8PRqqAEyAKEwBsNH4GiPpb4BCXZ1QiHDeYCtPJtVJoBWNeF8QFRik7MyUstiZ");
  });
}
