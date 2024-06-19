import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_param.dart';
import 'package:walletkit_dart/src/utils/buffer.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

extension FunctionParamTypeExtension on FunctionParamType {
  Uint8List encodeParameter(dynamic value) {
    switch (this) {
      case FunctionParamType.address:
        return _encodeAddress(value as String);
      case FunctionParamType.uint256:
        return _encodeUint256(value as BigInt);
      case FunctionParamType.uint8:
        return throw UnimplementedError();
      case FunctionParamType.int:
        return throw UnimplementedError();
      case FunctionParamType.int256:
        return throw UnimplementedError();
      case FunctionParamType.uint:
        return _encodeUint256(value as BigInt);
      case FunctionParamType.bytes:
        return throw UnimplementedError();
      case FunctionParamType.bytesArray:
        return throw UnimplementedError();
      case FunctionParamType.uint256Array:
        return throw UnimplementedError();
      case FunctionParamType.addressArray:
        return encodeArray(value as List<dynamic>, this.arrayType!);
      case FunctionParamType.Bool:
        return throw UnimplementedError();
      case FunctionParamType.string:
        return throw UnimplementedError();
      case FunctionParamType.BoolArray:
        return throw UnimplementedError();
      case FunctionParamType.int256Array:
        return throw UnimplementedError();
      case FunctionParamType.stringArray:
        return throw UnimplementedError();
      case FunctionParamType.int8Array:
        return throw UnimplementedError();
      case FunctionParamType.uint8Array:
        return throw UnimplementedError();
      case FunctionParamType.bytes32:
        return throw UnimplementedError();
      case FunctionParamType.int8:
        return throw UnimplementedError();
      case FunctionParamType.bytes4:
        return throw UnimplementedError();
      case FunctionParamType.uint32:
        return throw UnimplementedError();
    }
  }
}

Uint8List _encodeUint256(BigInt value) {
  if (value < BigInt.zero) {
    throw Exception('Negative value');
  }
  if (value.bitLength > 256) {
    throw Exception('Value is too big');
  }
  final byteData = ByteData(32);
  final bytes = value.toRadixString(16).padLeft(64, '0');
  final bytesList = bytes.hexToBytes;

  for (var i = 0; i < bytesList.length; i++) {
    byteData.setUint8(32 - bytesList.length + i, bytesList[i]);
  }

  return byteData.buffer.asUint8List();
}

Uint8List _encodeAddress(String address) {
  if (address.length != 42) {
    throw Exception('Invalid address');
  }

  final bytes = address.substring(2).hexToBytes;
  final byteData = ByteData(32);

  for (var i = 0; i < bytes.length; i++) {
    byteData.setUint8(12 + i, bytes[i]);
  }

  return byteData.buffer.asUint8List();
}

String decodeString(Uint8List encoded) {
  if (encoded.length < 64) {
    throw ArgumentError("Invalid encoded string");
  }

  final offsetHex = hex.encode(encoded.sublist(0, 32));
  final offset = BigInt.parse(offsetHex, radix: 16).toInt();

  final lengthHex = hex.encode(encoded.sublist(offset, offset + 32));
  final length = BigInt.parse(lengthHex, radix: 16).toInt();
  final stringDataHex =
      hex.encode(encoded.sublist(offset + 32, offset + 32 + length));
  final stringBytes = Uint8List.fromList(hex.decode(stringDataHex));

  return String.fromCharCodes(stringBytes);
}

Uint8List encodeArray(
  List<dynamic> values,
  FunctionParamType type,
) {
  final bytes_builder = BytesBuilder();

  final length_payload = _encodeUint256(values.length.toBigInt);

  bytes_builder.add(length_payload);

  for (var i = 0; i < values.length; i++) {
    final encoded = type.encodeParameter(values[i]);
    bytes_builder.add(encoded);
  }

  assert(bytes_builder.length % 32 == 0);

  return bytes_builder.toBytes();
}

const int size_unit = 32;
final Uint8List empty_bytes = Uint8List.fromList(List.filled(size_unit, -1));

class DataFieldBuilder {
  final Uint8List functionSelector;
  final Map<FunctionParam, dynamic> fields;
  final BufferBuilder buffer = BufferBuilder();

  DataFieldBuilder({
    required this.functionSelector,
    required this.fields,
  });

  DataFieldBuilder.fromFunction(ContractFunction function, List<dynamic> values)
      : assert(
          function.parameters.length == values.length,
          'Invalid values length. Must be equal to function parameters length',
        ),
        functionSelector = function.functionSelector,
        fields = {
          for (final param in function.parameters)
            param: values[function.parameters.indexOf(param)]
        };

  Uint8List buildDataField() {
    final dynamicHeaderOffsets = List.filled(fields.length, -1);

    assert(functionSelector.length == 4);

    for (var i = 0; i < fields.length; i++) {
      final MapEntry(key: param, value: payload) = fields.entries.elementAt(i);
      if (param.isDynamic) {
        dynamicHeaderOffsets[i] = buffer.length;
        _addField(empty_bytes);
        continue;
      }

      final encoded = param.type.encodeParameter(payload);
      _addField(encoded);
    }

    /// Update Dynamic Fields
    for (var i = 0; i < fields.length; i++) {
      final MapEntry(key: param, value: payload) = fields.entries.elementAt(i);

      /// Skip if not dynamic
      if (param.isDynamic == false) continue;

      final headerOffset = dynamicHeaderOffsets[i]; // Get offset of placeholder
      assert(headerOffset != -1);

      /// Replace placeholder with current offset
      final header = _encodeUint256(buffer.length.toBigInt);
      _replace(header, headerOffset);

      /// Write dynamic field
      final encoded = param.type.encodeParameter(payload);
      _addField(encoded);
    }

    return Uint8List.fromList([
      ...functionSelector,
      ...buffer.asBytes(),
    ]);
  }

  void _addField(Uint8List payload) {
    final length = payload.length;
    assert(length % size_unit == 0);

    buffer.add(payload);
  }

  void _replace(Uint8List payload, int offset) {
    final length = payload.length;
    assert(length % size_unit == 0);

    buffer.setRange(offset, length, payload);
  }
}
