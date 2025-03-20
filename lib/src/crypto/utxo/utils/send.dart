import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/payments/input_selection.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/tx_structure.dart';
import 'package:walletkit_dart/src/crypto/utxo/repositories/electrum_json_rpc_client.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/src/utils/der.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/wallet/hd_node.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

///
/// Useful: https://btcinformation.org/en/developer-reference#raw-transaction-format
/// https://github.com/bitcoin/bips/blob/master/bip-0144.mediawiki
///

RawTransaction buildUnsignedTransaction({
  required TransferIntent<UtxoFeeInformation> intent,
  required UTXONetworkType networkType,
  required HDWalletPath walletPath,
  required Iterable<UTXOTransaction> txList,
  required Amount feePerByte,
  required Iterable<String> changeAddresses,

  /// Pre chosen UTXOs to deterministly choose the UTXOs
  /// if null, the UTXOs will be chosen randomly
  List<ElectrumOutput>? preChosenUTXOs,
}) {
  if (txList.isEmpty) {
    throw SendFailure("No transactions");
  }

  var targetValue = intent.amount.value;

  if (targetValue < BigInt.zero) {
    throw SendFailure("targetValue < 0");
  }

  if (targetValue < networkType.dustTreshhold.legacy.toBI &&
      walletPath.purpose != HDWalletPurpose.BIP84) {
    throw SendFailure(
      "targetValue < DUST_THRESHOLD: ${networkType.dustTreshhold.legacy}",
    );
  }
  if (walletPath.purpose == HDWalletPurpose.BIP84 &&
      targetValue < networkType.dustTreshhold.segwit.toBI) {
    throw SendFailure(
      "targetValue < DUST_THRESHOLD_BIP84: ${networkType.dustTreshhold.segwit}",
    );
  }

  final allUTXOs = extractUTXOs(txList: txList);

  if (allUTXOs.isEmpty) {
    throw const SendFailure("no UTXOs"); // should be never reached
  }

  const lockTime = 0;
  const validFrom = 0; // EC8 specific
  const validUntil = 0; // EC8 specific
  final version = networkType.txVersion;

  final chosenUTXOs = preChosenUTXOs ??
      singleRandomDrawUTXOSelection(
        allUTXOs.keys.toList(),
        targetValue,
      );

  Logger.log("Chosen UTXOs: ${chosenUTXOs}");

  var chosenUTXOsMap = {
    for (final utxo in chosenUTXOs) utxo: allUTXOs[utxo]!,
  };

  var (totalInputValue, inputMap) = buildInputs(chosenUTXOsMap, networkType);

  if (totalInputValue < targetValue) {
    throw SendFailure("Not enough funds to pay targetValue $targetValue");
  }
  if (inputMap.keys.isEmpty) {
    throw SendFailure("No inputs");
  }

  final targetAddress = intent.recipient;

  final changeAddress = findUnusedAddress(
    addresses: changeAddresses,
    txs: txList,
  );

  ///
  /// Build Dummy TX
  ///

  final dummyOutputs = buildOutputs(
    recipient: intent.recipient,
    value: targetValue,
    changeAddress: changeAddress,
    changeValue: BigInt.one,
    networkType: networkType,
  );

  var dummyTx = buildDummyTx(
    networkType: networkType,
    walletPath: walletPath,
    inputMap: inputMap,
    dummyOutputs: dummyOutputs,
  );

  ///
  /// Build Outputs again with the estimated size
  ///

  var estimatedFee = calculateFee(tx: dummyTx, feePerByte: feePerByte);

  var changeValue = totalInputValue - targetValue - estimatedFee;

  if (changeValue < BigInt.zero) {
    targetValue -= changeValue.abs();
    if (targetValue < networkType.dustTreshhold.legacy.toBI) {
      /// Ad addidional UTXO to cover the fee
      targetValue = intent.amount.value;
      final additionalUTXO = fillUpToTargetAmount(
        chosenUTXOs,
        allUTXOs.keys.toList(),
        targetValue + estimatedFee * BigInt.two,
      );

      chosenUTXOsMap = {
        for (final utxo in additionalUTXO) utxo: allUTXOs[utxo]!,
      };

      (totalInputValue, inputMap) = buildInputs(chosenUTXOsMap, networkType);

      dummyTx = buildDummyTx(
        networkType: networkType,
        walletPath: walletPath,
        inputMap: inputMap,
        dummyOutputs: dummyOutputs,
      );

      estimatedFee = calculateFee(tx: dummyTx, feePerByte: feePerByte);
    }

    changeValue = totalInputValue - targetValue - estimatedFee;
    if (changeValue < BigInt.zero)
      throw SendFailure("Not enough funds to pay targetValue $targetValue");
  }

  assert(
    totalInputValue == targetValue + changeValue + estimatedFee,
    "Total Input Value does not match Total Output Value",
  );

  final outputs = buildOutputs(
    recipient: targetAddress,
    value: targetValue,
    changeAddress: changeAddress,
    changeValue: changeValue,
    networkType: networkType,
  );

  ///
  /// Build final transaction
  ///

  var tx = RawTransaction.build(
    version: version,
    lockTime: lockTime,
    validFrom: validFrom,
    validUntil: validUntil,
    inputMap: inputMap,
    outputs: outputs,
  );

  if (tx.totalOutputValue + estimatedFee != totalInputValue) {
    throw SendFailure(
      "Total Output Value does not match Total Input Value",
    );
  }
  Logger.log("Input Fee per Byte: ${feePerByte.displayDouble}");
  Logger.log("Estimated Fee: $estimatedFee");
  Logger.log("Actual Fee: ${tx.fee}");
  Logger.log("Fee per Byte: ${tx.feePerByte}");

  return tx;
}

typedef DummyTxInfo = ({
  RawTransaction dummyRawTx,
  List<ElectrumOutput> chosenUTXOs
});

///
/// Creates a dummy transaction to estimate the size of the transaction and hence the fee
/// Also returns the chosen UTXOs so that they can be used to create the real transaction with the same UTXOs
/// Includes a safety margin so that changes in the Amount dont lead to a different fee
///
DummyTxInfo buildDummyTxFromScratch({
  required TransferIntent intent,
  required UTXONetworkType networkType,
  required HDWalletPath walletPath,
  required Iterable<UTXOTransaction> txList,
  required List<String> changeAddresses,
}) {
  final allUTXOs = extractUTXOs(txList: txList);

  final chosenUTXOs = singleRandomDrawUTXOSelection(
    allUTXOs.keys.toList(),
    intent.amount.value,
  );

  final chosenUTXOsMap = {
    for (final utxo in chosenUTXOs) utxo: allUTXOs[utxo]!,
  };

  final (_, inputMap) = buildInputs(chosenUTXOsMap, networkType);

  final changeAddress = findUnusedAddress(
    addresses: changeAddresses,
    txs: txList,
  );

  final dummyOutputs = buildOutputs(
    recipient: intent.recipient,
    value: intent.amount.value,
    changeAddress: changeAddress,
    changeValue: BigInt.one,
    networkType: networkType,
  );

  final dummyTx = buildDummyTx(
    networkType: networkType,
    walletPath: walletPath,
    inputMap: inputMap,
    dummyOutputs: dummyOutputs,
  );

  return (dummyRawTx: dummyTx, chosenUTXOs: chosenUTXOs);
}

RawTransaction buildDummyTx({
  required UTXONetworkType networkType,
  required HDWalletPath walletPath,
  required Map<ElectrumOutput, Input> inputMap,
  required List<Output> dummyOutputs,
}) {
  final dummySeed = helloSeed;

  var dummyTx = RawTransaction.build(
    version: 0,
    lockTime: 0,
    validFrom: 0,
    validUntil: 0,
    inputMap: inputMap,
    outputs: dummyOutputs,
  ).sign(
    seed: dummySeed,
    networkType: networkType,
    walletPath: walletPath,
  );

  return dummyTx;
}

List<Input> signInputs({
  required Map<ElectrumOutput, Input> inputs,
  required HDWalletPath walletPath,
  required UTXONetworkType networkType,
  required RawTransaction tx,
  required Uint8List seed,
}) {
  final signedInputs = <Input>[];

  for (var i = 0; i < inputs.length; i++) {
    final entry = inputs.entries.elementAt(i);
    final input = entry.value;
    final output = entry.key;
    var bip32Node = output.node.bip32Node;

    if (bip32Node == null || bip32Node.isNeutered) {
      if (output.belongsToUs) {
        bip32Node = deriveChildNodeFromPath(
          seed: seed,
          childDerivationPath: output.node.derivationPath,
          networkType: networkType,
          walletPath: walletPath,
        );
      } else
        throw SendFailure("Can't sign input without node: $output $input");
    }

    if (tx is BTCRawTransaction && output.scriptPubKey.isSegwit) {
      final witnessSript = createScriptWitness(
        tx: tx,
        i: i,
        output: output,
        networkType: networkType,
        node: bip32Node,
      );

      signedInputs.add(input.addScript(witnessSript));
      continue;
    }

    final scriptSig = createScriptSignature(
      tx: tx,
      i: i,
      output: output,
      walletPurpose: walletPath.purpose,
      networkType: networkType,
      node: bip32Node,
    );

    signedInputs.add(input.addScript(scriptSig));
  }

  return signedInputs;
}

BTCUnlockingScript createScriptSignature({
  required RawTransaction tx,
  required int i,
  required ElectrumOutput output,
  required HDWalletPurpose walletPurpose,
  required UTXONetworkType networkType,
  required HDNode node,
}) {
  final hashType = networkType.sighash.all;
  final prevScriptPubKey = output.scriptPubKey.lockingScript;

  final sigHash = switch (networkType) {
    BITCOINCASH_NETWORK() ||
    ZENIQ_NETWORK() when tx is BTCRawTransaction =>
      tx.bip143sigHash(
        index: i,
        prevScript: prevScriptPubKey,
        networkType: networkType,
        output: output,
        hashType: hashType,
      ),
    LITECOIN_NETWORK() ||
    BITCOIN_NETWORK() ||
    EUROCOIN_NETWORK() =>
      tx.legacySigHash(
        index: i,
        prevScript: prevScriptPubKey,
        networkType: networkType,
        hashType: hashType,
      ),
    _ =>
      throw SendFailure("Could not find sigHash for networkType $networkType"),
  };

  final sig = signInput(bip32: node, sigHash: sigHash);

  final encodedSig = encodeSignature(sig, hashType);

  return switch (walletPurpose) {
    HDWalletPurpose.BIP49 => throw UnimplementedError(),
    _ => ScriptSignature(encodedSig, node.publicKey),
  };
}

ScriptWitness createScriptWitness({
  required BTCRawTransaction tx,
  required int i,
  required ElectrumOutput output,
  required UTXONetworkType networkType,
  required HDNode node,
}) {
  final hashType = networkType.sighash.all;
  final prevScriptPubKey = output.scriptPubKey.lockingScript;

  assert(output.scriptPubKey.isSegwit);

  final sigHash = tx.bip143sigHash(
    index: i,
    prevScript: prevScriptPubKey,
    output: output,
    hashType: hashType,
    networkType: networkType,
  );

  final sig = signInput(bip32: node, sigHash: sigHash);

  final scriptSig = encodeSignature(sig, hashType);

  final pubkey = node.publicKey;

  return ScriptWitness(scriptSig, pubkey);
}

(BigInt, Map<ElectrumOutput, Input>) buildInputs(
  Map<ElectrumOutput, UTXOTransaction> utxos,
  UTXONetworkType networkType,
) {
  final usedUTXO = <String>{};
  final inputs = <ElectrumOutput, Input>{};
  var totalInputValue = BigInt.zero;

  for (final uTXOEntry in utxos.entries) {
    final uTXO = uTXOEntry.key;
    final uTXOTx = uTXOEntry.value;

    final hash = uTXOTx.id;

    inputs[uTXO] = buildInput(
      txidHex: hash,
      usedUTXO: usedUTXO,
      utxo: uTXO,
      networkType: networkType,
    );

    totalInputValue += uTXO.value;
  }

  return (totalInputValue, inputs);
}

List<Output> buildOutputs({
  required String recipient,
  required BigInt value,
  required String? changeAddress,
  required BigInt changeValue,
  required UTXONetworkType networkType,
}) {
  return [
    buildOutput(recipient, value, networkType),
    if (changeAddress != null && changeValue != BigInt.zero)
      buildOutput(changeAddress, changeValue, networkType),
  ];
}

Input buildInput({
  required String txidHex,
  required Set<String> usedUTXO,
  required ElectrumOutput utxo,
  required UTXONetworkType networkType,
}) {
  final vout = utxo.n;
  final txid = Uint8List.fromList(
    hex.decode(txidHex).reversed.toList(),
  ); // Use 'txid' instead of 'hash'

  final prevTxOut = '$txidHex:$vout';

  if (usedUTXO.contains(prevTxOut)) {
    throw const SendFailure("double spend");
  }

  /// Check if utxo has a ScriptSig => Input should also have a ScriptSig
  /// Check if utxo has a WitnessScript => Input should also have a WitnessScript
  ///

  return switch (networkType) {
    BITCOIN_NETWORK() ||
    BITCOINCASH_NETWORK() ||
    ZENIQ_NETWORK() ||
    DOGECOIN_NETWORK() ||
    LITECOIN_NETWORK() =>
      BTCInput(
        txid: txid,
        vout: vout,
        script: null,
        prevOutput: utxo.toOutput,
      ),
    EUROCOIN_NETWORK() => EC8Input(
        txid: txid,
        vout: vout,
        script: null,
        prevOutput: utxo.toOutput,
      ),
  };
}

Output buildOutput(String address, BigInt value, UTXONetworkType networkType) {
  final lockingScript = BTCLockingScript.fromAddress(address);

  return switch (networkType) {
    BITCOIN_NETWORK() ||
    BITCOINCASH_NETWORK() ||
    ZENIQ_NETWORK() ||
    DOGECOIN_NETWORK() ||
    LITECOIN_NETWORK() =>
      BTCOutput(
        value: value,
        script: lockingScript,
      ),
    EUROCOIN_NETWORK() => EC8Output(
        value: value,
        script: lockingScript,
      ),
  };
}

Future<String> broadcastTransaction({
  required String rawTxHex,
  required UTXONetworkType type,
}) async {
  final (result, client, error) = await fetchFromRandomElectrumXNode(
    (client) async {
      final broadcastResult =
          await client.broadcastTransaction(rawTxHex: rawTxHex);
      return broadcastResult;
    },
    client: null,
    token: type.coin,
    endpoints: type.endpoints,
  );

  final host = "${client?.host}:${client?.port}";

  if (result == null) {
    throw SendFailure("Broadcasting failed for $host: ${error?.message}");
  }

  final json = jsonDecode(result);

  if (result.contains('error')) {
    if (json
        case {
          "error": {"error": {"code": int code, "message": String message}}
        }) {
      throw SendFailure("$host $code $message");
    }
    if (json case {"error": {"code": int code, "message": String message}}) {
      throw SendFailure("$host $code $message");
    }
    throw SendFailure("Unknown error for $host: $result");
  }

  if (result.contains('result') == false) {
    throw SendFailure("Unknown error for $host: $result");
  }

  final hash = json['result'];

  return hash;
}

///
/// For a given [hash] and [serializedTx] we check if the transaction is already in the mempool
/// If not we rebroadcast the transaction until at least half of the nodes have the transaction
///
Future<bool> rebroadcastTransaction({
  required String hash,
  required String serializedTx,
  required UTXONetworkType type,
  Duration delay = const Duration(seconds: 5),
}) async {
  await Future.delayed(delay);

  final clients = await Future.wait(
    [
      for (final endpoint in type.endpoints)
        createElectrumXClient(
          endpoint: endpoint.$1,
          port: endpoint.$2,
          token: type.coin,
        ),
    ],
  ).then(
    (clients) => clients.whereType<ElectrumXClient>(),
  );

  while (true) {
    int rebroadcastCount = 0;
    Set<ElectrumXClient> clientsForRebroadcast = {};

    Future<void> testEndpoint(ElectrumXClient client) async {
      final (rawTx, error) = await fetchFromNode(
        (client) => client.getRaw(hash),
        client: client,
      );

      if (error != null) {
        clientsForRebroadcast.add(client);
        return;
      }

      if (rawTx == serializedTx) {
        rebroadcastCount++;
      }
    }

    await Future.wait(
      [
        for (final client in clients) testEndpoint(client),
      ],
    );

    if (clientsForRebroadcast.isEmpty) {
      break;
    }

    if (rebroadcastCount > type.endpoints.length / 2) {
      break;
    }

    Logger.log(
      "Rebroadcasting: $hash for ${clientsForRebroadcast.length} endpoints",
    );

    for (final client in clientsForRebroadcast) {
      final (result, _) = await fetchFromNode(
        (client) => client.broadcastTransaction(rawTxHex: serializedTx),
        client: client,
      );
      if (result == null) continue;
      final json = jsonDecode(result);
      final hasResult = json.containsKey('result');
      final hasError = json.containsKey('error');
      if (hasResult) {
        final _hash = json['result'];
        Logger.log("Rebroadcasted: $_hash");
        assert(_hash == hash);
      }
      if (hasError) {
        final error = json['error'];
        Logger.logWarning("Error rebroadcasting: $error");
      }
    }

    await Future.delayed(delay);
  }

  await Future.wait([for (final client in clients) client.disconnect()]);

  return true;
}

Uint8List signInput({
  required HDNode bip32,
  required Uint8List sigHash,
}) {
  try {
    return bip32.sign(sigHash);
  } catch (e) {
    throw SendFailure("signing failed $e");
  }
}

BigInt calculateFee({
  required RawTransaction tx,
  required Amount feePerByte,
}) {
  return switch (tx) {
    EC8RawTransaction _ => calculateFeeEC8(tx: tx),
    BTCRawTransaction tx when tx.isSegwit => tx.weight * feePerByte.value,
    _ => tx.size.toBI * feePerByte.value,
  };
}

const int max_cheap_tx_weight = 15000;

BigInt calculateFeeEC8({
  required RawTransaction tx,
}) {
  var fee = 1000.toBI; // Base fee

  final outputLength = tx.outputs.length;

  if (outputLength > 2) {
    fee += 1000.toBI * (outputLength - 2).toBI;
  }

  if (tx.weight > max_cheap_tx_weight.toBI) {
    fee += 1000.toBI * ((tx.weight + 999.toBI) / 1000.toBI).toBI;
  }

  assert(fee % 1000.toBI == 0.toBI);

  return fee;
}
