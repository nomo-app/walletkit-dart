library extensions;

import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/domain/entities/node.dart';
// ignore: implementation_imports
import 'package:pointycastle/src/utils.dart' as p_utils;
import 'package:walletkit_dart/src/utils/var_uint.dart';

extension ExtFixedPrecision on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension BigIntUtil on BigInt {
  Uint8List get toBytesUnsigned {
    assert(this >= BigInt.zero, "BigInt must be positive");
    return p_utils.encodeBigIntAsUnsigned(this);
  }

  Uint8List get toBytes {
    return p_utils.encodeBigInt(this);
  }

  String get toHex => toRadixString(16);

  String get toHexWithPrefix => "0x" + toHex;
}

extension IntListUtil on List<int> {
  // BigInt get toBigInt => BigInt.parse(hex.encode(this), radix: 16);

  Uint8List get toUint8List => Uint8List.fromList(this);

  List<BigInt> get toBigIntList => map((e) => BigInt.from(e)).toList();
}

extension BufferUtil on Uint8List {
  /// Decode a unsigned big-endian integer from the buffer.
  int get toUInt {
    int result = 0;
    for (var i = 0; i < length; i++) {
      result = result * 256 + this[i];
    }
    return result;
  }

  /// Decode a big-endian integer from the buffer.
  /// Can be positive or negative.
  int get toInt {
    bool negative = length > 0 && (this[0] & 0x80) == 0x80;
    int result = 0;

    for (var i = 0; i < length; i++) {
      result = result * 256 + this[i];
    }

    return negative ? -(~result + 1) : result;
  }

  /// Decode a signed big-endian integer from the buffer.
  /// Can be positive or negative.
  // BigInt get toBigInt => p_utils.decodeBigInt(this);

  BigInt get toUBigInt {
    BigInt result = BigInt.zero;
    for (var i = 0; i < length; i++) {
      result = result * BigInt.from(256) + BigInt.from(this[i]);
    }
    return result;
  }

  String get toHex => hex.encode(this);

  String get bytesToUTF8 => utf8.decode(this, allowMalformed: true);

  Uint8List get rev => Uint8List.fromList(reversed.toList());

  Uint8List padToSize(int size) {
    if (length >= size) {
      return this;
    }
    final buffer = Uint8List(size);
    buffer.writeSlice(size - length, this);
    return buffer;
  }
}

extension ConvUtil on String {
  Uint8List get hexToBytes => Uint8List.fromList(hex.decode(this));

  Uint8List? get hexToBytesOrNull {
    try {
      return hexToBytes;
    } catch (e) {
      return null;
    }
  }

  Uint8List get hexToBytesWithPrefix => substring(2).hexToBytes;

  Uint8List? get hexToBytesWithPrefixOrNull {
    try {
      return hexToBytesWithPrefix;
    } catch (e) {
      return null;
    }
  }

  Uint8List get asUTF8 => utf8.encode(this);

  int? get toIntOrNull => int.tryParse(this);

  int get toInt => int.parse(this);

  BigInt? get toBigIntOrNull => BigInt.tryParse(this);

  BigInt get toBigInt => BigInt.parse(this);

  BigInt get toBigIntFromHex => BigInt.parse(this, radix: 16);

  BigInt? get toBigIntFromHexOrNull => BigInt.tryParse(this, radix: 16);
}

extension IterableUtil<E> on Iterable<E> {
  operator [](int index) {
    if (index < 0) {
      throw RangeError("index must be positive");
    }
    var i = 0;
    for (var element in this) {
      if (i == index) {
        return element;
      }
      i++;
    }
    throw RangeError("index out of range");
  }
}

extension NumUtil on num {
  BigInt get toBigInt => BigInt.from(this);

  String get toHex => toInt().toRadixString(16);

  String get toHexWithPrefix => "0x" + toHex;
}

extension FutureUtil<T> on Future<T> {
  Future<T> withRetry({
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    int retries = 0;
    while (retries < maxRetries) {
      try {
        return this;
      } catch (e) {
        retries++;
        if (retries == maxRetries) {
          rethrow;
        }
        await Future.delayed(delay);
      }
    }
    throw Exception("Retry failed");
  }
}

extension FuturesUtil<T> on Iterable<Future<T>> {
  Future<List<T>> waitAll({
    int batchSize = 50,
  }) async {
    final futures = List<Future<T>>.from(this);
    final results = <T>[];
    while (futures.isNotEmpty) {
      final batch = futures.take(batchSize).toList();
      futures.removeRange(0, batch.length);
      final batchResults = await Future.wait(batch);
      results.addAll(batchResults);
    }
    return results;
  }
}

extension NodesUtil on Iterable<NodeWithAddress> {
  Iterable<String> get addresses => map((e) => e.address);
  Iterable<ChangeNode> get changeNodes => whereType<ChangeNode>();
  Iterable<ReceiveNode> get receiveNodes => whereType<ReceiveNode>();
  Iterable<NodeWithAddress> get neutered => map((node) => node.neutered);
}

extension ListUtil<T> on List<T> {
  List<T> get growable => List<T>.from(this, growable: true);
}
