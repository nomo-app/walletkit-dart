import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';

class FunctionParam {
  final String name;
  final FunctionParamType type;
  final bool? indexed;

  bool get isDynamic => type.isDynamic;

  const FunctionParam({
    required this.name,
    required this.type,
    this.indexed,
  });

  factory FunctionParam.fromMap(Map<String, dynamic> map) {
    return FunctionParam(
      name: map['name'],
      type: FunctionParamType.fromString(map['type']),
      indexed: map['indexed'] as bool? ?? false,
    );
  }
}

class FunctionParamWithValue<T> extends FunctionParam {
  final T value;

  const FunctionParamWithValue({
    required this.value,
    required super.name,
    required super.type,
    super.indexed,
  });

  static FunctionParamWithValue fromParam<T>(
    FunctionParam param,
    T value,
  ) {
    return FunctionParamWithValue<T>(
      value: value,
      name: param.name,
      type: param.type,
      indexed: param.indexed,
    );
  }

  T castValue<T>() {
    if (value is T) {
      return value as T;
    }
    throw Exception('Invalid cast');
  }

  FunctionParamWithValue<T> cast<T>() {
    if (value! is T) {
      throw Exception('Invalid cast');
    }
    return FunctionParamWithValue<T>(
      value: value as T,
      name: name,
      type: type,
      indexed: indexed,
    );
  }
}

// enum FunctionParamType {
//   address("address", String),
//   uint256("uint256", BigInt),
//   uint8("uint8", BigInt),
//   int("int", BigInt),
//   int256("int256", BigInt),
//   uint("uint", BigInt),
//   bytes("bytes", Uint8List),
//   bytesArray("bytes[]", List<Uint8List>, true),
//   uint256Array("uint256[]", List<BigInt>, true),
//   addressArray("address[]", List<String>, true, FunctionParamType.address),
//   Bool("bool", bool),
//   BoolArray("bool[]", List<bool>, true),
//   int256Array("int256[]", List<BigInt>, true),
//   stringArray("string[]", List<String>, true),
//   int8Array("int8[]", List<BigInt>, true),
//   uint8Array("uint8[]", List<BigInt>, true),
//   bytes32("bytes32", List<Uint8List>),
//   int8("int8", BigInt),
//   bytes4("bytes4", Uint8List),
//   uint32("uint32", BigInt),
//   string("string", String);

//   final String abiName;
//   final bool isDynamic;
//   final FunctionParamType? arrayType;
//   final Type internalType;

//   const FunctionParamType(
//     this.abiName,
//     this.internalType, [
//     this.isDynamic = false,
//     this.arrayType = null,
//   ]);

//   static FunctionParamType fromString(String type) {
//     final enumType = FunctionParamType.values.singleWhereOrNull((e) {
//       return e.abiName == type;
//     });

//     if (enumType == null) throw Exception('Unknown type: $type');

//     return enumType;
//   }

//   String get name => abiName;
// }
