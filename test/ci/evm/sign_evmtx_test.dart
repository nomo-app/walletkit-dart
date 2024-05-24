import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart' as web3;
import '../../utils.dart';

void main() {
  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  final message =
      Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));
  final testSeed = loadFromEnv("DEV_SEED");
  final privateKey = derivePrivateKeyETH(testSeed);

  test('Sign Evm TX', () {
    final credentials = getETHCredentials(seed: testSeed);
    final signatureWeb3dart = credentials.signToEcSignature(message);

    final signature = Signature.createSignature(message, privateKey);

    final publicKey = privateKeyToPublic(bytesToUnsignedInt(privateKey));

    final isValid = signature.isValidETHSignature(
        message,
        Signature(
            signatureWeb3dart.r, signatureWeb3dart.s, signatureWeb3dart.v),
        publicKey);

    final web3isValid = web3.isValidSignature(
        web3.keccak256(message), signatureWeb3dart, publicKey);

    expect(signature.r, signatureWeb3dart.r);
    expect(signature.s, signatureWeb3dart.s);
    expect(signature.v, signatureWeb3dart.v);
    expect(web3isValid, true);
    expect(isValid, true);
  });

  //ToDO: Fix this test
  test('Sign RawTx and parse it to InternalEVMTransaction', () {
    final rawTransaction =
        RawEVMTransaction.getFromMessageHex(unsignedTxFromNomo);

    print(rawTransaction);

    final signedTx =
        InternalEVMTransaction.signTransaction(rawTransaction, privateKey);

    print(signedTx);
  });

  /**
   * ToDO: Fix this test. Some error when signing the tx when the chainId is not null
   */
  test('Sign and broadcast internal tx', () async {
    final arbRPC = EvmRpcInterface(ArbitrumNetwork);
    final to = "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616";
    final gasLimit = await arbRPC.client.estimateGasLimit(to: to);
    final gasPrice = await arbRPC.client.getGasPrice();
    final nonce = await arbRPC.client.getTransactionCount(to) + BigInt.from(1);
    final amount = Amount.convert(value: 0.001, decimals: 18);
    final value = amount.value;
    final data = Uint8List.fromList([]);
    final chainId = BigInt.from(42161);

    final rawUnsignedTx = RawEVMTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
    );

    final signedTx =
        InternalEVMTransaction.signTransaction(rawUnsignedTx, privateKey);

    final signedTxHex = signedTx.serializedMessageHex;

    print(signedTxHex);
    final tx = await arbRPC.client.sendRawTransaction(signedTxHex);

    print(tx);
  });
}
