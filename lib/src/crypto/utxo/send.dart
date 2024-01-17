import 'dart:convert';
import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/input_selection.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/src/utils/der.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

///
/// Useful: https://btcinformation.org/en/developer-reference#raw-transaction-format
/// https://github.com/bitcoin/bips/blob/master/bip-0144.mediawiki
///

String buildTransaction({
  required TransferIntent intent,
  required UTXONetworkType networkType,
  required HDWalletType walletType,
  required Uint8List seed,
  required Iterable<UTXOTransaction> txList,
  required double feePerKB,
  required Iterable<String> changeAddresses,
}) {
  if (txList.isEmpty) {
    throw SendFailure("empty txList"); // should be never reached
  }

  var targetValue = intent.amount.value;
  if (targetValue < BigInt.zero) {
    throw SendFailure("targetValue < 0");
  }
  // TODO: Check if DUST_THRESHOLD is correct for each network
  if (targetValue < DUST_THRESHOLD.toBI) {
    throw SendFailure("targetValue < DUST_THRESHOLD");
  }
  if (walletType == HDWalletType.BIP84 &&
      targetValue < DUST_THRESHOLD_SEGWIT.toBI) {
    throw SendFailure("targetValue < DUST_THRESHOLD_BIP84");
  }

  final allUTXOs = extractUTXOs(txList: txList);

  if (allUTXOs.isEmpty) {
    throw const SendFailure("no UTXOs"); // should be never reached
  }

  final feePerByte = feePerKB / 1024;

  const lockTime = 0;
  final version = networkType.txVersion;

  final chosenUTXOs = singleRandomDrawUTXOSelection(
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

  final changeAdress = findUnusedAddress(
    addresses: changeAddresses,
    txs: txList,
  );

  ///
  /// Build Dummy TX
  ///

  final dummyOutputs = buildOutputs(
    recipient: intent.recipient,
    value: targetValue,
    changeAddress: changeAdress,
    changeValue: BigInt.one,
    networkType: networkType,
  );

  var dummyTx = RawTransaction.build(
    version: version,
    lockTime: lockTime,
    inputs: inputMap.values.toList(),
    outputs: dummyOutputs,
  );

  var dummyInputs = signInputs(
    inputs: inputMap,
    walletType: walletType,
    tx: dummyTx,
    networkType: networkType,
    seed: seed,
  );

  dummyTx = dummyTx.signInputs(dummyInputs);

  ///
  /// Build Outputs again with the estimated size
  ///
  var estimatedSize = BigInt.from(dummyTx.size);
  var estimatedFee = estimatedSize * feePerByte.toSatoshi;

  var changeValue = totalInputValue - targetValue - estimatedFee;

  if (changeValue < BigInt.zero) {
    targetValue -= estimatedFee;
    if (targetValue < DUST_THRESHOLD.toBI) {
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

      dummyTx = dummyTx.signInputs(inputMap.values.toList());

      dummyInputs = signInputs(
        inputs: inputMap,
        walletType: walletType,
        tx: dummyTx,
        networkType: networkType,
        seed: seed,
      );

      dummyTx = dummyTx.signInputs(dummyInputs);

      estimatedSize = BigInt.from(dummyTx.size);
      estimatedFee = estimatedSize * feePerByte.toSatoshi;
    }

    changeValue = totalInputValue - targetValue - estimatedFee;
    if (changeValue < BigInt.zero)
      throw SendFailure("Not enough funds to pay targetValue $targetValue");
  }

  assert(
    totalInputValue == targetValue + changeValue + estimatedFee,
    "Total Input Value does not match Total Output Value",
  );

  Logger.log("Estimated Fee: $estimatedFee");

  final outputs = buildOutputs(
    recipient: targetAddress,
    value: targetValue,
    changeAddress: changeAdress,
    changeValue: changeValue,
    networkType: networkType,
  );

  ///
  /// Build final transaction
  ///

  var tx = RawTransaction.build(
    version: version,
    lockTime: lockTime,
    inputs: inputMap.values.toList(),
    outputs: outputs,
  );
  final signedInputs = signInputs(
    inputs: inputMap,
    walletType: walletType,
    tx: tx,
    networkType: networkType,
    seed: seed,
  );
  tx = tx.signInputs(signedInputs);

  if (tx.totalOutputValue + estimatedFee != totalInputValue) {
    throw SendFailure(
      "Total Output Value does not match Total Input Value",
    );
  }

  final serializedTx = tx.asHex;

  return serializedTx;
}

List<Input> signInputs({
  required Map<ElectrumOutput, Input> inputs,
  required HDWalletType walletType,
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

    if (bip32Node == null || bip32Node.isNeutered()) {
      if (output.belongsToUs) {
        bip32Node = deriveChildNodeFromPath(
          seed: seed,
          childDerivationPath: output.node.derivationPath,
          networkType: networkType,
          walletType: walletType,
        );
      } else
        throw SendFailure("Can't sign input without node");
    }

    if (tx is BTCRawTransaction && output.scriptPubKey.isSegwit) {
      final witnessSript = createScriptWitness(
        tx: tx,
        i: i,
        output: output,
        networkType: networkType,
        node: bip32Node,
      );

      signedInputs.add(input.addScript(wittnessScript: witnessSript));
      continue;
    }

    final scriptSig = createScriptSignature(
      tx: tx,
      i: i,
      output: output,
      walletType: walletType,
      networkType: networkType,
      node: bip32Node,
    );

    signedInputs.add(input.addScript(scriptSig: scriptSig));
  }

  return signedInputs;
}

Uint8List createScriptSignature({
  required RawTransaction tx,
  required int i,
  required ElectrumOutput output,
  required HDWalletType walletType,
  required UTXONetworkType networkType,
  required BIP32 node,
}) {
  final hashType = networkType.sighash.all;
  final prevScriptPubKey = output.scriptPubKey.lockingScript;

  final sigHash = switch (networkType) {
    BITCOINCASH_NETWORK() ||
    ZENIQ_NETWORK() when tx is BTCRawTransaction =>
      tx.bip143sigHash(
        index: i,
        prevScriptPubKey: prevScriptPubKey,
        output: output,
        hashType: hashType,
      ),
    LITECOIN_NETWORK() ||
    BITCOIN_NETWORK() ||
    EUROCOIN_NETWORK() =>
      tx.legacySigHash(
        index: i,
        prevScriptPubKey: prevScriptPubKey,
        hashType: hashType,
      ),
    _ =>
      throw SendFailure("Could not find sigHash for networkType $networkType"),
  };

  final sig = signInput(bip32: node, sigHash: sigHash);

  final scriptSig = encodeSignature(sig, hashType);

  final unlockingScript = constructScriptSig(
    walletType: walletType,
    signature: scriptSig,
    publicKey: node.publicKey,
  );

  return unlockingScript;
}

Uint8List createScriptWitness({
  required BTCRawTransaction tx,
  required int i,
  required ElectrumOutput output,
  required UTXONetworkType networkType,
  required BIP32 node,
}) {
  final hashType = networkType.sighash.all;
  final prevScriptPubKey = output.scriptPubKey.lockingScript;

  assert(output.scriptPubKey.isSegwit);

  final sigHash = tx.bip143sigHash(
    index: i,
    prevScriptPubKey: prevScriptPubKey,
    output: output,
    hashType: hashType,
  );

  final sig = signInput(bip32: node, sigHash: sigHash);

  final scriptSig = encodeSignature(sig, hashType);

  final pubkey = node.publicKey;

  return [
    0x02,
    scriptSig.length,
    ...scriptSig,
    pubkey.length,
    ...pubkey,
  ].toUint8List;
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
    LITECOIN_NETWORK() =>
      BTCInput(
        txid: txid,
        vout: vout,
        value: utxo.value,
        prevScriptPubKey: utxo.scriptPubKey.lockingScript,
      ),
    EUROCOIN_NETWORK() => EC8Input(
        txid: txid,
        vout: vout,
        value: utxo.value,
        prevScriptPubKey: utxo.scriptPubKey.lockingScript,
      ),
  };
}

Output buildOutput(String address, BigInt value, UTXONetworkType networkType) {
  final lockingScript = P2Hash(address).publicKeyScript;

  return switch (networkType) {
    BITCOIN_NETWORK() ||
    BITCOINCASH_NETWORK() ||
    ZENIQ_NETWORK() ||
    LITECOIN_NETWORK() =>
      BTCOutput(
        value: value,
        scriptPubKey: lockingScript,
      ),
    EUROCOIN_NETWORK() => EC8Output(
        value: value,
        scriptPubKey: lockingScript,
      ),
  };
}

Future<String> broadcastTransaction({
  required String rawTxHex,
  required UTXONetworkType type,
}) async {
  final (result, _, error) = await fetchFromRandomElectrumXNode(
    (client) async {
      print("Broadcasting Tx to ${client.host}");
      final broadcastResult =
          await client.broadcastTransaction(rawTxHex: rawTxHex);
      return broadcastResult;
    },
    client: null,
    token: type.coin,
    endpoints: type.endpoints,
  );

  if (result == null) {
    throw SendFailure("Broadcasting failed: ${error?.message}");
  }

  if (result.contains('error')) {
    final json = jsonDecode(result);

    if (json
        case {
          "error": {"error": {"code": int code, "message": String message}}
        }) {
      throw SendFailure("$code $message");
    }
    throw SendFailure("Unknown error: $result");
  }

  return result;
}

Uint8List signInput({
  required BIP32 bip32,
  required Uint8List sigHash,
}) {
  try {
    return bip32.sign(sigHash);
  } catch (e) {
    throw SendFailure("signing failed $e");
  }
}

Uint8List constructScriptSig({
  required HDWalletType walletType,
  required Uint8List signature,
  required Uint8List publicKey,
  Uint8List? redeemScript, // Required for BIP49 (P2SH-P2WPKH)
}) =>
    switch (walletType) {
      HDWalletType.NO_STRUCTURE ||
      HDWalletType.BIP44 ||
      HDWalletType.BIP44_LITECOIN =>
        Uint8List.fromList([
          signature.length,
          ...signature,
          publicKey.length,
          ...publicKey,
        ]),
      HDWalletType.BIP49 => Uint8List.fromList([
          0x00,
          signature.length,
          ...signature,
          redeemScript!.length,
          ...redeemScript,
        ]),

      /// Should never be called as it is handled in constructWitnessScript
      HDWalletType.BIP84 => Uint8List.fromList([
          0x00,
          signature.length,
          ...signature,
          publicKey.length,
          ...publicKey,
        ]),
    };
