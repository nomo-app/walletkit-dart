@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  // test('Test Any Tx', () async {
  //   final (_, nodes) = await fetchUTXOTransactions(
  //     seed: helloSeed,
  //     walletTypes: [HDWalletType.NO_STRUCTURE],
  //     addressTypes: [AddressType.legacy],
  //     networkType: ZeniqNetwork,
  //   );
  //   final tx = await fetchUTXOTXByHash(
  //     "6e1228f048c590062399a4fbaf4eab2f445935874fa56fa3ab54bcd02d278715",
  //     ZeniqNetwork,
  //     nodes,
  //     [AddressType.legacy],
  //   );

  //   print(tx);
  // });

  // test('Simulate Any Zeniq Tx', () async {
  //   final (_, nodes) = await fetchUTXOTransactions(
  //     seed: helloSeed,
  //     walletTypes: [HDWalletType.NO_STRUCTURE],
  //     addressTypes: [AddressType.legacy],
  //     networkType: ZeniqNetwork,
  //   );

  //   final result = await simulateTx(
  //     hash: "6e1228f048c590062399a4fbaf4eab2f445935874fa56fa3ab54bcd02d278715",
  //     nodes: nodes,
  //     writeToFile: true,
  //     seed: helloSeed,
  //     networkType: ZeniqNetwork,
  //     addressTypes: [AddressType.legacy],
  //   );

  //   print(result);
  //   expect(result.$2, true);
  // });

  test('Send to own Receive', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: helloSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
    );

    final reveiveAddress = findUnusedAddress(
      addresses: nodes.receiveNodes.addresses,
      txs: txList,
    );

    final intent = TransferIntent(
      recipient: reveiveAddress,
      amount: Amount(value: BigInt.from(100000000), decimals: 8),
      feePriority: FeePriority.high,
      token: zeniqCoin,
    );

    final serializedTx = buildTransaction(
      intent: intent,
      networkType: ZeniqNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
      txList: txList,
      seed: helloSeed,
      changeAddresses: nodes.changeNodes.addresses,
      feePerKB: 0.0001,
    );

    expect(serializedTx, isNotNull);

    print("Serialized Tx: $serializedTx");

    final hash = await broadcastTransaction(
      rawTxHex: serializedTx,
      type: ZeniqNetwork,
    );

    print(hash);

    expect(hash, isNotEmpty);
  });
}
