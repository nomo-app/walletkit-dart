import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_param.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'dart:math';

List<FunctionParamWithValue> decodeDataField({
  required Uint8List data,
  required List<FunctionParam> params,
}) {
  final decodedParams = <FunctionParamWithValue>[];
  int offset = 0;
  int max_offset = 0;
  params.forEach((param) {
    final data_field = data.sublist(offset, offset + size_unit);

    final decodedValue = switch (param.type) {
      BaseFunctionParamType type => type.decode(data_field),
      DynamicFunctionParamType type => () {
          final headerOffset = FunctionParamInt().decode(data_field).toInt();
          final (value, off) = type.decode(headerOffset, data);
          max_offset = max(max_offset, off);
          return value;
        }.call(),
      ArrayFunctionParamType type => () {
          final headerOffset = FunctionParamInt().decode(data_field).toInt();
          final (value, off) = type.decode(headerOffset, data);
          max_offset = max(max_offset, off);
          return value;
        }.call()
    };

    final decodedParam = FunctionParamWithValue.fromParam(param, decodedValue);

    offset += size_unit;

    decodedParams.add(decodedParam);
  });

  max_offset = max(max_offset, offset);

  if (max_offset != data.length) {
    throw Exception("offset is not equal to data length");
  }

  return decodedParams;
}

class DecodedFunctionValue<T> {
  final T value;
  final int offset;

  DecodedFunctionValue({required this.value, required this.offset});
}

DecodedFunctionValue<Uint8List> decodeByte(
  int offset,
  Uint8List data,
  int max_offset,
) {
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
  final bytes = data.sublist(byte_offset, byte_offset + length);
  byte_offset += length;
  max_offset = max(max_offset, byte_offset);
  return DecodedFunctionValue(
    value: bytes,
    offset: max_offset,
  );
}

DecodedFunctionValue<List<BigInt>> decodeUint256Array(
  int offset,
  Uint8List data,
) {
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

DecodedFunctionValue<List<Uint8List>> decodeBytesArray(
  int offset,
  int max_offset,
  Uint8List data,
) {
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

  var values = <Uint8List>[];

  for (int i = 0; i < byte_offsets.length; i++) {
    var byte_offset = byte_offsets[i];

    final length = data
        .sublist(byte_offset, byte_offset + 32)
        .toHex
        .substring(56)
        .toBigIntFromHex
        .toInt();

    byte_offset += 32;

    final byte = data.sublist(byte_offset, byte_offset + length);
    byte_offset += length;

    max_offset = max(max_offset, byte_offset);
    values.add(byte);
  }

  return DecodedFunctionValue(
    value: values,
    offset: max_offset,
  );
}

DecodedFunctionValue<List<String>> decodeAddressArray(
  int offset,
  int max_offset,
  Uint8List data,
) {
  final subList = data.sublist(offset, offset + 32);
  final subListHex = subList.toHex;
  final subListHex56 = subListHex.substring(56);
  final arrayLengthBigInt = subListHex56.toBigIntFromHex;
  var arrayOffset = arrayLengthBigInt.toInt() + 4;

  final arrayLength = data
      .sublist(arrayOffset, arrayOffset + 32)
      .toHex
      .substring(56)
      .toBigIntFromHex
      .toInt();

  arrayOffset += 32;
  var addresses = <String>[];

  for (int i = 0; i < arrayLength; i++) {
    var address = data.sublist(arrayOffset, arrayOffset + 32).toHex;
    addresses.add("0x" + address.substring(24));
    arrayOffset += 32;
  }

  max_offset = max(max_offset, arrayOffset);

  return DecodedFunctionValue(
    value: addresses,
    offset: max_offset,
  );
}
