import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/utxo/utils/ecurve.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart';

extension BIP32Extension on BipNode {
  Uint8List get publicKeyUncompressed {
    if (privateKey == null) {
      throw UnsupportedError("privateKey is null");
    }
    return pointFromScalar(privateKey!, false)!;
  }
}

String uncompressedPublicKeyToAddress(Uint8List publicKey, int prefix) {
  final addressInput = publicKey.sublist(1);
  final publicKeyHash = keccak256(addressInput);
  final addressBuffer = publicKeyHash.sublist(12);
  final addressBase58 = base58encode(prefix, addressBuffer);
  return addressBase58;
}

AddressError? validateTronAddress({required String address}) {
  if (address.trim().length != address.length) return AddressError.WHITESPACE;

  if (address.length != 34) return AddressError.INVALID;
  if (!address.startsWith("T")) return AddressError.INVALID;

  try {
    final bytes = base58decodeWithVersion(address);
    if (bytes.length != 21) return AddressError.INVALID;
    return null;
  } catch (e) {
    return AddressError.INVALID_CHECKSUM;
  }
}

String base58ToEVM(String base58, [bool withPrefix = true]) {
  final bytes = base58decode(base58);
  return "${withPrefix ? "0x" : ""}${bytes.toHex.toLowerCase()}";
}

String base58ToHex(String base58) {
  final bytes = base58decode(base58);

  return bytes.sublist(0, bytes.length - 4).toHex;
}
