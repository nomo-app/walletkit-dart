import 'dart:convert';
import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const stakingPartnerAddress =
    "0x6B984d04761E5CCD16e3ed54a51F1454f950F0E3"; // this address is configured in the AVINOC-staking-contract and the Safir-backoffice holds a private key for this address

String signEvmTransaction({
  required String messageHex,
  required Uint8List seed,
}) {
  final privateKey = derivePrivateKeyETH(seed);
  final rawTx = RawEVMTransaction.getFromMessageHex(messageHex);
  final signedTx = InternalEVMTransaction.signTransaction(rawTx, privateKey);
  return signedTx.serializedMessageHex;
}

String signEvmMessage({
  required String message,
  required Uint8List seed,
}) {
  final payload = Uint8List.fromList(utf8.encode(message));
  final privateKey = derivePrivateKeyETH(seed);
  final sig = Signature.createSignature(payload, privateKey);
  final signatureUint8List = sig.toBytes();
  return "0x" + HEX.encode(signatureUint8List);
}
