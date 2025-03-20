import 'dart:typed_data';
import 'package:dart_bech32/dart_bech32.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/tx_structure.dart';
import 'package:walletkit_dart/src/utils/base32.dart';
import 'package:convert/convert.dart' show hex;
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

String pubKeyHexToAddress(
  String pubKeyHex,
  AddressType addressType,
  UTXONetworkType networkType,
) {
  final pubKey = Uint8List.fromList(hex.decode(pubKeyHex));
  return pubKeyToAddress(pubKey, addressType, networkType);
}

String pubKeyToAddress(
  Uint8List pubKey,
  AddressType addressType,
  UTXONetworkType networkType,
) {
  final pubKeyHash = ripmed160Sha256Hash(pubKey);

  return switch (addressType) {
    AddressType.segwit => pubKeyHashToSegwitAddress(
      pubKeyHash,
      networkType.bech32,
      networkType.pubKeyHashPrefix,
    ),
    AddressType.compatibility => pubKeyHashToP2SHAddress(
      ripmed160Sha256Hash(PayToWitnessPublicKeyHashScript(pubKeyHash).bytes),
      networkType.scriptHashPrefix,
    ),
    AddressType.legacy => pubKeyHashToLegacyAddress(
      pubKeyHash,
      networkType.pubKeyHashPrefix,
    ),
    AddressType.cashaddr => bchAddrEncode(
      hrp: networkType.bech32,
      data: pubKeyHash,
      witnessVersion: networkType.pubKeyHashPrefix,
    ),
    _ => throw UnsupportedError("Address type not supported: $addressType"),
  };
}

String pubKeyHashToAddress(
  Uint8List pubKeyHash,
  AddressType addressType,
  UTXONetworkType networkType,
) {
  return switch (addressType) {
    AddressType.segwit => pubKeyHashToSegwitAddress(
      pubKeyHash,
      networkType.bech32,
      networkType.pubKeyHashPrefix,
    ),
    AddressType.legacy => pubKeyHashToLegacyAddress(
      pubKeyHash,
      networkType.pubKeyHashPrefix,
    ),
    AddressType.cashaddr => bchAddrEncode(
      hrp: networkType.bech32,
      data: pubKeyHash,
      witnessVersion: networkType.pubKeyHashPrefix,
    ),
    _ => throw UnsupportedError("Address type not supported: $addressType"),
  };
}

///
/// Legacy Address (Base58)
///
String pubKeyHashToLegacyAddress(Uint8List pubKeyHash, int witnessVersion) {
  final data = Uint8List.fromList([witnessVersion, ...pubKeyHash]);

  return bs58check.encode(data);
}

///
/// Segwit Address (Bech32)
///
String pubKeyHashToSegwitAddress(
  Uint8List pubKeyHash,
  String bech32Prefix,
  int witnessVersion,
) {
  final words = bech32.toWords(pubKeyHash);

  final wordsWithVersion = Uint8List.fromList([0, ...words]);

  final decoded = Decoded(prefix: bech32Prefix, words: wordsWithVersion);

  try {
    bech32.encode(decoded);
  } catch (e) {
    print(e);
  }

  return bech32.encode(decoded);
}

///
/// P2SH Address (Base58)
///
String pubKeyHashToP2SHAddress(Uint8List pubKeyHash, int scriptHashPrefix) {
  return base58CheckEncode(scriptHashPrefix, pubKeyHash);
}

///
/// BCH CashAddr
///

BigInt _polymod(List<int> data) {
  List<BigInt> GENERATOR = [
    BigInt.from(0x98f2bc8e61),
    BigInt.from(0x79b76d99e2),
    BigInt.from(0xf33e5fb3c4),
    BigInt.from(0xae2eabe2a8),
    BigInt.from(0x1e4f43e470),
  ];

  BigInt checksum = BigInt.from(1);

  for (int i = 0; i < data.length; ++i) {
    int value = data[i];
    BigInt topBits = checksum >> 35;
    checksum =
        ((checksum & BigInt.from(0x07ffffffff)) << 5) ^ BigInt.from(value);

    for (int j = 0; j < GENERATOR.length; ++j) {
      if ((topBits >> j) & BigInt.from(1) == BigInt.from(1)) {
        checksum = checksum ^ GENERATOR[j];
      }
    }
  }

  return checksum ^ BigInt.from(1);
}

String bchAddrEncode({
  required String hrp,
  required int witnessVersion,
  required List<int> data,
}) {
  final prefixData = [..._prefixToUint5Array(hrp), 0].toUint8List;

  final payloadData = bech32.toWords([witnessVersion, ...data].toUint8List);

  final checksumData =
      [
        ...prefixData,
        ...payloadData,
        ...[0, 0, 0, 0, 0, 0, 0, 0],
      ].toUint8List;

  final checksumUint5List = _checksumToUint5List(
    _polymod(checksumData).toInt(),
  );

  final payload = [...payloadData, ...checksumUint5List].toUint8List;

  final base32Encoded = Base32().encode(payload);

  return "$hrp:$base32Encoded";
}

Uint8List _checksumToUint5List(int checksum) {
  final result = Uint8List(8);
  for (var i = 0; i < 8; ++i) {
    result[7 - i] = checksum & 31;
    checksum = checksum >> 5;
  }
  return result;
}

Uint8List _prefixToUint5Array(String prefix) {
  var result = new Uint8List(prefix.length);
  for (var i = 0; i < prefix.length; ++i) {
    result[i] = prefix[i].codeUnitAt(0) & 31;
  }
  return result;
}
