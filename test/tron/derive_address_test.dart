import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

const tronAddress = "TMbyqJkw2RsSG7tT6VzJzbzDQuHEMvrGGj";
const tronAddress1 = "TBdBhvCChFgbC4zz64GbtL6PRxWPsZJSwU";

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

    expect(address, tronAddress);

    node = deriveNode(seed, tronBip44HDPath.getPath(0, 0, 1));

    address = uncompressedPublicKeyToAddress(
      node.publicKeyUncompressed,
      TRON_ADDRESS_PREFIX,
    );

    expect(address, tronAddress1);
  });

  test('Validate Address', () {
    expect(validateTronAddress(address: tronAddress), true);
    expect(validateTronAddress(address: tronAddress1), true);
    expect(validateTronAddress(address: "Tasdasdasdasd"), false);
    expect(
      validateTronAddress(address: "TBdBhvCChFgbC4zz64GbtL6PRxWPsZJS99"),
      false,
    );
  });
}
