import 'dart:typed_data';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/src/utils.dart' as p_utils;
import 'package:walletkit_dart/src/crypto/evm/entities/raw_transaction/signature.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/eurocoin_signing.dart';

final params = ECCurve_secp256k1();

Uint8List privateKeyToPublic(BigInt privateKey) {
  final p = (params.G * privateKey)!;
  //skip the type flag, https://github.com/ethereumjs/ethereumjs-util/blob/master/index.js#L319
  return Uint8List.view(p.getEncoded(false).buffer, 1);
}

BigInt bytesToUnsignedInt(Uint8List bytes) {
  return p_utils.decodeBigIntWithSign(1, bytes);
}

Uint8List recoverPublicKey(
  Uint8List payload,
  Signature signature, {
  bool hasSignatureYParity = false,
}) {
  final r = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(signature.r));
  final s = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(signature.s));

  assert(r.length == 32);
  assert(s.length == 32);

  final v = signature.v;
  int chainId = 0;
  int recoveryId;

  // Type 1 and Type 2 Transactions
  if (hasSignatureYParity) {
    recoveryId = signature.v; // Since V is the signature parity which is 0 or 1
  } else {
    // Handle both pre-EIP-155 and EIP-155 v values
    if (v == 27 || v == 28) {
      recoveryId = v - 27;
    } else {
      chainId = (v - 35) ~/ 2;
      recoveryId = v - (2 * chainId + 35);
    }
  }

  if (recoveryId != 0 && recoveryId != 1) {
    throw Exception('Invalid recovery id');
  }

  final sig = ECSignature(signature.r, signature.s);

  final pubKey = _recoverFromSignature(recoveryId, sig, payload, params);

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

int extractChainId(int v) {
  // Ensure `v` is a BigInt
  if (v >= 35) {
    return (v - 35) >> 1;
  } else {
    throw ArgumentError("v parameter does not contain a chain id");
  }
}

/// Given a byte array computes its compressed version and returns it as a byte array,
/// including the leading 02 or 03
Uint8List compressPublicKey(Uint8List compressedPubKey) {
  return Uint8List.view(
    params.curve.decodePoint(compressedPubKey)!.getEncoded(true).buffer,
  );
}
