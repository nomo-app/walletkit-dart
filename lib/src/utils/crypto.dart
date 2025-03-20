import 'dart:typed_data';
import 'package:pointycastle/export.dart';

///
/// Ripmed160 Hash of Sha256 Hash
///
Uint8List ripmed160Sha256Hash(Uint8List buffer) {
  final ripmed160 = RIPEMD160Digest();
  final sha256 = SHA256Digest();
  return ripmed160.process(sha256.process(buffer));
}

///
/// Ripmed160 Hash
///
Uint8List ripmed160Hash(Uint8List buffer) {
  final ripmed160 = RIPEMD160Digest();

  return ripmed160.process(buffer);
}

///
/// Sha256 Hash of Sha256 Hash
///
Uint8List sha256Sha256Hash(Uint8List buffer) {
  final sha256 = SHA256Digest();
  return sha256.process(sha256.process(buffer));
}

///
/// Sha256 Hash
///
Uint8List sha256Hash(Uint8List buffer) {
  final sha256 = SHA256Digest();
  return sha256.process(buffer);
}

///
/// HMAC Sha256
///
Uint8List hmacSHA512(Uint8List key, Uint8List data) {
  final hmac = HMac(SHA512Digest(), 128)..init(KeyParameter(key));
  return hmac.process(data);
}
