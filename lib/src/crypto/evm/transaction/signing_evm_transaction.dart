import 'dart:typed_data';

import 'package:pointycastle/export.dart';
import 'package:sec/sec.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:pointycastle/src/utils.dart' as p_utils;
import 'package:web3dart/crypto.dart';

class Signature {
  final BigInt r;
  final BigInt s;
  final int v;

  Signature(this.r, this.s, this.v);

  @override
  String toString() {
    return 'Signature{r: $r, s: $s, v: $v}';
  }
}

Signature signEVMTransaction(
  Uint8List payload,
  Uint8List seed, {
  bool isEIP1559 = false,
  int? chainId,
}) {
  final privateKey = derivePrivateKeyETH(seed);

  final digest = SHA256Digest();
  final signer = ECDSASigner(null, HMac(digest, 64));
  final params = ECCurve_secp256k1();
  final key = ECPrivateKey(bytesToUnsignedInt(privateKey), params);
  signer.init(true, PrivateKeyParameter(key));

  payload = keccak256(payload);

  var sig = signer.generateSignature(payload) as ECSignature;

  if (sig.s.compareTo(params.n >> 1) > 0) {
    final canonicalS = params.n - sig.s;
    sig = ECSignature(sig.r, canonicalS);
  }

  final publickey = bytesToUnsignedInt(
      _privateKeyToPublic(bytesToUnsignedInt(privateKey), params));

  final rcID = EC.secp256k1.calculateRecoveryId(publickey, sig, payload);

  if (rcID == null) {
    throw Exception('Failed to calculate recovery id');
  }
  final signature = Signature(sig.r, sig.s, rcID + 27);

  int chainIdV;

  if (isEIP1559) {
    chainIdV = signature.v - 27;
  } else {
    chainIdV =
        chainId != null ? (signature.v - 27 + (chainId * 2 + 35)) : signature.v;
  }

  return Signature(signature.r, signature.s, chainIdV);
}

Uint8List _privateKeyToPublic(BigInt privateKey, ECCurve_secp256k1 params) {
  final p = (params.G * privateKey)!;
  //skip the type flag, https://github.com/ethereumjs/ethereumjs-util/blob/master/index.js#L319
  return Uint8List.view(p.getEncoded(false).buffer, 1);
}

BigInt bytesToUnsignedInt(Uint8List bytes) {
  return p_utils.decodeBigIntWithSign(1, bytes);
}
