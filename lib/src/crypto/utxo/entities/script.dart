import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/utxo/entities/op_codes.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

class Script {
  final Uint8List bytes;

  const Script(this.bytes);

  List<ScriptChunk> get chunks {
    List<ScriptChunk> chunks = [];
    int offset = 0;

    while (offset < bytes.length) {
      int opcode = bytes[offset];
      offset += 1;
      int? dataToRead;

      if (opcode >= 0 && opcode <= OP_PUSHDATA1) {
        // The opcode value itself is length of data
        dataToRead = opcode;
      } else if (opcode == OP_PUSHDATA1) {
        // Next byte is length of data
        if (bytes.length - offset < 1) throw Exception('Unexpected end of script');
        dataToRead = bytes.bytes.readUint8(offset).$1;
        offset += 1;
      } else if (opcode == OP_PUSHDATA2) {
        // Next two bytes are length of data
        if (bytes.length - offset < 2) throw Exception('Unexpected end of script');
        dataToRead = bytes.bytes.readUint16(offset).$1;
        offset += 2;
      } else if (opcode == OP_PUSHDATA4) {
        // Next four bytes are length of data
        if (bytes.length - offset < 4) throw Exception('Unexpected end of script');
        dataToRead = bytes.bytes.readUint32(offset).$1;
        offset += 4;
      }

      final ScriptChunk chunk;
      if (dataToRead == null) {
        chunk = ScriptChunk(opcode, null);
      } else {
        if (dataToRead > bytes.length - offset)
          throw Exception(
              'Push of data element that is larger than remaining data: $dataToRead vs ${bytes.length - offset} ');
        final data = bytes.sublist(offset, offset + dataToRead);
        chunk = ScriptChunk(opcode, data);
        offset += dataToRead;
      }

      chunks.add(chunk);
    }
    if (offset != bytes.length) throw Exception('Script parsing error');
    return chunks;
  }
}

class ScriptChunk {
  final int opcode;
  final Uint8List? data;

  const ScriptChunk(this.opcode, this.data);
}

BigInt getScriptWeight(Uint8List scriptBytes) {
  final scriptChunks = Script(scriptBytes).chunks;

  BigInt w = BigInt.zero;
  bool dataMode = false;
  int lastOpcode = -1; // OP_INVALIDOPCODE
  for (ScriptChunk scriptChunk in scriptChunks) {
    if (scriptChunk.data != null) w += scriptChunk.data!.length.toBI;

    if (dataMode) {
      w += 5.toBI;
      continue;
    }

    final opcode = scriptChunk.opcode;

    switch (opcode) {
      case OP_RETURN:
        dataMode = true;
        w += 5.toBI;
        break;
      case OP_RIPEMD160:
      case OP_SHA1:
      case OP_SHA256:
      case OP_HASH160:
      case OP_HASH256:
        w += 10.toBI;
        break;
      case OP_CODESEPARATOR:
        w += 10.toBI;
        break;
      case OP_CHECKSIG:
      case OP_CHECKSIGVERIFY:
        w += 100.toBI;
        break;
      case OP_CHECKMULTISIG:
      case OP_CHECKMULTISIGVERIFY:
        if (lastOpcode >= OP_1 && lastOpcode <= OP_16)
          w += (100 * decodeOP_N(lastOpcode)).toBI;
        else
          w += (100 * MAX_PUBKEYS_PER_MULTISIG).toBI;
        break;
      case OP_RESERVED1:
      case OP_RESERVED2:
      case OP_NOP1:
      case OP_NOP2:
      case OP_NOP3:
      case OP_NOP4:
      case OP_NOP5:
      case OP_NOP6:
      case OP_NOP7:
      case OP_NOP8:
      case OP_NOP9:
      case OP_NOP10:
        w += 10000.toBI;
        break;
      // case OP_INVALIDOPCODE:
      //   w += 100000.toBI;
      //   break;

      default:
        w += 5.toBI;
        break;
    }
    lastOpcode = opcode;
  }

  if (dataMode) w *= 20.toBI;

  return w;
}

int decodeOP_N(int opcode) {
  // Subtracting opcode by (OpCode.OP_1 - 1) to get the numeric value
  return opcode - (OPCODE.OP_1.hex - 1);
}
