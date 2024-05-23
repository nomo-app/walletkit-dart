import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class InternalEVMTransaction extends RawEVMTransaction {
  BigInt r, s;
  // int v;

  InternalEVMTransaction({
    required super.nonce,
    required super.gasPrice,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required super.chainId,
    required this.r,
    required this.s,
    // required this.v,
  });

  @override
  String toString() {
    return 'InternalEVMTransaction{nonce: $nonce, gasPrice: $gasPrice, gasLimit: $gasLimit, to: $to, value: $value, data: $data, chainId: $chainId, r: $r, s: $s}';
  }

  factory InternalEVMTransaction.signTransaction(
      RawEVMTransaction transaction, Uint8List privateKey) {
    final serializedTx = transaction.serializeTransaction;

    final signature = Signature.createSignature(
      serializedTx,
      privateKey,
      chainId: transaction.chainId?.toInt() ?? null,
    );

    final isValid = signature.isValidETHSignature(
      serializedTx,
      signature,
      privateKeyToPublic(bytesToUnsignedInt(privateKey)),
    );

    if (!isValid) {
      throw Exception('Invalid signature');
    }

    return InternalEVMTransaction(
      nonce: transaction.nonce,
      gasPrice: transaction.gasPrice,
      gasLimit: transaction.gasLimit,
      to: transaction.to,
      value: transaction.value,
      data: transaction.data,
      chainId: signature.v.toBigInt,
      r: signature.r,
      s: signature.s,
      // v: signature.v,
    );
  }
}
