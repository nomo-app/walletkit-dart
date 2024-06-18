import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final optimismRPC = EvmRpcInterface(OptimismNetwork);
  final testSeed = loadFromEnv("DEV_SEED");
  test('Test Optimism send', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: optimism,
      memo: null,
    );

    final hash = await optimismRPC.sendERC20Token(
      intent: intent,
      seed: testSeed,
      from: arbitrumTestWallet,
    );

    print("Hash: $hash");
  });

  test('OptimismETH send', () async {
    final intentETH = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethOptimism,
      memo: null,
    );

    final hashETH = await optimismRPC.sendCoin(
      intent: intentETH,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hashETH");
  });
}
