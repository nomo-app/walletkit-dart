import 'dart:convert';
import 'dart:typed_data';

import 'package:walletkit_dart/src/domain/extensions.dart';

sealed class RLPItem<T> {
  final T value;

  RLPItem(this.value);

  Uint8List get encoded;

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
  Uint8List get encoded => arrayifyInteger(value);
}

final class RLPString extends RLPItem<String> {
  RLPString(super.value);

  @override
  Uint8List get encoded {
    if (value.startsWith("0x")) {
      return value.substring(2).hexToBytes;
    }

    return utf8.encode(value);
  }
}

final class RLPBigInt extends RLPItem<BigInt> {
  RLPBigInt(super.value);

  @override
  Uint8List get encoded {
    if (value == BigInt.zero) {
      return Uint8List.fromList([0x80]);
    }
    return this.value.bigIntToBytes;
  }
}

final class RLPBytes extends RLPItem<Uint8List> {
  RLPBytes(super.value);

  @override
  Uint8List get encoded => value;
}

final class RLPList extends RLPItem<List<RLPItem>> {
  RLPList(super.value);

  @override
  Uint8List get encoded {
    throw UnimplementedError();
  }

  int get length => value.length;

  RLPItem operator [](int index) {
    return value[index];
  }
}

Uint8List encodeRLP(RLPItem input) {
  if (input is RLPList) {
    final outpout = List<int>.empty(growable: true);

    for (final item in input.value) {
      outpout.addAll(encodeRLP(item));
    }
    if (outpout.length < 56) {
      return Uint8List.fromList([0xc0 + outpout.length, ...outpout]);
    }

    final lengthBuffer = arrayifyInteger(outpout.length);
    return Uint8List.fromList(
      [
        0xf7 + lengthBuffer.length,
        ...lengthBuffer,
        ...outpout,
      ],
    );
  }

  final buffer = input.encoded;

  if (input is RLPInt && buffer.length == 1 && input.value == 0) {
    return buffer;
  }

  if (input is RLPBigInt && buffer.length == 1 && input.value == BigInt.zero) {
    return buffer;
  }

  if (buffer.length == 1 && buffer[0] < 128) {
    return buffer;
  }

  if (buffer.length < 56) {
    return Uint8List.fromList([0x80 + buffer.length, ...buffer]);
  }

  final lengthBuffer = arrayifyInteger(buffer.length);

  return Uint8List.fromList(
    [
      0xb7 + lengthBuffer.length,
      ...lengthBuffer,
      ...buffer,
    ],
  );
}

Uint8List rlpEncode(dynamic input) {
  return Uint8List(1);
}

RLPItem decodeRLP(Uint8List input) {
  return RLPInt(0);
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
