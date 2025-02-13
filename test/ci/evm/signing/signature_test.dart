import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../utils.dart';

void main() {
  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  final message =
      Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));

  final testSeed = loadFromEnv("DEV_SEED");
  final privateKey =
      derivePrivateKeyETH(testSeed, ethereumBip44HDPath.defaultPath);

  test(
    "Test Serialization and Deserialization of Signature",
    () {
      final signature = Signature.createSignature(message, privateKey);

      final signature_v2 = Signature.fromHex(signature.hex);

      expect(signature.bytes, signature_v2.bytes);
      expect(signature.r, signature_v2.r);
      expect(signature.s, signature_v2.s);
      expect(signature.v, signature_v2.v);
    },
  );
}
