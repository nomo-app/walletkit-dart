// @Timeout(Duration(seconds: 600))
// import 'dart:typed_data';

// import 'package:dotenv/dotenv.dart';
// import 'package:test/test.dart';
// import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
// import 'package:walletkit_dart/src/utils/int.dart';
// import 'package:walletkit_dart/walletkit_dart.dart';

// void main() {
//   var env = DotEnv(includePlatformEnvironment: true)..load();
//   final rejectSeedString = env["REJECT_SEED"]!.split(",");
//   List<int> rejectIntList = rejectSeedString
//       .map((i) => int.parse(i))
//       .toList(); // Convert to list of integers
//   Uint8List rejectSeed = Uint8List.fromList(rejectIntList);

//   test(
//       'Simulate Zeniq Tx: b6008c2bdeaf58b4e96c01018167f376991bc5a691bcb45aa874a191cf3a0410',
//       () async {
//     ///
//     /// https://zeniq.net/tx/b6008c2bdeaf58b4e96c01018167f376991bc5a691bcb45aa874a191cf3a0410
//     ///

//     final firstUTXO = await fetchUTXOTXByHashAndIndex(
//       "e399e5ced49e0e3841b96a87d650f8b2550d2535ad05ece206542de9bad174b5",
//       77,
//       0,
//       rejectSeed,
//       ZeniqNetwork,
//     );

//     expect(
//       firstUTXO.outputs[0].node.address,
//       "mNCMFhuxwW3nKYGLAy2dvn48CqWfXhKndU",
//     );

//     final secondUTXO = await fetchUTXOTXByHashAndIndex(
//       "34ce3611cb58ea7d1c28c482d575e5034c1dee4be4931855c39976367ca89fda",
//       217,
//       1,
//       rejectSeed,
//       ZeniqNetwork,
//     );

//     expect(
//       secondUTXO.outputs[1].node.address,
//       "mf5T5FtGCzDMoQYyMyVHBh1eUaNUaavPdd",
//     );

//     final chosenUTXOs = {
//       firstUTXO.outputs[0]: firstUTXO,
//       secondUTXO.outputs[1]: secondUTXO,
//     };

//     final rawTx = await buildTestTransaction(
//       intent: TransferIntent(
//         recipient: "mPXMqhVtdUeH56rGNGDyjKCRueaQTAFmhs",
//         amount: Amount(
//           value: BigInt.from(1E5), // 0.01 Zeniq
//           decimals: 8,
//         ),
//         feeInfo: null,
//         token: ZeniqNetwork.coin,
//         memo: null,
//       ),
//       networkType: ZeniqNetwork,
//       walletType: bitcoinNSHDPath,
//       chosenUTXOs: chosenUTXOs,
//       seed: rejectSeed,
//       changeAddress: "mWthLdHK2DeQGSneiZ9SGeYtyueDsQc8uD",
//       version: 2,
//     );

//     expect(
//       rawTx,
//       "0200000002b574d1bae92d5406e2ec05ad35250d55b2f850d6876ab941380e9ed4cee599e3000000006b483045022100a525c94ad6b8aba5bd2038b98089192a689c43798a8742d54f6dfdb4931478c10220442b83dea62603130b61ada9c40f4f7c04ffd326d9008e0bbd66fef3e5be4fd34121033ec06d35d34c6597128d68c400326994224d08e88066567b1d4b9cc4d9cdc244ffffffffda9fa87c367699c3551893e44bee1d4c03e575d582c4281c7dea58cb1136ce34010000006b483045022100cde71b5710b12bea986c21d540dfb6de2a447b21e3b19e9eda958ba43d38e70b022073080443be5eed923a81e9a076e4d2b4bddd0f872921384e2dac7035e1d1c38e4121035cb7432b238f0f8dc68c0f248b69ab1dfd3fe1351d2aae6551429b392c82e1e1ffffffff02a0860100000000001976a9145091a47065fb17fcc5fba5cf4193c18b4999fca988aca818c213000000001976a914a16388e5e579a669c7647ee8ea83b7b20d31aef488ac00000000",
//     );
//   });

//   test(
//       'Simulate BTC Tx: fd5c80f9e59fdd075be74364133064fba79b9b7c119cf7628c2050bcbeab8bf9',
//       () async {
//     ///
//     /// https://www.blockchain.com/explorer/transactions/btc/fd5c80f9e59fdd075be74364133064fba79b9b7c119cf7628c2050bcbeab8bf9
//     ///
//     final firstUTXO = await fetchUTXOTXByHashAndIndex(
//       "e1c8d1d491291b70940d54dad043c3864a187c55ba80821c8a9ff5683b57a351",
//       2,
//       1,
//       rejectSeed,
//       BitcoinNetwork,
//     );

//     expect(
//       firstUTXO.outputs[1].node.address,
//       "1KzNFA9LVvB2brngcPkVzpTxcrvYmFAzF7",
//     );

//     final chosenUTXOs = {
//       firstUTXO.outputs[1]: firstUTXO,
//     };

//     final rawTx = await buildTestTransaction(
//       intent: TransferIntent(
//         recipient: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q",
//         amount: Amount(
//           value: BigInt.from(546),
//           decimals: 8,
//         ),
//         feeInfo: null,
//         token: BitcoinNetwork.coin,
//         memo: null,
//       ),
//       networkType: BitcoinNetwork,
//       walletType: bitcoinNSHDPath,
//       chosenUTXOs: chosenUTXOs,
//       seed: rejectSeed,
//       changeAddress: "1MGQBo8kinNLu7U3CrrgcEbpKZ8bXMMYNK",
//       version: 2,
//     );

//     expect(
//       rawTx,
//       "020000000151a3573b68f59f8a1c8280ba557c184a86c343d0da540d94701b2991d4d1c8e1010000006a47304402202362b80afdc505449bbff92536fe558fc068081d9bb972062b9e8f6f4c3e38a502200e9bf9fd223f7c2774905c0e3d89992e0db584af016d9f7bd6b3700cce9f8b97012103908441aad4f711689b01a77e9825bec57380a7adef66ea3046ae065223e5482affffffff0222020000000000001976a9145091a47065fb17fcc5fba5cf4193c18b4999fca988ac73a00400000000001976a914de4c1c22df7d9c333012979dcd7c811b4a2104bb88ac00000000",
//     );
//   });

//   test(
//       'Simulate BCH Tx: 6b8edb84f17afc4cb50c0e5438fb511db88a7767df0466cde42c43ad005de353',
//       () async {
//     ///
//     /// https://www.blockchain.com/explorer/transactions/bch/6b8edb84f17afc4cb50c0e5438fb511db88a7767df0466cde42c43ad005de353
//     ///

//     final firstUTXOTx = await fetchUTXOTXByHashAndIndex(
//       "cdc8f41721bf452f4b1a5285098be5452f1464433f27561c72bb08c0e896a5ff",
//       3,
//       0,
//       rejectSeed,
//       BitcoincashNetwork,
//     );
//     final firstUTXO = firstUTXOTx.outputs[0];

//     expect(
//       firstUTXO.node.address,
//       "139TFCQAhRf5u87UBagrjXruN1oYtASAeH",
//     );

//     expect(firstUTXO.value, 10000.toBI);

//     final secondUTXOTx = await fetchUTXOTXByHashAndIndex(
//       "d8b9cfb628323cde78c3187569c8794026bb3463275c4ddf6b38bd48be0dc7c1",
//       7,
//       1,
//       rejectSeed,
//       BitcoincashNetwork,
//     );
//     final secondUTXO = secondUTXOTx.outputs[1];

//     expect(
//       secondUTXO.node.address,
//       "1JSEPSdEiosDuXmaJyk1HZUKuurH8mx9EQ",
//     );

//     expect(secondUTXO.value, 1580100.toBI);

//     final chosenUTXOs = {
//       firstUTXO: firstUTXOTx,
//       secondUTXO: secondUTXOTx,
//     };

//     final rawTx = await buildTestTransaction(
//       intent: TransferIntent(
//         recipient: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q",
//         amount: Amount(
//           value: BigInt.from(1E5), // 0.001 BCH
//           decimals: 8,
//         ),
//         feeInfo: null,
//         token: BitcoincashNetwork.coin,
//         memo: null,
//       ),
//       networkType: BitcoincashNetwork,
//       walletType: bitcoinNSHDPath,
//       chosenUTXOs: chosenUTXOs,
//       seed: rejectSeed,
//       changeAddress: "1LLFknJu3zHJHZqU5naBdrfSZFN9vW4sFU",
//       version: 2,
//       fees: 374,
//     );

//     expect(
//       rawTx,
//       "0200000002ffa596e8c008bb721c56273f4364142f45e58b0985521a4b2f45bf2117f4c8cd000000006a473044022003d19aeb0402fd56f9c73ab503ccbfa074fdb30d66b986af1645ecef9c53b9a102204d101edf29e58f25c7e1a45b93083faff748b14ac3ec6667fdbdc4f53cf30c49412103bfc6c74a9cb68fe43af12ba06faf2977447d67e42a21a118b3528d26853f4193ffffffffc1c70dbe48bd386bdf4d5c276334bb264079c8697518c378de3c3228b6cfb9d8010000006a473044022004256dfd474f095d61540c55f883e06fcbdcb243eaa4193a9271666ab617c1e602200c9d6032ca5fcc33b1aa7c1dd3bcfaec7a698c79d62833cb50d108286ab589184121028172366aff2b6aa74dd52ba5efa945843fb00879c8e3bab5b2aaf716482d0460ffffffff02a0860100000000001976a9145091a47065fb17fcc5fba5cf4193c18b4999fca988ac3ebb1600000000001976a914d40e9c21ebbee6b4043e60a6dff770d62c59005388ac00000000",
//     );
//   });

//   /// FIRST LTC TX: https://live.blockcypher.com/ltc/tx/05d2cf7e5ecb7c29de7df349fda4b8ed534d3230672874c38abec3485f41ae23/
//   // test('Simulate Litecoin Transaction:  ', () async {
//   //   ///
//   //   /// https://www.blockchain.com/explorer/transactions/bch/6b8edb84f17afc4cb50c0e5438fb511db88a7767df0466cde42c43ad005de353
//   //   ///

//   //   final firstUTXO = await fetchUTXOTXByHashAndIndex(
//   //     "cdc8f41721bf452f4b1a5285098be5452f1464433f27561c72bb08c0e896a5ff",
//   //     3,
//   //     0,
//   //     rejectSeed,
//   //     LITECOIN_NETWORK,
//   //   );

//   //   expect(
//   //     firstUTXO.outputs[0].node!.address,
//   //     "139TFCQAhRf5u87UBagrjXruN1oYtASAeH",
//   //   );

//   //   final secondUTXO = await fetchUTXOTXByHashAndIndex(
//   //     "d8b9cfb628323cde78c3187569c8794026bb3463275c4ddf6b38bd48be0dc7c1",
//   //     7,
//   //     1,
//   //     rejectSeed,
//   //     LITECOIN_NETWORK,
//   //   );

//   //   expect(
//   //     secondUTXO.outputs[1].node!.address,
//   //     "1JSEPSdEiosDuXmaJyk1HZUKuurH8mx9EQ",
//   //   );

//   //   final chosenUTXOs = {
//   //     firstUTXO.outputs[0]: firstUTXO,
//   //     secondUTXO.outputs[1]: secondUTXO,
//   //   };

//   //   final rawTx = await buildTestTransaction(
//   //     intent: TransferIntent(
//   //       recipient: "18M1XkiCXdfu7RWjg7avPXFtgAEeCtkn6Q",
//   //       amount: Amount(
//   //         value: BigInt.from(1E5), // 0.001 BCH
//   //         decimals: 8,
//   //       ),
//   //       feePriority: FeePriority.high,
//   //       assets: bchCoin,
//   //     ),
//   //     networkType: LITECOIN_NETWORK,
//   //     walletType: bitcoinBip84HDPath,
//   //     chosenUTXOs: chosenUTXOs,
//   //     seed: rejectSeed,
//   //     changeAddress: "1LLFknJu3zHJHZqU5naBdrfSZFN9vW4sFU",
//   //     version: 2,
//   //     fees: 374,
//   //   );

//   //   expect(
//   //     rawTx,
//   //     "0200000002ffa596e8c008bb721c56273f4364142f45e58b0985521a4b2f45bf2117f4c8cd000000006a473044022003d19aeb0402fd56f9c73ab503ccbfa074fdb30d66b986af1645ecef9c53b9a102204d101edf29e58f25c7e1a45b93083faff748b14ac3ec6667fdbdc4f53cf30c49412103bfc6c74a9cb68fe43af12ba06faf2977447d67e42a21a118b3528d26853f4193ffffffffc1c70dbe48bd386bdf4d5c276334bb264079c8697518c378de3c3228b6cfb9d8010000006a473044022004256dfd474f095d61540c55f883e06fcbdcb243eaa4193a9271666ab617c1e602200c9d6032ca5fcc33b1aa7c1dd3bcfaec7a698c79d62833cb50d108286ab589184121028172366aff2b6aa74dd52ba5efa945843fb00879c8e3bab5b2aaf716482d0460ffffffff02a0860100000000001976a9145091a47065fb17fcc5fba5cf4193c18b4999fca988ac3ebb1600000000001976a914d40e9c21ebbee6b4043e60a6dff770d62c59005388ac00000000",
//   //   );
//   // });
// }

// Future<UTXOTransaction> fetchUTXOTXByHashAndIndex(
//   String hash,
//   int nodeIndex,
//   int chainIndex,
//   Uint8List seed,
//   UTXONetworkType networkType,
// ) async {
//   const walletType = bitcoinNSHDPath;
//   final masterNode = deriveMasterNodeFromSeed(
//     seed: seed,
//     networkType: networkType,
//     walletPath: walletType,
//   );
//   final node = deriveChildNode(
//     masterNode: masterNode,
//     chainIndex: chainIndex,
//     index: nodeIndex,
//     networkType: networkType,
//     walletPurpose: walletType.purpose,
//     addressTypes: [AddressType.legacy],
//   );

//   final (result, _, _) = await fetchFromRandomElectrumXNode(
//     (client) async {
//       return client.getTransaction(
//         txHash: hash,
//         type: networkType,
//         nodes: [node],
//         addressTypes: [AddressType.legacy],
//       );
//     },
//     client: null,
//     endpoints: networkType.endpoints,
//     token: networkType.coin,
//   );

//   expect(result, isNotNull);

//   return result!;
// }

// Future<String> buildTestTransaction({
//   required TransferIntent intent,
//   required UTXONetworkType networkType,
//   required HDWalletPath walletType,
//   required Map<ElectrumOutput, UTXOTransaction> chosenUTXOs,
//   required Uint8List seed,
//   required String? changeAddress,
//   required int version,
//   int fees = 1000,
// }) async {
//   final targetValue = intent.amount.value;

//   const lockTime = 0;

//   final (totalInputValue, inputMap) = buildInputs(chosenUTXOs, networkType);

//   final targetAddress = intent.recipient;

//   ///
//   /// Build Outputs again with the estimated size
//   ///

//   final estimatedFee = BigInt.from(fees);
//   final changeValue = totalInputValue - targetValue - estimatedFee;

//   final outputs = buildOutputs(
//     recipient: targetAddress,
//     value: targetValue,
//     changeAddress: changeAddress,
//     changeValue: changeValue,
//     networkType: networkType,
//   );

//   ///
//   /// Build final transaction
//   ///

//   var tx = RawTransaction.build(
//     version: version,
//     lockTime: lockTime,
//     inputMap: inputMap,
//     outputs: outputs,
//   ).sign(seed: seed, walletPath: walletType, networkType: networkType);

//   return tx.asHex;
// }
