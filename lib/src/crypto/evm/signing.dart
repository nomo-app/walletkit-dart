import 'dart:convert';
import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const stakingPartnerAddress =
    "0x6B984d04761E5CCD16e3ed54a51F1454f950F0E3"; // this address is configured in the AVINOC-staking-contract and the Safir-backoffice holds a private key for this address

(InternalEVMTransaction, Signature) signEvmTransaction({
  required String messageHex,
  required Uint8List seed,
}) {
  final privateKey = derivePrivateKeyETH(seed);
  final rawTx = RawEVMTransaction.fromHex(messageHex);

  final signature = Signature.createSignature(
    rawTx.serializeTransaction,
    privateKey,
    chainId: rawTx.chainId?.toInt(),
  );

  final signedTx = InternalEVMTransaction.appendSignature(rawTx, signature);

  return (signedTx, signature);
}

String recoverEthMessageSigner({
  required String message,
  required String signature,
}) {
  final messageHash = _createEthStyleMessageHash(message);
  final sig = _parseEthSignature(signature);
  final recoveredSignerPubKey = recoverPublicKey(messageHash, sig);
  final recoveredSignerAddress =
      publicKeyToAddress(recoveredSignerPubKey).toHex;

  return toChecksumAddress("0x" + recoveredSignerAddress);
}

String recoverPubKey({
  required String message,
  required String sig,
  required String coin,
  bool? uncompressed,
}) {
  final messageHash = _createEthStyleMessageHash(message);
  final parsedSig = _parseEthSignature(sig);
  final pubKeyUncompressed = recoverPublicKey(messageHash, parsedSig);
  if (uncompressed == true) {
    return HEX.encode(pubKeyUncompressed);
  }

  final uncompressedPrefix = [0x04];
  final pubKeyCompressed = compressPublicKey(
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

Uint8List _createEthStyleMessageHash(String message) {
  List<int> messageBytes;
  if (message.startsWith("0x") && !message.contains('_')) {
    messageBytes = HEX.decode(message.substring(2));
  } else {
    messageBytes = utf8.encode(message);
  }
  final prefix = utf8.encode(
    '\u0019Ethereum Signed Message:\n' + messageBytes.length.toString(),
  );
  final hashInput = Uint8List.fromList(prefix + messageBytes);
  return keccak256(hashInput);
}

Signature _parseEthSignature(String signature) {
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

  return Signature(r, s, v.toInt());
}

String signEvmMessage({
  required String message,
  required Uint8List seed,
}) {
  final payload = Uint8List.fromList(utf8.encode(message));
  final privateKey = derivePrivateKeyETH(seed);
  final sig = Signature.signPersonalMessageToUint8List(payload, privateKey);
  return "0x" + HEX.encode(sig);
}
