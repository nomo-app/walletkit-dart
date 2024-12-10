import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  test("Avalanche send test", () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: avalanche,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await avalancheRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });

  test('Wrapped ETH send test', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.0005, decimals: 18),
      token: wrappedETH,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await avalancheRPC.sendERC20Token(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });
}
