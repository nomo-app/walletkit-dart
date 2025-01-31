import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/parameter_type/function_parameter_type.dart';

class FunctionParam {
  final String? name;
  final FunctionParamType type;
  final bool? indexed;

  bool get isDynamic => type.isDynamic;

  const FunctionParam({
    required this.name,
    required this.type,
    this.indexed,
  });

  factory FunctionParam.fromJson(Map<String, dynamic> map) {
    return FunctionParam(
      name: map['name'],
      type: FunctionParamType.fromString(map['type']),
      indexed: map['indexed'] as bool? ?? false,
    );
  }

  Json toJson() {
    return {
      'name': name,
      'indexed': indexed,
      'type': type.name,
    };
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

  Json toJson() {
    return {
      'name': name,
      'indexed': indexed,
      'type': type.name,
      'value': type.valueToJson(value),
    };
  }

  factory FunctionParamWithValue.fromJson(Map map) {
    final type = FunctionParamType.fromString(map['type']);
    return FunctionParamWithValue(
      value: type.valueFromJson(map['value']),
      name: map['name'],
      indexed: map['indexed'] as bool? ?? false,
      type: type,
    );
  }
}
