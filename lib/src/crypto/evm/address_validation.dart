import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/utils/general.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:convert/convert.dart' as convert;

String toChecksumAddress(String address) {
  if (!address.startsWith("0x")) {
    throw ArgumentError("not an EVM address");
  }
  final stripAddress = address.replaceFirst("0x", "").toLowerCase();
  final Uint8List keccakHash = keccakUtf8(stripAddress);
  final String keccakHashHex = convert.hex.encode(keccakHash);

  String checksumAddress = "0x";
  for (var i = 0; i < stripAddress.length; i++) {
    final bool high = int.parse(keccakHashHex[i], radix: 16) >= 8;
    checksumAddress += (high ? stripAddress[i].toUpperCase() : stripAddress[i]);
  }
  return checksumAddress;
}

enum AddressError {
  /// we consider it as an error if addresses contain whitespace
  WHITESPACE,

  /// garbage addresses that are not valid on any chain
  INVALID,

  /// address that looks valid although it is invalid
  INVALID_CHECKSUM,

  /// address is valid on another chain
  WRONG_CHAIN,

  /// addresses that are valid, but not yet supported
  NOT_SUPPORTED,
}

/**
 * Returns null if the address is valid, otherwise returns an AddressError
 */
AddressError? validateAddress({
  required String address,
  required TokenEntity token,
}) {
  return switch (token) {
    _ when token.isUTXO =>
      validateUTXOAddress(address: address, token: token).$1,
    tron => validateTronAddress(address: address),
    _ => validateEVMAddress(address: address),
  };
}

(AddressError?, UTXONetworkType?) validateAddressAnyChain({
  required String address,
}) {
  final AddressError? evmError = validateEVMAddress(address: address);
  if (evmError == null) {
    return (null, null);
  }
  final AddressError? tronError = validateTronAddress(address: address);
  if (tronError == null) {
    return (null, null);
  }
  return validateUTXOAddress(address: address, token: null);
}

(AddressError?, UTXONetworkType?) validateUTXOAddress({
  required String address,
  required TokenEntity? token,
}) {
  if (address.trim().length != address.length) {
    return (AddressError.WHITESPACE, null);
  }

  try {
    // this is the main-check: see if an output-script can be generated
    P2Hash(address).publicKeyScript;
  } catch (e) {
    if (address.startsWith("0x")) {
      return (AddressError.WRONG_CHAIN, null);
    } else if (e.toString().contains("checksum")) {
      return (AddressError.INVALID_CHECKSUM, null);
    } else {
      return (AddressError.INVALID, null);
    }
  }

  if (token?.isUTXO ?? false) if (!address.startsWithAny(
      UTXO_Network_List.singleWhereOrNull((net) => net.coin == token)!
          .addressPrefixes
          .values
          .toList())) {
    return (AddressError.WRONG_CHAIN, null);
  }

  final network = UTXO_Network_List.singleWhereOrNull(
    (net) => address.startsWithAny(net.addressPrefixes.values.toList()),
  );

  return (null, network); // successful validation
}

AddressError? validateEVMAddress({required String address}) {
  if (address.trim().length != address.length) {
    return AddressError.WHITESPACE;
  }
  if (!address.startsWith("0x")) {
    final utxoError = validateUTXOAddress(address: address, token: null).$1;
    if (utxoError == null) {
      return AddressError.WRONG_CHAIN;
    } else {
      return AddressError.INVALID;
    }
  }
  try {
    _validate(address);
    return null;
  } catch (e) {
    if (e.toString().contains("not EIP-55 conformant")) {
      return AddressError.INVALID_CHECKSUM;
    } else {
      return AddressError.INVALID;
    }
  }
}

final RegExp _basicAddress =
    RegExp(r'^(0x)?[0-9a-f]{40}$', caseSensitive: false);

void _validate(String address) {
  // Basic address validation
  if (!_basicAddress.hasMatch(address)) {
    throw ArgumentError.value(
      address,
      'address',
      'Must be a hex string with a length of 40, optionally prefixed with "0x"',
    );
  }

  final cleanAddress =
      address.startsWith('0x') ? address.substring(2) : address;

  if (cleanAddress.toUpperCase() == cleanAddress ||
      cleanAddress.toLowerCase() == cleanAddress) {
    return;
  }

  // Perform EIP-55 checksum validation
  _validateEIP55Checksum(address);
}

void _validateEIP55Checksum(String address) {
  // Strip the '0x' prefix if present
  final cleanAddress =
      address.startsWith('0x') ? address.substring(2) : address;

  // Convert to lowercase and compute the hash
  final hash = keccakAscii(cleanAddress.toLowerCase()).toHex;
  for (var i = 0; i < 40; i++) {
    final hashedPos = int.parse(hash[i], radix: 16);
    if ((hashedPos > 7 && cleanAddress[i].toUpperCase() != cleanAddress[i]) ||
        (hashedPos <= 7 && cleanAddress[i].toLowerCase() != cleanAddress[i])) {
      throw ArgumentError(
        'Address has invalid case-characters and is'
        'thus not EIP-55 conformant, rejecting. Address was: $address',
      );
    }
  }
}
