import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/bigint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class RawEVMTransaction {
  final BigInt nonce;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final String to;
  final BigInt value;
  final Uint8List? data;
  final BigInt? chainId;

  const RawEVMTransaction({
    required this.nonce,
    required this.gasPrice,
    required this.gasLimit,
    required this.to,
    required this.value,
    required this.data,
    this.chainId,
  });

  @override
  String toString() {
    return 'RawEVMTransaction{nonce: $nonce, gasPrice: $gasPrice, gasLimit: $gasLimit, to: $to, value: $value, data: $data, chainId: $chainId}';
  }

  RawEVMTransaction copyWith({
    BigInt? nonce,
    BigInt? gasPrice,
    BigInt? gasLimit,
    String? to,
    BigInt? value,
    Uint8List? data,
    BigInt? chainId,
  }) {
    return RawEVMTransaction(
      nonce: nonce ?? this.nonce,
      gasPrice: gasPrice ?? this.gasPrice,
      gasLimit: gasLimit ?? this.gasLimit,
      to: to ?? this.to,
      value: value ?? this.value,
      data: data ?? this.data,
      chainId: chainId ?? this.chainId,
    );
  }

  /**
   * @param {String} messageHex
   * 
   * This function takes a message hash and returns a RawEVMTransaction object.
   * 
   * @returns {RawEVMTransaction}
   * 
   * @throws {Exception}  If the message hash is invalid or the result length is less than 5
   */
  factory RawEVMTransaction.fromHex(String messageHex) {
    final message = Uint8List.fromList(
      hex.decode(
        messageHex.replaceFirst("0x", ""),
      ),
    );

    DecodedRLP en = decodeRLP(message, 0);

    if (en.result! is List<String>) {
      throw Exception("Invalid message hash");
    }

    if (en.result.length < 5) {
      throw Exception("Result length is less than 5");
    }

    BigInt nonce = parseAsHexBigInt(en.result[0]);
    BigInt gasPrice = parseAsHexBigInt(en.result[1]);
    BigInt gasLimit = parseAsHexBigInt(en.result[2]);
    String evmAddress = en.result[3];

    BigInt value = parseAsHexBigInt(en.result[4] == "" ? "0x0" : en.result[4]);
    final Uint8List data = Uint8List.fromList(hex.decode(en.result[5]));

    BigInt? chainId;
    if (en.result.length >= 7) {
      // chainId might be optional if a transaction still goes through without chainId
      chainId = parseAsHexBigInt(en.result[6]);
    }

    return RawEVMTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: '0x$evmAddress',
      value: value,
      data: data,
      chainId: chainId,
    );
  }

  Uint8List get serializeTransaction {
    final nonce = this.nonce.bigIntToBytes.toHex;
    final gasPrice = this.gasPrice.bigIntToBytes.toHex;
    final gasLimit = this.gasLimit.bigIntToBytes.toHex;
    final to = this.to.replaceAll("0x", "").hexToBytes.toHex;
    final value = this.value.bigIntToBytes.toHex;
    final data = this.data?.toHex ?? Uint8List(0).toHex;
    final chainId = this.chainId?.bigIntToBytes.toHex ?? Uint8List(0).toHex;

    List<String> buffer = [
      nonce,
      gasPrice,
      gasLimit,
      to,
      value,
      data,
      chainId,
      "",
      "",
    ];

    final encoded = encode(buffer);
    return Uint8List.fromList(hex.decode(encoded));
  }

  String get serializedTransactionHex {
    return "0x${serializeTransaction.toHex}";
  }

  BigInt get gasFee {
    return gasPrice * gasLimit;
  }
}
