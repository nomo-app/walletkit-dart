import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  test("Avalanche send test", () async {
    final avalacheRPC = EvmRpcInterface(AvalancheNetwork);

    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: avalanche,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await avalacheRPC.sendCoin(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });
}
