import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/script.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/op_codes.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const output_index_length = 4;
const sequence_length = 4;

sealed class Input {
  final Uint8List txid;
  final int vout;
  final Uint8List? _scriptSig;
  final Uint8List? _wittnessScript;
  final BigInt? value;
  final Uint8List? _prevScriptPubKey;

  const Input({
    required this.txid,
    required this.vout,
    this.value,
    Uint8List? prevScriptPubKey,
    Uint8List? scriptSig,
    Uint8List? wittnessScript,
  })  : _scriptSig = scriptSig,
        _prevScriptPubKey = prevScriptPubKey,
        _wittnessScript = wittnessScript;

  BigInt get weight {
    if (_scriptSig == null || _prevScriptPubKey == null) return -1.toBI;
    return calculateWeight(_prevScriptPubKey, _scriptSig);
  }

  int get intValue => value != null ? value!.toInt() : 0;

  String? get scriptSigHex => _scriptSig != null ? _scriptSig.toHex : null;

  String get txIdString => hex.encode(txid);

  Uint8List get scriptSig => _scriptSig ?? Uint8List(0);

  Uint8List get wittnessScript => _wittnessScript ?? Uint8List(0);

  Uint8List get bytes;

  int get size => bytes.length;

  String get toHex => hex.encode(bytes);

  Uint8List get previousScriptPubKey => _prevScriptPubKey ?? Uint8List(0);

  bool get isP2SH =>
      previousScriptPubKey.length == 23 &&
      previousScriptPubKey[0] == OP_HASH160 &&
      previousScriptPubKey[1] == 0x14 &&
      previousScriptPubKey[22] == OP_EQUAL;

  bool get isP2PKH =>
      previousScriptPubKey.length == 25 &&
      previousScriptPubKey[0] == OP_DUP &&
      previousScriptPubKey[1] == OP_HASH160 &&
      previousScriptPubKey[2] == 0x14 &&
      previousScriptPubKey[23] == OP_EQUALVERIFY &&
      previousScriptPubKey[24] == OP_CHECKSIG;

  bool get isP2WPKH =>
      previousScriptPubKey.length == 22 &&
      previousScriptPubKey[0] == 0x00 &&
      previousScriptPubKey[1] == 0x14;

  bool get isP2WSH =>
      previousScriptPubKey.length == 34 &&
      previousScriptPubKey[0] == 0x00 &&
      previousScriptPubKey[1] == 0x20;

  bool get isP2PK =>
      previousScriptPubKey.length == 35 && previousScriptPubKey[0] == 0x21;

  bool get isSegwit => isP2WPKH || isP2WSH || hasWitness;

  bool get hasWitness => _wittnessScript != null;

  Uint8List get publicKeyFromSig {
    /// From ScriptSig (P2PKH, P2PK)
    if (_scriptSig != null && _scriptSig.isNotEmpty) {
      final script = Script(_scriptSig);

      final publicKey = script.chunks[1].data;
      if (publicKey == null) {
        throw Exception("Invalid Public Key");
      }
      if (publicKey.length != 33) {
        throw Exception("Invalid Public Key");
      }
      return publicKey;
    }

    /// From Witness
    if (_wittnessScript != null && _wittnessScript.isNotEmpty) {
      final chunks = decodeScriptWittness(wittnessScript: _wittnessScript);
      if (chunks.length != 2) {
        throw Exception("Invalid Witness");
      }
      final publicKey = chunks[1];
      if (publicKey.length != 33) {
        throw Exception("Invalid Public Key");
      }
      return publicKey;
    }

    throw Exception("No ScriptSig or Witness found");
  }

  Input addScript({Uint8List? scriptSig, Uint8List? wittnessScript});

  BigInt calculateWeight(
    Uint8List prevScriptPubKey,
    Uint8List? scriptSig,
  ) {
    if (scriptSig == null || prevScriptPubKey.isEmpty) {
      return 0.toBI;
    }

    BigInt w = 1.toBI + getScriptWeight(prevScriptPubKey);

    if (!isP2SH) return w;

    final script = Script(scriptSig);

    Uint8List? buffer = Uint8List(0);

    for (final chunk in script.chunks) {
      if (buffer != null) {
        buffer = chunk.data;
      }
      if (chunk.opcode > OP_16) {
        return weight;
      }
    }

    if (buffer != null && buffer.isNotEmpty) {
      w += getScriptWeight(buffer);
    }

    return w;
  }

  BTCInput changeSequence(int sequence) {
    return BTCInput(
      txid: txid,
      vout: vout,
      value: value,
      scriptSig: _scriptSig,
      prevScriptPubKey: _prevScriptPubKey,
      wittnessScript: _wittnessScript,
      sequence: sequence,
    );
  }
}

class BTCInput extends Input {
  final int sequence;

  const BTCInput({
    required super.txid,
    required super.vout,
    required super.value,
    super.scriptSig,
    super.prevScriptPubKey,
    super.wittnessScript,
    this.sequence = 0xffffffff,
  });

  factory BTCInput.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Previous Transaction Hash
    final (txid, off1) = buffer.readSlice(offset, 32);
    offset += off1;

    /// Previous Transaction Index
    final (vout, off2) = buffer.bytes.readUint32(offset);
    offset += off2;

    /// ScriptSig
    final (script, off3) = buffer.readVarSlice(offset);
    offset += off3;

    /// Sequence
    final (sequence, off4) = buffer.bytes.readUint32(offset);
    offset += off4;

    return BTCInput(
      txid: txid,
      vout: vout,
      sequence: sequence,
      scriptSig: script,
      value: null,
    );
  }

  BTCInput addScript({
    Uint8List? scriptSig,
    Uint8List? wittnessScript,
  }) {
    final _scriptSig = scriptSig ?? this._scriptSig;
    final _witnessScript = wittnessScript ?? _wittnessScript;

    return BTCInput(
      txid: txid,
      vout: vout,
      scriptSig: _scriptSig,
      prevScriptPubKey: previousScriptPubKey,
      wittnessScript: _witnessScript,
      value: value,
      sequence: sequence,
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
  const EC8Input({
    required super.txid,
    required super.vout,
    required super.value,
    super.prevScriptPubKey,
    super.scriptSig,
    super.wittnessScript,
  });

  EC8Input addScript({
    Uint8List? scriptSig,
    Uint8List? wittnessScript,
  }) {
    final _scriptSig = scriptSig ?? this._scriptSig;
    final _witnessScript = wittnessScript ?? _wittnessScript;

    return EC8Input(
      txid: txid,
      vout: vout,
      scriptSig: _scriptSig,
      value: value,
      prevScriptPubKey: previousScriptPubKey,
      wittnessScript: _witnessScript,
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
    offset += buffer.bytes.writeUint32(offset, weight.toInt());

    // Write ScriptSig
    offset += buffer.writeVarSlice(offset, scriptSig);

    return buffer;
  }

  Uint8List get bytesForTxId {
    final buffer = Uint8List(
      txid.length + output_index_length + value_length + weight_length + 1,
    );

    var offset = 0;
    // Write TXID
    offset += buffer.writeSlice(offset, txid); // Or TXID ?

    // Write Vout
    offset += buffer.bytes.writeUint32(offset, vout);

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    offset += buffer.bytes.writeUint32(offset, 0);

    // Write ScriptSig
    offset += buffer.writeVarSlice(offset, Uint8List(0));

    return buffer;
  }

  Uint8List bytesForSigning({
    required bool withWeight,
    required bool withScript,
  }) {
    final buffer = Uint8List(
      txid.length +
          output_index_length +
          value_length +
          (withWeight ? weight_length : 0) +
          (withScript ? scriptSig.length + 1 : 0),
    );

    var offset = 0;
    // Write TXID
    offset += buffer.writeSlice(offset, txid);
    // Write Vout
    offset += buffer.bytes.writeUint32(offset, vout);
    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    if (withWeight) {
      offset +=
          buffer.bytes.writeUint32(offset, weight.toInt()); // Should be 146
    }

    if (withScript) {
      // Write ScriptSig
      offset += buffer.writeVarSlice(offset, scriptSig);
    }
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

    /// Weight (is ignored since it is calculated)
    final (_, off4) = buffer.bytes.readUint32(offset);
    offset += off4;

    /// ScriptSig
    final (scriptSig, off5) = buffer.readVarSlice(offset);
    offset += off5;

    return EC8Input(
      txid: txid,
      vout: vout,
      scriptSig: scriptSig,
      value: BigInt.from(value),
    );
  }
}

(Uint8List, int) readScriptWittness({
  required Uint8List buffer,
  required int offset,
}) {
  final (count, off1) = buffer.bytes.readVarInt(offset);
  offset += off1;

  final scripts = <Uint8List>[];

  for (var i = 0; i < count; i++) {
    final (script, off2) = buffer.readVarSlice(offset);
    offset += off2;
    scripts.add(script);
  }

  final wittnessScript = [
    count,
    for (final script in scripts) ...[
      script.length,
      ...script,
    ],
  ].toUint8List;

  return (wittnessScript, wittnessScript.length);
}

List<Uint8List> decodeScriptWittness({
  required Uint8List wittnessScript,
}) {
  final scripts = <Uint8List>[];

  var offset = 0;

  final count = wittnessScript[offset];
  offset += 1;

  for (var i = 0; i < count; i++) {
    final length = wittnessScript[offset];
    offset += 1;

    final script = wittnessScript.sublist(offset, offset + length);
    offset += length;

    scripts.add(script);
  }

  return scripts;
}
