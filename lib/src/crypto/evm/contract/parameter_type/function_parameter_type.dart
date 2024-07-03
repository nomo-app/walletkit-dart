library function_parameter_type;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
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

  bool get isDynamic => this is DynamicFunctionParamType;

  static FunctionParamType fromString(String name) {
    if (name.endsWith('[]')) {
      final itemTypeName = name.substring(0, name.length - 2);
      final itemParamType = fromString(itemTypeName);
      return itemParamType.arrayType;
    }

    if (name.startsWith('(') && name.endsWith(')')) {
      final nameWithoutParentheses = name.substring(1, name.length - 1);
      final tupleTypes =
          ExternalContractFunction.extractParams(nameWithoutParentheses)
              .map((e) => fromString(e))
              .toList();
      return TupleFunctionParamType(name, tupleTypes);
    }

    return _elementaryTypes.singleWhere(
      (element) => element.name == name,
      orElse: () => throw Exception('Invalid type: $name'),
    );
  }

  Uint8List encode(T value);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is FunctionParamType) {
      return name == other.name;
    }
    return false;
  }

  ArrayFunctionParamType<T> get arrayType =>
      ArrayFunctionParamType("${name}[]", this);
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
final class TupleFunctionParamType
    extends DynamicFunctionParamType<List<dynamic>> {
  final List<FunctionParamType> types;

  const TupleFunctionParamType(super.name, this.types);

  @override
  Uint8List encode(List<dynamic> value) {
    final builder = DataFieldBuilder(
      fields: {
        for (var i = 0; i < types.length; i++) types[i]: value[i],
      },
    );
    return builder.buildDataField();
  }

  (List<dynamic>, int) decode(int offset, Uint8List data) {
    final values = <dynamic>[];
    int initial_offset = offset;
    int max_offset = 0;

    for (var i = 0; i < types.length; i++) {
      final type = types[i];
      final data_field = data.sublist(offset, offset + 32);
      offset += 32;

      final decodedValue = switch (type) {
        BaseFunctionParamType type => type.decode(data_field),
        DynamicFunctionParamType type => () {
            final headerOffset = FunctionParamInt().decode(data_field).toInt();
            final (value, off) =
                type.decode(initial_offset + headerOffset, data);
            max_offset = max(max_offset, off);
            return value;
          }.call(),
      };

      values.add(decodedValue);
    }

    max_offset = max(max_offset, offset);

    return (values, max_offset);
  }
}

///
/// Array
///
final class ArrayFunctionParamType<T>
    extends DynamicFunctionParamType<List<T>> {
  final FunctionParamType<T> itemType;

  const ArrayFunctionParamType(String name, this.itemType) : super(name);

  (List<T>, int) decode(int offset, Uint8List data) {
    final length = FunctionParamInt().decode(data.sublist(offset, offset + 32));
    offset += 32;

    final values = <T>[];
    final array_offset = offset;
    int max_offset = 0;
    for (var i = 0; i < length.toInt(); i++) {
      final data_field = data.sublist(offset, offset + 32);

      values.add(
        switch (itemType) {
          BaseFunctionParamType type => () {
              offset += 32;
              return type.decode(data_field);
            }.call(),
          TupleFunctionParamType type => () {
              final (value, off) = type.decode(offset, data);
              offset =
                  off; // As all tuples inside of an array are the same size we can just use the last offset as the beginning of the next tuple
              return value;
            }.call(),
          DynamicFunctionParamType type => () {
              final headerOffset =
                  FunctionParamInt().decode(data_field).toInt() + array_offset;
              final (value, off) = type.decode(headerOffset, data);
              max_offset = max(max_offset, off);
              offset += 32;
              return value;
            }.call(),
        },
      );
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
}

final class FunctionParamAddressArray extends ArrayFunctionParamType<String> {
  const FunctionParamAddressArray()
      : super('address[]', const FunctionParamAddress());
}

final class FunctionParamBytesArray extends ArrayFunctionParamType<Uint8List> {
  const FunctionParamBytesArray()
      : super('bytes[]', const FunctionParamBytes());
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
    final byteData = ByteData(32);

    for (var i = 0; i < bytes.length; i++) {
      byteData.setUint8(12 + i, bytes[i]);
    }

    return byteData.buffer.asUint8List();
  }

  @override
  String decode(Uint8List data) {
    final addressBuffer = data.sublist(12, 32);
    return "0x" + addressBuffer.toHex;
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
}
