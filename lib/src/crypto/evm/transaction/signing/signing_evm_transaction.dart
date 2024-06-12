import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:sec/sec.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:pointycastle/src/utils.dart' as p_utils;

class Signature {
  final BigInt r;
  final BigInt s;
  final int v;

  const Signature(this.r, this.s, this.v);

  @override
  String toString() {
    return 'Signature{r: $r, s: $s, v: $v}';
  }

  factory Signature.fromRSV(BigInt r, BigInt s, int v) {
    return Signature(r, s, v);
  }

  factory Signature.createSignature(
    Uint8List payload,
    Uint8List privateKey, {
    bool isEIP1559 = false,
    int? chainId,
    bool hashPayload = true,
  }) {
    final digest = SHA256Digest();
    final signer = ECDSASigner(null, HMac(digest, 64));
    final params = ECCurve_secp256k1();
    final key = ECPrivateKey(bytesToUnsignedInt(privateKey), params);
    signer.init(true, PrivateKeyParameter(key));

    if (hashPayload) {
      payload = keccak256(payload);
    }
    var sig = signer.generateSignature(payload) as ECSignature;

    if (sig.s.compareTo(params.n >> 1) > 0) {
      final canonicalS = params.n - sig.s;
      sig = ECSignature(sig.r, canonicalS);
    }

    final publickey =
        bytesToUnsignedInt(privateKeyToPublic(bytesToUnsignedInt(privateKey)));

    final rcID = EC.secp256k1.calculateRecoveryId(publickey, sig, payload);

    if (rcID == null) {
      throw Exception('Failed to calculate recovery id');
    }
    final signature = Signature(sig.r, sig.s, rcID + 27);

    int chainIdV;

    if (isEIP1559) {
      chainIdV = signature.v - 27;
    } else {
      chainIdV = chainId != null
          ? (signature.v - 27 + (chainId * 2 + 35))
          : signature.v;
    }

    return Signature(signature.r, signature.s, chainIdV);
  }

  bool isValidETHSignature(
    Uint8List payload,
    Uint8List publicKey,
  ) {
    payload = keccak256(payload);
    final recoverdPublicKey = recoverPublicKey(payload, this);

    return recoverdPublicKey.toHex == publicKey.toHex;
  }

  Uint8List toBytes() {
    final rBytes = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(r));
    final sBytes = padUint8ListTo32(p_utils.encodeBigIntAsUnsigned(s));

    return Uint8List.fromList([...rBytes, ...sBytes, v]);
  }
}
