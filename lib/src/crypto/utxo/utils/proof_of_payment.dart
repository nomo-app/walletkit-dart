import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/op_codes.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/src/crypto/utxo/repositories/electrum_json_rpc_client.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'ecurve.dart' as ecc;

class POPResult {
  final Uint8List uPoPHash;
  final BTCRawTransaction upopTx;

  /// Signatures of uPoPHash for each input used in the to be proven transaction
  final List<Uint8List> pops;

  const POPResult(this.uPoPHash, this.upopTx, this.pops);

  bool verifiyPop(int index, Uint8List publicKey) {
    assert(index < pops.length);
    return ecc.verify(uPoPHash, publicKey, pops[index]);
  }

  Map<String, dynamic> toJson() {
    return {
      "uPoPTxId": upopTx.txid,
      "uPoP": upopTx.asHex,
      "uPoPHash": uPoPHash.toHex,
      "pops": [
        for (final pop in pops) pop.toHex,
      ],
    };
  }
}

///
/// Proof of Payment using BIP120: https://bips.xyz/120
///
Future<POPResult> proofOfPayment({
  required String txid,
  required String nonce,
  required List<NodeWithAddress> nodes,
  required Uint8List seed,
  required UTXONetworkType networkType,
}) async {
  final isEc8 = networkType == EurocoinNetwork;
  final nonceBytes = nonce.hexToBytesWithPrefix;

  ///
  /// Fetch to be proven Tx
  ///
  final tbProvenTxSerialized = await fetchRawTxByHash(txid, networkType);
  final tbProvenTx = isEc8
      ? EC8RawTransaction.fromHex(tbProvenTxSerialized)
      : BTCRawTransaction.fromHex(tbProvenTxSerialized);

  ///
  /// Get Nodes for Inputs
  ///
  ///
  final listEquality = const ListEquality().equals;
  final usedNodes = [
    for (final input in tbProvenTx.inputs)
      () {
        final node = nodes.firstWhereOrNull(
          (node) => listEquality(
            node.publicKey.hexToBytes,
            input.publicKeyFromSig,
          ),
        );
        if (node == null) return null;
        return node;
      }.call()
  ].whereType<NodeWithAddress>().toList();

  assert(
    tbProvenTx.inputs.length == usedNodes.length,
    "Could not find the Nodes for the given transaction.",
  );

  ///
  /// Create Pop Output
  ///
  final pop_output_script = Uint8List(1 + 2 + 32 + nonceBytes.length + 1);
  var offset = 0;
  offset += pop_output_script.bytes.writeUint8(offset, OP_RETURN);
  offset += pop_output_script.bytes.writeUint16(offset, 0x01); // POP Version
  offset += pop_output_script.writeSlice(offset, txid.hexToBytes);
  offset += pop_output_script.writeVarSlice(offset, nonceBytes);

  final pop_output = BTCOutput(
    value: 0.toBI,
    scriptPubKey: pop_output_script,
  );

  ///
  /// Adjust Inputs (Set Sequence to 0x00000000)
  ///
  final pop_inputs = tbProvenTx.inputs.map((input) {
    return input.changeSequence(0x00000000);
  }).toList();

  ///
  /// Create UPoP
  ///
  final uPopTx = BTCRawTransaction(
    version: tbProvenTx.version,
    lockTime: 499999999,
    inputs: pop_inputs,
    outputs: [pop_output],
  );
  final uPoPSerialized = uPopTx.bytes;

  ///
  /// Create Pop Signature
  ///
  final uPoPHash = sha256Sha256Hash(uPoPSerialized);

  if (usedNodes.any((node) => node.walletPurpose == null)) {
    throw Exception("WalletPurpose is required for all nodes.");
  }

  final bip32Nodes = [
    for (final node in usedNodes)
      deriveChildNodeFromPath(
        seed: seed,
        networkType: networkType,
        childDerivationPath: node.derivationPath,
        walletPath: HDWalletPath.fromPurpose(
          node.walletPurpose!,
          networkType,
        ), // TODO: Store HDWalletPath better
      ),
  ];

  final signatures = [
    for (final node in bip32Nodes) (node.sign(uPoPHash) as Uint8List),
  ];

  return POPResult(uPoPHash, uPopTx, signatures);
}
