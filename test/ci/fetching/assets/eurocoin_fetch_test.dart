import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../no_ci/input_simulation_test.dart';
import '../../../utils.dart';
import '../fetch_utxo_transactions_test.dart';

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

    expect(txList.length, greaterThanOrEqualTo(10));

    reportCoinsAndAddresses(txList: txList, type: EurocoinNetwork);
  });

  test('Simulate a few Txs', () async {
    Future<(UTXOTransaction, bool, String?)> simulateForEC8(
      String hash,
      Iterable<NodeWithAddress> nodes,
    ) async {
      final result = await simulateTx(
        hash: hash,
        nodes: nodes,
        seed: rejectSeed,
        networkType: EurocoinNetwork,
        addressTypes: [AddressType.legacy],
      );

      return result;
    }

    final (_, nodes) = await fetchUTXOTransactions(
      seed: rejectSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
      networkType: EurocoinNetwork,
      minEndpoints: 1,
    );

    var hash =
        "0df82ba308170f0b37b9281c1b118eadb6651be8c7ffdba2dbc9aba1b1b9820a";
    var result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);

    // var hash =
    //     "e1dedc0a6e080686aaa579f77b32b7f97d4ba6e2493a64970b36e1692ac45122";
    // var result = await simulateForEC8(hash, nodes);
    // expect(result.$2, isTrue);

    // hash = "e2d927462a03bdee8aa643a2dc29c872696ac59a680d73bfda99033760fb3dac";
    // result = await simulateForEC8(hash, nodes);
    // expect(result.$2, isTrue);

    // hash = "2720a674d55119f7c8a2d856e7920f50c54a4bca7ef90bb2ff8af730b3451ac7";
    // result = await simulateForEC8(hash, nodes);
    // expect(result.$2, isTrue);

    // hash = "dfbfbe044cd39d1dee8f7d63f9e7107c1e81d453a963c7ec767768f2cde78012";
    // result = await simulateForEC8(hash, nodes);
    // expect(result.$2, isTrue);
  });

  test('Parse Raw Tx', () async {
    const hash =
        "0df82ba308170f0b37b9281c1b118eadb6651be8c7ffdba2dbc9aba1b1b9820a";

    final (utxoTx, raw) = await fetchUTXOTXByHash(
      hash,
      EurocoinNetwork,
      [],
      [AddressType.legacy],
    );

    expect(raw, isNotNull);

    final tx = EC8RawTransaction.fromHex(raw!);

    expect(tx.txid, utxoTx.hash);
  });

  // Currently failing due to the Fulcrum Node
  // test('Simulate All Send EC8 Tx', () async {
  //   final (txList, nodes) = await fetchUTXOTransactions(
  //     seed: rejectSeed,
  //     walletTypes: [HDWalletType.NO_STRUCTURE],
  //     addressTypes: [AddressType.legacy],
  //     networkType: EurocoinNetwork,
  //     minEndpoints: 1,
  //   );
  //   expect(txList.length, greaterThanOrEqualTo(4));

  //   final sendTxs = txList
  //       .where(
  //         (tx) => (tx.transferMethod == TransactionTransferMethod.send ||
  //             tx.transferMethod == TransactionTransferMethod.own),
  //       )
  //       .map((tx) => tx.id);

  //   final results = await Future.wait([
  //     for (final tx in sendTxs)
  //       simulateTx(
  //         hash: tx,
  //         nodes: nodes,
  //         seed: rejectSeed,
  //         networkType: EurocoinNetwork,
  //         addressTypes: [AddressType.legacy],
  //       ),
  //   ]);

  //   final validSimulations = results.where((result) => result.$2).toList();
  //   final invalidSimulations = results.where((result) => !result.$2).toList();

  //   expect(validSimulations.length, greaterThanOrEqualTo(1));
  //   expect(invalidSimulations, isEmpty);
  // });
}
