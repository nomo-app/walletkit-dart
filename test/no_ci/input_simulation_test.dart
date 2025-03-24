import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
        await client.getRaw(hash),
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
  required HDWalletPurpose purpose,
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
  ).sign(seed: seed, purpose: purpose, networkType: networkType);

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
    final chosenUtxosMap = {for (final utxo in chosenUtxos) utxo.$2: utxo.$1};

    final outputs =
        expectedTx.outputs
            .map(
              (out) => switch (networkType) {
                BITCOIN_NETWORK() ||
                BITCOINCASH_NETWORK() ||
                LITECOIN_NETWORK() ||
                DOGECOIN_NETWORK() ||
                ZENIQ_NETWORK() => BTCOutput(
                  value: out.value,
                  script: out.scriptPubKey.lockingScript,
                ),
                EUROCOIN_NETWORK() => EC8Output(
                  value: out.value,
                  script: out.scriptPubKey.lockingScript,
                ),
              },
            )
            .toList();

    final fees = expectedTx.fee?.value.toInt() ?? 0;

    if (fees <= 0) {
      return (expectedTx, false, "Fees <= 0");
    }

    final simulatedTx = buildTestTransactionWithOutputs(
      networkType: networkType,
      purpose: HDWalletPurpose.NO_STRUCTURE, // TODO: check if needed
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
