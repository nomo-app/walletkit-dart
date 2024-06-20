import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';
import 'package:walletkit_dart/src/utils/buffer.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

Uint8List encodeUint256(BigInt value) {
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

Uint8List encodeAddress(String address) {
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

const int size_unit = 32;
final Uint8List empty_bytes = Uint8List.fromList(List.filled(size_unit, -1));

class DataFieldBuilder {
  final ContractFunctionWithValues function;
  final BufferBuilder buffer = BufferBuilder();

  DataFieldBuilder({
    required this.function,
  });

  Uint8List buildDataField() {
    final dynamicHeaderOffsets = List.filled(function.parameters.length, -1);

    assert(function.functionSelector.length == 4);

    for (var i = 0; i < function.parameters.length; i++) {
      final param = function.parameters[i];
      if (param.isDynamic) {
        dynamicHeaderOffsets[i] = buffer.length;
        _addField(empty_bytes);
        continue;
      }

      final encoded = param.type.encode(param.value);
      _addField(encoded);
    }

    /// Update Dynamic Fields
    for (var i = 0; i < function.parameters.length; i++) {
      final param = function.parameters[i];

      /// Skip if not dynamic
      if (param.isDynamic == false) continue;

      final headerOffset = dynamicHeaderOffsets[i]; // Get offset of placeholder
      assert(headerOffset != -1);

      /// Replace placeholder with current offset
      final header = encodeUint256(buffer.length.toBigInt);
      _replace(header, headerOffset);

      /// Write dynamic field
      final encoded = param.type.encode(param.value);
      _addField(encoded);
    }

    return Uint8List.fromList([
      ...function.functionSelector,
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
