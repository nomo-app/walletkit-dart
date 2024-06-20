import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';
import 'package:walletkit_dart/src/utils/buffer.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
      final header = FunctionParamInt().encode(buffer.length.toBigInt);
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
