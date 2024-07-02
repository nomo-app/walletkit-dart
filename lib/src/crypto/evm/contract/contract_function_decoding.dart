import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_param.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';
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
        }.call(),
      _ => throw Exception('Invalid type: ${param.type}'),
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
