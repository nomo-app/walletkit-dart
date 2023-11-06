import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const output_index_length = 4;
const sequence_length = 4;

class Input {
  final Uint8List txid;
  final int vout;
  final int sequence;

  final Uint8List? _scriptSig;

  /// Only used for segwit
  final Uint8List? scriptWitness;

  const Input({
    required this.txid,
    required this.vout,
    this.sequence = 0xffffffff,
    Uint8List? scriptSig,
    this.scriptWitness,
  }) : _scriptSig = scriptSig;

  String? get scriptSigHex =>
      _scriptSig != null ? hex.encode(_scriptSig!) : null;

  String get txIdString => hex.encode(txid);

  Uint8List get scriptSig => _scriptSig ?? Uint8List(0);

  bool get isSegwit => scriptWitness != null;

  factory Input.fromBuffer(Uint8List buffer) {
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

    return Input(
      txid: txid,
      vout: vout,
      sequence: sequence,
      scriptSig: scriptSig,
    );
  }

  Input copyWith({
    Uint8List? scriptSig,
    Uint8List? scriptWitness,
  }) {
    return Input(
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

  int get size => bytes.length;

  String toHex() {
    return hex.encode(bytes);
  }
}
