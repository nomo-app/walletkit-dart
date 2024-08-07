import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/domain/repository/function_selector_repository.dart';
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

    // https://etherscan.io/tx/0xaed20c6930ee87b852780ca5d81970ac946ad1a44b42f0f6f3b0a2200aa72818

    // https://etherscan.io/tx/0x92632ffa61e1e846b93fa2ba9e3baf13aed68bfa75a8f66a1158d91d03d2106c
  });

  test("submitInitial(tuple commitment,uint256[] bitfield,tuple proof)",
      () async {
    // https://etherscan.io/tx/0x2185df99024f13bd4c8098c8d151c3453f934695f9103cc71226b773c1724772

    String dataString =
        "0xbb51f1eb0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000001e00000000000000000000000000000000000000000000000000000000001480dc900000000000000000000000000000000000000000000000000000000000003310000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000206d6800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000020835938ba48f833d14566c77bb3c1b9d4cd7358dc7bf8d76d398d7a1d49d7d1670000000000000000000000000000000000000000000000000000000000000002bdcb0f2d9596c592dbbfffe9744ffdaf6512bd39bea7e59fafaffbff8caf6fff0000000000000000000000000000000000000000000000000000015faddad7f9000000000000000000000000000000000000000000000000000000000000001bb7377f2a1fe0f513634a236cea99261cac53a762041cf67c20b7a916ce88b6ce515544fc13da37b29506f4f061905392f41aab976810a41a193744d984de943500000000000000000000000000000000000000000000000000000000000000bb0000000000000000000000005710fee4554a33a8a0ac679ad50309a4064f684000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000009c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a4708c32d03ac21086c89925ee5a7cba890241a9ad2ecad22a69097ec2dbf1f57ef1d734da99176569e4df389447042d1bb480d569dcf556611bd0b48bb51ee632d29fc01da9a4d7e3c90345ce38fd6e14a504b5ba278570044ad8c759962a34f59fcd03274ac49b76ee2ac99179a7f8e9c491b5ef2b2a33ad6f13acf0196b5a0b790999b3ce0e3d188741d975499e22c690e65f8a50c30aec4d0f66411a8b6ae1862af4821ae0b82482e80dfcc4828f70bc7d5038955bfe48af237b5b176acab6ef921021bdb19b8b147a4d1b4b27add82e4f17f33aa3611563ad8669043e1abe372f686441fd5a2e9f2e84a103c3a5e3ec06eb7bb5d17449e8a1449a58c38ff0ef";

    final contractFunction =
        await ContractFunctionWithValues.decodeRawWithFetch(
      data: dataString.hexToBytesWithPrefix,
    );

    expect(contractFunction.name, "submitInitial");
  });

  test(
      'https://etherscan.io/tx/0xc8aa827fa1fcaf50a8e8945584ad16e8b1e7d3890918d62903622ae6fc886b54',
      () async {
    final contractFunction =
        await ContractFunctionWithValues.decodeRawWithFetch(
      data:
          "0x13d79a0b0000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000012000000000000000000000000000000000000000000000000000000000000001c000000000000000000000000000000000000000000000000000000000000003e00000000000000000000000000000000000000000000000000000000000000004000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000001bc3bafb479cf00000000000000000000000000000000000000000000000000000000001747e1ef5c000000000000000000000000000000000000000000000001bc3bafb479cf0000000000000000000000000000000000000000000000000000000000174876e80000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000005c02f2dfcb6537b83929596fe8a3278e237e3e7c000000000000000000000000000000000000000000000000000000174876e800000000000000000000000000000000000000000000000001bae1d29347fe96f2000000000000000000000000000000000000000000000000000000006686d721f4c17d12a7afdbf56c5ae1fad213ac36cf3499276e48f2ab768e9c6faa93a02300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000174876e800000000000000000000000000000000000000000000000000000000000000016000000000000000000000000000000000000000000000000000000000000000415402e579943a2d85182166f1ec505f3672f7719e27021f589018c0ca546905fd2672834c47293b6db931e4b406ca11d6087477e2353bf265577bdc4067d860811c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000002c0000000000000000000000000def1c0ded9bec7f1a1670819833240f027b25eff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000001e4aa77476c000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000001d27dcfc85ca3c1e2000000000000000000000000000000000000000000000000000000187280a225000000000000000000000000a69babef1ca67a37ffaf7a485dfff3382056e78c0000000000000000000000009008d19f58aabd9ed0d60971565aa8510560ab41000000000000000000000000e3067c7c27c1038de4e8ad95a83b927d23dfbd990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006686d0ba01ffffffffffffffffffffffffffffffffffffff348caea26686d0560000003f0000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000001ce0fd5d9a853ecfab33b09da09b896cb62349d70e0575da64b52cc408216910aa48a3cc1667816cbc21ba7abda098ab0aff4b2a02223e2e3dad3544c7e0766b960000000000000000000000000000000000000000000000000000001747e1ef5c00000000000000000000000000000000000000000000000000000000000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000242e1a7d4d000000000000000000000000000000000000000000000001bc3bafb479cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008ac3f9"
              .hexToBytesWithPrefix,
    ); // This is actually not 0xc8aa827fa1fcaf50a8e8945584ad16e8b1e7d3890918d62903622ae6fc886b54 but a different transaction using the same function signature

    expect(contractFunction.name, "settle");
    expect(contractFunction.parameters[0].type, FunctionParamAddressArray());
    expect(contractFunction.parameters[0].value, [
      "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48".toLowerCase(),
      "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE".toLowerCase(),
      "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48".toLowerCase(),
      "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE".toLowerCase(),
    ]);

    expect(
      contractFunction.parameters[1].type,
      ArrayFunctionParamType("uint256[]", FunctionParamUint256()),
    );
    expect(
      contractFunction.parameters[1].value,
      [
        BigInt.parse("01bc3bafb479cf0000", radix: 16),
        BigInt.parse("1747e1ef5c", radix: 16),
        BigInt.parse("01bc3bafb479cf0000", radix: 16),
        BigInt.parse("174876e800", radix: 16),
      ],
    );

    expect(
      contractFunction.parameters[2].type,
      ArrayFunctionParamType(
        "(uint256,uint256,address,uint256,uint256,uint32,bytes32,uint256,uint256,uint256,bytes)[]",
        TupleFunctionParamType(
          "(uint256,uint256,address,uint256,uint256,uint32,bytes32,uint256,uint256,uint256,bytes)",
          [
            FunctionParamUint256(),
            FunctionParamUint256(),
            FunctionParamAddress(),
            FunctionParamUint256(),
            FunctionParamUint256(),
            FunctionParamUint32(),
            FunctionParamBytes32(),
            FunctionParamUint256(),
            FunctionParamUint256(),
            FunctionParamUint256(),
            FunctionParamBytes(),
          ],
        ),
      ),
    );

    expect(
      contractFunction.parameters[2].value,
      [
        [
          BigInt.from(2),
          BigInt.from(3),
          "0x5c02f2dfcb6537b83929596fe8a3278e237e3e7c",
          BigInt.parse("174876e800", radix: 16),
          BigInt.parse("01bae1d29347fe96f2", radix: 16),
          1720112929.toBigInt,
          "0xf4c17d12a7afdbf56c5ae1fad213ac36cf3499276e48f2ab768e9c6faa93a023"
              .hexToBytesWithPrefix,
          BigInt.zero,
          BigInt.zero,
          BigInt.parse("174876e800", radix: 16),
          "0x5402e579943a2d85182166f1ec505f3672f7719e27021f589018c0ca546905fd2672834c47293b6db931e4b406ca11d6087477e2353bf265577bdc4067d860811c"
              .hexToBytesWithPrefix,
        ],
      ],
    );

    expect(
      contractFunction.parameters[3].type,
      ArrayFunctionParamType(
        "(address,uint256,bytes)[][3]",
        ArrayFunctionParamType(
          "(address,uint256,bytes)[]",
          TupleFunctionParamType(
            "(address,uint256,bytes)",
            [
              FunctionParamAddress(),
              FunctionParamUint256(),
              FunctionParamBytes(),
            ],
          ),
        ),
      ),
    );
    expect(
      contractFunction.parameters[3].value,
      [
        [],
        [
          [
            "0xDef1C0ded9bec7F1a1670819833240f027b25EfF".toLowerCase(),
            BigInt.from(0),
            "0xaa77476c000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2000000000000000000000000a0b86991c6218b36c1d19d4a2e9eb0ce3606eb48000000000000000000000000000000000000000000000001d27dcfc85ca3c1e2000000000000000000000000000000000000000000000000000000187280a225000000000000000000000000a69babef1ca67a37ffaf7a485dfff3382056e78c0000000000000000000000009008d19f58aabd9ed0d60971565aa8510560ab41000000000000000000000000e3067c7c27c1038de4e8ad95a83b927d23dfbd990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006686d0ba01ffffffffffffffffffffffffffffffffffffff348caea26686d0560000003f0000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000001ce0fd5d9a853ecfab33b09da09b896cb62349d70e0575da64b52cc408216910aa48a3cc1667816cbc21ba7abda098ab0aff4b2a02223e2e3dad3544c7e0766b960000000000000000000000000000000000000000000000000000001747e1ef5c"
                .hexToBytesWithPrefix,
          ],
          [
            "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2".toLowerCase(),
            BigInt.from(0),
            "0x2e1a7d4d000000000000000000000000000000000000000000000001bc3bafb479cf0000"
                .hexToBytesWithPrefix,
          ]
        ],
        [],
      ],
    );
  });

  test('Fetch Function Selectors', () async {
    String selector = "0xbb51f1eb";

    var result = await FunctionSelectorRepository.fetchSelector(selector);

    expect(result, isNotNull);

    expect(result!.functionSelectorHex, "bb51f1eb");
    expect(
      result.function,
      "submitInitial((uint32,uint64,(bytes2,bytes)[]),uint256[],(uint8,bytes32,bytes32,uint256,address,bytes32[]))",
    );

    selector = "0x13d79a0b";

    result = await FunctionSelectorRepository.fetchSelector(selector);

    expect(result, isNotNull);
    expect(result!.functionSelectorHex, "13d79a0b");
    expect(
      result.function,
      "settle(address[],uint256[],(uint256,uint256,address,uint256,uint256,uint32,bytes32,uint256,uint256,uint256,bytes)[],(address,uint256,bytes)[][3])",
    );

    // TODO: Comment back in: 4Byte currently not working
    // result = await FunctionSelectorRepository.fetchSelector4Byte(selector);

    // expect(result, isNotNull);
    // expect(result!.functionSelectorHex, "13d79a0b");
    // expect(
    //   result.function,
    //   "settle(address[],uint256[],(uint256,uint256,address,uint256,uint256,uint32,bytes32,uint256,uint256,uint256,bytes)[],(address,uint256,bytes)[][3])",
    // );
  });

  ///
  /// uint256[][]
  ///
  test(
      "g(uint256[][],string[]) with values ([[1, 2], [3]], ['one', 'two', 'three'])",
      () async {
    //  0x2289b18c                                                           - function signature
    //  0 - f                                                                - offset of [[1, 2], [3]]
    //  1 - g                                                                - offset of ["one", "two", "three"]
    //  2 - 0000000000000000000000000000000000000000000000000000000000000002 - count for [[1, 2], [3]]
    //  3 - 0000000000000000000000000000000000000000000000000000000000000040 - offset of [1, 2]
    //  4 - 00000000000000000000000000000000000000000000000000000000000000a0 - offset of [3]
    //  5 - 0000000000000000000000000000000000000000000000000000000000000002 - count for [1, 2]
    //  6 - 0000000000000000000000000000000000000000000000000000000000000001 - encoding of 1
    //  7 - 0000000000000000000000000000000000000000000000000000000000000002 - encoding of 2
    //  8 - 0000000000000000000000000000000000000000000000000000000000000001 - count for [3]
    //  9 - 0000000000000000000000000000000000000000000000000000000000000003 - encoding of 3
    // 10 - 0000000000000000000000000000000000000000000000000000000000000003 - count for ["one", "two", "three"]
    // 11 - 0000000000000000000000000000000000000000000000000000000000000060 - offset for "one"
    // 12 - 00000000000000000000000000000000000000000000000000000000000000a0 - offset for "two"
    // 13 - 00000000000000000000000000000000000000000000000000000000000000e0 - offset for "three"
    // 14 - 0000000000000000000000000000000000000000000000000000000000000003 - count for "one"
    // 15 - 6f6e650000000000000000000000000000000000000000000000000000000000 - encoding of "one"
    // 16 - 0000000000000000000000000000000000000000000000000000000000000003 - count for "two"
    // 17 - 74776f0000000000000000000000000000000000000000000000000000000000 - encoding of "two"
    // 18 - 0000000000000000000000000000000000000000000000000000000000000005 - count for "three"
    // 19 - 7468726565000000000000000000000000000000000000000000000000000000 - encoding of "three"

    String dataString = "0x2289b18c" +
            "0000000000000000000000000000000000000000000000000000000000000040" + // offset of [[1, 2], [3]]
            "0000000000000000000000000000000000000000000000000000000000000140" + // offset of ["one", "two", "three"]
            "0000000000000000000000000000000000000000000000000000000000000002" + // count for [[1, 2], [3]]
            "0000000000000000000000000000000000000000000000000000000000000040" + // offset of [1, 2]
            "00000000000000000000000000000000000000000000000000000000000000a0" + // offset of [3]
            "0000000000000000000000000000000000000000000000000000000000000002" + // count for [1, 2]
            "0000000000000000000000000000000000000000000000000000000000000001" + // encoding of 1
            "0000000000000000000000000000000000000000000000000000000000000002" + // encoding of 2
            "0000000000000000000000000000000000000000000000000000000000000001" + // count for [3]
            "0000000000000000000000000000000000000000000000000000000000000003" + // encoding of 3
            "0000000000000000000000000000000000000000000000000000000000000003" + // count for ["one", "two", "three"]
            "0000000000000000000000000000000000000000000000000000000000000060" + // offset for "one"
            "00000000000000000000000000000000000000000000000000000000000000a0" + // offset for "two"
            "00000000000000000000000000000000000000000000000000000000000000e0" + // offset for "three"
            "0000000000000000000000000000000000000000000000000000000000000003" + // count for "one"
            "6f6e650000000000000000000000000000000000000000000000000000000000" + // encoding of "one"
            "0000000000000000000000000000000000000000000000000000000000000003" + // count for "two"
            "74776f0000000000000000000000000000000000000000000000000000000000" + // encoding of "two"
            "0000000000000000000000000000000000000000000000000000000000000005" + // count for "three"
            "7468726565000000000000000000000000000000000000000000000000000000" // encoding of "three"
        ;

    final contractFunction =
        await ContractFunctionWithValues.decodeRawWithFetch(
      data: dataString.hexToBytesWithPrefix,
      function: ExternalContractFunction.fromString(
        textSignature: "g(uint256[][],string[])",
      ),
    );

    expect(contractFunction.name, "g");
    expect(
      contractFunction.parameters[0].type,
      ArrayFunctionParamType(
        "uint256[][]",
        ArrayFunctionParamType(
          "uint256[]",
          FunctionParamUint256(),
        ),
      ),
    );
    expect(
      contractFunction.parameters[0].value,
      [
        [BigInt.from(1), BigInt.from(2)],
        [BigInt.from(3)],
      ],
    );
    expect(
      contractFunction.parameters[1].type,
      ArrayFunctionParamType(
        "string[]",
        FunctionParamString(),
      ),
    );
    expect(
      contractFunction.parameters[1].value,
      ["one", "two", "three"],
    );
  });
}
