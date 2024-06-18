import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/ecurve.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
  final addressBase58 = base58CheckEncode(prefix, addressBuffer);
  return addressBase58;
}

AddressError? validateTronAddress({required String address}) {
  if (address.trim().length != address.length) return AddressError.WHITESPACE;

  if (address.length != 34) return AddressError.INVALID;
  if (!address.startsWith("T")) return AddressError.INVALID;

  try {
    final bytes = base58CheckDecodeWithVersion(address);
    if (bytes.length != 21) return AddressError.INVALID;
    return null;
  } catch (e) {
    return AddressError.INVALID_CHECKSUM;
  }
}

String base58ToEVM(String base58, [bool withPrefix = true]) {
  final bytes = base58CheckDecode(base58);
  return "${withPrefix ? "0x" : ""}${bytes.toHex.toLowerCase()}";
}

String base58FromEVM(String evmAddress) {
  final bytes = evmAddress.hexToBytesWithPrefix;
  return base58CheckEncode(TRON_ADDRESS_PREFIX, bytes);
}

// String base58CheckToHex(String base58) {
//   final bytes = base58CheckDecode(base58);

//   return bytes.sublist(0, bytes.length - 4).toHex;
// }

Uint8List base58ToHex(String base58) {
  final bytes = base58Decode(base58);

  return bytes;
}

String base58CheckFromHex(Uint8List input) {
  final hash0 = sha256Hash(input);
  final hash1 = sha256Hash(hash0);

  final checksum = hash1.sublist(0, 4);
  final bytesWithChecksum = Uint8List.fromList([...input, ...checksum]);

  return base58Encode(bytesWithChecksum);
}
