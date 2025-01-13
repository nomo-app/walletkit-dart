import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/payments/pk_script_converter.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const SEGWIT_FLAG = 0x01;
const SEGWIT_MARKER = 0x00;

sealed class RawTransaction {
  final int version;
  final List<Input> inputs;
  final List<Output> outputs;

  /// Mapping of UTXOs to generated inputs
  /// Non Null if returned from [buildUnsignedTransaction]
  final Map<ElectrumOutput, Input>? inputMap;

  BigInt get weight {
    return inputs.fold(
          0.toBI,
          (prev, input) => prev + input.weight,
        ) +
        outputs.fold(
          0.toBI,
          (prev, output) => prev + output.weight,
        );
  }

  Uint8List get bytes;

  String get asHex => bytes.toHex;

  int get size => bytes.length;

  BigInt get fee => totalInputValue - totalOutputValue;

  // Value of the first output
  BigInt get targetAmount => outputs.first.value;

  BigInt get totalInputValue {
    return inputs.fold(
      BigInt.zero,
      (prev, element) => prev + (element.value ?? BigInt.zero),
    );
  }

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
      copy.inputs[i] = copy.inputs[i].addScript(
        scriptSig: Uint8List.fromList([]),
      );
    }

    // set scriptSig for inputIndex to prevScriptPubKeyHex
    copy.inputs[index] = copy.inputs[index].addScript(
      scriptSig: prevScriptPubKey,
    );

    final bytes = copy is EC8RawTransaction ? copy.bytesForSigning : copy.bytes;

    final buffer = Uint8List(bytes.length + 4);
    var offset = 0;
    offset += buffer.writeSlice(0, bytes);
    offset += buffer.bytes.writeUint32(offset, hashType);

    final hash = sha256Sha256Hash(buffer);

    return hash;
  }

  const RawTransaction({
    required this.version,
    required this.inputs,
    required this.outputs,
    this.inputMap,
  });

  RawTransaction createCopy();

  RawTransaction _addInputs(List<Input>? inputs);

  static RawTransaction build({
    required int version,
    required List<Output> outputs,
    required Map<ElectrumOutput, Input> inputMap,
    int? lockTime,
    int? validFrom,
    int? validUntil,
  }) {
    final inputs = inputMap.values;
    final btcInputs = inputs.whereType<BTCInput>();
    final btcOutputs = outputs.whereType<BTCOutput>();

    if (btcInputs.isNotEmpty && btcOutputs.isNotEmpty && lockTime != null) {
      return BTCRawTransaction(
        version: version,
        inputs: btcInputs.toList(),
        outputs: btcOutputs.toList(),
        inputMap: inputMap,
        lockTime: lockTime,
      );
    }

    final ec8Inputs = inputs.whereType<EC8Input>();
    final ec8Outputs = outputs.whereType<EC8Output>();

    if (ec8Inputs.isNotEmpty &&
        ec8Outputs.isNotEmpty &&
        validFrom != null &&
        validUntil != null) {
      return EC8RawTransaction(
        version: version,
        inputs: ec8Inputs.toList(),
        outputs: ec8Outputs.toList(),
        inputMap: inputMap,
        validFrom: validFrom,
        validUntil: validUntil,
      );
    }

    throw UnimplementedError();
  }

  RawTransaction sign({
    required Uint8List seed,
    required HDWalletPath walletPath,
    required UTXONetworkType networkType,
  }) {
    assert(
      inputMap != null,
      'Cant sign transaction without inputs',
    );

    final signedInputs = signInputs(
      inputs: inputMap!,
      walletPath: walletPath,
      tx: this,
      networkType: networkType,
      seed: seed,
    );

    return _addInputs(signedInputs);
  }
}

///
/// Raw Transaction Implementation for Bitcoin
///
class BTCRawTransaction extends RawTransaction {
  final int lockTime;

  @override
  final List<BTCInput> inputs;

  @override
  final List<BTCOutput> outputs;

  const BTCRawTransaction({
    required super.version,
    required this.lockTime,
    required this.inputs,
    required this.outputs,
    super.inputMap,
  }) : super(
          inputs: inputs,
          outputs: outputs,
        );

  bool get hasWitness {
    return inputs.any((input) => input.hasWitness);
  }

  Iterable<BTCInput> get segwitInputs {
    return inputs.where((input) => input.hasWitness);
  }

  Iterable<BTCInput> get nonSegwitInputs {
    return inputs.where((input) => input.hasWitness == false);
  }

  BTCRawTransaction createCopy() {
    return BTCRawTransaction(
      version: version,
      lockTime: lockTime,
      inputs: inputs,
      outputs: outputs,
    );
  }

  BTCRawTransaction _addInputs(
    List<Input>? inputs,
  ) {
    final signedInputs = inputs?.whereType<BTCInput>().toList() ?? this.inputs;

    return BTCRawTransaction(
      version: version,
      lockTime: lockTime,
      inputs: signedInputs,
      outputs: outputs,
    );
  }

  factory BTCRawTransaction.fromHex(String hex) {
    final buffer = hex.hexToBytes;

    var offset = 0;

    /// Version
    final (version, length) = buffer.bytes.readUint32(offset);
    offset += length;

    /// Segwit Flag
    final isSegwit =
        buffer[offset] == SEGWIT_MARKER && buffer[offset + 1] == SEGWIT_FLAG;

    if (isSegwit) {
      offset += 2;
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
      List<(Uint8List, BTCInput)> wittnessScripts = [];

      for (final input in inputs) {
        final (emptyScript, emptyScriptLength) = buffer.bytes.readUint8(offset);
        if (emptyScript == 0x00) {
          offset += emptyScriptLength;
          continue;
        }

        final (wittnessScript, length) =
            readScriptWittness(buffer: buffer, offset: offset);
        wittnessScripts.add((wittnessScript, input));
        offset += length;
      }

      for (final (wittnessScript, input) in wittnessScripts) {
        final index = inputs.indexOf(input);
        inputs[index] = input.addScript(wittnessScript: wittnessScript);
      }
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

    if (hasWitness) {
      txByteLength += 1; // Segwit Flag
      txByteLength += 1; // Segwit Marker

      txByteLength += segwitInputs.fold(
        0,
        (prev, input) {
          assert(input.isSegwit);
          return prev + input.wittnessScript.length;
        },
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
    if (hasWitness) {
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
    if (hasWitness)
      for (final input in inputs) {
        if (input.isSegwit) {
          offset += buffer.writeSlice(offset, input.wittnessScript);
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

  final int validFrom;
  final int validUntil;

  const EC8RawTransaction({
    required super.version,
    required this.inputs,
    required this.outputs,
    required this.validFrom,
    required this.validUntil,
    super.inputMap,
  }) : super(
          inputs: inputs,
          outputs: outputs,
        );

  String get txid {
    final buffer = bytesForTxId;
    final hash = sha256Sha256Hash(buffer);
    return hash.rev.toHex;
  }

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
    offset += buffer.bytes.writeUint64(offset, fee.toInt());

    /// Weight
    offset += buffer.bytes.writeUint32(offset, weight.toInt());

    /// ValidFrom
    offset += buffer.bytes.writeUint64(offset, validFrom);

    /// ValidUntil
    offset += buffer.bytes.writeUint32(offset, validUntil);

    return buffer;
  }

  Uint8List get bytesForTxId {
    final inputBuffers = inputs.map((input) => input.bytesForTxId);
    const inputLengthByte = 1;
    final inputsByteLength = inputBuffers.fold(
      0,
      (prev, buffer) => prev + buffer.length,
    );

    final outputBuffers = outputs.map((output) => output.bytesForTxId);
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
      offset += buffer.writeSlice(offset, input.bytesForTxId);
    }

    /// Outputs
    offset += buffer.bytes.writeVarInt(offset, outputs.length);
    for (final output in outputs) {
      offset += buffer.writeSlice(offset, output.bytesForTxId);
    }

    /// Fee
    offset += buffer.bytes.writeUint64(offset, fee.toInt());

    /// Weight
    offset += buffer.bytes.writeUint32(offset, 0);

    /// ValidFrom
    offset += buffer.bytes.writeUint64(offset, validFrom);

    /// ValidUntil
    offset += buffer.bytes.writeUint32(offset, validUntil);

    return buffer;
  }

  ///
  /// Doesnt include weight
  ///
  Uint8List get bytesForSigning {
    /// Double SHA256 Hash of all inputs
    final inputBuffers = inputs.map(
      (input) => input.bytesForSigning(
        withWeight: true,
        withScript: false,
      ),
    );
    final combinedInputBuffers = inputBuffers.fold(
      Uint8List(0),
      (prev, buffer) => Uint8List.fromList(prev + buffer),
    );
    final hashInputs = sha256Sha256Hash(combinedInputBuffers);

    /// Double SHA256 Hash of all outputs
    final outputBuffers = outputs.map((output) => output.bytes);
    final combinedOutputBuffers = outputBuffers.fold(
      Uint8List(0),
      (prev, buffer) => Uint8List.fromList(prev + buffer),
    );
    final hashOutputs = sha256Sha256Hash(combinedOutputBuffers);

    ///
    /// Input to be signed
    ///

    /// Input to be signed has a scriptSig all other inputs have empty scriptSigs
    final input = inputs.singleWhereOrNull(
      (input) => input.scriptSig.length != 0,
    );
    if (input == null) {
      throw Exception('No input to be signed');
    }

    final inputBytes = input.bytesForSigning(
      withWeight: false,
      withScript: true,
    );

    ///
    /// Construct Buffer
    ///
    final txByteLength = 4 +
        hashInputs.length +
        hashOutputs.length +
        inputBytes.length +
        8 +
        8 +
        4;
    final buffer = Uint8List(txByteLength);
    var offset = 0;

    /// Version
    offset += buffer.bytes.writeUint32(offset, version);

    /// HashInputs
    offset += buffer.writeSlice(offset, hashInputs);

    /// Input to be signed
    offset += buffer.writeSlice(
      offset,
      inputBytes,
    );

    /// HashOutputs
    offset += buffer.writeSlice(offset, hashOutputs);

    /// Fee
    offset += buffer.bytes.writeUint64(offset, fee.toInt());

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
      validFrom: validFrom,
      validUntil: validUntil,
    );
  }

  EC8RawTransaction _addInputs(
    List<Input>? inputs,
  ) {
    final signedInputs = inputs?.whereType<EC8Input>().toList() ?? this.inputs;

    return EC8RawTransaction(
      version: version,
      inputs: signedInputs,
      outputs: outputs,
      validFrom: validFrom,
      validUntil: validUntil,
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
      offset += input.size;
      inputs.add(input);
    }

    /// Outputs
    final (outputLength, outputLengthByteLength) =
        buffer.bytes.readVarInt(offset);
    offset += outputLengthByteLength;

    final outputs = <EC8Output>[];

    for (int i = 0; i < outputLength; i++) {
      final output = EC8Output.fromBuffer(buffer.sublist(offset));
      offset += output.size;
      outputs.add(output);
    }

    /// Fee (is ignored since it is calculated from inputs and outputs)
    final (_, feeOffset) = buffer.bytes.readUint64(offset);
    offset += feeOffset;

    /// Weight (is ignored since it is calculated)
    final (_, weightOffset) = buffer.bytes.readUint32(offset);
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
      validFrom: validFrom,
      validUntil: validUntil,
    );
  }
}
