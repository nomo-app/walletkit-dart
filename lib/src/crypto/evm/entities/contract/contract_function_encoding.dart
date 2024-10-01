import 'dart:typed_data';
import 'package:walletkit_dart/src/utils/buffer.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const int size_unit = 32;
final Uint8List empty_bytes = Uint8List.fromList(List.filled(size_unit, -1));

class DataFieldBuilder {
  final BufferBuilder buffer = BufferBuilder();

  final List<(FunctionParamType, dynamic)> fields;

  final Uint8List? selector;

  DataFieldBuilder({
    required this.fields,
    this.selector,
  });

  factory DataFieldBuilder.fromFunction({
    required ContractFunctionWithValues function,
  }) {
    return DataFieldBuilder(
      fields: [
        for (final paramWithValue in function.parameters)
          (paramWithValue.type, paramWithValue.value)
      ],
      selector: function.functionSelector,
    );
  }

  Uint8List buildDataField() {
    final dynamicHeaderOffsets = List.filled(fields.length, -1);

    assert(selector == null || selector!.length == 4);

    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];

      final type = field.$1;

      if (type.isDynamic) {
        dynamicHeaderOffsets[i] = buffer.length;
        _addField(empty_bytes);
        continue;
      }
      final value = field.$2;
      final encoded = type.encode(value);
      _addField(encoded);
    }

    /// Update Dynamic Fields
    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];
      final type = field.$1;

      /// Skip if not dynamic
      if (type.isDynamic == false) continue;

      final headerOffset = dynamicHeaderOffsets[i]; // Get offset of placeholder
      assert(headerOffset != -1);

      /// Replace placeholder with current offset
      final header = FunctionParamInt().encode(buffer.length.toBigInt);
      _replace(header, headerOffset);

      /// Write dynamic field
      final value = field.$2;
      final encoded = type.encode(value);
      _addField(encoded);
    }

    return Uint8List.fromList([
      if (selector != null) ...selector!,
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
