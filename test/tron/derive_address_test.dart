import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
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

    final masterNode = deriveMasterNodeFromSeed(
      seed: seed,
      walletPath: bitcoinNSHDPath,
    );
  });

  test('Validate Address', () {});
}
