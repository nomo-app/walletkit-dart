import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final zkSyncRPC = EvmRpcInterface(ZKSyncNetwork);
  final testSeed = loadFromEnv("DEV_SEED");
  test('Test zkSync wbtc send', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.00004, decimals: 8),
      feeInfo: null,
      token: wbtcZKSync,
      memo: null,
    );

    final hash = await zkSyncRPC.sendERC20Token(
      intent: intent,
      credentials: getETHCredentials(seed: testSeed),
    );

    print("Hash: $hash");
  });

  test('zkSyncETH send', () async {
    final intentETH = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethzkSync,
      memo: null,
    );

    final hashETH = await zkSyncRPC.sendCoin(
      intent: intentETH,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hashETH");
  });

  test('estimate fee zksync', () async {
    final fee = await zkSyncRPC.client
        .estimateZkSyncFee(from: arbitrumTestWallet, to: arbitrumTestWallet);

    print(fee);
  });
}
