import 'dart:convert';
import 'dart:typed_data';
import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:pointycastle/src/utils.dart' as p_utils;
import 'package:bip32/src/utils/ecurve.dart' as ecc;
import 'package:convert/convert.dart' as convert;

List<int> nomoIdDerivationPath(int hostId) {
  return [0, 100, 102, hostId];
}

String ec8Recover({required String message, required String sig}) {
  final messageHash = createEurocoinMessageHash(message);
  final parsedSig = _parseEc8Signature(sig);
  final pubKeyUncompressed = recoverPublicKey(messageHash, parsedSig);

  final uncompressedPrefix = [0x04];
  final pubKeyCompressed = compressPublicKey(
      Uint8List.fromList(uncompressedPrefix + pubKeyUncompressed));
  final pubKeyHex = convert.hex.encode(pubKeyCompressed);
  return pubKeyHex;
}

Signature _parseEc8Signature(String signature) {
  if (signature.startsWith("0x")) {
    throw Failure("expected to not begin with 0x");
  }
  if (signature.length != 130) {
    throw Failure("Unexpected signature length");
  }

  // Extract the r and s values
  BigInt r = BigInt.parse(signature.substring(2, 66), radix: 16);
  BigInt s = BigInt.parse(signature.substring(66, 130), radix: 16);

  // Extract the recovery identifier (v) and make it backwards-compat to the following C-code:
  // int expectedRecId = (((uint8_t *)compactSig)[0] - 27) % 4;
  BigInt v = BigInt.parse(signature.substring(0, 2), radix: 16);
  final expectedRecId = (v - BigInt.from(27)) % BigInt.from(4);
  v = expectedRecId + BigInt.from(27);

  return Signature.fromRSV(r, s, v.toInt());
}

Uint8List createEurocoinMessageHash(String message) {
  List<int> messageBytes;
  if (message.startsWith("0x")) {
    messageBytes = HEX.decode(message.substring(2));
  } else {
    messageBytes = utf8.encode(message);
  }
  final varIntLength = encodeVarint(messageBytes.length);
  final prefix = utf8.encode('\u0019Eurocoin Signed Message:\n') + varIntLength;
  final hashInput = Uint8List.fromList(prefix + messageBytes);

  return sha256Sha256Hash(hashInput);
}

Uint8List ec8SignMessage(String message, NodeWithAddress node) {
  final privateKey = node.bip32Node!.privateKey!;
  // message test vector: https://zeniq.id/safir.com/backend/qrl?n=2f24bc32c0752e835e21&r=/backend/qrll
  final messageHash = createEurocoinMessageHash(message);
  // messageHash test vector: u8	uint8_t[32]	"\xf9\x9b\xf9~\U00000015j\xf1\xd1K\U0000001a\U00000002[\U00000011\x83\U0000001ae\xeb\nH\xa0zⴞ\xa8k\xc4Tn~\x80\xe3"
  final signature =
      Signature.createSignature(messageHash, privateKey, hashPayload: false);

  final r = padUint8ListTo32(unsignedIntToBytes(signature.r));
  final s = padUint8ListTo32(unsignedIntToBytes(signature.s));
  final v = unsignedIntToBytes(BigInt.from(signature.v));

  // https://github.com/ethereumjs/ethereumjs-util/blob/8ffe697fafb33cefc7b7ec01c11e3a7da787fe0e/src/signature.ts#L63
  return uint8ListFromList(v + r + s);
}

String _derivationPathToString(List<int> derivationPath) {
  String path = "m";
  for (final rawInt in derivationPath) {
    int i = rawInt;
    bool hardened = false;
    if (rawInt < 0) {
      i += 0x80000000;
      hardened = true;
    } else if (rawInt >= 0x80000000) {
      i -= 0x80000000;
      hardened = true;
    }
    path += "/" + i.toString();
    if (hardened) {
      path += "'";
    }
  }
  return path;
}

Future<NodeWithAddress> deriveBIP32Ec8({
  required List<int> derivationPath,
  required Uint8List seed,
}) async {
  final String derivationPathString = _derivationPathToString(derivationPath);

  bip32.BIP32 seedNode = bip32.BIP32.fromSeed(seed);
  final bip32.BIP32 childNode = seedNode.derivePath(derivationPathString);

  const compressed = false; // needed for address backwards compat
  final publicKey = ecc.pointFromScalar(childNode.privateKey!, compressed)!;
  final address = pubKeyToAddress(
    publicKey,
    AddressType.legacy,
    EurocoinNetwork,
  );

  return ChangeNode(
    bip32Node: childNode,
    address: address,
    derivationPath: "", //
    addresses: {AddressType.legacy: address},
    walletPurpose: HDWalletPurpose.BIP44,
    publicKey: childNode.publicKey.toHex,
  );
}

Uint8List uint8ListFromList(List<int> data) {
  if (data is Uint8List) return data;

  return Uint8List.fromList(data);
}

Uint8List padUint8ListTo32(Uint8List data) {
  assert(data.length <= 32);
  if (data.length == 32) return data;

  return Uint8List(32)..setRange(32 - data.length, 32, data);
}

Uint8List unsignedIntToBytes(BigInt number) {
  assert(!number.isNegative);
  return p_utils.encodeBigIntAsUnsigned(number);
}

Uint8List encodeVarint(int value) {
  final List<int> result = [];

  if (value < 0xFD) {
    result.add(value);
  } else if (value <= 0xFFFF) {
    result.addAll([0xFD, value & 0xFF, (value >> 8) & 0xFF]);
  } else if (value <= 0xFFFFFFFF) {
    result.addAll([
      0xFE,
      value & 0xFF,
      (value >> 8) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 24) & 0xFF
    ]);
  } else {
    result.addAll([
      0xFF,
      value & 0xFF,
      (value >> 8) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 24) & 0xFF,
      (value >> 32) & 0xFF,
      (value >> 40) & 0xFF,
      (value >> 48) & 0xFF,
      (value >> 56) & 0xFF,
    ]);
  }
  return Uint8List.fromList(result);
}
