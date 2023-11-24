import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/function_signature.dart';
import 'package:convert/convert.dart';
import 'dart:typed_data';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('fetch human readable function signature from the api', () async {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf86982074b8504a817c80083029810946d3be2fca848393ee83b2a1d65b312889cacf5e680b84440c10f1900000000000000000000000005870f1507d820212e921e1f39f14660336231d10000000000000000000000000000000000000000000000000000000000f34344";

    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    final DecodedRLP en = decodeRLP(message, 0);

    final Uint8List data = Uint8List.fromList(hex.decode(en.result[5]));

    final contractFunction =
        await FunctionSignature.fetchFunctionSignature(data);

    expect(contractFunction.name, "mint");
    expect(contractFunction.parameters, {
      "0": "address",
      "1": "uint256",
    });
    expect(contractFunction.args?[0].value,
        "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(contractFunction.args?[1].value, BigInt.from(15942468));
  });
}
