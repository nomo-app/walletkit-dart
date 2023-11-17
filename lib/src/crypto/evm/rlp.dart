import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/bigint_utils.dart';
import 'package:web3dart/web3dart.dart';

class DecodedRLP {
  final int consumed;
  final dynamic result;

  DecodedRLP({required this.consumed, required this.result});
}

/**
 * 
 * @param {Uint8List} data
 * @param {int} offset
 * @param {int} length
 * 
 * This function iterates over the data and returns the integer value of the data
 * 
 * @returns {int}
 */
int unarrayifyInteger(Uint8List data, int offset, int length) {
  int result = 0;
  for (int i = 0; i < length; i++) {
    result = (result * 256) + data[offset + i];
  }
  return result;
}

/**
 * 
 * @param {int} value
 * 
 * This function takes an integer value, converts it to a hexadecimal string, 
 * and ensures that the string is at least two characters long by padding with zeros 
 * if necessary.
 * 
 * @returns {String}  The result is prefixed with "0x" 
 */
String hexlifyByte(int value) {
  String result = value.toRadixString(16);
  while (result.length < 2) {
    result = "0" + result;
  }

  return "0x" + result;
}

/**
 * @param {Uint8List} data
 * @param {int} offset
 * 
 * This function is the main RLP decoding logic. It recursively decodes RLP-encoded data.
  It checks the first byte of the data to determine the type of encoding (long item, list, long string, short string).
  Depending on the type, it calls _decodeChildren to handle the decoding recursively.
  The decoded result is stored in a List<dynamic>.
  The function returns a Decoded object containing the consumed bytes and the result.
 * 
 */
DecodedRLP decodeRLP(Uint8List data, int offset) {
  DecodedRLP _decodeChildren(
      Uint8List data, int offset, int childOffset, int length) {
    List<dynamic> result = [];

    while (childOffset < offset + 1 + length) {
      DecodedRLP decoded = decodeRLP(data, childOffset);

      result.add(decoded.result);

      childOffset += decoded.consumed;
    }

    return DecodedRLP(consumed: (1 + length), result: result);
  }

  if (data[offset] >= 0xf8) {
    final lengthLength = data[offset] - 0xf7;

    final length = unarrayifyInteger(data, offset + 1, lengthLength);

    return _decodeChildren(
        data, offset, offset + 1 + lengthLength, lengthLength + length);
  } else if (data[offset] >= 0xc0) {
    final length = data[offset] - 0xc0;

    return _decodeChildren(data, offset, offset + 1, length);
  } else if (data[offset] >= 0xb8) {
    final lengthLength = data[offset] - 0xb7;

    final length = unarrayifyInteger(data, offset + 1, lengthLength);

    final result = hex.encode(data.sublist(
        offset + 1 + lengthLength, offset + 1 + lengthLength + length));
    return DecodedRLP(consumed: (1 + lengthLength + length), result: result);
  } else if (data[offset] >= 0x80) {
    final length = data[offset] - 0x80;

    final result = hex.encode(data.sublist(offset + 1, offset + 1 + length));
    return DecodedRLP(consumed: (1 + length), result: result);
  }

  return DecodedRLP(consumed: 1, result: hexlifyByte(data[offset]));
}

/**
 * @param {String} messageHex
 * 
 * This function takes a message hex string and returns a Transaction object.
 * 
 * @returns {Transaction}
 * 
 * @throws {Exception}  If the message hash is invalid or the result length is less than 5
 */
Transaction getTransactionFromMessageHash(String messageHex) {
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

  return Transaction(
    nonce: nonce.toInt(),
    gasPrice: EtherAmount.inWei(gasPrice),
    maxGas: gasLimit.toInt(),
    to: EthereumAddress.fromHex(evmAddress),
    value: EtherAmount.inWei(value),
    data: data,
  );
}
