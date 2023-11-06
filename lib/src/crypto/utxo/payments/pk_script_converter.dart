import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/utxo/op_codes.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

class PublicKeyScriptConverter {
  final Uint8List script;

  late final Uint8List publicKeyHash;

  PublicKeyScriptConverter(this.script) {
    if (script.length == 0) {
      throw Exception("Script length is 0");
    }

    // P2PKH
    if (script.length == 25) {
      if (script[0] != 25 &&
          script[1] != OPCODE.OP_DUP.hex &&
          script[2] != OPCODE.OP_HASH160.hex &&
          script[23] != OPCODE.OP_EQUALVERIFY.hex &&
          script.last != OPCODE.OP_CHECKSIG.hex) {
        throw Exception("Script is not P2PKH");
      }
      publicKeyHash = script.sublist(3, 23);
      return;
    }

    // P2WPKH
    if (script.length == 22) {
      if (script[0] != OPCODE.OP_0.hex && script[1] != 20) {
        throw Exception("Script is not P2WPKH");
      }
      publicKeyHash = script.sublist(2, 22);
      return;
    }

    // P2SH
    if (script.length == 23) {
      if (script.first != 23 &&
          script[1] != OPCODE.OP_HASH160.hex &&
          script[2] != 20 &&
          script.last != OPCODE.OP_EQUAL.hex) {
        throw Exception("Script is not P2SH");
      }
      publicKeyHash = script.sublist(3, 23);
      return;
    }

    // P2WPKH
    if (script.length == 34) {
      if (script.first != 34 && script[1] != OPCODE.OP_0.hex) {
        throw Exception("Script is not P2WPKH");
      }
      publicKeyHash = script.sublist(2, 34);
      return;
    }

    throw Exception("Unknown script type");
  }

  Uint8List get p2wpkhScript {
    assert(publicKeyHash.length == 20, "publicKeyHash.length != 20");
    return [
      OPCODE.OP_0.hex,
      publicKeyHash.length,
      ...publicKeyHash,
    ].toUint8List;
  }

  Uint8List get p2shScript {
    assert(publicKeyHash.length == 20, "publicKeyHash.length != 20");
    return [
      OPCODE.OP_HASH160.hex,
      publicKeyHash.length,
      ...publicKeyHash,
      OPCODE.OP_EQUAL.hex,
    ].toUint8List;
  }

  Uint8List get p2pkhScript {
    assert(publicKeyHash.length == 20, "publicKeyHash.length != 20");
    return [
      OPCODE.OP_DUP.hex,
      OPCODE.OP_HASH160.hex,
      publicKeyHash.length,
      ...publicKeyHash,
      OPCODE.OP_EQUALVERIFY.hex,
      OPCODE.OP_CHECKSIG.hex,
    ].toUint8List;
  }

  Uint8List get p2pkScript {
    assert(publicKeyHash.length == 33, "publicKeyHash.length != 33");
    return [
      OPCODE.OP_DUP.hex,
      OPCODE.OP_HASH160.hex,
      publicKeyHash.length,
      ...publicKeyHash,
      OPCODE.OP_EQUALVERIFY.hex,
      OPCODE.OP_CHECKSIG.hex,
    ].toUint8List;
  }

  Uint8List get p2wshScript {
    assert(publicKeyHash.length == 32, "publicKeyHash.length != 32");
    return [
      OPCODE.OP_0.hex,
      publicKeyHash.length,
      ...publicKeyHash,
    ].toUint8List;
  }
}
