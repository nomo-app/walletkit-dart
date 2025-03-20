import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/src/wallet/bip39/bip39.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  const devWallet =
      "toss when type boat distance prosper artist goose please gloom pear caution";
  test("P2WPKH", () {
    const pubkeyHash = "ea6d525c0c955d90d3dbd29a81ef8bfb79003727";

    final address = pubKeyHashToSegwitAddress(pubkeyHash.hexToBytes, "bc", 1);

    expect(address, "bc1qafk4yhqvj4wep57m62dgrmutldusqde8adh20d");
  });

  test("P2WPKH 2", () {
    const pubkeyHash = "168b992bcfc44050310b3a94bd0771136d0b28d1";

    final address = pubKeyHashToSegwitAddress(pubkeyHash.hexToBytes, "bc", 1);

    expect(address, "bc1qz69ej270c3q9qvgt822t6pm3zdksk2x35j2jlm");
  });

  test("derive address", () {
    final seed = mnemonicToSeed(devWallet);

    var childNode = deriveNodeFromSeed(
      seed: seed,
      addressTypes: [AddressType.segwit],
      networkType: BitcoinNetwork,
      purpose: HDWalletPurpose.BIP84,
      path: "m/84'/0'/0'/0/0",
    );
    print(childNode.derivationPath);
    print(childNode.address);

    childNode = deriveNodeFromSeed(
      seed: seed,
      addressTypes: [AddressType.compatibility],
      networkType: BitcoinNetwork,
      purpose: HDWalletPurpose.BIP49,
      path: "m/49'/0'/0'/0/0",
    );
    print(childNode.derivationPath);
    print(childNode.address);
  });
}
