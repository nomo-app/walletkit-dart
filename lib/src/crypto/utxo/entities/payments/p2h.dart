import 'dart:typed_data';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:convert/convert.dart';
import 'package:dart_bech32/dart_bech32.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/op_codes.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/utils/base32.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class P2Hash {
  final String address;

  const P2Hash(this.address);

  String get publicKeyScriptHash => sha256Hash(publicKeyScript).rev.toHex;

  Uint8List get publicKeyScript {
    if (address.startsWith(P2PKH_PREFIX) ||
        address.startsWith(P2PKH_PREFIX_LTC) ||
        address.startsWith(P2PKH_PREFIX_ZENIQ) ||
        address.startsWith(P2PKH_PREFIX_EC8)) {
      return p2pkhScript;
    }

    if (address.startsWith(P2SH_PREFIX) ||
        address.startsWith(P2SH_PREFIX_LTC)) {
      return p2shScript;
    }

    if (address.startsWith(P2WPKH_PREFIX_BTC) ||
        address.startsWith(P2WPKH_PREFIX_LTC)) {
      return p2wpkhScript;
    }

    /// Remove the prefix
    if (address.startsWith("bitcoincash:")) {
      return p2pkhScriptBCH;
    }

    throw UnsupportedError("Address type not supported: $address");
  }

  ///
  /// P2PKH
  ///

  Uint8List get p2pkhScript {
    final decodedHex = bs58check.decode(address).toHex;
    final pubKeyHash = decodedHex.substring(2);

    if (pubKeyHash.length != 40) {
      throw WKFailure("wrong pubKeyHash length");
    }
    // see https://en.bitcoinwiki.org/wiki/Pay-to-Pubkey_Hash for P2PKH
    final scriptP2PKH =
        "${OPCODE.OP_DUP}${OPCODE.OP_HASH160}$PUBKEY_SCRIPT_HASH_LENGTH_HEX$pubKeyHash${OPCODE.OP_EQUALVERIFY}${OPCODE.OP_CHECKSIG}";

    return scriptP2PKH.hexToBytes;
  }

  ///
  /// P2WPKH
  ///

  Uint8List get p2wpkhScript {
    final decoded = bech32.decode(address);
    var words = decoded.words;
    // Remove the witness version
    words = words.sublist(1);
    // Convert 5-bit words to 8-bit
    Uint8List convertedWords;
    try {
      convertedWords = bech32.fromWords(words);
    } catch (e) {
      convertedWords = words;
    }

    final scriptPubKeyHash =
        "${OPCODE.OP_0}$PUBKEY_SCRIPT_HASH_LENGTH_HEX${hex.encode(convertedWords)}";

    return scriptPubKeyHash.hexToBytes;
  }

  ///
  /// P2WPKH BCH
  ///
  Uint8List get p2pkhScriptBCH {
    final _address = address.substring(12); // remove "bitcoincash:"

    final payload = Base32().decode(_address);

    final payloadData =
        bech32.fromWords(payload.sublist(0, payload.length - 8));

    final version = payloadData[0];
    final pubKeyHash = payloadData.sublist(1);

    assert(version == 0);
    assert(pubKeyHash.length == 20);

    return [
      OPCODE.OP_DUP.hex,
      OPCODE.OP_HASH160.hex,
      pubKeyHash.length,
      ...pubKeyHash,
      OPCODE.OP_EQUALVERIFY.hex,
      OPCODE.OP_CHECKSIG.hex,
    ].toUint8List;
  }

  ///
  /// P2SH
  ///

  Uint8List get p2shScript {
    // Decode the Base58Check encoded P2SH address and extract the script hash
    final scriptHash = bs58check.decode(address).sublist(1);

    return [
      OPCODE.OP_HASH160.hex,
      scriptHash.length,
      ...scriptHash,
      OPCODE.OP_EQUAL.hex,
    ].toUint8List;
  }

  ///
  /// Utility functions
  ///
  static Uint8List toP2PKHScript(Uint8List segWitScript) {
    final pubkeyhash = segWitScript.sublist(2);

    return [
      OPCODE.OP_DUP.hex,
      OPCODE.OP_HASH160.hex,
      pubkeyhash.length,
      ...pubkeyhash,
      OPCODE.OP_EQUALVERIFY.hex,
      OPCODE.OP_CHECKSIG.hex,
    ].toUint8List;
  }
}

///
/// Returns the address from the locking script of a transaction output.
///
String getAddressFromLockingScript(
  ElectrumScriptPubKey scriptPubKey,
  UTXONetworkType type, {
  AddressType? addressType,
}) {
  final (pubKeyHash, walletType) = getPublicKeyFromLockingScript(
    scriptPubKey,
    type,
  );

  return switch (walletType) {
    HDWalletPurpose.BIP44 when addressType == AddressType.cashaddr =>
      bchAddrEncode(
        hrp: type.bech32,
        data: pubKeyHash,
        witnessVersion: type.pubKeyHashPrefix,
      ),
    HDWalletPurpose.BIP44 =>
      pubKeyHashToLegacyAddress(pubKeyHash, type.pubKeyHashPrefix),
    HDWalletPurpose.BIP49 =>
      pubKeyHashToP2SHAddress(pubKeyHash, type.scriptHashPrefix),
    HDWalletPurpose.BIP84 =>
      pubKeyHashToSegwitAddress(pubKeyHash, type.bech32, type.pubKeyHashPrefix),
    _ => throw UnsupportedError("Address type not supported: $pubKeyHash")
  };
}

(Uint8List, HDWalletPurpose) getPublicKeyFromLockingScript(
  ElectrumScriptPubKey scriptPubKey,
  UTXONetworkType type,
) {
  final hexKey = scriptPubKey.hexString;

  ///
  /// P2PKH
  ///
  if (hexKey.startsWith(p2pkhPrefix) && hexKey.endsWith(p2pkhPostfix)) {
    final pubKeyHashHex = hexKey.substring(
      p2pkhPrefix.length,
      hexKey.length - p2pkhPostfix.length,
    );
    final pubKeyHash = Uint8List.fromList(hex.decode(pubKeyHashHex));
    return (pubKeyHash, HDWalletPurpose.BIP44);
  }

  ///
  /// P2SH
  ///
  if (hexKey.startsWith(p2shPrefix) && hexKey.endsWith(p2shPostfix)) {
    final pubKeyHashHex = hexKey.substring(
      p2shPrefix.length,
      hexKey.length - p2shPostfix.length,
    );
    final pubKeyHash = Uint8List.fromList(hex.decode(pubKeyHashHex));
    return (pubKeyHash, HDWalletPurpose.BIP49);
  }

  ///
  /// P2WPKH
  ///
  if (hexKey.startsWith(p2wpkhPrefix)) {
    final pubKeyHashHex = hexKey.substring(
      p2wpkhPrefix.length,
      hexKey.length,
    );
    final pubKeyHash = Uint8List.fromList(hex.decode(pubKeyHashHex));
    return (pubKeyHash, HDWalletPurpose.BIP84);
  }

  throw UnsupportedError("Address type not supported: $hexKey");
}

///
/// Returns the address from the unlocking script of a transaction input. This only works for P2PKH and P2WPKH inputs.
///
String getAddressFromInput(
  UTXONetworkType type,
  ElectrumInput input, {
  AddressType? addressType,
}) {
  final (publicKey, pubKeyAddressType) = getPubKeyFromInput(input);

  ///
  /// Allow for overriding the address type (used for BCH)
  ///
  final _addressType = switch (addressType) {
    AddressType.cashaddr when pubKeyAddressType == AddressType.legacy =>
      AddressType.cashaddr,
    _ => pubKeyAddressType
  };

  return pubKeyToAddress(publicKey, _addressType, type);
}

///
/// Returns the PublicKey from the unlocking script of a transaction input. This only works for P2PKH and P2WPKH inputs.
///
(Uint8List, AddressType) getPubKeyFromInput(
  ElectrumInput input,
) {
  final hexSig = input.scriptSig;

  ///
  /// Use ScriptSig (P2PKH)
  ///
  if (hexSig != null && hexSig.isNotEmpty) {
    if (hexSig.length < 68) {
      throw UnsupportedError("Address type not supported: $hexSig");
    }
    final redeemScriptHex = hexSig.substring(hexSig.length - 68);
    if (!redeemScriptHex.startsWith("21")) {
      // expect varInt 0x21 -> 33 byte pubkey
      throw UnsupportedError("Address type not supported: $hexSig");
    }
    final pubKeyHex = redeemScriptHex.substring(2);
    if (pubKeyHex.length != 66) {
      throw UnsupportedError("Address type not supported: $hexSig");
    }
    return (pubKeyHex.hexToBytes, AddressType.legacy);
  }

  ///
  /// Use ScriptWitness (P2WPKH)
  ///
  final witnessData = input.txinwitness;
  if (witnessData != null && witnessData.isNotEmpty) {
    // In P2WPKH witness data, the second item is the pubkey. It should start with either "02" or "03" (compressed pubkey).
    final pubKeyHex = witnessData[1];

    if (pubKeyHex.length != 66) {
      throw UnsupportedError("Address type not supported: $witnessData");
    }

    return (pubKeyHex.hexToBytes, AddressType.segwit);
  }

  throw UnsupportedError("Address type not supported: $hexSig");
}
