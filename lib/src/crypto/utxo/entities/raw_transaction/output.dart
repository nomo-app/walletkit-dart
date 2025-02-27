import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/tx_structure.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/script.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const value_length = 8;

abstract class Output {
  final BigInt value;
  final BTCLockingScript script;

  int get intValue => value.toInt();

  String get scriptHex => script.hex;

  int get size => bytes.length;

  Uint8List get bytes;

  String get toHex => hex.encode(bytes);

  BigInt get weight => script.weight;

  const Output({
    required this.value,
    required this.script,
  });
}

class BTCOutput extends Output {
  const BTCOutput({
    required super.value,
    required super.script,
  });

  factory BTCOutput.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Value
    final (value, off1) = buffer.bytes.readUint64(offset);
    offset += off1;

    /// ScriptPubKey
    final (script, off2) = buffer.readVarSlice(offset);
    offset += off2;

    return BTCOutput(
      value: BigInt.from(value),
      script: BTCLockingScript.fromBuffer(script),
    );
  }

  Uint8List get bytes {
    final buffer = Uint8List(value_length + script.size + 1);

    var offset = 0;

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write ScriptPubKey
    offset += buffer.writeVarSlice(offset, script.bytes);

    return buffer;
  }
}

class EC8Output extends Output {
  const EC8Output({
    required super.value,
    required super.script,
  });

  Uint8List get bytes {
    final buffer = Uint8List(
      value_length + weight_length + script.size + 1,
    );

    var offset = 0;

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    offset += buffer.bytes.writeUint32(offset, weight.toInt()); // Should be 146

    // Write ScriptPubKey
    offset += buffer.writeVarSlice(offset, script.bytes);

    return buffer;
  }

  Uint8List get bytesForTxId {
    final buffer = Uint8List(
      value_length + weight_length + script.size + 1,
    );

    var offset = 0;

    // Write Value
    offset += buffer.bytes.writeUint64(offset, intValue);

    // Write Weight
    offset += buffer.bytes.writeUint32(offset, 0);

    // Write ScriptPubKey
    offset += buffer.writeVarSlice(offset, script.bytes);

    return buffer;
  }

  factory EC8Output.fromBuffer(Uint8List buffer) {
    var offset = 0;

    /// Value
    final (value, off1) = buffer.bytes.readUint64(offset);
    offset += off1;

    /// Weight (is ingored since it is calculated)
    final (_, off2) = buffer.bytes.readUint32(offset);
    offset += off2;

    /// Script
    final (script, off3) = buffer.readVarSlice(offset);
    offset += off3;

    return EC8Output(
      value: value.toBI,
      script: BTCLockingScript.fromBuffer(script),
    );
  }
}
