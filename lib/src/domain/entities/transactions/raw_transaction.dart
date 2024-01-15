import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/pk_script_converter.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/input.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/output.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/utxo_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const SEGWIT_FLAG = 0x01;
const SEGWIT_MARKER = 0x00;

class RawTransaction {
  final int version;
  final int lockTime;

  final List<Input> inputs;
  final List<Output> outputs;

  /// Mapping of UTXOs to generated inputs
  /// Non Null if returned from [buildUnsignedTransaction]
  final Map<ElectrumOutput, Input>? inputMap;

  const RawTransaction({
    required this.version,
    required this.lockTime,
    required this.inputs,
    required this.outputs,
  }) : inputMap = null;

  RawTransaction.fromInputMap({
    required Map<ElectrumOutput, Input> inputMap,
    required this.version,
    required this.lockTime,
    required this.outputs,
  })  : inputMap = inputMap,
        inputs = inputMap.values.toList();

  bool get isSegwit {
    return inputs.any((input) => input.scriptWitness != null);
  }

  Iterable<Input> get segwitInputs {
    return inputs.where((input) => input.scriptWitness != null);
  }

  Iterable<Input> get nonSegwitInputs {
    return inputs.where((input) => input.scriptWitness == null);
  }

  String get txid {
    final buffer = bytes;
    final hash = sha256Sha256Hash(buffer);
    return hash.rev.toHex;
  }

  RawTransaction copyWith({
    int? version,
    int? lockTime,
    List<Input>? inputs,
    List<Output>? outputs,
  }) {
    return RawTransaction(
      version: version ?? this.version,
      lockTime: lockTime ?? this.lockTime,
      inputs: inputs ?? this.inputs,
      outputs: outputs ?? this.outputs,
    );
  }

  factory RawTransaction.fromHex(String hex) {
    final buffer = hex.hexToBytes;

    var offset = 0;

    /// Version
    final (version, length) = buffer.bytes.readUint32(offset);
    offset += length;

    /// Segwit Flag
    final isSegwit = buffer[offset] == SEGWIT_MARKER;
    if (isSegwit) {
      offset += 2;
      throw UnimplementedError();
    }

    /// Inputs
    final (inputLength, inputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += inputLengthByteLength;

    final inputs = <Input>[];
    for (int i = 0; i < inputLength; i++) {
      final input = Input.fromBuffer(buffer.sublist(offset));
      offset += input.size;
      inputs.add(input);
    }

    /// Outputs
    final (outputLength, outputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += outputLengthByteLength;

    final outputs = <Output>[];

    for (int i = 0; i < outputLength; i++) {
      final output = Output.fromBuffer(buffer.sublist(offset));
      offset += output.size;
      outputs.add(output);
    }

    /// Witness
    if (isSegwit) {
      throw UnimplementedError();
    }

    /// Locktime
    final (lockTime, _) = buffer.bytes.readUint32(offset);

    return RawTransaction(
      version: version,
      lockTime: lockTime,
      inputs: inputs,
      outputs: outputs,
    );
  }

  Uint8List get bytes {
    final inputBuffers = inputs.map((input) => input.bytes);
    const inputLengthByte = 1;
    final inputsByteLength = inputBuffers.fold(
      0,
      (prev, buffer) => prev + buffer.length,
    );

    final outputBuffers = outputs.map((output) => output.bytes);
    const outputLengthByte = 1;
    final outputsByteLength = outputBuffers.fold(
      0,
      (prev, buffer) => prev + buffer.length,
    );

    var txByteLength = 4 +
        inputLengthByte +
        inputsByteLength +
        outputLengthByte +
        outputsByteLength +
        4;

    if (isSegwit) {
      txByteLength += 1; // Segwit Flag
      txByteLength += 1; // Segwit Marker
      txByteLength += segwitInputs.fold(
        0,
        (prev, input) => prev + input.scriptWitness!.length,
      );
      txByteLength += nonSegwitInputs.length; // Empty Script
    }

    ///
    /// Construct Buffer
    ///
    final buffer = Uint8List(txByteLength);
    var offset = 0;

    /// Version
    offset += buffer.bytes.writeUint32(offset, version);

    /// Segwit Flag
    if (isSegwit) {
      offset += buffer.bytes.writeUint8(offset, SEGWIT_MARKER);
      offset += buffer.bytes.writeUint8(offset, SEGWIT_FLAG);
    }

    /// Inputs
    offset += buffer.bytes.writeVarInt(offset, inputs.length);
    for (final input in inputs) {
      offset += buffer.writeSlice(offset, input.bytes);
    }

    /// Outputs
    offset += buffer.bytes.writeVarInt(offset, outputs.length);
    for (final output in outputs) {
      offset += buffer.writeSlice(offset, output.bytes);
    }

    /// Witness
    if (isSegwit)
      for (final input in inputs) {
        if (input.isSegwit) {
          offset += buffer.writeSlice(offset, input.scriptWitness!);
          continue;
        }

        offset += buffer.bytes.writeUint8(offset, 0x00); // Empty Script
      }

    /// Locktime
    offset += buffer.bytes.writeUint32(offset, lockTime);

    return buffer;
  }

  Uint8List legacySigHash({
    required int index,
    required Uint8List prevScriptPubKey,
    required int hashType,
  }) {
    final copy = copyWith();

    // clear all scriptSigs
    for (int i = 0; i < copy.inputs.length; i++) {
      copy.inputs[i] =
          copy.inputs[i].copyWith(scriptSig: Uint8List.fromList([]));
    }

    // set scriptSig for inputIndex to prevScriptPubKeyHex
    copy.inputs[index] =
        copy.inputs[index].copyWith(scriptSig: prevScriptPubKey);

    final buffer = Uint8List(copy.bytes.length + 4);
    var offset = 0;
    offset += buffer.writeSlice(0, copy.bytes);
    offset += buffer.bytes.writeUint32(offset, hashType);

    final bufHex = hex.encode(buffer);
    print("Buffer: $bufHex");

    final hash = sha256Sha256Hash(buffer);

    return hash;
  }

  ///
  /// BIP143 SigHash: https://github.com/bitcoin/bips/blob/master/bip-0143.mediawiki
  ///
  Uint8List bip143sigHash({
    required int index,
    required Uint8List prevScriptPubKey,
    required ElectrumOutput output,
    required int hashType,
  }) {
    ///
    /// Always use P2PKH in bip143 sigHash
    ///
    final converter = PublicKeyScriptConverter(prevScriptPubKey);
    final p2pkhScript = converter.p2pkhScript;

    final outputBuffers = outputs.map((output) => output.bytes);
    final txOutSize = outputBuffers.fold(
      0,
      (prev, element) => prev + element.length,
    );

    ///
    /// Inputs
    ///
    var tBuffer = Uint8List(36 * inputs.length);
    var tOffset = 0;
    for (final input in inputs) {
      tOffset += tBuffer.writeSlice(tOffset, input.txid);
      tOffset += tBuffer.bytes.writeUint32(tOffset, input.vout);
    }

    final hashPrevouts = sha256Sha256Hash(tBuffer);

    tBuffer = Uint8List(4 * inputs.length);
    tOffset = 0;
    for (final input in inputs) {
      tOffset += tBuffer.bytes.writeUint32(tOffset, input.sequence);
    }
    final hashSequence = sha256Sha256Hash(tBuffer);

    /// Outputs

    tBuffer = Uint8List(txOutSize);
    tOffset = 0;

    for (final output in outputs) {
      tOffset += tBuffer.bytes.writeUint64(tOffset, output.value.toInt());
      tOffset += tBuffer.writeVarSlice(tOffset, output.scriptPubKey);
    }
    final hashOutputs = sha256Sha256Hash(tBuffer);

    /// Final Buffer
    final inputToSign = inputs[index];
    final prevScriptPubKeyLength = varSliceSize(p2pkhScript);
    tBuffer = Uint8List(156 + prevScriptPubKeyLength);
    tOffset = 0;

    tOffset += tBuffer.bytes.writeUint32(tOffset, version);
    tOffset += tBuffer.writeSlice(tOffset, hashPrevouts);
    tOffset += tBuffer.writeSlice(tOffset, hashSequence);

    tOffset += tBuffer.writeSlice(tOffset, inputToSign.txid);
    tOffset += tBuffer.bytes.writeUint32(tOffset, inputToSign.vout);

    tOffset += tBuffer.writeVarSlice(tOffset, p2pkhScript);

    tOffset += tBuffer.bytes.writeUint64(tOffset, output.value.toInt());
    tOffset += tBuffer.bytes.writeUint32(tOffset, inputToSign.sequence);

    tOffset += tBuffer.writeSlice(tOffset, hashOutputs);

    tOffset += tBuffer.bytes.writeUint32(tOffset, lockTime);
    tOffset += tBuffer.bytes.writeUint32(tOffset, hashType);

    final hash = sha256Sha256Hash(tBuffer);

    return hash;
  }

  String get asHex {
    return hex.encode(bytes);
  }

  int get size => bytes.length;

  BigInt get totalOutputValue {
    return outputs.fold(
      BigInt.zero,
      (prev, element) => prev + element.value,
    );
  }
}

int varSliceSize(Uint8List slice) {
  return encodingLength(slice.length) + slice.length;
}

int encodingLength(int number) {
  // if (!isUint(number, 53)) throw ArgumentError("Expected UInt53");
  return (number < 0xfd
      ? 1
      : number <= 0xffff
          ? 3
          : number <= 0xffffffff
              ? 5
              : 9);
}
