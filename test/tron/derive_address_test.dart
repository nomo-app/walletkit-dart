import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

const tronAddress = "TMbyqJkw2RsSG7tT6VzJzbzDQuHEMvrGGj";
const tronAddressHex = "417f9dc8311e51c1685764bbb0f5ceac7ad79b0128";
const tronAddressEVM = "0x7f9dc8311e51c1685764bbb0f5ceac7ad79b0128";

const tronAddress1 = "TBdBhvCChFgbC4zz64GbtL6PRxWPsZJSwU";
const tronAddress1Hex = "411226d9d2d336d60e42496133790d6a69af045e33";
const tronAddress1EVM = "0x1226d9d2d336d60e42496133790d6a69af045e33";

const tronUSDTAddress = "TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t";

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
    var address_hex = base58ToHex(address);
    var evm_address = base58ToEVM(address);

    expect(address, tronAddress);
    expect(address_hex, tronAddressHex);
    expect(evm_address, tronAddressEVM);

    node = deriveNode(seed, tronBip44HDPath.getPath(0, 0, 1));
    address = uncompressedPublicKeyToAddress(
      node.publicKeyUncompressed,
      TRON_ADDRESS_PREFIX,
    );
    address_hex = base58ToHex(address);
    evm_address = base58ToEVM(address);

    expect(address, tronAddress1);
    expect(address_hex, tronAddress1Hex);
    expect(evm_address, tronAddress1EVM);
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
