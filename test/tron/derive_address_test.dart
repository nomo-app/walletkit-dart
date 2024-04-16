import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/ecurve.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart';
import '../utils.dart';

void main() {
  test('Test HD Wallet Path Test', () {
    expect(tronBip44HDPath.basePath, "m/44'/195'");
    expect(tronBip44HDPath.getPath(0, 0, 0), "m/44'/195'/0'/0/0");
    expect(tronBip44HDPath.getPath(0, 0, 1), "m/44'/195'/0'/0/1");
    expect(tronBip44HDPath.getPath(0, 1, 0), "m/44'/195'/0'/1/0");
    expect(tronBip44HDPath.getPath(1, 0, 0), "m/44'/195'/1'/0/0");
  });
  test('Derive Addresses', () {
    final seed = loadFromEnv('TRON_SEED');

    var node = deriveNode(seed, tronBip44HDPath.defaultPath);

    var address = uncompressedPublicKeyToAddress(
      node.publicKeyUncompressed,
      TRON_ADDRESS_PREFIX,
    );

    expect(address, "TMbyqJkw2RsSG7tT6VzJzbzDQuHEMvrGGj");

    node = deriveNode(seed, tronBip44HDPath.getPath(0, 0, 1));

    address = uncompressedPublicKeyToAddress(
      node.publicKeyUncompressed,
      TRON_ADDRESS_PREFIX,
    );

    expect(address, "TBdBhvCChFgbC4zz64GbtL6PRxWPsZJSwU");
  });

  test('Validate Address', () {});
}

extension on BipNode {
  Uint8List get publicKeyUncompressed {
    if (privateKey == null) {
      throw UnsupportedError("privateKey is null");
    }
    return pointFromScalar(privateKey!, false)!;
  }
}

String uncompressedPublicKeyToAddress(Uint8List publicKey, int prefix) {
  final addressInput = publicKey.sublist(1);
  final publicKeyHash = keccak256(addressInput);
  final addressBuffer = publicKeyHash.sublist(12);
  final addressBase58 = base58encode(prefix, addressBuffer);
  return addressBase58;
}
