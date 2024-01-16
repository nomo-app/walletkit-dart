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

  test('Parse', () async {
    final tx = EC8RawTransaction.fromHex(
        "02000000016f75830ea8a5b45c4faf36f5655a9466d5468df97b56be45673e88315fb04e850000000058474c0000000000920000006a47304402205fd73dc6cc5ac7ade4099d71b02c1b77280115d62e946f01499bcd978719fe9102206fc8ed8833fe78416cfd1a107cea3be930332330ab74c1669a7aa77404bb7617012102d1e1d9b5a9f73e7667f694d04918b63f1c345f4fe13186ec1d9e20f1bb22250602b8204c0000000000920000001976a9149f490d17fd11f46e58a976d173eec3a489f6208088acb822000000000000920000001976a914fe11d6bbb014576261c756a99bf2a833321bbc9188ace803000000000000b6010000000000000000000000000000");

    print(tx);
  });

  test('Parse Raw Tx', () async {
    final hash =
        "e4b06195023ab59ed3d52e6f6b16acdb8ce67f7dd14b5e03ce31fe26ce67671a";

    final (utxoTx, raw) = await fetchUTXOTXByHash(
      hash,
      EurocoinNetwork,
      [],
      [AddressType.legacy],
    );

    expect(raw, isNotNull);

    final tx = EC8RawTransaction.fromHex(raw!);

    expect(tx.txid, utxoTx.hash);

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
