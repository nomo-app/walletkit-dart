import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const output_index_length = 4;
const sequence_length = 4;

abstract class Input {
  final Uint8List txid;
  final int vout;
  final Uint8List? _scriptSig;

  const Input({
    required this.txid,
    required this.vout,
    required Uint8List? scriptSig,
  }) : _scriptSig = scriptSig;

  String? get scriptSigHex =>
      _scriptSig != null ? hex.encode(_scriptSig!) : null;

  String get txIdString => hex.encode(txid);

  Uint8List get scriptSig => _scriptSig ?? Uint8List(0);

  Uint8List get bytes;

  int get size => bytes.length;

  String get toHex => hex.encode(bytes);

  Input copyWith({
    Uint8List? scriptSig,
  });
}

class BTCInput extends Input {
  final int sequence;

  /// Only used for segwit
  final Uint8List? scriptWitness;

  const BTCInput({
    required super.txid,
    required super.vout,
    super.scriptSig,
    this.sequence = 0xffffffff,
    this.scriptWitness,
  });

  bool get isSegwit => scriptWitness != null;

  factory BTCInput.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Previous Transaction Hash
    final (txid, off1) = buffer.readSlice(offset, 32);
    offset += off1;

    /// Previous Transaction Index
    final (vout, off2) = buffer.bytes.readUint32(offset);
    offset += off2;

    /// ScriptSig
    final (scriptSig, off3) = buffer.readVarSlice(offset);
    offset += off3;

    /// Sequence
    final (sequence, off4) = buffer.bytes.readUint32(offset);
    offset += off4;

    return BTCInput(
      txid: txid,
      vout: vout,
      sequence: sequence,
      scriptSig: scriptSig,
    );
  }

  BTCInput copyWith({
    Uint8List? scriptSig,
    Uint8List? scriptWitness,
  }) {
    return BTCInput(
      txid: txid,
      vout: vout,
      sequence: sequence,
      scriptSig: scriptSig ?? _scriptSig,
      scriptWitness: scriptWitness ?? this.scriptWitness,
    );
  }

  Uint8List get bytes {
    final buffer = Uint8List(
      txid.length +
          output_index_length +
          scriptSig.length +
          1 +
          sequence_length,
    );

    var offset = 0;
    // Write TXID
    offset += buffer.writeSlice(offset, txid); // Or TXID ?

    // Write Vout
    offset += buffer.bytes.writeUint32(offset, vout);

    // Write ScriptSig
    offset += buffer.writeVarSlice(offset, scriptSig);

    // Write Sequence
    offset += buffer.bytes.writeUint32(offset, sequence);

    return buffer;
  }
}

const value_length = 8;
const weight_length = 4;

class EC8Input extends Input {
  final int weight;
  final BigInt value;

  const EC8Input({
    required super.txid,
    required super.vout,
    super.scriptSig,
    required this.weight,
    required this.value,
  });

  int get intValue => value.toInt();

  EC8Input copyWith({
    Uint8List? scriptSig,
  }) {
    return EC8Input(
      scriptSig: scriptSig ?? _scriptSig,
      txid: txid,
      vout: vout,
      weight: weight,
      value: value,
    );
  }

  Uint8List get bytes {
    final buffer = Uint8List(
      txid.length +
          output_index_length +
          value_length +
          weight_length +
          scriptSig.length +
          1,
    );

    var offset = 0;
    // Write TXID
    offset += buffer.writeSlice(offset, txid); // Or TXID ?

    // Write Vout
    offset += buffer.bytes.writeUint32(offset, vout);

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    offset += buffer.bytes.writeUint32(offset, weight);

    // Write ScriptSig
    offset += buffer.writeVarSlice(offset, scriptSig);

    return buffer;
  }

  factory EC8Input.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Previous Transaction Hash
    final (txid, off1) = buffer.readSlice(offset, 32);
    offset += off1;

    /// Previous Transaction Index
    final (vout, off2) = buffer.bytes.readUint32(offset);
    offset += off2;

    /// Value
    final (value, off3) = buffer.bytes.readUint64(offset);
    offset += off3;

    /// Weight
    final (weight, off4) = buffer.bytes.readUint32(offset);
    offset += off4;

    /// ScriptSig
    final (scriptSig, off5) = buffer.readVarSlice(offset);
    offset += off5;

    return EC8Input(
      txid: txid,
      vout: vout,
      scriptSig: scriptSig,
      value: BigInt.from(value),
      weight: weight,
    );
  }
}
