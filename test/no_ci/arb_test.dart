import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final testSeed = loadFromEnv("DEV_SEED");
  //Test to send Arbitrum
  // test("Try to send Arbitrum", () async {
  //   final intent = TransferIntent(
  //     recipient: arbitrumTestWallet,
  //     amount: Amount.convert(value: 0.001, decimals: 18),
  //     feeInfo: null,
  //     token: arbitrum,
  //     memo: null,
  //   );

  //   final hash = await arbitrumRPC.sendERC20Token(
  //     intent: intent,
  //     credentials: getETHCredentials(seed: testSeed),
  //   );

  //   print("Hash: $hash");
  // });

  test('Send ETH Arbitrum', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
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

  test('test to transfer erc1155 asset', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 100, decimals: 0),
      token: nullToken,
      memo: null,
    );

    final hash = await zeniqSmartChainRPC.sendERC1155Token(
      contractAddress: "0xB868a4d85c3f7207106145eB41444c5313C97D86",
      from: arbitrumTestWallet,
      tokenID: BigInt.from(0),
      intent: intent,
      seed: testSeed,
    );

    print("Hash: $hash");
  });
}
