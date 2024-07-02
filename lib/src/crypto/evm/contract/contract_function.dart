import 'dart:typed_data';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_param.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_decoding.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/parameter_type/function_parameter_type.dart';
import 'package:walletkit_dart/src/domain/repository/4byte_repository.dart';
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

  factory ExternalContractFunction.fromJSON(Json json) {
    if (json
        case {
          "id": int _,
          "created_at": _,
          "text_signature": String text_signature,
          "hex_signature": _,
          "bytes_signature": _,
        }) {
      // TODO: Parse Tuples
      final opening = text_signature.indexOf("(");
      final closing = text_signature.lastIndexOf(")");
      final name = text_signature.substring(0, opening);
      final params_s = text_signature
          .substring(opening + 1, closing)
          .split(RegExp(r',(?![^()]*\))'));
      final params = [
        for (final param in params_s)
          FunctionParam(
            name: param,
            type: FunctionParamType.fromString(param),
          ),
      ];

      return ExternalContractFunction(
        name: name,
        parameters: params,
      );
    }

    throw UnsupportedError("Unsupported JSON: ${json}");
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
    final paramsWithValues = <FunctionParamWithValue>[];
    for (var i = 0; i < parameters.length; i++) {
      final param = parameters[i];
      final value = values[i];

      // if (param.type.internalType != value.runtimeType) {
      //   throw Exception(
      //     "Invalid type for param: ${param.name}. Expected: ${param.type.internalType} Got: ${value.runtimeType}",
      //   );
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
    final dataFieldBuilder = DataFieldBuilder(function: this);
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
  }) async {
    assert(data.length >= 4, "Invalid data length");
    final function_selector = data.sublist(0, 4).toHex;

    // final localResult = decodeRaw(data: data);

    // if (localResult != null) {
    //   //return localResult;
    // }
    // TODO: Comment back in

    /// Fetch the function from 4byte.directory
    final externalResult =
        await FourByteRepository.fetchSelector(function_selector);

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

    final dataWithoutSelector = data.sublist(4);

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
