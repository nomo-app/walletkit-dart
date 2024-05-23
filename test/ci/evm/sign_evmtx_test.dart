import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart' as web3;
import '../../utils.dart';

void main() {
  test('Sign Evm TX', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
    final message =
        Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));

    final testSeed = loadFromEnv("DEV_SEED");

    final credentials = getETHCredentials(seed: testSeed);
    final signatureWeb3dart = credentials.signToEcSignature(message);

    final signature = Signature.createSignature(message, testSeed);

    final privateKey = derivePrivateKeyETH(testSeed);
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
}
