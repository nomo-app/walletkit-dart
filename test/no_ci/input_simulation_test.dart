@Timeout(Duration(seconds: 600))
import 'dart:io';
import 'dart:typed_data';
import 'package:dotenv/dotenv.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  final rejectSeedString = env["REJECT_SEED"]!.split(",");
  List<int> rejectIntList = rejectSeedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List rejectSeed = Uint8List.fromList(rejectIntList);

  final spoilSeedString = env["SPOIL_SEED"]!.split(",");
  List<int> spoilIntList = spoilSeedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List spoilSeed = Uint8List.fromList(spoilIntList);

  test('Simulate All Send Zeniq Tx', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: rejectSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
      minEndpoints: 10,
      maxLatency: Duration(
        milliseconds: 500,
      ),
    );
    expect(txList.length, greaterThanOrEqualTo(323));

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
          networkType: ZeniqNetwork,
          addressTypes: [AddressType.legacy],
        ),
    ]);

    //  final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    //  expect(validSimulations.length, greaterThanOrEqualTo(250));
    expect(invalidSimulations, isEmpty);
  });

  test('Simulate BTC TXs rejectSeed', () async {
    final addressTypes = [
      AddressType.legacy,
      AddressType.segwit,
    ];
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: rejectSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: addressTypes,
      networkType: BitcoinNetwork,
      minEndpoints: 10,
      maxLatency: Duration(
        milliseconds: 500,
      ),
    );
    expect(txList.length, greaterThanOrEqualTo(74));
    expect(
      nodes.first.address,
      startsWith("113G5SRkh8KqMfmqJKphuS1ALjxC3ead3Z"),
    ); // just a sanity check

    final sendTxs = txList
        .where((tx) =>
            tx.transferMethod == TransactionTransferMethod.send ||
            tx.transferMethod == TransactionTransferMethod.own)
        .map((tx) => tx.id);

    final unknown = txList
        .where((tx) => tx.transferMethod == TransactionTransferMethod.unknown)
        .map((tx) => tx.id)
        .toList();

    expect(unknown, hasLength(0));

    final results = await Future.wait([
      for (final tx in sendTxs)
        simulateTx(
          hash: tx,
          nodes: nodes,
          seed: rejectSeed,
          networkType: BitcoinNetwork,
          addressTypes: addressTypes,
        ),
    ]);

//    final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    //  expect(validSimulations.length, greaterThanOrEqualTo(62));
    expect(invalidSimulations.length, 0);

    for (final result in invalidSimulations) {
      expect(
        result.$1.inputs.any(
            (element) => element.getAddress(BitcoinNetwork).startsWith("bc1")),
        isTrue,
      );
    }
  });

  test('Litecoin Segwit Sending', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: spoilSeed,
      walletTypes: [litecoinBip44HDPath],
      addressTypes: [AddressType.segwit, AddressType.legacy],
      networkType: LitecoinNetwork,
      minEndpoints: 1,
      maxLatency: Duration(
        milliseconds: 500,
      ),
    );
    expect(txList.length, greaterThanOrEqualTo(31));

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
          seed: spoilSeed,
          networkType: LitecoinNetwork,
          addressTypes: [AddressType.segwit, AddressType.legacy],
        ),
    ]);

    final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    expect(validSimulations.length, greaterThanOrEqualTo(15));
    expect(invalidSimulations, isEmpty);
  });

  test('Bitcoincash Sending', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: rejectSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy, AddressType.cashaddr],
      networkType: BitcoincashNetwork,
      minEndpoints: 3,
      maxLatency: Duration(
        milliseconds: 800,
      ),
    );
    // expect(txList.length, greaterThanOrEqualTo(17));

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
          networkType: BitcoincashNetwork,
          addressTypes: [AddressType.segwit, AddressType.legacy],
        ),
    ]);

    //  final validSimulations = results.where((result) => result.$2).toList();
    final invalidSimulations = results.where((result) => !result.$2).toList();

    //expect(validSimulations.length, greaterThanOrEqualTo(13));
    expect(invalidSimulations, isEmpty);
  });
}

///
/// UTILS
///
Future<(UTXOTransaction, String?)> fetchUTXOTXByHash(
  String hash,
  UTXONetworkType networkType,
  Iterable<NodeWithAddress> nodes,
  Iterable<AddressType> addressTypes,
) async {
  final (result, _, e) = await fetchFromRandomElectrumXNode(
    (client) async {
      return (
        await client.getTransactionForSimulation(
          txHash: hash,
          nodes: nodes,
          type: networkType,
          addressTypes: addressTypes,
        ),
        await client.getRaw(hash)
      );
    },
    client: null,
    endpoints: networkType.endpoints,
    token: networkType.coin,
    timeout: Duration(seconds: 10),
  );

  expect(e, isNull);

  expect(result, isNotNull, reason: "Result is null for $hash");

  return result!;
}

String buildTestTransactionWithOutputs({
  required UTXONetworkType networkType,
  required HDWalletPath walletType,
  required Map<ElectrumOutput, UTXOTransaction> chosenUTXOs,
  required Uint8List seed,
  required int version,
  required List<Output> outputs,
}) {
  const lockTime = 0;
  const validFrom = 0;
  const validUntil = 0;

  final (_, inputMap) = buildInputs(chosenUTXOs, networkType);

  ///
  /// Build final transaction
  ///

  var tx = RawTransaction.build(
    version: version,
    inputMap: inputMap,
    outputs: outputs,
    lockTime: lockTime,
    validFrom: validFrom,
    validUntil: validUntil,
  ).sign(
    seed: seed,
    walletPath: walletType,
    networkType: networkType,
  );

  return tx.asHex;
}

Future<(UTXOTransaction, bool, String?)> simulateTx({
  required String hash,
  required Iterable<NodeWithAddress> nodes,
  required Uint8List seed,
  required UTXONetworkType networkType,
  required Iterable<AddressType> addressTypes,
  bool writeToFile = false,
}) async {
  // mainTx is an already confirmed transaction from the blockchain
  final (expectedTx, expectedTxRaw) = await fetchUTXOTXByHash(
    hash,
    networkType,
    nodes,
    addressTypes,
  );
  try {
    final usedUtxos = expectedTx.inputs
        .where((input) => !input.isCoinbase)
        .map((input) => (input.txid!, input.vout!));

    final inputTxs = usedUtxos.map((utxo) async {
      final (tx, _) = await fetchUTXOTXByHash(
        utxo.$1,
        networkType,
        nodes,
        addressTypes,
      );
      return (tx, tx.outputs[utxo.$2]);
    });

    final chosenUtxos = await Future.wait(inputTxs);
    final chosenUtxosMap = {
      for (final utxo in chosenUtxos) utxo.$2: utxo.$1,
    };

    final outputs = expectedTx.outputs
        .map((out) => switch (networkType) {
              BITCOIN_NETWORK() ||
              BITCOINCASH_NETWORK() ||
              LITECOIN_NETWORK() ||
              DOGECOIN_NETWORK() ||
              ZENIQ_NETWORK() =>
                BTCOutput(
                  value: out.value,
                  scriptPubKey: out.scriptPubKey.lockingScript,
                ),
              EUROCOIN_NETWORK() => EC8Output(
                  value: out.value,
                  scriptPubKey: out.scriptPubKey.lockingScript,
                ),
            })
        .toList();

    final fees = expectedTx.fee?.value.toInt() ?? 0;

    if (fees <= 0) {
      return (expectedTx, false, "Fees <= 0");
    }

    final simulatedTx = buildTestTransactionWithOutputs(
      networkType: networkType,
      walletType: bitcoinNSHDPath,
      chosenUTXOs: chosenUtxosMap,
      seed: seed,
      version: expectedTx.version,
      outputs: outputs,
    );

    if (writeToFile) {
      final file = File("test/simulationOutput.txt");
      await file.writeAsString(
        "Simulation Tx\n$simulatedTx\n\nSource Tx\n$expectedTxRaw",
        flush: true,
      );
    }

    return (expectedTx, simulatedTx == expectedTxRaw, null);
  } catch (e, s) {
    return (expectedTx, false, "$e $s");
  }
}
