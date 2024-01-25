import 'package:test/test.dart';
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
        await FunctionSignatureWithArgs.fetchFunctionSignature(data);

    expect(contractFunction.name, "mint");
    expect(contractFunction.parameters, {
      "0": "address",
      "1": "uint256",
    });
    expect(contractFunction.args?[0].value,
        "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(contractFunction.args?[1].value, BigInt.from(15942468));
  });

  test("fetch sigature and decode bytes and bytes[]", () async {
    const String dataString =
        "3593564c000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000006563dac700000000000000000000000000000000000000000000000000000000000000020b080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000016345785d8a000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000016345785d8a00000000000000000000000000000000000000000000000018c5c71dd6f8c06a772000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000004e9fcd48af4738e3bf1382009dc1e93ebfce698f";

    final Uint8List data = Uint8List.fromList(hex.decode(dataString));

    final FunctionSignatureWithArgs contractFunction =
        await FunctionSignatureWithArgs.fetchFunctionSignature(data);

    expect(contractFunction.name, "execute");
    expect(contractFunction.parameters, {
      "0": "bytes",
      "1": "bytes[]",
      "2": "uint256",
    });
    expect(contractFunction.args?[0].value, "0x0b08");
    expect(contractFunction.args?[1].value[0],
        "0x0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000016345785d8a0000");
    expect(contractFunction.args?[1].value[1],
        "0x0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000016345785d8a00000000000000000000000000000000000000000000000018c5c71dd6f8c06a772000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000004e9fcd48af4738e3bf1382009dc1e93ebfce698f");
    expect(contractFunction.args?[2].value, BigInt.from(1701042887));
  });

  test("fetch sigature and decode bytes and bytes[] of long bytes[]", () async {
    const String dataString =
        "3593564c000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000656888cf00000000000000000000000000000000000000000000000000000000000000040b000604000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a7640000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a764000000000000000000000000000000000000000000000000000000000000774a342100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002bc02aaa39b223fe8d0a0e5c4f27ead9083c756cc20001f4a0b86991c6218b36c1d19d4a2e9eb0ce3606eb480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb4800000000000000000000000027213e28d7fda5c57fe9e5dd923818dbccf71c47000000000000000000000000000000000000000000000000000000000000000f0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000774a3421";

    final Uint8List data = Uint8List.fromList(hex.decode(dataString));

    final FunctionSignatureWithArgs contractFunction =
        await FunctionSignatureWithArgs.fetchFunctionSignature(data);

    expect(contractFunction.name, "execute");
    expect(contractFunction.parameters, {
      "0": "bytes",
      "1": "bytes[]",
      "2": "uint256",
    });
    expect(contractFunction.args?[0].value, "0x0b000604");
    expect(contractFunction.args?[1].value[0],
        "0x00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a7640000");
    expect(contractFunction.args?[1].value[1],
        "0x00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a764000000000000000000000000000000000000000000000000000000000000774a342100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002bc02aaa39b223fe8d0a0e5c4f27ead9083c756cc20001f4a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000");
    expect(contractFunction.args?[1].value[2],
        "0x000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb4800000000000000000000000027213e28d7fda5c57fe9e5dd923818dbccf71c47000000000000000000000000000000000000000000000000000000000000000f");
    expect(contractFunction.args?[1].value[3],
        "0x000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000774a3421");
    expect(contractFunction.args?[2].value, BigInt.from(1701349583));
  });
}
