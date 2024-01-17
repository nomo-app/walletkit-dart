import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/script.dart';
import 'package:walletkit_dart/src/crypto/utxo/op_codes.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const value_length = 8;

abstract class Output {
  final BigInt value;
  final Uint8List scriptPubKey;
  final BigInt weight;

  int get intValue => value.toInt();

  String get scriptPubKeyHex => hex.encode(scriptPubKey);

  int get size => bytes.length;

  Uint8List get bytes;

  String get toHex => hex.encode(bytes);

  const Output({
    required this.value,
    required this.scriptPubKey,
    required this.weight,
  });
}

class BTCOutput extends Output {
  BTCOutput({
    required super.value,
    required super.scriptPubKey,
  }) : super(weight: getScriptWeight(scriptPubKey));

  factory BTCOutput.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Value
    final (value, off1) = buffer.bytes.readUint64(offset);
    offset += off1;

    /// ScriptPubKey
    final (scriptPubKey, off2) = buffer.readVarSlice(offset);
    offset += off2;

    return BTCOutput(
      value: BigInt.from(value),
      scriptPubKey: scriptPubKey,
    );
  }

  Uint8List get bytes {
    final buffer = Uint8List(value_length + scriptPubKey.length + 1);

    var offset = 0;

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write ScriptPubKey
    offset += buffer.writeVarSlice(offset, scriptPubKey);

    return buffer;
  }
}

class EC8Output extends Output {
  EC8Output({
    required super.value,
    required super.scriptPubKey,
  }) : super(weight: getScriptWeight(scriptPubKey));

  const EC8Output.withWeight({
    required super.value,
    required super.scriptPubKey,
    required super.weight,
  });

  Uint8List get bytes {
    final buffer = Uint8List(
      value_length + weight_length + scriptPubKey.length + 1,
    );

    var offset = 0;

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    offset += buffer.bytes.writeUint32(offset, weight.toInt()); // Should be 146

    // Write ScriptPubKey
    offset += buffer.writeVarSlice(offset, scriptPubKey);

    return buffer;
  }

  factory EC8Output.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Value
    final (value, off1) = buffer.bytes.readUint64(offset);
    offset += off1;

    /// Weight
    final (weight, off2) = buffer.bytes.readUint32(offset);
    offset += off2;

    /// ScriptPubKey
    final (scriptPubKey, off3) = buffer.readVarSlice(offset);
    offset += off3;

    return EC8Output.withWeight(
      value: value.toBI,
      scriptPubKey: scriptPubKey,
      weight: weight.toBI,
    );
  }
}
