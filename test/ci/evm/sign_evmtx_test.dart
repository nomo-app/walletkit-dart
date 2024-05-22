import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing_evm_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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

    print(
        "Signature from web3dart: ${signatureWeb3dart.r} ${signatureWeb3dart.s} ${signatureWeb3dart.v}");

    final signature = signEVMTransaction(message, testSeed);

    print("Signature from walletkit: $signature");

    expect(signature.r, signatureWeb3dart.r);
    expect(signature.s, signatureWeb3dart.s);
    expect(signature.v, signatureWeb3dart.v);
  });
}
