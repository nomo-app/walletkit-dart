import 'dart:typed_data';

import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/src/utils.dart' as p_utils;
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final params = ECCurve_secp256k1();

Uint8List privateKeyToPublic(BigInt privateKey) {
  final p = (params.G * privateKey)!;
  //skip the type flag, https://github.com/ethereumjs/ethereumjs-util/blob/master/index.js#L319
  return Uint8List.view(p.getEncoded(false).buffer, 1);
}

BigInt bytesToUnsignedInt(Uint8List bytes) {
  return p_utils.decodeBigIntWithSign(1, bytes);
}

Uint8List recoverPublicKey(Uint8List payload, Signature signature) {
  final r = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(signature.r));
  final s = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(signature.s));

  assert(r.length == 32);
  assert(s.length == 32);

  final header = signature.v & 0xFF;

  if (header < 27 || header > 34) {
    throw Exception('Invalid header');
  }

  final sig = ECSignature(signature.r, signature.s);

  final recID = header - 27;

  final pubKey = _recoverFromSignature(recID, sig, payload, params);

  if (pubKey == null) {
    throw Exception('Failed to recover public key');
  }

  return unsignedIntToBytes(pubKey);
}

ECPoint _decompressKey(BigInt xBN, bool yBit, ECCurve c) {
  List<int> x9IntegerToBytes(BigInt s, int qLength) {
    //https://github.com/bcgit/bc-java/blob/master/core/src/main/java/org/bouncycastle/asn1/x9/X9IntegerConverter.java#L45
    final bytes = p_utils.encodeBigInt(s);

    if (qLength < bytes.length) {
      return bytes.sublist(0, bytes.length - qLength);
    } else if (qLength > bytes.length) {
      final tmp = List<int>.filled(qLength, 0);

      final offset = qLength - bytes.length;
      for (var i = 0; i < bytes.length; i++) {
        tmp[i + offset] = bytes[i];
      }

      return tmp;
    }

    return bytes;
  }

  final compEnc = x9IntegerToBytes(xBN, 1 + ((c.fieldSize + 7) ~/ 8));
  compEnc[0] = yBit ? 0x03 : 0x02;
  return c.decodePoint(compEnc)!;
}

BigInt? _recoverFromSignature(
  int recId,
  ECSignature sig,
  Uint8List msg,
  ECDomainParameters params,
) {
  final n = params.n;
  final i = BigInt.from(recId ~/ 2);
  final x = sig.r + (i * n);

  //Parameter q of curve
  final prime = BigInt.parse(
    'fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f',
    radix: 16,
  );
  if (x.compareTo(prime) >= 0) return null;

  final R = _decompressKey(x, (recId & 1) == 1, params.curve);
  if (!(R * n)!.isInfinity) return null;

  final e = bytesToUnsignedInt(msg);

  final eInv = (BigInt.zero - e) % n;
  final rInv = sig.r.modInverse(n);
  final srInv = (rInv * sig.s) % n;
  final eInvrInv = (rInv * eInv) % n;

  final q = (params.G * eInvrInv)! + (R * srInv);

  final bytes = q!.getEncoded(false);
  return bytesToUnsignedInt(bytes.sublist(1));
}
