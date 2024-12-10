import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  test(
    "Replace by Fee Smartchain",
    () async {
      final seed = loadFromEnv("DEV_SEED");

      final tx = await zeniqSmartChainRPC.buildTransaction(
        sender: arbitrumTestWallet,
        recipient: arbitrumTestWallet,
        seed: seed,
        feeInfo: EvmFeeInformation(
          gasLimit: GasLimits.ethSend.value,
          gasPrice: Amount.convert(value: 10, decimals: 9), // 10 GWEI
        ),
        data: null,
        value: Amount.convert(value: 1, decimals: 18).value,
      ) as RawEVMTransactionType0;

      final tx2 = await zeniqSmartChainRPC.buildTransaction(
        sender: tx.sender,
        recipient: tx.to,
        seed: seed,
        feeInfo: EvmFeeInformation(
          gasLimit: tx.gasLimit.toInt(),
          gasPrice: Amount.convert(value: 20, decimals: 9), // 20 GWEI
        ),
        data: null,
        value: tx.value,
        nonce: tx.nonce,
      ) as RawEVMTransactionType0;

      final hash1 =
          await zeniqSmartChainRPC.sendRawTransaction(tx.serializedHex);
      print(hash1);
      final hash2 =
          await zeniqSmartChainRPC.sendRawTransaction(tx2.serializedHex);
      print(hash2);
    },
  );

  test(
    "Replace by Fee Ethereum",
    () async {
      final seed = loadFromEnv("DEV_SEED");

      final tx = await ethereumRPC.buildTransaction(
        sender: arbitrumTestWallet,
        recipient: arbitrumTestWallet,
        seed: seed,
        feeInfo: EvmFeeInformation(
          gasLimit: GasLimits.ethSend.value,
          gasPrice: Amount.convert(value: 16, decimals: 9), // 10 GWEI
        ),
        data: null,
        value: Amount.convert(value: 0.00001, decimals: 18).value,
      ) as RawEVMTransactionType0;

      final tx2 = await ethereumRPC.buildTransaction(
        sender: tx.sender,
        recipient: tx.to,
        seed: seed,
        feeInfo: EvmFeeInformation(
          gasLimit: tx.gasLimit.toInt(),
          gasPrice: Amount.convert(value: 20, decimals: 9), // 20 GWEI
        ),
        data: null,
        value: tx.value,
        nonce: tx.nonce,
      ) as RawEVMTransactionType0;

      final hash1 = await ethereumRPC.sendRawTransaction(tx.serializedHex);
      print(hash1);
      final hash2 = await ethereumRPC.sendRawTransaction(tx2.serializedHex);
      print(hash2);
    },
  );
}
