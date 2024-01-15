import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/utxo/payments/pk_script_converter.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/output.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/utxo_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const SEGWIT_FLAG = 0x01;
const SEGWIT_MARKER = 0x00;

abstract class RawTransaction {
  final int version;
  final List<Input> inputs;
  final List<Output> outputs;

  Uint8List get bytes;

  String get asHex => bytes.toHex;

  int get size => bytes.length;

  BigInt get totalOutputValue {
    return outputs.fold(
      BigInt.zero,
      (prev, element) => prev + element.value,
    );
  }

  String get txid {
    final buffer = bytes;
    final hash = sha256Sha256Hash(buffer);
    return hash.rev.toHex;
  }

  Uint8List legacySigHash({
    required int index,
    required Uint8List prevScriptPubKey,
    required int hashType,
  }) {
    final copy = createCopy();

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

    final hash = sha256Sha256Hash(buffer);

    return hash;
  }

  const RawTransaction({
    required this.version,
    required this.inputs,
    required this.outputs,
  });

  RawTransaction createCopy();

  RawTransaction copyWith({
    int? version,
    List<Input>? inputs,
    List<Output>? outputs,
  });

  static RawTransaction build({
    required int version,
    required List<Input> inputs,
    required List<Output> outputs,
    int? lockTime,
    int? validFrom,
    int? validUntil,
    int? fee,
  }) {
    final btcInputs = inputs.whereType<BTCInput>();
    final btcOutputs = outputs.whereType<BTCOutput>();

    if (btcInputs.isNotEmpty && btcOutputs.isNotEmpty && lockTime != null) {
      return BTCRawTransaction(
        version: version,
        inputs: btcInputs.toList(),
        outputs: btcOutputs.toList(),
        lockTime: lockTime,
      );
    }

    final ec8Inputs = inputs.whereType<EC8Input>();
    final ec8Outputs = outputs.whereType<EC8Output>();

    if (ec8Inputs.isNotEmpty && ec8Outputs.isNotEmpty && fee != null) {
      return EC8RawTransaction(
        version: version,
        inputs: ec8Inputs.toList(),
        outputs: ec8Outputs.toList(),
        fee: fee,
        weight: 0, // TODO: Calculate Weight
        validFrom: validFrom ?? 0,
        validUntil: validUntil ?? 0,
      );
    }

    throw UnimplementedError();
  }
}

///
/// Raw Transaction Implementation for Bitcoin
///
class BTCRawTransaction extends RawTransaction {
  final int lockTime;
  final List<BTCInput> inputs;
  final List<BTCOutput> outputs;

  const BTCRawTransaction({
    required super.version,
    required this.lockTime,
    required this.inputs,
    required this.outputs,
  }) : super(
          inputs: inputs,
          outputs: outputs,
        );

  bool get isSegwit {
    return inputs.any((input) => input.scriptWitness != null);
  }

  Iterable<BTCInput> get segwitInputs {
    return inputs.where((input) => input.scriptWitness != null);
  }

  Iterable<BTCInput> get nonSegwitInputs {
    return inputs.where((input) => input.scriptWitness == null);
  }

  BTCRawTransaction createCopy() {
    return BTCRawTransaction(
      version: version,
      lockTime: lockTime,
      inputs: inputs,
      outputs: outputs,
    );
  }

  BTCRawTransaction copyWith({
    int? version,
    int? lockTime,
    List<Input>? inputs,
    List<Output>? outputs,
  }) {
    return BTCRawTransaction(
      version: version ?? this.version,
      lockTime: lockTime ?? this.lockTime,
      inputs: inputs?.whereType<BTCInput>().toList() ?? this.inputs,
      outputs: outputs?.whereType<BTCOutput>().toList() ?? this.outputs,
    );
  }

  factory BTCRawTransaction.fromHex(String hex) {
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

    final inputs = <BTCInput>[];
    for (int i = 0; i < inputLength; i++) {
      final input = BTCInput.fromBuffer(buffer.sublist(offset));
      offset += input.size;
      inputs.add(input);
    }

    /// Outputs
    final (outputLength, outputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += outputLengthByteLength;

    final outputs = <BTCOutput>[];

    for (int i = 0; i < outputLength; i++) {
      final output = BTCOutput.fromBuffer(buffer.sublist(offset));
      offset += output.size;
      outputs.add(output);
    }

    /// Witness
    if (isSegwit) {
      throw UnimplementedError();
    }

    /// Locktime
    final (lockTime, _) = buffer.bytes.readUint32(offset);

    return BTCRawTransaction(
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
}

///
/// Raw Transaction Implementation for EC8
///
class EC8RawTransaction extends RawTransaction {
  final List<EC8Input> inputs;
  final List<EC8Output> outputs;

  final int fee;
  final int weight;
  final int validFrom;
  final int validUntil;

  const EC8RawTransaction({
    required super.version,
    required this.inputs,
    required this.outputs,
    required this.fee,
    required this.weight,
    required this.validFrom,
    required this.validUntil,
  }) : super(
          inputs: inputs,
          outputs: outputs,
        );

  @override
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
        8 +
        4 +
        8 +
        4;

    ///
    /// Construct Buffer
    ///
    final buffer = Uint8List(txByteLength);
    var offset = 0;

    /// Version
    offset += buffer.bytes.writeUint32(offset, version);

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

    /// Fee
    offset += buffer.bytes.writeUint64(offset, fee);

    /// Weight
    offset += buffer.bytes.writeUint32(offset, weight);

    /// ValidFrom
    offset += buffer.bytes.writeUint64(offset, validFrom);

    /// ValidUntil
    offset += buffer.bytes.writeUint32(offset, validUntil);

    return buffer;
  }

  EC8RawTransaction createCopy() {
    return EC8RawTransaction(
      version: version,
      inputs: inputs,
      outputs: outputs,
      fee: fee,
      weight: weight,
      validFrom: validFrom,
      validUntil: validUntil,
    );
  }

  EC8RawTransaction copyWith({
    int? version,
    List<Input>? inputs,
    List<Output>? outputs,
    int? fee,
    int? weight,
    int? validFrom,
    int? validUntil,
  }) {
    return EC8RawTransaction(
      version: version ?? this.version,
      inputs: inputs?.whereType<EC8Input>().toList() ?? this.inputs,
      outputs: outputs?.whereType<EC8Output>().toList() ?? this.outputs,
      fee: fee ?? this.fee,
      weight: weight ?? this.weight,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
    );
  }

  factory EC8RawTransaction.fromHex(String hex) {
    final buffer = hex.hexToBytes;

    var offset = 0;

    /// Version
    final (version, length) = buffer.bytes.readUint32(offset);
    offset += length;

    /// Inputs
    final (inputLength, inputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += inputLengthByteLength;

    final inputs = <EC8Input>[];
    for (int i = 0; i < inputLength; i++) {
      final input = EC8Input.fromBuffer(buffer.sublist(offset));
      offset += input.size + 8;
      inputs.add(input);
    }

    /// Outputs
    final (outputLength, outputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += outputLengthByteLength;

    final outputs = <EC8Output>[];

    for (int i = 0; i < outputLength; i++) {
      final output = EC8Output.fromBuffer(buffer.sublist(offset));
      offset += output.size + 4;
      outputs.add(output);
    }

    /// Fee
    final (fee, feeOffset) = buffer.bytes.readUint64(offset);
    offset += feeOffset;

    /// Weight
    final (weight, weightOffset) = buffer.bytes.readUint32(offset);
    offset += weightOffset;

    /// ValidFrom
    final (validFrom, validFromOffset) = buffer.bytes.readUint64(offset);
    offset += validFromOffset;

    /// ValidUntil
    final (validUntil, validUntilOffset) = buffer.bytes.readUint32(offset);
    offset += validUntilOffset;

    return EC8RawTransaction(
      version: version,
      inputs: inputs,
      outputs: outputs,
      fee: fee,
      weight: weight,
      validFrom: validFrom,
      validUntil: validUntil,
    );
  }
}
