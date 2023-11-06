import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const value_length = 8;

class Output {
  final BigInt value;
  final Uint8List scriptPubKey;

  int get intValue => value.toInt();

  const Output({
    required this.value,
    required this.scriptPubKey,
  });

  String get scriptPubKeyHex => hex.encode(scriptPubKey);

  factory Output.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Value
    final (value, off1) = buffer.bytes.readUint64(offset);
    offset += off1;

    /// ScriptPubKey
    final (scriptPubKey, off2) = buffer.readVarSlice(offset);
    offset += off2;

    return Output(
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

  int get size => bytes.length;

  String toHex() {
    return hex.encode(bytes);
  }

  @override
  String toString() {
    return 'Output{value: $value, scriptPubKey: $scriptPubKey}';
  }
}
