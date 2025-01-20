import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
 * This function takes an integer value and converts it to a Uint8List.
 * 
 * @returns {Uint8List}
 */
Uint8List arrayifyInteger(int value) {
  if (value == 0) {
    return Uint8List.fromList([0x80]);
  }
  List<int> result = [];
  while (value > 0) {
    result.insert(0, value & 0xff);
    value >>= 8;
  }

  return Uint8List.fromList(result);
}

/**
 * 
 * @param {dynamic} object
 * 
 * This function checks if the object is a Uint8List.
 * 
 * @returns {bool}
 */
bool _isBytesLike(dynamic object) {
  return object is Uint8List;
}

/**
 * Normalizes a hex string by removing leading zeros and '0x' prefix
 * @param {String} hexStr The hex string to normalize
 * @returns {String} The normalized hex string
 */
String normalizeHexString(String hexStr) {
  // Remove 0x prefix if present
  hexStr = hexStr.toLowerCase().replaceAll('0x', '');

  // Remove leading zeros
  hexStr = hexStr.replaceAll(RegExp(r'^0+'), '');

  // Handle special case of zero
  if (hexStr.isEmpty) {
    return '00';
  }

  // Ensure even length
  if (hexStr.length % 2 != 0) {
    hexStr = '0' + hexStr;
  }

  return hexStr;
}

/**
 * 
 * @param {dynamic} object
 * 
 * This function encodes the object into RLP format.
 * 
 * @returns {Uint8List}
 * 
 * @throws {ArgumentError}  If the object is not a List, int, String, or Uint8List
 */
Uint8List _encode(dynamic object) {
  if (object is List) {
    List<int> payload = [];
    for (var child in object) {
      payload.addAll(_encode(child));
    }
    if (payload.length <= 55) {
      payload.insert(0, 0xc0 + payload.length);
      return Uint8List.fromList(payload);
    }
    Uint8List length = arrayifyInteger(payload.length);
    length = Uint8List.fromList([0xf7 + length.length] + length);
    return Uint8List.fromList(length + payload);
  }

  if (object is int) {
    object = arrayifyInteger(object);
  } else if (object is String) {
    object = Uint8List.fromList(hex.decode(normalizeHexString(object)));
  }

  if (!_isBytesLike(object)) {
    throw ArgumentError(
        "RLP object must be BytesLike (Uint8List), int, String, or List<dynamic>");
  }

  Uint8List data = object;
  if (data.length == 1 && data[0] == 0) {
    return Uint8List.fromList([0x80]);
  } else if (data.length == 1 && data[0] <= 0x7f) {
    return data;
  } else if (data.length <= 55) {
    return Uint8List.fromList([0x80 + data.length] + data.toList());
  }

  Uint8List length = arrayifyInteger(data.length);
  length = Uint8List.fromList([0xb7 + length.length] + length);
  return Uint8List.fromList(length + data);
}

/**
 * 
 * @param {dynamic} object
 * 
 * This function encodes the object into RLP format and returns a hexadecimal string.
 * 
 * @returns {String}
 */
String rlpEncode(dynamic object) {
  return _encode(object).toHex;
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
