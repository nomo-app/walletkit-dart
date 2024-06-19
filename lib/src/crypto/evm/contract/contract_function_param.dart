import 'package:collection/collection.dart';

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
}

enum FunctionParamType {
  address("address"),
  uint256("uint256"),
  uint8("uint8"),
  int("int"),
  int256("int256"),
  uint("uint"),
  bytes("bytes"),
  bytesArray("bytes[]", true),
  uint256Array("uint256[]", true),
  addressArray("address[]", true, FunctionParamType.address),
  Bool("bool"),
  BoolArray("bool[]", true),
  int256Array("int256[]", true),
  stringArray("string[]", true),
  int8Array("int8[]", true),
  uint8Array("uint8[]", true),
  bytes32("bytes32"),
  int8("int8"),
  bytes4("bytes4"),
  uint32("uint32"),
  string("string");

  final String abiName;
  final bool isDynamic;
  final FunctionParamType? arrayType;

  const FunctionParamType(
    this.abiName, [
    this.isDynamic = false,
    this.arrayType = null,
  ]);

  static FunctionParamType fromString(String type) {
    final enumType = FunctionParamType.values.singleWhereOrNull((e) {
      return e.abiName == type;
    });

    if (enumType == null) throw Exception('Unknown type: $type');

    return enumType;
  }

  String get name => abiName;
}
