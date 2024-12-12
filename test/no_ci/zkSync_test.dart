import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final testSeed = loadFromEnv("DEV_SEED");
  test('Test zkSync wbtc send', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.00004, decimals: 8),
      token: wbtcZKSync,
      memo: null,
    );

    final hash = await zksyncRPC.sendERC20Token(
      intent: intent,
      seed: testSeed,
      from: arbitrumTestWallet,
    );

    print("Hash: $hash");
  });

  test('zkSyncETH send', () async {
    final intentETH = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      token: ethzkSync,
      memo: null,
    );

    final hashETH = await zksyncRPC.sendCoin(
      intent: intentETH,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hashETH");
  });
}
