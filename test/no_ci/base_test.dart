import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final baseRPC = EvmRpcInterface(BaseNetwork);
  test("Try to send Ethereum Base", () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethBase,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await baseRPC.sendCoin(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });

  test('Try to send MATH', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 3, decimals: 18),
      feeInfo: null,
      token: mathToken,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await baseRPC.sendERC20Token(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });
}