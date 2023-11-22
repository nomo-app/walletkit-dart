import 'dart:typed_data';

class RawEVMTransaction {
  final BigInt nonce;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final String to;
  final BigInt value;
  final Uint8List? data;
  final BigInt? chainId;

  RawEVMTransaction({
    required this.nonce,
    required this.gasPrice,
    required this.gasLimit,
    required String to,
    required this.value,
    required this.data,
    this.chainId,
  }) : to = to.startsWith("0x") ? to : "0x${to}";
}
