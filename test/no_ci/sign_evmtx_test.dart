import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../utils.dart';

void main() {
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

    print("Signature: $signature");

    expect(signature.r.toString(),
        "108416698238142458920766909294412046931924383064358611369366506483536145079069");
    expect(signature.s.toString(),
        "38618417914543961133652146298086071310916316687892966422603324842792920587798");
    expect(signature.v, 28);
  });

  test('Sign RawTx and parse it to InternalEVMTransaction', () {
    final rawTransaction = RawEVMTransactionType0.fromHex(unsignedTxFromNomo);

    print(rawTransaction);

    final signedTx = rawTransaction.sign(
      privateKey: privateKey,
      chainId: ZeniqSmartNetwork.chainId,
    );

    print(signedTx);
  });

  test('Broadcast evm raw tx', () async {
    const to = "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616";
    final gasLimit = await arbitrumRPC.estimateGasLimit(
      recipient: to,
      sender: to,
    );
    final gasPrice = await arbitrumRPC.getGasPrice();
    final nonce = await arbitrumRPC.getTransactionCount(to);
    final amount = Amount.convert(value: 0.001, decimals: 18);
    final value = amount.value;
    final data = Uint8List.fromList([]);
    const chainId = 42161;

    final signedTx = RawEVMTransactionType0.unsigned(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit.toBigInt,
      to: to,
      value: value,
      data: data,
    ).sign(
      privateKey: privateKey,
      chainId: chainId,
    );

    final signedTxHex = signedTx.serialized.toHex;

    print(signedTxHex);

    final hash = await arbitrumRPC.sendRawTransaction("0x" + signedTxHex);

    print("Hash: $hash");
  });

  test('Broadcast evm raw tx type2', () async {
    const to = "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616";
    final gasLimit = await arbitrumRPC.estimateGasLimit(
      recipient: to,
      sender: to,
    );
    final gasPrice = await arbitrumRPC.getGasPrice();
    final nonce = await arbitrumRPC.getTransactionCount(to);
    final amount = Amount.convert(value: 0.001, decimals: 18);
    final value = amount.value;
    final data = Uint8List.fromList([]);
    const chainId = 42161;

    final signedTx = RawEVMTransactionType2.unsigned(
      nonce: nonce,
      maxFeePerGas: gasPrice,
      maxPriorityFeePerGas: BigInt.zero,
      gasLimit: gasLimit.toBigInt,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      accessList: [],
    ).sign(privateKey: privateKey);

    final signedTxHex = signedTx.serialized.toHex;

    print(signedTxHex);

    final hash = await arbitrumRPC.sendRawTransaction("0x" + signedTxHex);

    print("Hash: $hash");
  });

  test("try to send arb typ2", () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethArbitrum,
      memo: null,
      maxFeePerGas: BigInt.zero,
      maxPriorityFeePerGas: BigInt.zero,
    );

    final hash = await arbitrumRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );
    print("Hash: $hash");
  });

  test("try to send arb typ1", () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethArbitrum,
      memo: null,
      accessList: [],
    );

    final hash = await arbitrumRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });

  test('Send Coin (EthARB)', () async {
    final intent = TransferIntent<EvmFeeInformation>(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 0.001, decimals: 18),
      feeInfo: null,
      token: ethArbitrum,
      memo: "Hello my friend",
    );

    final hash = await arbitrumRPC.sendCoin(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );

    print("Hash: $hash");
  });

  test('send erc721 token from reject to spoil', () async {
    final hash = await ethereumRPC.sendERC721Nft(
      recipient: spoilEVM,
      from: rejectEVM,
      seed: testSeed,
      contractAddress: "0x7561DEAf4ECf96dc9F0d50B4136046979ACdAD3e",
      tokenId: 14142,
    );

    print("Hash: $hash");
  });
  test('derive eth address from pubkey', () {
    final checksumAddress = pubKeytoChecksumETHAddress(testSeed);
    expect(arbitrumTestWallet, checksumAddress);
  });

  test('sign message and verify signature', () async {
    const String message = "this message comes from my wallet";

    final rejectSeed = loadFromEnv("REJECT_SEED");

    final sig = signEvmMessage(
      message: message,
      seed: rejectSeed,
    );
    expect(sig,
        "0x1e8fccc1f75eda4ee82adb9b3b0ae8243b418bd8810873b6df696d240267a223105e265189bd2ea0677bfa42f5d9cbba50622d91ef4e4805cd81f9f8715e38101b");

    final String pubKeyHex = recoverPubKey(
      sig: sig,
      message: message,
      coin: "ETH",
      uncompressed: true,
    );
    expect(pubKeyHex,
        "3f2ac2efe7a90c365e245e8e08c2dfba3aa57d8d0fe99ef1d6598f828ba200786ed81927394a2ec0db63387df95665ac83442fd9b21645dccc26c6154d0a1eff");

    final address = pubKeytoChecksumETHAddress(rejectSeed);
    expect(address, "0x05870f1507d820212E921e1f39f14660336231D1");
  });

  test('verify chat signature', () async {
    const String message =
        "0x3f0e8cf0c6eb9789348541d9d0ce4ac847277e9b_1702296844698";

    const sig =
        "0x143987b0bd7c5f5370acef96353164f776f12577f95ea4c2d70c6952302504d55c204ea33b73df46b3f2e9eaa6d14ae0ac678d6282c844d920d415105e9bb7651b";

    expect(sig.length, 132);

    final String address =
        recoverEthMessageSigner(message: message, signature: sig);

    expect(address, "0x3f0e8cF0c6eb9789348541D9D0Ce4ac847277e9B");
  });

  test('sign Smartchain EVM transaction', () async {
    final spoilSeed = loadFromEnv("SPOIL_SEED");

    const unsignedTx =
        "f38201008502540be400825208941464935f48ca992d1a0beaa2358471d7cb6374e588016345785d8a0000808559454e49518080";

    final sig = signEvmTransaction(
      messageHex: unsignedTx,
      seed: spoilSeed,
    );
    expect(sig,
        "fb4b75783e57b4244c3fcf03bb595ac8c54185273fc063e6f931afcce3af704f4a51f39e3e4d3881fe602ca0b078c2db1d45235483a79325c2e4236a250e9f9d1b");
  });
}
