import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../utils.dart';

void main() {
  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  final arbRPC = EvmRpcInterface(ArbitrumNetwork);
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

    print("Signature: $signature");

    expect(signature.r.toString(),
        "108416698238142458920766909294412046931924383064358611369366506483536145079069");
    expect(signature.s.toString(),
        "38618417914543961133652146298086071310916316687892966422603324842792920587798");
    expect(signature.v, 28);
  });

  test('Sign RawTx and parse it to InternalEVMTransaction', () {
    final rawTransaction =
        RawEVMTransaction.getFromMessageHex(unsignedTxFromNomo);

    print(rawTransaction);

    final signedTx =
        InternalEVMTransaction.signTransaction(rawTransaction, privateKey);

    print(signedTx);
  });

  test('Simulate TX', () async {
    final testTx = await arbRPC.client.getTransactionByHash(
        "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b");
    print("TestTx: $testTx");

    print("ChainID ${testTx.chainId}");
    print(testTx.serializeTransaction.toHex);

    final rawUnsignedTx = RawEVMTransaction(
      nonce: testTx.nonce,
      gasPrice: testTx.gasPrice,
      gasLimit: testTx.gasLimit,
      to: testTx.to,
      value: testTx.value,
      data: testTx.data,
      chainId: testTx.chainId,
    );

    final signedTx =
        InternalEVMTransaction.signTransaction(rawUnsignedTx, privateKey);

    final signedTxHex = signedTx.serializedMessageHex;

    expect(testTx.chainId, 42161.toBigInt);
    expect(signedTxHex,
        "0xf86d1683989680830186a094a7fa4bb0bba164f999e8c7b83c9da96a3be4461687038d7ea4c680008083014985a01182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14a02e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6");
  });

  test('Broadcast evm raw tx', () async {
    final to = "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616";
    final gasLimit = await arbRPC.client.estimateGasLimit(to: to);
    final gasPrice = await arbRPC.client.getGasPrice();
    final nonce = await arbRPC.client.getTransactionCount(to);
    final amount = Amount.convert(value: 0.001, decimals: 18);
    final value = amount.value;
    final data = Uint8List.fromList([]);
    final chainId = BigInt.from(42161);

    final rawTx = RawEVMTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
    );

    final signedTx = InternalEVMTransaction.signTransaction(rawTx, privateKey);

    final signedTxHex = signedTx.serializedMessageHex;

    final hash = await arbRPC.client.sendRawTransaction(signedTxHex);

    print("Hash: $hash");
  });

  test('Send Coin (EthARB)', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethArbitrum,
      memo: "Hello my friend",
    );

    final hash = await arbRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });
}
