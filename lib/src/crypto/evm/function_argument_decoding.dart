import 'dart:typed_data';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'dart:math';

class DecodedFunctionValue {
  final dynamic value;
  final int offset;

  DecodedFunctionValue({required this.value, required this.offset});
}

DecodedFunctionValue decodeByte(int offset, Uint8List data, int max_offset) {
  var byte_offset = data
          .sublist(offset, offset + 32)
          .toHex
          .substring(56)
          .toBigIntFromHex
          .toInt() +
      4;

  final length = data
      .sublist(byte_offset, byte_offset + 32)
      .toHex
      .substring(56)
      .toBigIntFromHex
      .toInt();

  byte_offset += 32;
  final bytes = "0x" + data.sublist(byte_offset, byte_offset + length).toHex;
  byte_offset += length;
  max_offset = max(max_offset, byte_offset);
  return DecodedFunctionValue(
    value: bytes,
    offset: max_offset,
  );
}

DecodedFunctionValue decodeUint256Array(int offset, Uint8List data) {
  final field_lenght = data
      .sublist(offset, offset + 32)
      .toHex
      .substring(56)
      .toBigIntFromHex
      .toInt();

  offset += 32;

  final legth = data
      .sublist(offset, offset + 32)
      .toHex
      .substring(56)
      .toBigIntFromHex
      .toInt();

  offset += 32;

  final values = [
    for (int i = 0; i < legth; i++)
      data
          .sublist(offset + i * field_lenght, offset + (i + 1) * field_lenght)
          .toHex
          .toBigIntFromHex,
  ];
  offset += field_lenght * legth - 32;

  return DecodedFunctionValue(
    value: values,
    offset: offset,
  );
}

DecodedFunctionValue decodeBytesArray(
    int offset, int max_offset, Uint8List data) {
  var array_offset = data
          .sublist(offset, offset + 32)
          .toHex
          .substring(56)
          .toBigIntFromHex
          .toInt() +
      4;

  final array_length = data
      .sublist(array_offset, array_offset + 32)
      .toHex
      .substring(56)
      .toBigIntFromHex
      .toInt();

  array_offset += 32;
  final array_items_start_point = array_offset;
  var byte_offsets = [];

  for (int i = 0; i < array_length; i++) {
    var byte_offset = data
            .sublist(array_offset, array_offset + 32)
            .toHex
            .substring(56)
            .toBigIntFromHex
            .toInt() +
        array_items_start_point;

    byte_offsets.add(byte_offset);

    array_offset += 32;
  }

  var values = [];

  for (int i = 0; i < byte_offsets.length; i++) {
    var byte_offset = byte_offsets[i];

    final length = data
        .sublist(byte_offset, byte_offset + 32)
        .toHex
        .substring(56)
        .toBigIntFromHex
        .toInt();

    byte_offset += 32;

    final byte = "0x" + data.sublist(byte_offset, byte_offset + length).toHex;
    byte_offset += length;

    max_offset = max(max_offset, byte_offset);
    values.add(byte);
  }

  return DecodedFunctionValue(
    value: values,
    offset: max_offset,
  );
}
