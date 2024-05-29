import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final arbitrumRPC = EvmRpcInterface(ArbitrumNetwork);
  final testSeed = loadFromEnv("DEV_SEED");
  //Test to send Arbitrum
  test("Try to send Arbitrum", () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: arbitrum,
      memo: null,
    );

    final hash = await arbitrumRPC.sendERC20Token(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });

  test('Send ETH Arbitrum', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethArbitrum,
      memo: null,
    );
    final hash = await arbitrumRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });
}
