import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
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

    final FunctionSignatureWithArgs functionSignature =
        FunctionSignatureWithArgs.fromData(data);

    expect(functionSignature.name, "mint");
    expect(functionSignature.parameters, {
      "to": "address",
      "amount": "uint256",
    });

    expect(functionSignature.args?[0].value,
        "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(functionSignature.args?[1].value, BigInt.from(15942468));
  });

  test('Test for data field with claim event', () {
    const String dataString =
        "6ba4c1380000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002200000000000000000000000000000000000000000000000000000000000021c4000000000000000000000000000000000000000000000000000000000000220d000000000000000000000000000000000000000000000000000000000000234b000000000000000000000000000000000000000000000000000000000000234c00000000000000000000000000000000000000000000000000000000000023500000000000000000000000000000000000000000000000000000000000002351000000000000000000000000000000000000000000000000000000000000235300000000000000000000000000000000000000000000000000000000000023650000000000000000000000000000000000000000000000000000000000002375000000000000000000000000000000000000000000000000000000000000239a000000000000000000000000000000000000000000000000000000000000239b000000000000000000000000000000000000000000000000000000000000239c000000000000000000000000000000000000000000000000000000000000239e00000000000000000000000000000000000000000000000000000000000023c800000000000000000000000000000000000000000000000000000000000023c900000000000000000000000000000000000000000000000000000000000026780000000000000000000000000000000000000000000000000000000000002679000000000000000000000000000000000000000000000000000000000000277c000000000000000000000000000000000000000000000000000000000000277d00000000000000000000000000000000000000000000000000000000000027c700000000000000000000000000000000000000000000000000000000000027c800000000000000000000000000000000000000000000000000000000000027c900000000000000000000000000000000000000000000000000000000000027ca00000000000000000000000000000000000000000000000000000000000027f8000000000000000000000000000000000000000000000000000000000000283c0000000000000000000000000000000000000000000000000000000000002b350000000000000000000000000000000000000000000000000000000000002b360000000000000000000000000000000000000000000000000000000000002b4a0000000000000000000000000000000000000000000000000000000000002bd10000000000000000000000000000000000000000000000000000000000002c0a0000000000000000000000000000000000000000000000000000000000002f4e00000000000000000000000000000000000000000000000000000000000036520000000000000000000000000000000000000000000000000000000000003735000000000000000000000000000000000000000000000000000000000000373e";

    final Uint8List data = Uint8List.fromList(hex.decode(dataString));

    final FunctionSignatureWithArgs functionSignature =
        FunctionSignatureWithArgs.fromData(data);

    expect(
        functionSignature.args?[0].value,
        [
          8644,
          8717,
          9035,
          9036,
          9040,
          9041,
          9043,
          9061,
          9077,
          9114,
          9115,
          9116,
          9118,
          9160,
          9161,
          9848,
          9849,
          10108,
          10109,
          10183,
          10184,
          10185,
          10186,
          10232,
          10300,
          11061,
          11062,
          11082,
          11217,
          11274,
          12110,
          13906,
          14133,
          14142
        ].toBigIntList);
  });

  test('extract functionSignature mint with more params from the transaction',
      () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf9023282075d8504a817c80083029810944a9e707fc2abf8fcf840054f250e5416a3d8608b80b90204d63a47d600000000000000000000000005870f1507d820212e921e1f39f14660336231d10000000000000000000000000000000000000000000000000000000000f3434400000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000001a00000000000000000000000000000000000000000000000000000000000000017000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000d4172726179456c656d656e743100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d4172726179456c656d656e7432000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000742d35cc6634c0532925a3b844bc454e4438f44e000000000000000000000000742d35cc6634c0532925a3b844bc454e4438f44e8559454e49518080";

    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    final DecodedRLP en = decodeRLP(message, 0);

    final Uint8List data = Uint8List.fromList(hex.decode(en.result[5]));

    final FunctionSignatureWithArgs functionSignature =
        FunctionSignatureWithArgs.fromData(data);

    expect(functionSignature.name, "mint");
    expect(functionSignature.parameters, {
      "_to": "address",
      "_amount": "uint256",
      "_amounts": "bytes[]",
      "_collect": "bool",
      "_addresses": "address[]",
      "_intParam": "int256"
    });
    expect(functionSignature.args?[0].name, "_to");
    expect(functionSignature.args?[0].value,
        "0x05870f1507d820212e921e1f39f14660336231d1");

    expect(functionSignature.args?[1].name, "_amount");
    expect(functionSignature.args?[1].value, BigInt.from(15942468));

    expect(functionSignature.args?[2].name, "_amounts");
    expect(functionSignature.args?[2].value,
        ["0x4172726179456c656d656e7431", "0x4172726179456c656d656e7432"]);

    expect(functionSignature.args?[3].name, "_collect");
    expect(functionSignature.args?[3].value, true);

    expect(functionSignature.args?[4].name, "_addresses");
    expect(functionSignature.args?[4].value, [
      '0x742d35cc6634c0532925a3b844bc454e4438f44e',
      '0x742d35cc6634c0532925a3b844bc454e4438f44e'
    ]);

    expect(functionSignature.args?[5].name, "_intParam");
    expect(functionSignature.args?[5].value, BigInt.from(23));
  });
}
