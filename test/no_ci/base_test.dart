import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final baseRPC = EvmRpcInterface(BaseNetwork);
  test("Try to send Ethereum Base", () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethBase,
      memo: null,
    );
    final testSeed = loadFromEnv("DEV_SEED");

    final hash = await baseRPC.sendCoin(
      intent: intent,
      seed: testSeed,
      from: arbitrumTestWallet,
    );

    print("Hash: $hash");
  });

  test('Try to send MATH', () async {
    // final intent = TransferIntent<EvmFeeInformation>(
    //   recipient: arbitrumTestWallet,
    //   amount: Amount.convert(value: 3, decimals: 18),
    //   feeInfo: null,
    //   token: mathToken,
    //   memo: null,
    // );
    final testSeed = loadFromEnv("DEV_SEED");

    // final hash = await baseRPC.sendERC20Token(
    //   intent: intent,
    //   seed: testSeed,
    //   from: arbitrumTestWallet,
    // );

    // print("Hash: $hash");

    final contract_function = contractAbiErc20.getFunction("transfer");

    assert(contract_function != null);
    assert(contract_function!.functionSelector == "a9059cbb");

    final hash = await baseRPC.interactWithContract(
      contractAddress: mathToken.contractAddress,
      function: contract_function!,
      params: [
        arbitrumTestWallet,
        Amount.convert(value: 3, decimals: 18).value
      ],
      sender: arbitrumTestWallet,
      seed: testSeed,
      feeInfo: null,
    );

    print("Hash: $hash");
  });
}
