import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final moonbeamRPC = EvmRpcInterface(MoonbeamNetwork);
  test("MoonBeam send test", () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: moonbeam,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await moonbeamRPC.sendCoin(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });

  test('Frax send test', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.01, decimals: 18),
      feeInfo: null,
      token: frax,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await moonbeamRPC.sendCoin(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });
}
