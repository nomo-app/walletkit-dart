import 'package:flutter_test/flutter_test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';

void main() {
  test('multi_account_test', () {
    final seed = loadFromEnv("DEV_SEED");
    var path = ethereumBip44HDPath.getPath(0, 0, 0);
    final evmAddress1 = pubKeytoChecksumETHAddress(
      seed,
      path,
    );

    path = ethereumBip44HDPath.getPath(0, 0, 1);
    final evmAddress2 = pubKeytoChecksumETHAddress(
      seed,
      path,
    );

    path = ethereumBip44HDPath.getPath(0, 0, 2);
    final evmAddress3 = pubKeytoChecksumETHAddress(
      seed,
      path,
    );

    path = ethereumBip44HDPath.getPath(0, 0, 3);
    final evmAddress4 = pubKeytoChecksumETHAddress(
      seed,
      path,
    );

    path = ethereumBip44HDPath.getPath(0, 0, 4);
    final evmAddress5 = pubKeytoChecksumETHAddress(
      seed,
      path,
    );

    expect(evmAddress1, "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616");
    expect(evmAddress2, "0xD8ae81039bcfe390e75BfE6675da87D586F7A56c");
    expect(evmAddress3, "0x5dE43B4C0331dDe5808F2c8Fd2a35aE156860EA2");
    expect(evmAddress4, "0x9290dC162bf73DE567670b08edF7189A7d8abA55");
    expect(evmAddress5, "0xf8D3aA317aC072fCf289acAea2559FBE2B01168d");
  });
}
