import 'package:bip39/bip39.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../no_ci/input_simulation_test.dart';
import '../../../no_ci/utils_test.dart';
import '../fetch_utxo_transactions_test.dart';
import '../serialization_test.dart';

void main() {
  final rejectSeed = loadDevSeedFromEnv();

  test('Fetch Txs', () async {
    final (txList, _) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: rejectSeed,
      minEndpoints: 1,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
    );

    reportCoinsAndAddresses(txList: txList, type: EurocoinNetwork);
  });

  test('Parse Raw Tx', () async {
    final hash =
        "854eb05f31883e6745be567bf98d46d566945a65f536af4f5cb4a5a80e83756f";

    final (utxoTx, raw) = await fetchUTXOTXByHash(
      hash,
      EurocoinNetwork,
      [],
      [AddressType.legacy],
    );

    expect(raw, isNotNull);

    final tx = EC8RawTransaction.fromHex(raw!);

    print(tx);
  });

  test('Simulate All Send EC8 Tx', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: rejectSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
      networkType: EurocoinNetwork,
      minEndpoints: 1,
    );
    expect(txList.length, greaterThanOrEqualTo(2));

    final sendTxs = txList
        .where((tx) =>
            tx.transferMethod == TransactionTransferMethod.send ||
            tx.transferMethod == TransactionTransferMethod.own)
        .map((tx) => tx.id);

    final results = await Future.wait([
      for (final tx in sendTxs)
        simulateTx(
          hash: tx,
          nodes: nodes,
          seed: rejectSeed,
          networkType: EurocoinNetwork,
          addressTypes: [AddressType.legacy],
          writeToFile: true,
        ),
    ]);

    //  final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    //  expect(validSimulations.length, greaterThanOrEqualTo(250));
    expect(invalidSimulations, isEmpty);
  });

  test('Send to own Address', () async {
    final reject =
        "reject tomato wrap average lunch fame breeze task clump network answer else";

    final rejectSeed = mnemonicToSeed(reject);

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: rejectSeed,
      minEndpoints: 1,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
    );

    reportCoinsAndAddresses(txList: txList, type: EurocoinNetwork);

    final receive = findUnusedAddress(
      addresses: nodes.receiveNodes.addresses,
      txs: txList,
    );

    print("Receive Address: $receive");

    final intent = TransferIntent(
      recipient: receive,
      amount: Amount(value: BigInt.from(100000000), decimals: 8),
      feePriority: FeePriority.high,
      token: ec8Coin,
    );

    final serializedTx = buildTransaction(
      intent: intent,
      networkType: EurocoinNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
      txList: txList,
      seed: rejectSeed,
      changeAddresses: nodes.changeNodes.addresses,
      feePerKB: 0.0001,
    );

    expect(serializedTx, isNotNull);

    print("Serialized Tx: $serializedTx");

    final hash = await broadcastTransaction(
      rawTxHex: serializedTx,
      type: EurocoinNetwork,
    );

    print(hash);

    expect(hash, isNotEmpty);
  });
}
