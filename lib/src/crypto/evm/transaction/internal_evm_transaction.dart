import 'package:walletkit_dart/walletkit_dart.dart';

class InternalEVMTransaction extends RawEVMTransaction {
  BigInt r, s;
  int v;

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
    required this.v,
  });

  // factory InternalEVMTransaction.signTransaction(
  //   RawEVMTransaction transaction,
  // ) {
  //   final encoded = encode(transaction);
  // }
}
