import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_abi.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  final arbScan = EtherscanExplorer(
    etherscanBaseEndpoint,
    loadListFromEnv("ETHERSCAN_API_KEYS"),
    ethArbitrum,
  );

  test(
    "Test",
    () async {
      const hash =
          "0xca3a1cd2f5fd49bd4ac5e93dcf5435cce4489972146934797920a3db1f9bace9";
      const wallet = "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616";

      final txs = await arbScan.fetchERC20Transactions(
        contractAddress: arbitrum.contractAddress,
        address: wallet,
      );

      final contains = txs.singleWhereOrNull((tx) => tx.hash == hash) != null;

      print("TX found in Etherscan fetchTokenTransactions: $contains");

      final nativeTx = await arbScan.fetchTransactions(address: wallet);

      final containsNative =
          nativeTx.singleWhereOrNull((tx) => tx.hash == hash) != null;

      print("TX found in Etherscan fetchTransactions: $containsNative");

      final rpcTx = await arbitrumRPC.getTransactionByHash(hash);
      print("TX found in RPC: ${rpcTx}");
      final receipt = await arbitrumRPC.getConfirmationStatus(hash);
      print("Receipt: ${receipt}");

      final etherscanReceipt = await arbScan.fetchTransactionsReceipt(hash);
      print("Etherscan Receipt: ${etherscanReceipt}");
    },
  );
}

// import 'package:test/test.dart';
// import 'package:walletkit_dart/walletkit_dart.dart';

// import '../utils.dart';

// void main() {
//   final testSeed = loadFromEnv("DEV_SEED");
//   //Test to send Arbitrum
//   // test("Try to send Arbitrum", () async {
//   //   final intent = TransferIntent(
//   //     recipient: arbitrumTestWallet,
//   //     amount: Amount.convert(value: 0.001, decimals: 18),
//   //     feeInfo: null,
//   //     token: arbitrum,
//   //     memo: null,
//   //   );

//   //   final hash = await arbitrumRPC.sendERC20Token(
//   //     intent: intent,
//   //     credentials: getETHCredentials(seed: testSeed),
//   //   );

//   //   print("Hash: $hash");
//   // });

//   test('Send ETH Arbitrum', () async {
//     final intent = TransferIntent<EvmFeeInformation>(
//       recipient: arbitrumTestWallet,
//       amount: Amount.convert(value: 0.001, decimals: 18),
//       token: ethArbitrum,
//       memo: null,
//     );
//     final hash = await arbitrumRPC.sendCoin(
//       intent: intent,
//       from: arbitrumTestWallet,
//       seed: testSeed,
//     );

//     print("Hash: $hash");
//   });

//   test('test to transfer erc1155 asset', () async {
//     final intent = TransferIntent<EvmFeeInformation>(
//       recipient: arbitrumTestWallet,
//       amount: Amount.convert(value: 100, decimals: 0),
//       token: nullToken,
//       memo: null,
//     );

//     final hash = await zeniqSmartChainRPC.sendERC1155Token(
//       contractAddress: "0xB868a4d85c3f7207106145eB41444c5313C97D86",
//       from: arbitrumTestWallet,
//       tokenID: BigInt.from(0),
//       intent: intent,
//       seed: testSeed,
//     );

//     print("Hash: $hash");
//   });
// }
