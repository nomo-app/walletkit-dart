import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/utils/der.dart';

final chainCode = Uint8List.fromList(
  [
    110,
    140,
    176,
    151,
    208,
    44,
    205,
    123,
    201,
    45,
    202,
    138,
    165,
    82,
    94,
    84,
    81,
    35,
    224,
    194,
    214,
    76,
    30,
    250,
    81,
    19,
    165,
    200,
    31,
    25,
    140,
    98
  ],
);

void main() {
  test('Bitcoin Unlocking Script P2PKH', () {
    const sigHashHex =
        "5345eb4e8f7d99cb2b591909c25ec4f549db0551bfd7829af0d250823f28e007";
    final sigHash = Uint8List.fromList(hex.decode(sigHashHex));

    final privateKey = Uint8List.fromList(
      hex.decode(
        "77306bb02155b0d8ed8d854ecb2d38a185ca737c3d3d68c25643c47e9a24b4ec",
      ),
    );
    final bip32 = BIP32.fromPrivateKey(privateKey, chainCode);

    final sigHashRev = Uint8List.fromList(sigHash.reversed.toList());
    final sig = bip32.sign(sigHashRev);

    final scriptSig = encodeSignature(sig, 1);
    final scriptSigHex = hex.encode(scriptSig);

    expect(
      scriptSigHex,
      "3045022100886d3d8b0d4974cfea745aa4a5fb1a85055f9c726991933f92f796103f0b85000220345729220221a3080a1bbd3f3d7801227af2a713261c38de70fdc960ef91255101",
    );
  });

  ///
  /// TODO: Add Tests for ZENIQ and BCH
  ///
}
