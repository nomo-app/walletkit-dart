@Timeout(Duration(minutes: 5))

import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/op_codes.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../utils.dart';

///
/// We do everything outlined in BIP120 except running the Input Scripts
/// TODO: Implement Running of Scripts since we can only parse Scripts for now
///

void main() {
  test('Bitcoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: devSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );
    final selectedTx = txList.first;

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: BitcoinNetwork,
    );

    /// Verify uPoPTx Structure

    expect(popResult.upopTx.lockTime, 499999999);
    expect(popResult.upopTx.outputs.length, 1);

    final output = popResult.upopTx.outputs.first;

    expect(output.value, BigInt.zero);

    final outputScript = output.scriptPubKey;
    var offset = 0;
    final (op, off1) = outputScript.bytes.readUint8(offset);
    offset += off1;
    final (version, off2) = outputScript.bytes.readUint16(offset);
    offset += off2;
    final (txid, off3) = outputScript.readSlice(offset, 32);
    offset += off3;
    final (nonceBytes, _) = outputScript.readVarSlice(offset);

    expect(op, OP_RETURN);
    expect(version, 1);
    expect(txid, selectedTx.hash.hexToBytes);
    expect(nonceBytes, rejectEVM.hexToBytesWithPrefix);

    for (var i = 0; i < popResult.upopTx.inputs.length; i++) {
      final input = popResult.upopTx.inputs[i];
      expect(input.sequence, 0x00000000);

      final compareInput = selectedTx.inputs[i];

      expect(input.txid.rev.toHex, compareInput.txid);
      expect(input.scriptSig, compareInput.scriptSig?.hexToBytes);
      expect(input.vout, compareInput.vout);
    }

    /// Verify Signatures

    var publicKey = selectedTx.inputs.first.publicKey;
    var result = popResult.verifiyPop(0, publicKey!);
    expect(result, true);

    publicKey = selectedTx.inputs[1].publicKey;
    result = popResult.verifiyPop(1, publicKey!);
    expect(result, true);

    publicKey = selectedTx.inputs[2].publicKey;
    result = popResult.verifiyPop(2, publicKey!);
    expect(result, true);
  });

  test('Eurcoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    const toBeProvenHash =
        "3574231d1a64760f6e42bd469bef95aa0b2c8ea6c38e043a443c3f0196cecd39";

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: devSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      minEndpoints: 1,
    );
    final selectedTx = txList.singleWhereOrNull(
      (element) => element.hash == toBeProvenHash,
    );

    if (selectedTx == null) {
      throw Exception("Could not find a transaction with the hash");
    }

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: EurocoinNetwork,
    );

    expect(popResult.pops, isNotEmpty);

    /// Verify uPoPTx Structure

    expect(popResult.upopTx.lockTime, 499999999);
    expect(popResult.upopTx.outputs.length, 1);

    final output = popResult.upopTx.outputs.first;

    expect(output.value, BigInt.zero);

    final outputScript = output.scriptPubKey;
    var offset = 0;
    final (op, off1) = outputScript.bytes.readUint8(offset);
    offset += off1;
    final (version, off2) = outputScript.bytes.readUint16(offset);
    offset += off2;
    final (txid, off3) = outputScript.readSlice(offset, 32);
    offset += off3;
    final (nonceBytes, _) = outputScript.readVarSlice(offset);

    expect(op, OP_RETURN);
    expect(version, 1);
    expect(txid, selectedTx.hash.hexToBytes);
    expect(nonceBytes, rejectEVM.hexToBytesWithPrefix);

    for (var i = 0; i < popResult.upopTx.inputs.length; i++) {
      final input = popResult.upopTx.inputs[i];
      expect(input.sequence, 0x00000000);

      final compareInput = selectedTx.inputs[i];

      expect(input.txid.rev.toHex, compareInput.txid);
      expect(input.scriptSig, compareInput.scriptSig?.hexToBytes);
      expect(input.vout, compareInput.vout);
    }

    /// Verifiy Signature
    final publicKey = selectedTx.inputs.first.publicKey;

    expect(publicKey, isNotNull);

    var result = popResult.verifiyPop(0, publicKey!);

    expect(result, true);
  });

  test('Zeniq Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    const toBeProvenHash =
        "859bce577c74fb7057e82e84d14d29f57b5540061d7baa06ef1831a75761d5df";

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: ZeniqNetwork,
      seed: devSeed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      minEndpoints: 1,
    );
    final selectedTx = txList.singleWhereOrNull(
      (element) => element.hash == toBeProvenHash,
    );

    if (selectedTx == null) {
      throw Exception("Could not find a transaction with the hash");
    }

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: ZeniqNetwork,
    );

    expect(popResult.pops, isNotEmpty);

    /// Verify uPoPTx Structure

    expect(popResult.upopTx.lockTime, 499999999);
    expect(popResult.upopTx.outputs.length, 1);

    final output = popResult.upopTx.outputs.first;

    expect(output.value, BigInt.zero);

    final outputScript = output.scriptPubKey;
    var offset = 0;
    final (op, off1) = outputScript.bytes.readUint8(offset);
    offset += off1;
    final (version, off2) = outputScript.bytes.readUint16(offset);
    offset += off2;
    final (txid, off3) = outputScript.readSlice(offset, 32);
    offset += off3;
    final (nonceBytes, _) = outputScript.readVarSlice(offset);

    expect(op, OP_RETURN);
    expect(version, 1);
    expect(txid, selectedTx.hash.hexToBytes);
    expect(nonceBytes, rejectEVM.hexToBytesWithPrefix);

    for (var i = 0; i < popResult.upopTx.inputs.length; i++) {
      final input = popResult.upopTx.inputs[i];
      expect(input.sequence, 0x00000000);

      final compareInput = selectedTx.inputs[i];

      expect(input.txid.rev.toHex, compareInput.txid);
      expect(input.scriptSig, compareInput.scriptSig?.hexToBytes);
      expect(input.vout, compareInput.vout);
    }

    /// Verifiy Signature
    final publicKey = selectedTx.inputs.first.publicKey;

    expect(publicKey, isNotNull);

    var result = popResult.verifiyPop(0, publicKey!);

    expect(result, true);
  });
}
