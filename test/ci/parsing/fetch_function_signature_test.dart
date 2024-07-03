import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';
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
        await ContractFunctionWithValues.decodeRawWithFetch(data: data);

    expect(contractFunction.name, "mint");
    expect(contractFunction.parameters.first.type, FunctionParamAddress());
    expect(contractFunction.parameters.first.value,
        "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(contractFunction.parameters.last.type, FunctionParamUint256());
    expect(contractFunction.parameters.last.value, BigInt.from(15942468));
  });

  test("fetch sigature and decode bytes and bytes[]", () async {
    const String dataString =
        "3593564c000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000006563dac700000000000000000000000000000000000000000000000000000000000000020b080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000016345785d8a000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000016345785d8a00000000000000000000000000000000000000000000000018c5c71dd6f8c06a772000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000004e9fcd48af4738e3bf1382009dc1e93ebfce698f";

    final Uint8List data = Uint8List.fromList(hex.decode(dataString));

    final contractFunction =
        await ContractFunctionWithValues.decodeRawWithFetch(data: data);

    expect(contractFunction.name, "execute");
    expect(contractFunction.parameters.first.type, FunctionParamBytes());
    expect(
        (contractFunction.parameters.first.value as Uint8List).toHex, "0b08");
    expect(contractFunction.parameters[1].type, FunctionParamBytesArray());
    expect((contractFunction.parameters[1].value[0] as Uint8List).toHex,
        "0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000016345785d8a0000");
    expect((contractFunction.parameters[1].value[1] as Uint8List).toHex,
        "0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000016345785d8a00000000000000000000000000000000000000000000000018c5c71dd6f8c06a772000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000004e9fcd48af4738e3bf1382009dc1e93ebfce698f");
    expect(contractFunction.parameters.last.type, FunctionParamUint256());
    expect(contractFunction.parameters.last.value, BigInt.from(1701042887));
  });

  test("fetch sigature and decode bytes and bytes[] of long bytes[]", () async {
    const String dataString =
        "3593564c000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000656888cf00000000000000000000000000000000000000000000000000000000000000040b000604000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a7640000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a764000000000000000000000000000000000000000000000000000000000000774a342100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002bc02aaa39b223fe8d0a0e5c4f27ead9083c756cc20001f4a0b86991c6218b36c1d19d4a2e9eb0ce3606eb480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb4800000000000000000000000027213e28d7fda5c57fe9e5dd923818dbccf71c47000000000000000000000000000000000000000000000000000000000000000f0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000774a3421";

    final Uint8List data = Uint8List.fromList(hex.decode(dataString));

    final contractFunction =
        await ContractFunctionWithValues.decodeRawWithFetch(data: data);

    expect(contractFunction.name, "execute");
    expect(contractFunction.parameters.first.type, FunctionParamBytes());
    expect((contractFunction.parameters.first.value as Uint8List).toHex,
        "0b000604");
    expect(contractFunction.parameters[1].type, FunctionParamBytesArray());
    expect((contractFunction.parameters[1].value[0] as Uint8List).toHex,
        "00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a7640000");
    expect((contractFunction.parameters[1].value[1] as Uint8List).toHex,
        "00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000de0b6b3a764000000000000000000000000000000000000000000000000000000000000774a342100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002bc02aaa39b223fe8d0a0e5c4f27ead9083c756cc20001f4a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000");
    expect((contractFunction.parameters[1].value[2] as Uint8List).toHex,
        "000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb4800000000000000000000000027213e28d7fda5c57fe9e5dd923818dbccf71c47000000000000000000000000000000000000000000000000000000000000000f");
    expect((contractFunction.parameters[1].value[3] as Uint8List).toHex,
        "000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000774a3421");
    expect(contractFunction.parameters.last.type, FunctionParamUint256());
    expect(contractFunction.parameters.last.value, BigInt.from(1701349583));
  });

  test("Test Tuples", () async {
    // https://etherscan.io/tx/0x17531ea3be7d2d61391ac22c8bf1bedaa557af05704a1597691a94098e1cb312
    String dataString =
        "0x3dbe1c55000000000000000000000000d08bb564b3af10c657d00b2e97c1611e3692b8ca000000000000000000000000a96febd6c5faf7739d3149bfb43211ec6844a37c00000000000000000000000000000000000000000000000006296034c935583000000000000000000000000000000000000000000000000003403fc6762f6e1b00000000000000000000000000000000000000000000000000000000000000a00000000000000000000000007a4effd87c2f3c55ca251080b1343b605f327e3a0000000000000000000000000000000000000000000000000c34d5d6fdb280d30000000000000000000000007a4effd87c2f3c55ca251080b1343b605f327e3a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    var contractFunction = await ContractFunctionWithValues.decodeRawWithFetch(
      data: dataString.hexToBytesWithPrefix,
    );

    expect(contractFunction.name, "addLiquiditySingleTokenKeepYt");
    expect(contractFunction.parameters[0].type, FunctionParamAddress());
    expect(contractFunction.parameters[0].value,
        "0xD08Bb564b3Af10c657d00b2E97C1611E3692B8CA".toLowerCase());
    expect(contractFunction.parameters[1].type, FunctionParamAddress());
    expect(contractFunction.parameters[1].value,
        "0xa96febd6c5faf7739d3149bfb43211ec6844a37c".toLowerCase());
    expect(contractFunction.parameters[2].type, FunctionParamUint256());
    expect(
        contractFunction.parameters[2].value, BigInt.from(443991818102986800));
    expect(contractFunction.parameters[3].type, FunctionParamUint256());
    expect(
        contractFunction.parameters[3].value, BigInt.from(234257302242160155));
    expect(
      contractFunction.parameters[4].type,
      TupleFunctionParamType(
          "(address,uint256,address,address,(uint8,address,bytes,bool))", [
        FunctionParamAddress(),
        FunctionParamUint256(),
        FunctionParamAddress(),
        FunctionParamAddress(),
        TupleFunctionParamType(
          "",
          [
            FunctionParamAddress(),
            FunctionParamUint256(),
            FunctionParamAddress(),
            FunctionParamAddress(),
            TupleFunctionParamType(
              "(uint8,address,bytes,bool)",
              [
                FunctionParamUint8(),
                FunctionParamAddress(),
                FunctionParamBytes(),
                FunctionParamBool(),
              ],
            ),
          ],
        ),
      ]),
    );
    expect(
      contractFunction.parameters[4].value,
      [
        "0x7a4effd87c2f3c55ca251080b1343b605f327e3a",
        BigInt.from(879562946600141011),
        "0x7a4effd87c2f3c55ca251080b1343b605f327e3a",
        "0x0000000000000000000000000000000000000000",
        [
          BigInt.zero,
          "0x0000000000000000000000000000000000000000",
          Uint8List(0),
          false,
        ],
      ],
    );

    // https://etherscan.io/tx/0x70118425d4e2570d09cf2a63ca852213a9e021a9cc06061b64e8aacb1c496336
    dataString =
        "0x3f8fc2330000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000458179a8c5c75673d733f714ccce11ccfcd35e22139addd9c270318fa9067500c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001af78260b41491153b1cca7d54b4b968db26d3e67b881abfa451f1e030b9731db000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000017815cf042f814bba091dd59f4a9f2565d0361621ca00a8b63b050ec045f4e1a50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000117c90af00aedee74edcb44be829ed64b3b72bdacb789e94ec88e1c3415ec35e400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";

    contractFunction = await ContractFunctionWithValues.decodeRawWithFetch(
      data: dataString.hexToBytesWithPrefix,
      function: ExternalContractFunction.fromString(
        textSignature: "cancelTrades((bytes32,uint256,uint256)[])",
      ),
    );

    expect(contractFunction.name, "cancelTrades");
    expect(
      contractFunction.parameters[0].type,
      ArrayFunctionParamType(
        "(bytes32,uint256,uint256)[]",
        TupleFunctionParamType(
          "(bytes32,uint256,uint256)",
          [
            FunctionParamBytes32(),
            FunctionParamUint256(),
            FunctionParamUint256(),
          ],
        ),
      ),
    );
    expect(
      contractFunction.parameters[0].value,
      [
        [
          "0x58179a8c5c75673d733f714ccce11ccfcd35e22139addd9c270318fa9067500c"
              .hexToBytesWithPrefix,
          BigInt.from(0),
          BigInt.from(1),
        ],
        [
          "0xaf78260b41491153b1cca7d54b4b968db26d3e67b881abfa451f1e030b9731db"
              .hexToBytesWithPrefix,
          BigInt.from(0),
          BigInt.from(1),
        ],
        [
          "0x7815cf042f814bba091dd59f4a9f2565d0361621ca00a8b63b050ec045f4e1a5"
              .hexToBytesWithPrefix,
          BigInt.from(0),
          BigInt.from(1),
        ],
        [
          "0x17c90af00aedee74edcb44be829ed64b3b72bdacb789e94ec88e1c3415ec35e4"
              .hexToBytesWithPrefix,
          BigInt.from(0),
          BigInt.from(1),
        ],
      ],
    );
  });

  ///
  /// uint256[][]
  ///
  test("Test Nested Array", () async {});

  test("adssad", () {
    ExternalContractFunction.extractParams(
      "address,address,uint256,uint256,(address,address,(uint8,bool)), (bool, bool), (bool, (bool, bool))",
    );
  });
}
