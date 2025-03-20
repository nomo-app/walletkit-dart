import 'dart:typed_data';

import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:dart_bech32/dart_bech32.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/op_codes.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/input.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/output.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/script.dart';
import 'package:walletkit_dart/src/utils/base32.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

enum InputType { P2PK, P2PKH, P2SH, P2WPKH, P2WSH, P2TR }

sealed class BTCScript {
  final Uint8List bytes;

  const BTCScript(this.bytes);

  BigInt get weight => 1.toBI + getScriptWeight(bytes);

  String get hex => bytes.toHex;

  int get size => bytes.length;
}

sealed class BTCLockingScript extends BTCScript {
  const BTCLockingScript(super.bytes);

  Uint8List get data {
    return switch (this) {
      PayToPublicKeyScript script => script.publicKey,
      PayToPublicKeyHashScript script => script.publicKeyHash,
      PayToScriptHashScript script => script.scriptHash,
      PayToWitnessPublicKeyHashScript script => script.publicKeyHash,
      PayToWitnessScriptHashScript script => script.witnessScriptHash,
      OPReturnScript script => script.data,
      TimeLockedScript script => script.input.data,
      NestedSegwitScript script => script.nestedScriptHash,
      PayToTaprootScript script => script.pubkey,
      AnyoneCanSpendScript _ => Uint8List(0),
      EmptyLockingScript _ => Uint8List(0),
    };
  }

  factory BTCLockingScript.fromAddress(String address) {
    if (address.startsWith(P2PKH_PREFIX) ||
        address.startsWith(P2PKH_PREFIX_LTC) ||
        address.startsWith(P2PKH_PREFIX_ZENIQ) ||
        address.startsWith(P2PKH_PREFIX_EC8)) {
      final decodedHex = bs58check.decode(address);
      final pubKeyHash = decodedHex.sublist(1);
      if (pubKeyHash.length != 40) {
        throw WKFailure("wrong pubKeyHash length");
      }

      return PayToPublicKeyHashScript(pubKeyHash);
    }

    if (address.startsWith(P2SH_PREFIX) ||
        address.startsWith(P2SH_PREFIX_LTC)) {
      final scriptHash = bs58check.decode(address).sublist(1);

      return PayToScriptHashScript(scriptHash);
    }

    if (address.startsWith(P2WPKH_PREFIX_BTC) ||
        address.startsWith(P2WPKH_PREFIX_LTC)) {
      final decoded = bech32.decode(address);
      var words = decoded.words;
      // Remove the witness version
      words = words.sublist(1);
      // Convert 5-bit words to 8-bit
      Uint8List publicyKeyHash;
      try {
        publicyKeyHash = bech32.fromWords(words);
      } catch (e) {
        publicyKeyHash = words;
      }

      return PayToWitnessPublicKeyHashScript(publicyKeyHash);
    }

    /// Remove the prefix
    if (address.startsWith("bitcoincash:")) {
      final _address = address.substring(12); // remove "bitcoincash:"

      final payload = Base32().decode(_address);

      final payloadData = bech32.fromWords(
        payload.sublist(0, payload.length - 8),
      );

      final version = payloadData[0];
      final pubKeyHash = payloadData.sublist(1);

      assert(version == 0);
      assert(pubKeyHash.length == 20);

      return PayToWitnessPublicKeyHashScript(pubKeyHash);
    }

    throw UnimplementedError("Address type not supported: $address");
  }

  factory BTCLockingScript.fromPublicKey(Uint8List publicKey) {
    return PayToPublicKeyScript(publicKey);
  }

  factory BTCLockingScript.fromBuffer(Uint8List buffer) {
    if (buffer.isEmpty) {
      return AnyoneCanSpendScript();
    }

    if (buffer.length < 2) {
      throw Exception("Invalid Script");
    }
    final secondOpCode = OPCODE.fromHex(buffer[1]);

    if (secondOpCode != null &&
        switch (secondOpCode) {
          OPCODE.OP_CHECKSEQUENCEVERIFY => true,
          OPCODE.OP_CHECKLOCKTIMEVERIFY => true,
          _ => false,
        }) {
      return TimeLockedScript.fromScript(buffer);
    }

    final firstOpCode = OPCODE.fromHex(buffer[0]);

    if (firstOpCode != null && firstOpCode == OPCODE.OP_RETURN) {
      return OPReturnScript.fromScript(buffer);
    }

    if (firstOpCode == OPCODE.OP_1) {
      return PayToTaprootScript.fromScript(buffer);
    }

    // Check for P2PK (public key + OP_CHECKSIG)
    if (buffer.length >= 2 &&
        OPCODE.fromHex(buffer[buffer.length - 1]) == OPCODE.OP_CHECKSIG) {
      // Verify this isn't P2PKH by checking for absence of OP_DUP at start
      if (firstOpCode != OPCODE.OP_DUP) {
        return PayToPublicKeyScript.fromScript(buffer);
      }
    }

    return switch (buffer.length) {
      22 => PayToWitnessPublicKeyHashScript.fromScript(buffer),
      23 => PayToScriptHashScript.fromScript(buffer),
      25 => PayToPublicKeyHashScript.fromScript(buffer),
      34 => PayToWitnessScriptHashScript.fromScript(buffer),
      _ => throw Exception("Unknown script type"),
    };
  }
}

sealed class BTCUnlockingScript extends BTCScript {
  const BTCUnlockingScript(super.bytes);

  factory BTCUnlockingScript.fromBuffer(Uint8List buffer) {
    final first = buffer[0];

    return switch (first) {
      0x00 => RedeemScript.fromScript(buffer),
      0x02 => ScriptWitness.fromScript(buffer),
      _ => ScriptSignature.fromScript(buffer),
    };
  }
}

///
/// RedeemScript is used to unlock a P2SH output
///
final class RedeemScript extends BTCUnlockingScript {
  late final Uint8List signature;
  late final Uint8List redeemScript;

  RedeemScript.fromScript(super.bytes) {
    final signatureLength = bytes[1];
    signature = bytes.sublist(2, 2 + signatureLength).toUint8List;
    redeemScript = bytes.sublist(3 + signatureLength).toUint8List;
  }

  RedeemScript(this.signature, this.redeemScript)
    : super(
        [
          0x00,
          signature.length,
          ...signature,
          redeemScript.length,
          ...redeemScript,
        ].toUint8List,
      );
}

final class ScriptSignature extends BTCUnlockingScript {
  late final Uint8List signature;
  late final Uint8List publicKey;

  ScriptSignature.fromScript(super.bytes) {
    final signatureLength = bytes[1];
    signature = bytes.sublist(2, 2 + signatureLength).toUint8List;
    publicKey = bytes.sublist(3 + signatureLength).toUint8List;
  }

  ScriptSignature(this.signature, this.publicKey)
    : super(
        [
          signature.length,
          ...signature,
          publicKey.length,
          ...publicKey,
        ].toUint8List,
      );
}

final class ScriptWitness extends BTCUnlockingScript {
  late final Uint8List scriptSig;
  late final Uint8List publicKey;

  ScriptWitness.fromScript(super.bytes) {
    final scriptSigLength = bytes[1];
    scriptSig = bytes.sublist(2, 2 + scriptSigLength).toUint8List;
    publicKey = bytes.sublist(3 + scriptSigLength).toUint8List;
  }

  ScriptWitness(this.scriptSig, this.publicKey)
    : super(
        [
          0x02,
          scriptSig.length,
          ...scriptSig,
          publicKey.length,
          ...publicKey,
        ].toUint8List,
      );
}

final class TimeLockedScript extends BTCLockingScript {
  final BTCLockingScript input;
  final int lockTime;
  final bool isRelative;

  TimeLockedScript.fromScript(super.bytes)
    : input = BTCLockingScript.fromBuffer(bytes.sublist(3, bytes.length - 1)),
      lockTime = bytes[0],
      isRelative = bytes[1] == OPCODE.OP_CHECKSEQUENCEVERIFY.hex;

  TimeLockedScript(this.input, this.lockTime, this.isRelative)
    : super(
        isRelative
            ? [
              lockTime,
              OPCODE.OP_CHECKSEQUENCEVERIFY.hex,
              OPCODE.OP_DROP.hex,
              ...input.bytes,
            ].toUint8List
            : [
              lockTime,
              OPCODE.OP_CHECKLOCKTIMEVERIFY.hex,
              OPCODE.OP_DROP.hex,
              ...input.bytes,
            ].toUint8List,
      );
}

final class PayToPublicKeyScript extends BTCLockingScript {
  final Uint8List publicKey;

  PayToPublicKeyScript.fromScript(super.bytes)
    : publicKey = bytes.sublist(0, bytes.length - 1).toUint8List;

  PayToPublicKeyScript(this.publicKey)
    : super(
        [publicKey.length, ...publicKey, OPCODE.OP_CHECKSIG.hex].toUint8List,
      );
}

final class PayToPublicKeyHashScript extends BTCLockingScript {
  final Uint8List publicKeyHash;

  PayToPublicKeyHashScript.fromScript(super.bytes)
    : publicKeyHash = bytes.sublist(3, bytes.length - 2).toUint8List;

  PayToPublicKeyHashScript(this.publicKeyHash)
    : super(
        [
          OPCODE.OP_DUP.hex,
          OPCODE.OP_HASH160.hex,
          publicKeyHash.length,
          ...publicKeyHash,
          OPCODE.OP_EQUALVERIFY.hex,
          OPCODE.OP_CHECKSIG.hex,
        ].toUint8List,
      );
}

final class PayToScriptHashScript extends BTCLockingScript {
  final Uint8List scriptHash;

  PayToScriptHashScript.fromScript(super.bytes)
    : scriptHash = bytes.sublist(2, bytes.length - 1).toUint8List;

  PayToScriptHashScript(this.scriptHash)
    : super(
        [
          OPCODE.OP_HASH160.hex,
          scriptHash.length,
          ...scriptHash,
          OPCODE.OP_EQUAL.hex,
        ].toUint8List,
      );
}

final class PayToWitnessPublicKeyHashScript extends BTCLockingScript {
  final Uint8List publicKeyHash;

  PayToWitnessPublicKeyHashScript.fromScript(super.bytes)
    : publicKeyHash = bytes.sublist(2, bytes.length).toUint8List;

  PayToWitnessPublicKeyHashScript(this.publicKeyHash)
    : super(
        [OPCODE.OP_0.hex, publicKeyHash.length, ...publicKeyHash].toUint8List,
      );
}

final class PayToWitnessScriptHashScript extends BTCLockingScript {
  final Uint8List witnessScriptHash;

  PayToWitnessScriptHashScript.fromScript(super.bytes)
    : witnessScriptHash = bytes.sublist(2, bytes.length).toUint8List;

  PayToWitnessScriptHashScript(this.witnessScriptHash)
    : super(
        [
          OPCODE.OP_0.hex,
          witnessScriptHash.length,
          ...witnessScriptHash,
        ].toUint8List,
      );
}

final class NestedSegwitScript extends BTCLockingScript {
  final Uint8List nestedScriptHash;

  NestedSegwitScript(super.bytes)
    : nestedScriptHash = bytes.sublist(2, bytes.length - 1).toUint8List;
}

final class PayToWitnessPublicKeyHashNestedScript extends NestedSegwitScript {
  final Uint8List? pubKeyHash;

  PayToWitnessPublicKeyHashNestedScript.fromScript(super.script)
    : pubKeyHash = null;

  PayToWitnessPublicKeyHashNestedScript(Uint8List pubKeyHash)
    : pubKeyHash = pubKeyHash,
      super(
        [
          OPCODE.OP_HASH160.hex,
          20,
          ...ripmed160Hash([00, 14, ...pubKeyHash].toUint8List),
          OPCODE.OP_EQUAL.hex,
        ].toUint8List,
      );
}

final class PayToWitnessScriptHashNestedScript extends NestedSegwitScript {
  final Uint8List? witnessSript;

  PayToWitnessScriptHashNestedScript.fromScript(super.script)
    : witnessSript = null;

  PayToWitnessScriptHashNestedScript(Uint8List witnessSript)
    : witnessSript = witnessSript,
      super(
        [
          OPCODE.OP_HASH160.hex,
          ...ripmed160Hash([00, 20, ...sha256Hash(witnessSript)].toUint8List),
          OPCODE.OP_EQUAL.hex,
        ].toUint8List,
      );
}

final class PayToTaprootScript extends BTCLockingScript {
  final Uint8List pubkey;

  PayToTaprootScript.fromScript(super.bytes)
    : pubkey = bytes.sublist(2, bytes.length).toUint8List;

  PayToTaprootScript(this.pubkey)
    : super([OPCODE.OP_1.hex, pubkey.length, ...pubkey].toUint8List);
}

// final class BareMultiSigScript extends UTXOScript {
//   final List<Uint8List> pubKeys;
//   final int m;

//   BareMultiSigScript.fromScript(super.script)
//       : m = script[0] - 0x50,
//         pubKeys = script.sublist(1, script.length - 2).toUint8List.split(33);

//   BareMultiSigScript(this.pubKeys, this.m)
//       : super(
//           [
//             m + 0x50,
//             ...pubKeys.fold(
//               Uint8List(0),
//               (previousValue, element) =>
//                   [...previousValue, ...element].toUint8List,
//             ),
//             pubKeys.length + 0x50,
//             OPCODE.OP_CHECKMULTISIG.hex,
//           ].toUint8List,
//         );
// }

final class OPReturnScript extends BTCLockingScript {
  final Uint8List data;

  OPReturnScript.fromScript(super.bytes)
    : data = bytes.sublist(2, bytes.length).toUint8List;

  OPReturnScript(this.data)
    : assert(data.length <= 80, "Data length must be less than 80 bytes"),
      super([OPCODE.OP_RETURN.hex, ...data].toUint8List);
}

final class AnyoneCanSpendScript extends BTCLockingScript {
  AnyoneCanSpendScript() : super([OPCODE.OP_TRUE.hex].toUint8List);
}

final class EmptyScript extends BTCScript {
  EmptyScript() : super(Uint8List(0));
}

final class EmptyUnlockingScript extends BTCUnlockingScript {
  EmptyUnlockingScript() : super(Uint8List(0));
}

final class EmptyLockingScript extends BTCLockingScript {
  EmptyLockingScript() : super(Uint8List(0));
}

sealed class BTCTransactionStructure {
  Set<InputType> get acceptedInputTypes;

  const BTCTransactionStructure();

  factory BTCTransactionStructure.create({
    required int version,
    required int lockTime,
    required List<Input> inputs,
    required List<Output> outputs,
  }) {
    throw UnimplementedError();
  }

  Uint8List buildBuffer({
    required int version,
    required int lockTime,
    required List<Input> inputs,
    required List<Output> outputs,
  });
}

final class LegacyFormat extends BTCTransactionStructure {
  @override
  Set<InputType> get acceptedInputTypes => {
    InputType.P2PKH,
    InputType.P2SH,
    InputType.P2PK,
  };

  Uint8List buildBuffer({
    required int version,
    required int lockTime,
    required List<Input> inputs,
    required List<Output> outputs,
  }) {
    return Uint8List(0);
  }
}

/// SegWit v0
final class SegwitFormat extends BTCTransactionStructure {
  final int version = 1;
  final int flag = 1;

  @override
  Set<InputType> get acceptedInputTypes => {
    InputType.P2PKH,
    InputType.P2SH,
    InputType.P2PK,
    InputType.P2WPKH,
    InputType.P2WSH,
  };

  @override
  Uint8List buildBuffer({
    required int version,
    required int lockTime,
    required List<Input> inputs,
    required List<Output> outputs,
  }) {
    throw UnimplementedError();
  }
}

/// SegWit v1
final class TaprootFormat extends SegwitFormat {
  @override
  final int version = 2;

  @override
  final int flag = 0;

  @override
  Set<InputType> get acceptedInputTypes => {
    ...super.acceptedInputTypes,
    InputType.P2TR,
  };
}
