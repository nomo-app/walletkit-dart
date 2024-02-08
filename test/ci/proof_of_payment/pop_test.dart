@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/op_codes.dart';
import 'package:walletkit_dart/src/crypto/utxo/proof_of_payment.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../utils.dart';

/// Validation
/// 1: Check Format of POP

/// 2: Check that locktime is 499999999
/// 3: Check that the tx has only one output and its value is 0
/// 4: Check that the POP inputs are the same as the RawTx inputs except the sequence
/// 6: Run the Scripts of the inputs and check that they are valid
/// 7: Check that the TxID (in output) of the POP is the same as the TxID of the RawTx

void main() {
  test('Bitcoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
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

      expect(input.txid.toHex, compareInput.txid);
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

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
    );
    final selectedTx = txList.first;

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: EurocoinNetwork,
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

      expect(input.txid.toHex, compareInput.txid);
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
