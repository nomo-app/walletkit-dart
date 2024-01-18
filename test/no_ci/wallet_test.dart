@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../ci/fetching/fetch_utxo_transactions_test.dart';
import 'utils_test.dart';

void main() {
  final devSeed = loadDevSeedFromEnv();

  test('Send ZENIQ-UTXO to ourselve', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: devSeed,
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
      seed: devSeed,
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

  test('Send to own Address', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: devSeed,
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
      amount: Amount.num(value: 1.2, decimals: 5),
      feePriority: FeePriority.high,
      token: ec8Coin,
    );

    final serializedTx = buildTransaction(
      intent: intent,
      networkType: EurocoinNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
      txList: txList,
      seed: devSeed,
      changeAddresses: nodes.changeNodes.addresses,
      feePerKB: 0.00008, // Minimum 0.00004; Max 0.00008
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
