import 'dart:convert';
import 'dart:typed_data';

import 'package:walletkit_dart/src/domain/extensions.dart';

final class RLPException implements Exception {
  final String message;
  const RLPException(this.message);

  @override
  String toString() {
    return "RLPException: $message";
  }
}

sealed class RLPItem<T> {
  final T value;

  RLPItem(this.value);

  Uint8List get buffer;

  String get hex => buffer.toHex;

  @override
  String toString() => hex;

  static RLPItem<dynamic> fromValue(dynamic value) {
    if (value is int) {
      return RLPInt(value);
    } else if (value is String) {
      if (value.startsWith("#")) {
        return RLPBigInt(BigInt.parse(value.substring(1)));
      }

      return RLPString(value);
    } else if (value is BigInt) {
      return RLPBigInt(value);
    } else if (value is Uint8List) {
      return RLPBytes(value);
    } else if (value is List) {
      final items = value.map((item) => RLPItem.fromValue(item)).toList();
      return RLPList(items);
    }
    throw ArgumentError("Unsupported type: ${value.runtimeType}");
  }
}

final class RLPInt extends RLPItem<int> {
  RLPInt(super.value);

  @override
  Uint8List get buffer => arrayifyInteger(value);
}

final class RLPString extends RLPItem<String> {
  final bool? isHex;

  RLPString(super.value, {this.isHex});

  @override
  Uint8List get buffer {
    if (isHex == true) {
      if (value.startsWith("0x")) {
        return value.substring(2).hexToBytes;
      }
      return value.hexToBytes;
    }

    if (value.startsWith("0x")) {
      return value.substring(2).hexToBytes;
    }

    return utf8.encode(value);
  }
}

final class RLPBigInt extends RLPItem<BigInt> {
  RLPBigInt(super.value);

  @override
  Uint8List get buffer {
    if (value == BigInt.zero) {
      return Uint8List.fromList([0x80]);
    }
    return this.value.toBytesUnsigned;
  }
}

final class RLPNull extends RLPItem<Null> {
  RLPNull() : super(null);

  @override
  Uint8List get buffer => Uint8List(0);
}

final class RLPBytes extends RLPItem<Uint8List> {
  RLPBytes(super.value);

  @override
  Uint8List get buffer => value;
}

final class RLPList extends RLPItem<List<RLPItem>> {
  RLPList(super.value);

  @override
  Uint8List get buffer =>
      Uint8List.fromList([for (final item in value) ...encodeRLP(item)]);

  int get length => value.length;

  RLPItem operator [](int index) {
    return value[index];
  }

  List<String> get hexValues => value.map((e) => e.hex).toList();

  @override
  String get hex => "[" + hexValues.join(", ") + "]";

  factory RLPList.fromBuffer(
    Uint8List buffer,
    int offset,
    int childOffset,
    int length,
  ) {
    final items = <RLPItem>[];
    while (childOffset < offset + 1 + length) {
      final (item, consumed) = decodeRLP(buffer, offset: childOffset);
      items.add(item);
      childOffset += consumed;
    }
    return RLPList(items);
  }
}

Uint8List encodeRLP(RLPItem input) {
  final buffer = input.buffer;

  /// Check for int = 0
  if (input is RLPInt && buffer.length == 1 && input.value == 0) {
    return buffer;
  }

  /// Check for bigint = 0
  if (input is RLPBigInt && buffer.length == 1 && input.value == BigInt.zero) {
    return buffer;
  }
  if (input is! RLPList && buffer.length == 1 && buffer[0] < 128) {
    return buffer;
  }

  if (buffer.length < 56) {
    final flag = switch (input) {
      RLPList _ => 0xc0,
      _ => 0x80,
    };

    return Uint8List.fromList([flag + buffer.length, ...buffer]);
  }

  final lengthBuffer = arrayifyInteger(buffer.length);

  final flag = switch (input) {
    RLPList _ => 0xf7,
    _ => 0xb7,
  };

  return Uint8List.fromList(
    [
      flag + lengthBuffer.length,
      ...lengthBuffer,
      ...buffer,
    ],
  );
}

RLPItem decodeRLPCheck(Uint8List input) {
  final (item, consumed) = decodeRLP(input);
  if (consumed != input.length) {
    throw RLPException("Invalid RLP: input is longer than specified length");
  }
  return item;
}

(RLPItem, int) decodeRLP(
  Uint8List input, {
  int offset = 0,
}) {
  final bytes = input.buffer.asByteData();
  if (offset >= input.length) {
    throw RLPException("offset out of bounds");
  }
  final firstByte = bytes.getUint8(offset);

  switch (firstByte) {
    case >= 0xf8:
      final lengthLength = firstByte - 0xf7;
      if (offset + 1 + lengthLength > input.length) {
        throw RLPException("insufficient data for length bytes");
      }

      final length = decodeLength(input, lengthLength, offset + 1);

      if (length < 56) {
        throw RLPException("encoded list too short");
      }

      final totalLength = 1 + lengthLength + length;
      if (offset + totalLength > input.length) {
        throw RLPException("insufficient data length");
      }

      // For Root Lists we can enforce a stric length check
      if (offset == 0) {
        if (offset + totalLength != input.length) {
          throw RLPException("Given input is longer than specified length");
        }
      }

      return (
        RLPList.fromBuffer(
          input,
          offset,
          offset + 1 + lengthLength,
          lengthLength + length,
        ),
        1 + lengthLength + length
      );
    case >= 0xc0:
      final length = firstByte - 0xc0;

      if (offset + 1 + length > input.length) {
        throw RLPException("insufficient data length");
      }

      // For Root Lists we can enforce a stric length check
      if (offset == 0) {
        if (1 + length != input.length) {
          throw RLPException("Given input is longer than specified length");
        }
      }

      return (
        RLPList.fromBuffer(
          input,
          offset,
          offset + 1,
          length,
        ),
        1 + length
      );
    case >= 0xb8:
      final lengthLength = firstByte - 0xb7;
      if (offset + 1 + lengthLength > input.length) {
        throw RLPException("insufficient data for length bytes");
      }
      final length = decodeLength(input, lengthLength, offset + 1);

      if (length < 56) {
        throw RLPException("Invalid RLP: length is too short");
      }
      if (offset + 1 + lengthLength + length > input.length) {
        throw RLPException("insufficient data length");
      }
      final result = input.sublist(
        offset + 1 + lengthLength,
        offset + 1 + lengthLength + length,
      );
      return (RLPBytes(result), 1 + lengthLength + length);
    case >= 0x80:
      final length = firstByte - 0x80;
      if (offset + 1 + length > input.length) {
        throw RLPException("insufficient data length");
      }
      final result = input.sublist(
        offset + 1,
        offset + 1 + length,
      );
      if (offset == 0 && length == 1 && result[0] < 0x80) {
        throw RLPException(
          "invalid RLP encoding: invalid prefix, single byte < 0x80 are not prefixed",
        );
      }
      return (RLPBytes(result), 1 + length);
    default:
      final result = input.sublist(offset, offset + 1);
      return (RLPBytes(result), 1);
  }
}

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

int decodeLength(
  Uint8List input,
  int lengthLength,
  int offset,
) {
  final buffer = input.sublist(offset, offset + lengthLength);
  if (buffer.length > 1 && buffer[0] == 0) {
    throw RLPException('Leading zeros are not allowed');
  }
  return buffer.toUInt;
}
