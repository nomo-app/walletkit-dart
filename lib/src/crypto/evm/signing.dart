import 'dart:convert';
import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:walletkit_dart/src/crypto/evm/address_validation.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart' as web3crypto;

const stakingPartnerAddress =
    "0x6B984d04761E5CCD16e3ed54a51F1454f950F0E3"; // this address is configured in the AVINOC-staking-contract and the Safir-backoffice holds a private key for this address

bool validateAVINOCStakingSignature({
  required String signature,
  required String address,
}) {
  final messageSigner = recoverEthMessageSigner(
    message: address,
    signature: signature,
  );
  return messageSigner.toLowerCase() == stakingPartnerAddress.toLowerCase();
}

String signEvmTransaction({
  required String messageHex,
  required Credentials credentials,
}) {
  final message = Uint8List.fromList(HEX.decode(messageHex));

  final sig = credentials.signToUint8List(message);
  return HEX.encode(sig);
}

String recoverPubKey({
  required String message,
  required String sig,
  required String coin,
  bool? uncompressed,
}) {
  final messageHash = _createEthStyleMessageHash(message);
  final parsedSig = _parseEthSignature(sig);
  final pubKeyUncompressed = web3crypto.ecRecover(messageHash, parsedSig);
  if (uncompressed == true) {
    return HEX.encode(pubKeyUncompressed);
  }

  final uncompressedPrefix = [0x04];
  final pubKeyCompressed = web3crypto.compressPublicKey(
    Uint8List.fromList(uncompressedPrefix + pubKeyUncompressed),
  );
  String pubKeyHex = HEX.encode(pubKeyCompressed);
  if (pubKeyHex.startsWith("02")) {
    pubKeyHex = pubKeyHex.replaceFirst(
      "02",
      "04",
    ); // workaround for Safir backwards compat
  }
  return pubKeyHex;
}

String recoverEthMessageSigner({
  required String message,
  required String signature,
}) {
  final messageHash = _createEthStyleMessageHash(message);
  final sig = _parseEthSignature(signature);
  final recoveredSignerPubKey = web3crypto.ecRecover(messageHash, sig);

  final recoveredSignerAddress =
      EthereumAddress.fromPublicKey(recoveredSignerPubKey).hex;
  return toChecksumAddress(recoveredSignerAddress);
}

Uint8List _createEthStyleMessageHash(String message) {
  List<int> messageBytes;
  if (message.startsWith("0x")) {
    messageBytes = HEX.decode(message.substring(2));
  } else {
    messageBytes = utf8.encode(message);
  }
  final prefix = utf8.encode(
    '\u0019Ethereum Signed Message:\n' + messageBytes.length.toString(),
  );
  final hashInput = Uint8List.fromList(prefix + messageBytes);
  return web3crypto.keccak256(hashInput);
}

web3crypto.MsgSignature _parseEthSignature(String signature) {
  if (!signature.startsWith("0x")) {
    throw Failure("expected to begin with 0x");
  }
  if (signature.length != 132) {
    throw Failure("Unexpected signature length");
  }
  // Skip the prefix byte and extract the remaining 129 hex characters as the signature string
  String signatureStr = signature.substring(2);

  // Extract the r and s values
  BigInt r = BigInt.parse(signatureStr.substring(0, 64), radix: 16);
  BigInt s = BigInt.parse(signatureStr.substring(64, 128), radix: 16);

  // Extract the recovery identifier (v)
  BigInt v = BigInt.parse(signatureStr.substring(128), radix: 16);

  if (v < BigInt.from(27)) {
    v += BigInt.from(27);
  }

  return web3crypto.MsgSignature(r, s, v.toInt());
}

String signEvmMessage({
  required String message,
  required Credentials credentials,
}) {
  final payload = Uint8List.fromList(utf8.encode(message));
  final sig = credentials.signPersonalMessageToUint8List(payload);
  return "0x" + HEX.encode(sig);
}
