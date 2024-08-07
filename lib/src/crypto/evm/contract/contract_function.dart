import 'dart:typed_data';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_decoding.dart';
import 'package:walletkit_dart/src/domain/repository/function_selector_repository.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

///
/// An Object that represents a contract function where we only have the function signature
/// And hence only have the function name, selector and the parameters
/// Only used for decoding existing datafields
///
class ExternalContractFunction {
  final String name;
  final List<FunctionParam> parameters;

  const ExternalContractFunction({
    required this.name,
    required this.parameters,
  });

  String get function {
    final params = parameters.map((e) => e.type.name).join(',');
    return "$name($params)";
  }

  Uint8List get functionSelector {
    final buffer = keccakUtf8(function);
    return buffer.sublist(0, 4);
  }

  String get functionSelectorHex {
    return functionSelector.toHex;
  }

  factory ExternalContractFunction.fromString({
    required String textSignature,
  }) {
    final opening = textSignature.indexOf("(");
    final closing = textSignature.lastIndexOf(")");
    final name = textSignature.substring(0, opening);
    final params_s = extractParams(
      textSignature.substring(opening + 1, closing),
    );
    final params = [
      for (final param in params_s)
        FunctionParam(
          name: null,
          type: FunctionParamType.fromString(param),
        ),
    ];

    return ExternalContractFunction(
      name: name,
      parameters: params,
    );
  }

  static List<String> extractParams(String text) {
    text = text.trim().replaceAll(' ', '');

    var opening = text.indexOf("(");

    final values = <String>[];
    final start = opening == -1
        ? text
        : opening == 0
            ? ""
            : text.substring(0, opening - 1);

    if (start.isNotEmpty) {
      if (start.startsWith('('))
        values.add(start);
      else if (start.contains(','))
        values.addAll(start.split(','));
      else
        values.add(start);
    }
    if (opening != -1) {
      var closing = -1;
      var nested = 0;
      for (var i = opening; i < text.length; i++) {
        final char = text[i];
        if (nested == 0 && char == ',') {
          closing = i;
          break;
        }

        if (char == "(") nested++;
        if (char == ")") nested--;
      }

      if (closing == -1) closing = text.length;

      var tuple = text.substring(opening, closing);
      values.add(tuple);

      if (closing < text.length) {
        values.addAll(
          extractParams(
            text.substring(closing + 1),
          ),
        );
      }
    }

    return values;
  }
}

///
/// An Object that represents a contract function where we only have the function signature
/// And hence only have the function name, selector and the parameters
/// Created after decoding the datafield with [ExternalContractFunction]
///
class ExternalContractFunctionWithValues extends ExternalContractFunction {
  final List<FunctionParamWithValue> parameters;

  const ExternalContractFunctionWithValues({
    required this.parameters,
    required super.name,
  }) : super(parameters: parameters);

  Json toJson() {
    return {
      "name": name,
      "parameters": parameters.map((e) => e.toJson()).toList(),
    };
  }

  factory ExternalContractFunctionWithValues.fromJson(Map json) {
    if (json
        case {
          "name": String name,
          "parameters": List<dynamic> parameters,
        }) {
      return ExternalContractFunctionWithValues(
        name: name,
        parameters: [
          for (final param in parameters)
            FunctionParamWithValue.fromJson(param),
        ],
      );
    }
    throw Exception("Invalid json");
  }
}

///
/// A mixin for [ContractFunction] and [ContractFunctionWithValues]
/// Used to get the stateMutability and outputs of the function
/// These are only available in the local contract functions
///
mixin LocalContractFunctionMixin {
  StateMutability get stateMutability;
  List<FunctionParam> get outputs;
}

///
/// An Object that represents a contract function generated from an ABI
/// Used for Encoding a datafield and after executing decoding the output
///
class ContractFunction extends ExternalContractFunction
    with LocalContractFunctionMixin {
  final StateMutability stateMutability;
  final List<FunctionParam> outputs;

  const ContractFunction({
    required super.name,
    required super.parameters,
    required this.stateMutability,
    required this.outputs,
  });

  ContractFunctionWithValues addValues({
    required List<dynamic> values,
  }) {
    assert(values.length == parameters.length, "Provided values are invalid");

    final paramsWithValues = <FunctionParamWithValue>[];
    for (var i = 0; i < parameters.length; i++) {
      final param = parameters[i];
      final value = values[i];

      // if (param.type.internalType != value.runtimeType) {
      //   if (param.type.internalType == BigInt &&
      //       value.runtimeType.toString() == "_BigIntImpl") {
      //   } else
      //     throw Exception(
      //       "Invalid type for param: ${param.name}. Expected: ${param.type.internalType} Got: ${value.runtimeType}",
      //     );
      // }

      final paramWithValue = FunctionParamWithValue.fromParam(param, value);
      paramsWithValues.add(paramWithValue);
    }

    return ContractFunctionWithValues(
      name: name,
      parameters: paramsWithValues,
      stateMutability: stateMutability,
      outputs: outputs,
    );
  }
}

class ContractFunctionWithValues extends ExternalContractFunctionWithValues
    with LocalContractFunctionMixin {
  final StateMutability stateMutability;
  final List<FunctionParam> outputs;

  @override
  final List<FunctionParamWithValue> parameters;

  const ContractFunctionWithValues({
    required super.name,
    required this.parameters,
    required this.stateMutability,
    required this.outputs,
  }) : super(parameters: parameters);

  Uint8List buildDataField() {
    final dataFieldBuilder = DataFieldBuilder.fromFunction(function: this);
    return dataFieldBuilder.buildDataField();
  }

  ///
  /// Try to decode the raw data using the [abiList]
  /// If the function is not found locally it will try to fetch the function from an external source (4byte.directory)
  /// If the function is not found, return null
  /// If a local function is found, return a [ContractFunctionWithValues]
  /// If an external function is found, return a [ExternalContractFunctionWithValues]
  ///
  static Future<ExternalContractFunctionWithValues> decodeRawWithFetch({
    required Uint8List data,
    ExternalContractFunction? function,
  }) async {
    try {
      assert(data.length >= 4, "Invalid data length");
      final function_selector = data.sublist(0, 4).toHex;

      if (function != null) {
        return _decodeExternal(data: data, function: function);
      }

      final localResult = decodeRaw(data: data);

      if (localResult != null) {
        return localResult;
      }

      /// Fetch the function from 4byte.directory
      final externalResult =
          await FunctionSelectorRepository.fetchSelector(function_selector);

      if (externalResult != null) {
        return _decodeExternal(data: data, function: externalResult);
      }

      // Fallback
      return ExternalContractFunctionWithValues(
        name: "Unknown",
        parameters: [
          FunctionParamWithValue.fromParam<Uint8List>(
            FunctionParam(name: "data", type: FunctionParamBytes()),
            data,
          ),
        ],
      );
    } catch (e) {
      // Fallback

      throw FunctionDecodingException("Error decoding function: $e");
    }
  }

  ///
  /// Try to decode the raw data using the [abiList] and return the decoded function
  /// If the function is not found, return null
  ///
  static ContractFunctionWithValues? decodeRaw({
    required Uint8List data,
  }) {
    assert(data.length >= 4, "Invalid data length");

    final function_selector = data.sublist(0, 4).toHex;

    final validAbis = abiList.where(
      (abi) => abi.getFunctionFromSelector(function_selector) != null,
    );

    for (final abi in validAbis) {
      final function = abi.getFunctionFromSelector(function_selector)!;
      try {
        return ContractFunctionWithValues.decode(
          data: data,
          function: function,
        );
      } catch (e) {
        Logger.logWarning(
          "Error decoding function: ${function.name} for abi: ${abi.toString()}",
        );
        continue;
      }
    }

    return null;
  }

  ///
  /// Try to decode the raw data using the [function] and return the decoded function
  /// If the decoding of the data with information from the [function] fails, an exception is thrown
  ///
  static ContractFunctionWithValues decode({
    required Uint8List data,
    required ContractFunction function,
  }) {
    final external = _decodeExternal(data: data, function: function);
    return ContractFunctionWithValues(
      name: external.name,
      parameters: external.parameters,
      stateMutability: function.stateMutability,
      outputs: function.outputs,
    );
  }

  ///
  /// Try to decode the raw data using the [function] and return the decoded function
  /// If the decoding of the data with information from the [function] fails, an exception is thrown
  ///
  static ExternalContractFunctionWithValues _decodeExternal({
    required Uint8List data,
    required ExternalContractFunction function,
  }) {
    assert(data.length >= 4, "Invalid data length");
    final function_selector = data.sublist(0, 4).toHex;

    assert(
      function_selector == function.functionSelectorHex,
      "Invalid function selector",
    );

    var dataWithoutSelector = data.sublist(4);

    if (dataWithoutSelector.length % 32 != 0) {
      dataWithoutSelector = dataWithoutSelector.sublist(
        0,
        dataWithoutSelector.length - (dataWithoutSelector.length % 32),
      );
    }

    final decodedParams = decodeDataField(
      data: dataWithoutSelector,
      params: function.parameters,
    );

    return ExternalContractFunctionWithValues(
      parameters: decodedParams,
      name: function.name,
    );
  }
}

///
/// An Object that represents a contract function generated from an ABI
/// Has the List<FunctionParamWithValue> parameters with wich the function was called
/// Has the List<FunctionParam> outputs with the outputs of said executed function
///
class ContractFunctionWithValuesAndOutputs extends ContractFunctionWithValues {
  @override
  final List<FunctionParamWithValue> outputs;

  const ContractFunctionWithValuesAndOutputs._({
    required this.outputs,
    required super.name,
    required super.parameters,
    required super.stateMutability,
  }) : super(
          outputs: outputs,
        );

  factory ContractFunctionWithValuesAndOutputs.decode({
    required ContractFunctionWithValues function,
    required Uint8List data,
  }) {
    final decodedOutputs = decodeDataField(
      data: data,
      params: function.outputs,
    );

    return ContractFunctionWithValuesAndOutputs._(
      outputs: decodedOutputs,
      name: function.name,
      parameters: function.parameters,
      stateMutability: function.stateMutability,
    );
  }
}

class FunctionSelectorException implements Exception {
  final String message;

  FunctionSelectorException(this.message);

  @override
  String toString() {
    return message;
  }
}

class FunctionDecodingException implements Exception {
  final String message;

  FunctionDecodingException(this.message);

  @override
  String toString() {
    return message;
  }
}
