library function_parameter_type;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_decoding.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'int_parameter_type.dart';
part 'fixed_parameter_type.dart';
part 'bytes_parameter_type.dart';

///
/// https://docs.soliditylang.org/en/latest/abi-spec.html
///

const _elementaryTypes = <FunctionParamType>[
  FunctionParamAddress(),
  FunctionParamBool(),
  FunctionParamBytes(),
  FunctionParamString(),
  FunctionParamInt(),
  FunctionParamInt8(),
  FunctionParamInt16(),
  FunctionParamInt24(),
  FunctionParamInt32(),
  FunctionParamInt40(),
  FunctionParamInt48(),
  FunctionParamInt56(),
  FunctionParamInt64(),
  FunctionParamInt72(),
  FunctionParamInt80(),
  FunctionParamInt88(),
  FunctionParamInt96(),
  FunctionParamInt104(),
  FunctionParamInt112(),
  FunctionParamInt120(),
  FunctionParamInt128(),
  FunctionParamInt136(),
  FunctionParamInt144(),
  FunctionParamInt152(),
  FunctionParamInt160(),
  FunctionParamInt168(),
  FunctionParamInt176(),
  FunctionParamInt184(),
  FunctionParamInt192(),
  FunctionParamInt200(),
  FunctionParamInt208(),
  FunctionParamInt216(),
  FunctionParamInt224(),
  FunctionParamInt232(),
  FunctionParamInt240(),
  FunctionParamInt248(),
  FunctionParamInt256(),
  FunctionParamUint(),
  FunctionParamUint8(),
  FunctionParamUint16(),
  FunctionParamUint24(),
  FunctionParamUint32(),
  FunctionParamUint40(),
  FunctionParamUint48(),
  FunctionParamUint56(),
  FunctionParamUint64(),
  FunctionParamUint72(),
  FunctionParamUint80(),
  FunctionParamUint88(),
  FunctionParamUint96(),
  FunctionParamUint104(),
  FunctionParamUint112(),
  FunctionParamUint120(),
  FunctionParamUint128(),
  FunctionParamUint136(),
  FunctionParamUint144(),
  FunctionParamUint152(),
  FunctionParamUint160(),
  FunctionParamUint168(),
  FunctionParamUint176(),
  FunctionParamUint184(),
  FunctionParamUint192(),
  FunctionParamUint200(),
  FunctionParamUint208(),
  FunctionParamUint216(),
  FunctionParamUint224(),
  FunctionParamUint232(),
  FunctionParamUint240(),
  FunctionParamUint248(),
  FunctionParamUint256(),
  FunctionParamBytes1(),
  FunctionParamBytes2(),
  FunctionParamBytes3(),
  FunctionParamBytes4(),
  FunctionParamBytes5(),
  FunctionParamBytes6(),
  FunctionParamBytes7(),
  FunctionParamBytes8(),
  FunctionParamBytes9(),
  FunctionParamBytes10(),
  FunctionParamBytes11(),
  FunctionParamBytes12(),
  FunctionParamBytes13(),
  FunctionParamBytes14(),
  FunctionParamBytes15(),
  FunctionParamBytes16(),
  FunctionParamBytes17(),
  FunctionParamBytes18(),
  FunctionParamBytes19(),
  FunctionParamBytes20(),
  FunctionParamBytes21(),
  FunctionParamBytes22(),
  FunctionParamBytes23(),
  FunctionParamBytes24(),
  FunctionParamBytes25(),
  FunctionParamBytes26(),
  FunctionParamBytes27(),
  FunctionParamBytes28(),
  FunctionParamBytes29(),
  FunctionParamBytes30(),
  FunctionParamBytes31(),
  FunctionParamBytes32(),
];

sealed class FunctionParamType<T> {
  final String name;
  final Type internalType;

  const FunctionParamType(this.name, this.internalType);

  bool get isDynamic => switch (this) {
        TupleFunctionParamType type => type.types.any((type) => type.isDynamic),
        ArrayFunctionParamType type => (type.isFixed && type.itemType.isDynamic == false) == false,
        DynamicFunctionParamType _ => true,
        _ => false,
      };

  static FunctionParamType fromString(String name) {
    if (name.endsWith(']')) {
      final lastOpeningsBracket = name.lastIndexOf('[');
      final length = (name.length - 1) - lastOpeningsBracket > 1
          ? int.parse(name[lastOpeningsBracket + 1])
          : 0;
      final itemTypeName = name.substring(0, lastOpeningsBracket);
      final itemParamType = fromString(itemTypeName);
      return itemParamType.getArrayType(length);
    }

    if (name.startsWith('(') && name.endsWith(')')) {
      final nameWithoutParentheses = name.substring(1, name.length - 1);
      final tupleTypes =
          extractParams(nameWithoutParentheses).map((e) => fromString(e.$1)).toList();
      return TupleFunctionParamType(name, tupleTypes);
    }

    return _elementaryTypes.singleWhere(
      (element) => element.name == name,
      orElse: () => throw Exception('Invalid type: $name'),
    );
  }

  Uint8List encode(T value);

  T valueFromJson(dynamic json);

  dynamic valueToJson(T value);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is FunctionParamType) {
      return name == other.name;
    }
    return false;
  }

  ArrayFunctionParamType<T> getArrayType(int length) =>
      ArrayFunctionParamType("${name}[${length > 0 ? length : ''}]", this);
}

abstract class BaseFunctionParamType<T> extends FunctionParamType<T> {
  const BaseFunctionParamType(String name) : super(name, T);

  T decode(Uint8List data);
}

abstract class DynamicFunctionParamType<T> extends FunctionParamType<T> {
  const DynamicFunctionParamType(String name) : super(name, T);

  (T, int) decode(int offset, Uint8List data);
}

///
/// Tuple
///
final class TupleFunctionParamType extends FunctionParamType<List<dynamic>> {
  final List<FunctionParamType> types;

  const TupleFunctionParamType(String name, this.types) : super(name, List<dynamic>);

  @override
  Uint8List encode(List<dynamic> value) {
    final builder = DataFieldBuilder(
      fields: [
        for (var i = 0; i < types.length; i++) (types[i], value[i]),
      ],
    );
    return builder.buildDataField();
  }

  (List<dynamic>, int) decode(int offset, Uint8List data) {
    final values = <dynamic>[];
    int initial_offset = offset;
    int max_offset = 0;

    for (final type in types) {
      final decoded = decodeParameter(
        data: data,
        type: type,
        offset: offset,
        max_offset: max_offset,
        header_offset_increment: initial_offset,
      );
      offset = decoded.offset;
      max_offset = max(max_offset, decoded.max_offset);
      values.add(decoded.value);
    }

    max_offset = max(max_offset, offset);

    return (values, max_offset);
  }

  @override
  valueToJson(List<dynamic> value) => value.mapIndexed((index, element) {
        final type = types[index];
        return type.valueToJson(element);
      }).toList();

  @override
  List<dynamic> valueFromJson(dynamic json) {
    return switch (json) {
      List list => list.mapIndexed((index, element) {
          final type = types[index];
          return type.valueFromJson(element);
        }).toList(),
      _ => throw Exception('Invalid value'),
    };
  }
}

///
/// Array TODO: Add support for fixed size arrays
///
final class ArrayFunctionParamType<T> extends FunctionParamType<List<T>> {
  final FunctionParamType<T> itemType;

  const ArrayFunctionParamType(String name, this.itemType) : super(name, List<T>);

  int? get fixed_length {
    final lastOpeningBracket = name.lastIndexOf('[');

    final hasNumber = (name.length - 1) - lastOpeningBracket > 1;

    return hasNumber ? int.parse(name[lastOpeningBracket + 1]) : null;
  }

  bool get isFixed => fixed_length != null;

  (List<T>, int) decode(int offset, Uint8List data) {
    final length = switch (fixed_length) {
      int length => length,
      _ => () {
          final length = FunctionParamInt().decode(data.sublist(offset, offset + size_unit));
          offset += size_unit;
          return length.toInt();
        }.call(),
    };

    final values = <T>[];
    final array_offset = offset;
    int max_offset = 0;
    for (var i = 0; i < length.toInt(); i++) {
      final decoded = decodeParameter(
        data: data,
        type: itemType,
        offset: offset,
        max_offset: max_offset,
        header_offset_increment: array_offset,
      );
      offset = decoded.offset;
      max_offset = max(max_offset, decoded.max_offset);
      values.add(decoded.value);
    }

    max_offset = max(max_offset, offset);

    return (values, max_offset);
  }

  Uint8List encode(List<T> values) {
    final length = values.length;

    final length_header = FunctionParamInt().encode(length.toBigInt);

    final encoded_values = values.map((value) => itemType.encode(value));

    return Uint8List.fromList(
      [...length_header, for (var value in encoded_values) ...value],
    );
  }

  @override
  valueToJson(List<T> value) => value.map((val) => itemType.valueToJson(val)).toList();

  @override
  List<T> valueFromJson(dynamic json) {
    return switch (json) {
      List list => list.map((e) => itemType.valueFromJson(e)).toList(),
      _ => throw Exception('Invalid value'),
    };
  }
}

final class FunctionParamAddressArray extends ArrayFunctionParamType<String> {
  const FunctionParamAddressArray() : super('address[]', const FunctionParamAddress());
}

final class FunctionParamBytesArray extends ArrayFunctionParamType<Uint8List> {
  const FunctionParamBytesArray() : super('bytes[]', const FunctionParamBytes());
}

///
/// Address
/// Bool
/// String
///

final class FunctionParamAddress extends BaseFunctionParamType<String> {
  const FunctionParamAddress() : super('address');

  @override
  Uint8List encode(String value) {
    if (value.length != 42) {
      throw Exception('Invalid address');
    }

    final bytes = value.substring(2).hexToBytes;
    final byteData = ByteData(size_unit);

    for (var i = 0; i < bytes.length; i++) {
      byteData.setUint8(12 + i, bytes[i]);
    }

    return byteData.buffer.asUint8List();
  }

  @override
  String decode(Uint8List data) {
    final addressBuffer = data.sublist(12, size_unit);
    return "0x" + addressBuffer.toHex;
  }

  @override
  valueToJson(String value) => value;

  @override
  String valueFromJson(json) {
    return switch (json) {
      String str => str,
      _ => throw Exception('Invalid value'),
    };
  }
}

final class FunctionParamBool extends BaseFunctionParamType<bool> {
  const FunctionParamBool() : super('bool');

  @override
  Uint8List encode(bool value) {
    return FunctionParamInt8().encode(value ? BigInt.one : BigInt.zero);
  }

  @override
  bool decode(Uint8List data) {
    return FunctionParamInt8().decode(data) == BigInt.one;
  }

  @override
  valueToJson(bool value) => value;

  @override
  bool valueFromJson(json) {
    return switch (json) {
      String strinbool => bool.parse(strinbool),
      bool b => b,
      _ => throw Exception('Invalid value'),
    };
  }
}

final class FunctionParamString extends DynamicFunctionParamType<String> {
  const FunctionParamString() : super('string');

  @override
  Uint8List encode(String value) {
    return FunctionParamBytes().encode(value.asUTF8);
  }

  @override
  (String, int) decode(int offset, Uint8List data) {
    final (bytes, off) = FunctionParamBytes().decode(offset, data);
    final string = utf8.decode(bytes);
    return (string, off);
  }

  @override
  valueToJson(String value) => value;

  @override
  String valueFromJson(json) {
    return switch (json) {
      String str => str,
      _ => throw Exception('Invalid value'),
    };
  }
}

typedef ABIFunction = ({Uint8List selector, String address});

final class FunctionParamFunction extends BaseFunctionParamType<ABIFunction> {
  const FunctionParamFunction() : super('function');

  @override
  Uint8List encode(ABIFunction value) {
    throw UnimplementedError();
  }

  @override
  ABIFunction decode(Uint8List data) {
    throw UnimplementedError();
  }

  @override
  valueToJson(ABIFunction value) {
    throw UnimplementedError();
  }

  @override
  ABIFunction valueFromJson(json) {
    throw UnimplementedError();
  }
}
