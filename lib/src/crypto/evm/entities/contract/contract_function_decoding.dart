import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_param.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/parameter_type/function_parameter_type.dart';
import 'dart:math';

List<FunctionParamWithValue> decodeDataField({
  required Uint8List data,
  required List<FunctionParam> params,
}) {
  final decodedParams = <FunctionParamWithValue>[];
  int offset = 0;
  int max_offset = 0;
  for (final param in params) {
    final decoded = decodeParameter(
      data: data,
      type: param.type,
      offset: offset,
      max_offset: max_offset,
    );

    offset = decoded.offset;
    max_offset = max(max_offset, decoded.max_offset);

    final decodedParam = FunctionParamWithValue.fromParam(param, decoded.value);

    decodedParams.add(decodedParam);
  }

  max_offset = max(max_offset, offset);

  if (max_offset != data.length) {
    throw Exception("offset is not equal to data length");
  }

  return decodedParams;
}

({dynamic value, int offset, int max_offset}) decodeParameter({
  required Uint8List data,
  required FunctionParamType type,
  required int offset,
  required int max_offset,
  int header_offset_increment = 0,
}) {
  final data_field = data.sublist(offset, offset + size_unit);
  final value = switch (type) {
    BaseFunctionParamType type => () {
        offset += size_unit;
        return type.decode(data_field);
      }.call(),
    TupleFunctionParamType type => () {
        if (type.isDynamic) {
          final headerOffset =
              FunctionParamInt().decode(data_field).toInt() + header_offset_increment;
          final (value, off) = type.decode(headerOffset, data);
          max_offset = max(max_offset, off);
          offset += size_unit;
          return value;
        }

        /// Tuple is not dynamic
        final (value, off) = type.decode(offset, data);
        offset = off;
        return value;
      }.call(),
    ArrayFunctionParamType type => () {
        if (type.isDynamic) {
          final headerOffset =
              FunctionParamInt().decode(data_field).toInt() + header_offset_increment;
          final (value, off) = type.decode(headerOffset, data);
          max_offset = max(max_offset, off);
          offset += size_unit;
          return value;
        }

        /// Array is not dynamic
        final (value, off) = type.decode(offset, data);
        offset = off;
        return value;
      }.call(),
    DynamicFunctionParamType type => () {
        final headerOffset =
            FunctionParamInt().decode(data_field).toInt() + header_offset_increment;
        final (value, off) = type.decode(headerOffset, data);
        max_offset = max(max_offset, off);
        offset += size_unit;
        return value;
      }.call(),
  };

  max_offset = max(max_offset, offset);

  return (
    value: value,
    offset: offset,
    max_offset: max_offset,
  );
}
