@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
}
