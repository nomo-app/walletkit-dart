import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/tx_structure.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const output_index_length = 4;
const sequence_length = 4;

sealed class Input {
  final Uint8List txid;
  final int vout;

  final Output? prevOutput;

  final BTCScript? script;

  BigInt? get value => prevOutput?.value;

  const Input({
    required this.txid,
    required this.vout,
    required this.prevOutput,
    required this.script,
  });

  // BigInt get witnessSize {
  //   if (_wittnessScript == null || _wittnessScript!.isEmpty) return 0.toBI;

  //   BigInt size = getVarIntSize(_wittnessScript!.length)
  //       .toBI; // Count of witness elements

  //   final wittnessChunks =
  //       decodeScriptWittness(wittnessScript: _wittnessScript!);

  //   for (final chunk in wittnessChunks) {
  //     size += getVarIntSize(chunk.length).toBI; // Size of this element
  //     size += chunk.length.toBI; // The element itself
  //   }

  //   return size;
  // }

  // BigInt get scriptSize {
  //   if (_scriptSig == null || _scriptSig!.isEmpty) return 0.toBI;

  //   return getVarIntSize(_scriptSig!.length).toBI + _scriptSig!.length.toBI;
  // }

  BigInt get weight;

  int get intValue => value != null ? value!.toInt() : 0;

  String get txIdString => hex.encode(txid);

  Uint8List get bytes;

  int get size => bytes.length;

  String get toHex => hex.encode(bytes);

  BTCLockingScript? get previousScript => prevOutput?.script;

  bool get isSegwit =>
      hasWitness ||
      previousScript is PayToWitnessScriptHashScript ||
      previousScript is PayToWitnessPublicKeyHashScript;

  bool get hasWitness => script is ScriptWitness;

  Uint8List get publicKeyFromSig {
    return switch (script) {
      ScriptSignature scripSig => scripSig.publicKey,
      ScriptWitness scriptWitness => scriptWitness.publicKey,
      RedeemScript _ => throw Exception("Redeem Script"),
      _ => throw Exception("Unknown Script"),
    };
  }

  Input addScript(BTCScript script);

  BTCInput changeSequence(int sequence) {
    return BTCInput(
      txid: txid,
      vout: vout,
      script: script,
      prevOutput: prevOutput,
      sequence: sequence,
    );
  }
}

class BTCInput extends Input {
  final int sequence;

  const BTCInput({
    required super.txid,
    required super.vout,
    required super.prevOutput,
    required super.script,
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
      script: BTCUnlockingScript.fromBuffer(script),
      prevOutput: null,
    );
  }

  BTCInput addScript(BTCScript script) {
    return BTCInput(
      txid: txid,
      vout: vout,
      script: script,
      prevOutput: prevOutput,
      sequence: sequence,
    );
  }

  Uint8List get bytes {
    assert(script != null, "Script is required");

    /// Only the ScriptSig is included in the input
    /// If the script is a witness, the witness is included in the transaction itself not in the input => use EmptyLockingScript
    final _script = switch (script) {
      ScriptSignature sig => sig,
      _ => EmptyLockingScript(),
    };

    final buffer = Uint8List(
      txid.length +
          output_index_length +
          _script.size +
          getVarIntSize(_script.size) +
          sequence_length,
    );

    var offset = 0;
    // Write TXID
    offset += buffer.writeSlice(offset, txid);

    // Write Vout
    offset += buffer.bytes.writeUint32(offset, vout);

    // Write Unlocking Script
    offset += buffer.writeVarSlice(offset, _script.bytes);

    // Write Sequence
    offset += buffer.bytes.writeUint32(offset, sequence);

    return buffer;
  }

  @override
  BigInt get weight {
    final weight =
        (txid.length + output_index_length + sequence_length).toBI *
        4.toBI; // (32 + 4 + 4) * 4

    return switch (script!) {
      ScriptSignature sig => weight + (sig.weight * 4.toBI),
      ScriptWitness witness => weight + witness.weight,
      RedeemScript redeem =>
        weight + redeem.weight, // TODO: I think this doesnt make sense
      _ => throw Exception("Unknown Script"),
    };
  }
}

const value_length = 8;
const weight_length = 4;

class EC8Input extends Input {
  const EC8Input({
    required super.txid,
    required super.vout,
    required super.script,
    required super.prevOutput,
  });

  @override
  BigInt get weight {
    throw UnimplementedError();
    // if (_scriptSig == null || _prevScriptPubKey == null) return -1.toBI;
    // return calculateWeight(_prevScriptPubKey!, _scriptSig!);
  }

  BigInt calculateWeight(Uint8List prevScriptPubKey, Uint8List? scriptSig) {
    throw UnimplementedError();
    // if (scriptSig == null || prevScriptPubKey.isEmpty) {
    //   return 0.toBI;
    // }

    // BigInt w = 1.toBI + getScriptWeight(prevScriptPubKey);

    // if (!isP2SH) return w;

    // final script = Script(scriptSig);

    // Uint8List? buffer = Uint8List(0);

    // for (final chunk in script.chunks) {
    //   if (buffer != null) {
    //     buffer = chunk.data;
    //   }
    //   if (chunk.opcode > OP_16) {
    //     return weight;
    //   }
    // }

    // if (buffer != null && buffer.isNotEmpty) {
    //   w += getScriptWeight(buffer);
    // }

    // return w;
  }

  EC8Input addScript(BTCScript script) {
    return EC8Input(
      txid: txid,
      vout: vout,
      script: script,
      prevOutput: prevOutput,
    );
  }

  Uint8List get bytes {
    assert(script != null, "Script is required");
    final _script = script!;

    final buffer = Uint8List(
      txid.length +
          output_index_length +
          value_length +
          weight_length +
          _script.size +
          getVarIntSize(_script.size),
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
    offset += buffer.writeVarSlice(offset, _script.bytes);

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
    assert(withWeight || withScript, "At least one of the two is required");
    assert(script != null, "Script is required");
    final _script = script!;

    final buffer = Uint8List(
      txid.length +
          output_index_length +
          value_length +
          (withWeight ? weight_length : 0) +
          (withScript ? _script.size + getVarIntSize(_script.size) : 0),
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
      offset += buffer.bytes.writeUint32(
        offset,
        weight.toInt(),
      ); // Should be 146
    }

    if (withScript) {
      // Write ScriptSig
      offset += buffer.writeVarSlice(offset, _script.bytes);
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
    final (script, off5) = buffer.readVarSlice(offset);
    offset += off5;

    return EC8Input(
      txid: txid,
      vout: vout,
      script: BTCUnlockingScript.fromBuffer(script),
      prevOutput: null,
    );
  }
}

List<Uint8List> decodeScriptWittness({required Uint8List wittnessScript}) {
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
