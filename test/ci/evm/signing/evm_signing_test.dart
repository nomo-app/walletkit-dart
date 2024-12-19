import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../../mocks.mocks.dart';
import '../../../utils.dart';

void main() {
  late MockJsonRPC mockJsonRPC;
  late EvmRpcInterface evmRpcInterface;

  setUp(() {
    mockJsonRPC = MockJsonRPC();

    evmRpcInterface = EvmRpcInterface(
      type: ArbitrumNetwork,
      clients: [
        EvmRpcClient.withRPC(mockJsonRPC),
      ],
    );
  });

  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  final message =
      Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));

  final testSeed = loadFromEnv("DEV_SEED");
  final privateKey = derivePrivateKeyETH(testSeed);

  test('Sign Evm TX', () {
    final signature = Signature.createSignature(message, privateKey);

    final publicKey = privateKeyToPublic(bytesToUnsignedInt(privateKey));

    final payload = keccak256(message);
    final recoveredPublicKey = recoverPublicKey(payload, signature);

    expect(recoveredPublicKey.toHex, publicKey.toHex);

    expect(signature.r.toString(),
        "108416698238142458920766909294412046931924383064358611369366506483536145079069");
    expect(signature.s.toString(),
        "38618417914543961133652146298086071310916316687892966422603324842792920587798");
    expect(signature.v, 28);
  });

  test('Sign RawTx and parse it to InternalEVMTransaction', () {
    final rawTransaction = RawEVMTransactionType0.fromHex(unsignedTxFromNomo);
    final signature = Signature.createSignature(
      rawTransaction.serializedUnsigned(ZeniqSmartNetwork.chainId),
      privateKey,
      chainId: ZeniqSmartNetwork.chainId,
    );

    final signedTx = rawTransaction.addSignature(signature);

    expect(
        signedTx.r,
        BigInt.parse(
            "108416698238142458920766909294412046931924383064358611369366506483536145079069"));
    expect(
        signedTx.s,
        BigInt.parse(
            "38618417914543961133652146298086071310916316687892966422603324842792920587798"));
    expect(signedTx.v, 766829695686);
  });

  test('Simulate TX', () async {
    final testTxHash =
        "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b";

    when(mockJsonRPC.call('eth_blockNumber', any))
        .thenAnswer((_) async => RPCResponse(1, "0x11114b3d"));

    when(mockJsonRPC.call('eth_getTransactionByHash', [testTxHash]))
        .thenAnswer((_) async => RPCResponse(
              1,
              {
                "blockHash":
                    "0x442bf21bfa82c64b53a0e7ef51bd32174ad401b40e01ee3b1fc81a5c6b34716d",
                "blockNumber": "0xce2e175",
                "chainId": "0xa4b1",
                "from": "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
                "gas": "0x186a0",
                "gasPrice": "0x989680",
                "hash":
                    "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b",
                "input": "0x",
                "nonce": "0x16",
                "r":
                    "0x1182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14",
                "s":
                    "0x2e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6",
                "to": "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
                "transactionIndex": "0xc",
                "type": "0x0",
                "v": "0x14985",
                "value": "0x38d7ea4c68000",
              },
            ));

    final testTx = await evmRpcInterface.getTransactionByHash(
      "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b",
    ) as RawEVMTransactionType0;

    expect(testTx.serialized.toHex,
        "f86d1683989680830186a094a7fa4bb0bba164f999e8c7b83c9da96a3be4461687038d7ea4c680008083014985a01182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14a02e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6");

    final rawUnsignedTx = RawEVMTransactionType0.unsigned(
      nonce: testTx.nonce,
      gasPrice: testTx.gasPrice,
      gasLimit: testTx.gasLimit,
      to: testTx.to,
      value: testTx.value,
      data: testTx.data,
    );

    final rawUnsignedTx2 = RawEVMTransactionType0.fromHex(
      rawUnsignedTx.serializedUnsigned(testTx.chainId).toHex,
    );

    expect(
      rawUnsignedTx.serializedUnsigned(testTx.chainId),
      rawUnsignedTx2.serializedUnsigned(testTx.chainId),
    );

    final signature = Signature.createSignature(
      rawUnsignedTx.serializedUnsigned(testTx.chainId),
      privateKey,
      chainId: testTx.chainId,
    );

    final signedTx = rawUnsignedTx.addSignature(signature);

    final signedTxHex = signedTx.serialized.toHex;

    expect(testTx.chainId, 42161);
    expect(signedTxHex,
        "f86d1683989680830186a094a7fa4bb0bba164f999e8c7b83c9da96a3be4461687038d7ea4c680008083014985a01182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14a02e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6");
  });
}
