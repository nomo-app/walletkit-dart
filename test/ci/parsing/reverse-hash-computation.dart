import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/function_signature.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('extract functionSignature mint from the transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf86982074b8504a817c80083029810946d3be2fca848393ee83b2a1d65b312889cacf5e680b84440c10f1900000000000000000000000005870f1507d820212e921e1f39f14660336231d10000000000000000000000000000000000000000000000000000000000f34344";
    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    final DecodedRLP en = decodeRLP(message, 0);

    final Uint8List data = Uint8List.fromList(hex.decode(en.result[5]));

    final FunctionSignature functionSignature =
        FunctionSignature.decodeDataField(data);

    expect(functionSignature.name, "mint");
    expect(functionSignature.parameters, {
      "to": "address",
      "amount": "uint256",
    });
  });
}
