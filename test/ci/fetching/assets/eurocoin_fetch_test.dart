import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../no_ci/input_simulation_test.dart';
import '../../../utils.dart';
import '../expected_utxo_tx_hashes.dart';
import '../fetch_utxo_transactions_test.dart';

void main() {
  final rejectSeed = loadDevSeedFromEnv();

  test('Fetch Txs', () async {
    final (txList, _) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: rejectSeed,
      minEndpoints: 2,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
    );

    expect(txList.length, greaterThanOrEqualTo(10));
    final expectedTxHashes = expectedTxHashesEuroCoinReject();
    expectTxHashes(txList: txList, expectedTxHashes: expectedTxHashes);

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
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      networkType: EurocoinNetwork,
      minEndpoints: 1,
    );

    var hash = "0df82ba308170f0b37b9281c1b118eadb6651be8c7ffdba2dbc9aba1b1b9820a";
    var result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);

    hash = "e1dedc0a6e080686aaa579f77b32b7f97d4ba6e2493a64970b36e1692ac45122";
    result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);

    hash = "e2d927462a03bdee8aa643a2dc29c872696ac59a680d73bfda99033760fb3dac";
    result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);

    hash = "2720a674d55119f7c8a2d856e7920f50c54a4bca7ef90bb2ff8af730b3451ac7";
    result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);

    hash = "dfbfbe044cd39d1dee8f7d63f9e7107c1e81d453a963c7ec767768f2cde78012";
    result = await simulateForEC8(hash, nodes);
    expect(result.$2, isTrue);
  });

  test('Parse Raw Tx', () async {
    const hash = "0df82ba308170f0b37b9281c1b118eadb6651be8c7ffdba2dbc9aba1b1b9820a";

    final (utxoTx, raw) = await fetchUTXOTXByHash(
      hash,
      EurocoinNetwork,
      [],
      [AddressType.legacy],
    );

    expect(raw, isNotNull);
    expect(raw,
        "0200000002f162508bb2ebfac41eadedf281b930dfe8ab07dd2fc71f822e45c23b81fde7740100000052c9010000000000920000006a47304402207c322395d27e3787886c84aa13e71a132a673a4ac5b9a7b1262afcd6a505958f0220651d6ca97e79920b2b0a869cda42e7870303e462be7288beb84f675be023e9ea012102a9db3a7a0697637bd9f6dc4295eca43a7c549497531e8b3cbb9a87e7d6c5e3a82251c42a69e1360b97643a49e2a64b7df9b7327bf779a5aa8606086e0adcdee101000000bde3e00000000000920000006a473044022079392301659dc68f07a3fbf79e4b67f94ecb156e84597e3dad40fbe8300fe5ea02200c6aedaca35a964a9055d1c771e8d66c80006d751cd312b27ee78fcd59867fe30121035df321678cf93292df3fb490ae33ee652ae679ad60f214fba2e7159a4652a6fd02725a010000000000920000001976a9149ca4cd3b0664514e066ce802a4532447c6b45f3788ac3d47e10000000000920000001976a9142af171511b5ba032912156f163628ae129e1dfaf88ac600b00000000000048020000000000000000000000000000");

    final tx = EC8RawTransaction.fromHex(raw!);

    expect(tx.txid, utxoTx.hash);
  });

  // Currently failing due to the Fulcrum Node
  // test('Simulate All Send EC8 Tx', () async {
  //   final (txList, nodes) = await fetchUTXOTransactions(
  //     seed: rejectSeed,
  //     walletTypes: [bitcoinNSHDPath],
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
