import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/signing/signing_evm_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class InternalEVMTransaction extends RawEVMTransaction {
  final BigInt r, s;
  final int v;

  const InternalEVMTransaction({
    required super.nonce,
    required super.gasPrice,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    super.chainId,
    required this.r,
    required this.s,
    required this.v,
  });

  @override
  String toString() {
    return 'InternalEVMTransaction{nonce: $nonce, gasPrice: $gasPrice, gasLimit: $gasLimit, to: $to, value: $value, data: $data, v: $v, r: $r, s: $s}';
  }

  @override
  Uint8List get serializeTransaction {
    final nonce = this.nonce.bigIntToBytes.toHex;
    final gasPrice = this.gasPrice.bigIntToBytes.toHex;
    final gasLimit = this.gasLimit.bigIntToBytes.toHex;
    final to = this.to.replaceAll("0x", "").hexToBytes.toHex;
    final value = this.value.bigIntToBytes.toHex;
    final data = this.data?.toHex ?? Uint8List(0).toHex;

    List<String> buffer = [
      nonce,
      gasPrice,
      gasLimit,
      to,
      value,
      data,
      v.toBigInt.bigIntToBytes.toHex,
      r.bigIntToBytes.toHex,
      s.bigIntToBytes.toHex,
    ];

    final encoded = encode(buffer);
    return Uint8List.fromList(hex.decode(encoded));
  }

  factory InternalEVMTransaction.signTransaction(
      RawEVMTransaction transaction, Uint8List privateKey) {
    final serializedTx = transaction.serializeTransaction;

    final signature = Signature.createSignature(
      serializedTx,
      privateKey,
      chainId: transaction.chainId!.toInt(),
    );

    return InternalEVMTransaction(
      nonce: transaction.nonce,
      gasPrice: transaction.gasPrice,
      gasLimit: transaction.gasLimit,
      to: transaction.to,
      value: transaction.value,
      data: transaction.data,
      v: signature.v,
      r: signature.r,
      s: signature.s,
    );
  }

  int get getChainID {
    return extractChainId(v);
  }

  @override
  String get serializedTransactionHex {
    return "0x" + serializeTransaction.toHex;
  }
}
