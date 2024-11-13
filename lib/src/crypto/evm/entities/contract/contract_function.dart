import 'dart:convert';
import 'dart:typed_data';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/contract/contract_function_decoding.dart';
import 'package:walletkit_dart/src/crypto/evm/repositories/function_selector_repository.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

sealed class ContractFunction implements ExternalContractFunctionMixin {
  final String name;

  const ContractFunction({
    required this.name,
  });

  bool get isExternal => !isLocal;

  bool get isLocal => this is LocalContractFunctionMixin;

  List<FunctionParam> get parameters;

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

    return switch (this) {
      ErrorContractFunctionMixin() =>
        throw Exception("Cannot add values to $this"),
      LocalContractFunctionMixin functionMixin =>
        LocalContractFunctionWithValues(
          name: name,
          parameters: paramsWithValues,
          stateMutability: functionMixin.stateMutability,
          outputTypes: functionMixin.outputTypes,
        ),
      ExternalContractFunctionMixin _ => ExternalContractFunctionWithValues(
          name: name,
          parameters: paramsWithValues,
        ),
    };
  }

  static ExternalContractFunction? fromTextSignature({
    required String textSignature,
  }) {
    final opening = textSignature.indexOf("(");
    final closing = textSignature.lastIndexOf(")");

    if (opening == -1 || closing == -1) {
      return null;
    }

    try {
      final name = textSignature.substring(0, opening);
      final params_s = extractParams(
        textSignature.substring(opening + 1, closing),
      );
      final params = [
        for (final (type_s, name) in params_s)
          FunctionParam(
            name: name,
            type: FunctionParamType.fromString(type_s),
          ),
      ];

      return ExternalContractFunction(
        name: name,
        parameters: params,
      );
    } catch (e, s) {
      Logger.logError(
        e,
        s: s,
        hint: "Failed to parse function text signature: $textSignature",
      );
      return null;
    }
  }

  Json toJson() {
    return {
      "name": name,
      "parameters": parameters.map((e) => e.toJson()).toList(),
    };
  }

  factory ContractFunction.fromJson(Map json) {
    if (json
        case {
          "name": String name,
          "parameters": List<dynamic> parameters,
        }) {
      return ExternalContractFunction(
        name: name,
        parameters: [
          for (final param in parameters) FunctionParam.fromJson(param),
        ],
      );
    }
    if (json case {"name": String name, "data": String data}) {
      final dataBytes = data.hexToBytes;
      final timestamp = json["timeStamp"] as int?;
      return switch (name) {
        "Unknown" =>
          UnknownContractFunction(data: dataBytes, timeStamp: timestamp),
        "NotDecodable" =>
          NotDecodableContractFunction(data: dataBytes, timeStamp: timestamp),
        _ => throw Exception("Invalid json"),
      };
    }

    throw Exception("Invalid json");
  }

  ///
  /// Try to decode the raw data using the [abiList]
  /// If the function is not found locally it will try to fetch the function from an external source (4byte.directory)
  /// If the function is not found, return null
  /// If a local function is found, return a [LocalContractFunctionWithValues]
  /// If an external function is found, return a [ExternalContractFunctionWithValues]
  ///
  static Future<ContractFunctionWithValues> decodeRawWithFetch({
    required Uint8List data,
    Map<String, String>? functionMap,
  }) async {
    print("a");
    if (data.length < 4) return UnknownContractFunction(data: data);

    if (functionMap != null) {
      final localResult = decodeRaw(data: data, functionMap: functionMap);

      if (localResult is! UnknownContractFunction &&
          localResult is! NotDecodableContractFunction) {
        return localResult;
      }
    }

    final function_selector = data.sublist(0, 4).toHex;

    try {
      final externalFunction = await FunctionSelectorRepository().fetchSelector(
        function_selector,
      );
      if (externalFunction == null) {
        return UnknownContractFunction(data: data);
      }

      return decode(data: data, function: externalFunction);
    } catch (e) {
      return UnknownContractFunction(data: data);
    }
  }

  ///
  /// Try to decode the raw data using the [abiList] and return the decoded function
  /// If the function is not found, return null
  ///
  static ContractFunctionWithValues decodeRaw({
    required Uint8List data,
    required Map<String, String> functionMap,
  }) {
    if (data.length < 4) return UnknownContractFunction(data: data);

    final hex_signature = "0x${data.sublist(0, 4).toHex}";

    final text_signarure = functionMap[hex_signature];

    if (text_signarure == null) return UnknownContractFunction(data: data);

    final function =
        ContractFunction.fromTextSignature(textSignature: text_signarure);

    if (function == null) return UnknownContractFunction(data: data);

    return ContractFunction.decode(
      data: data,
      function: function,
    );
  }

  ///
  /// Try to decode the raw data using the [function] and return the decoded function
  /// If the decoding of the data with information from the [function] fails a [NotDecodableContractFunction] is returned
  ///
  static ContractFunctionWithValues decode({
    required Uint8List data,
    required ContractFunction function,
  }) {
    try {
      if (data.length < 4) {
        throw FunctionDecodingException("Invalid data length: ${data.length}");
      }

      final function_selector = data.sublist(0, 4).toHex;

      if (function_selector != function.functionSelectorHex) {
        throw FunctionSelectorException(
          "Invalid function selector: $function_selector",
        );
      }

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

      if (function is LocalContractFunction) {
        return LocalContractFunctionWithValues(
          name: function.name,
          parameters: decodedParams,
          stateMutability: function.stateMutability,
          outputTypes: function.outputTypes,
        );
      }

      return ExternalContractFunctionWithValues(
        name: function.name,
        parameters: decodedParams,
      );
    } catch (e) {
      return NotDecodableContractFunction(
        data: data,
        error: e,
      );
    }
  }
}

sealed class ContractFunctionWithValues extends ContractFunction {
  const ContractFunctionWithValues({
    required super.name,
  });

  @override
  List<FunctionParamWithValue> get parameters;

  Uint8List buildDataField() {
    final dataFieldBuilder = DataFieldBuilder.fromFunction(function: this);
    return dataFieldBuilder.buildDataField();
  }

  factory ContractFunctionWithValues.fromJson(Map json) {
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
    if (json case {"name": String name, "data": String data}) {
      final dataBytes = data.hexToBytes;
      return switch (name) {
        "Unknown" => UnknownContractFunction(data: dataBytes),
        "NotDecodable" => NotDecodableContractFunction(data: dataBytes),
        _ => throw Exception("Invalid json"),
      };
    }

    throw Exception("Invalid json");
  }
}

sealed class ContractFunctionWithValuesAndOutputs
    extends ContractFunctionWithValues {
  List<FunctionParamWithValue> get outputs;

  List<FunctionParamWithValue> get parameters;

  const ContractFunctionWithValuesAndOutputs({
    required super.name,
  });
}

final class LocalContractFunctionWithValuesAndOutputs
    extends ContractFunctionWithValuesAndOutputs
    implements LocalContractFunctionMixin {
  @override
  final List<FunctionParamWithValue> outputs;

  @override
  List<FunctionParam> get outputTypes => outputs;

  @override
  final List<FunctionParamWithValue> parameters;

  @override
  final StateMutability stateMutability;

  factory LocalContractFunctionWithValuesAndOutputs.decode({
    required LocalContractFunctionWithValues function,
    required Uint8List data,
  }) {
    final decodedOutputs = decodeDataField(
      data: data,
      params: function.outputTypes,
    );

    return LocalContractFunctionWithValuesAndOutputs(
      name: function.name,
      parameters: function.parameters,
      outputs: decodedOutputs,
      stateMutability: function.stateMutability,
    );
  }

  const LocalContractFunctionWithValuesAndOutputs({
    required super.name,
    required this.outputs,
    required this.parameters,
    required this.stateMutability,
  });
}

final class ExternalContractFunctionWithValuesAndOutputs
    extends ContractFunctionWithValuesAndOutputs
    implements ExternalContractFunctionMixin {
  @override
  final List<FunctionParamWithValue> outputs;

  @override
  final List<FunctionParamWithValue> parameters;

  @override
  final StateMutability? stateMutability;

  @override
  final List<FunctionParam>? outputTypes;

  factory ExternalContractFunctionWithValuesAndOutputs.decode({
    required ExternalContractFunctionWithValues function,
    required List<FunctionParam> outputs,
    required Uint8List data,
    StateMutability? stateMutability,
  }) {
    final decodedOutputs = decodeDataField(
      data: data,
      params: outputs,
    );

    return ExternalContractFunctionWithValuesAndOutputs._(
      name: function.name,
      parameters: function.parameters,
      outputs: decodedOutputs,
      outputTypes: outputs,
      stateMutability: stateMutability,
    );
  }

  const ExternalContractFunctionWithValuesAndOutputs._({
    required super.name,
    required this.outputs,
    required this.parameters,
    this.stateMutability,
    this.outputTypes,
  });
}

///
/// An Object that represents a contract function where we only have the function signature
/// And hence only have the function name, selector and the parameters
/// Only used for decoding existing datafields
///
class ExternalContractFunction extends ContractFunction
    implements ExternalContractFunctionMixin {
  final List<FunctionParam> parameters;

  @override
  final StateMutability? stateMutability;

  @override
  final List<FunctionParam>? outputTypes;

  const ExternalContractFunction({
    required this.parameters,
    required super.name,
    this.stateMutability,
    this.outputTypes,
  });
}

///
/// An Object that represents a contract function where we only have the function signature
/// And hence only have the function name, selector and the parameters
/// Created after decoding the datafield with [ExternalContractFunction]
///
class ExternalContractFunctionWithValues extends ContractFunctionWithValues
    implements ExternalContractFunctionMixin {
  @override
  final List<FunctionParamWithValue> parameters;

  @override
  final StateMutability? stateMutability;

  @override
  final List<FunctionParam>? outputTypes;

  const ExternalContractFunctionWithValues({
    required super.name,
    required this.parameters,
    this.stateMutability,
    this.outputTypes,
  });
}

///
/// A mixin for Locale Contract Functions
/// Used to get the stateMutability and outputs of the function
/// These are only available in the local contract functions
///
class LocalContractFunctionMixin implements ExternalContractFunctionMixin {
  @override
  final StateMutability stateMutability;
  @override
  final List<FunctionParam> outputTypes;

  const LocalContractFunctionMixin({
    required this.stateMutability,
    required this.outputTypes,
  });
}

///
/// A mixin for External Contract Functions
/// Does not have any additional properties just a marker
///
class ExternalContractFunctionMixin {
  final StateMutability? stateMutability;
  final List<FunctionParam>? outputTypes;

  const ExternalContractFunctionMixin({
    this.stateMutability,
    this.outputTypes,
  });
}

class ErrorContractFunctionMixin extends ExternalContractFunctionMixin {
  /// TimeStamp when the error occured
  final int timeStamp;

  const ErrorContractFunctionMixin({
    required this.timeStamp,
  });
}

///
/// An Object that represents a contract function generated from an ABI
/// Used for Encoding a datafield and after executing decoding the output
///
class LocalContractFunction extends ContractFunction
    implements LocalContractFunctionMixin {
  @override
  final List<FunctionParam> parameters;
  final StateMutability stateMutability;
  final List<FunctionParam> outputTypes;

  const LocalContractFunction({
    required super.name,
    required this.parameters,
    required this.stateMutability,
    required this.outputTypes,
  });

  @override
  LocalContractFunctionWithValues addValues({required List<dynamic> values}) {
    return LocalContractFunctionWithValues(
      name: name,
      parameters: [
        for (var i = 0; i < parameters.length; i++)
          FunctionParamWithValue.fromParam(parameters[i], values[i]),
      ],
      stateMutability: stateMutability,
      outputTypes: outputTypes,
    );
  }
}

class LocalContractFunctionWithValues extends ContractFunctionWithValues
    implements LocalContractFunctionMixin {
  final StateMutability stateMutability;
  final List<FunctionParam> outputTypes;

  @override
  final List<FunctionParamWithValue> parameters;

  const LocalContractFunctionWithValues({
    required super.name,
    required this.parameters,
    required this.stateMutability,
    required this.outputTypes,
  });
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

class UnknownContractFunction extends ContractFunctionWithValues
    implements ErrorContractFunctionMixin {
  final Uint8List data;
  final int timeStamp;
  @override
  StateMutability? get stateMutability => null;

  @override
  List<FunctionParam>? get outputTypes => null;

  @override
  List<FunctionParamWithValue> get parameters {
    return [
      FunctionParamWithValue.fromParam<Uint8List>(
        FunctionParam(name: "data", type: FunctionParamBytes()),
        data,
      ),
    ];
  }

  UnknownContractFunction({
    required this.data,
    int? timeStamp,
  })  : timeStamp = timeStamp ?? DateTime.now().millisecondsSinceEpoch,
        super(name: "Unknown");

  @override
  Uint8List get functionSelector {
    return data.sublist(0, 4);
  }

  @override
  String get functionSelectorHex {
    return functionSelector.toHex;
  }

  @override
  String get function => name;

  String get UTF8 {
    return utf8.decode(data);
  }

  @override
  Json toJson() {
    return {
      "name": name,
      "data": data.toHex,
      "timeStamp": timeStamp,
    };
  }
}

class NotDecodableContractFunction extends ContractFunctionWithValues
    implements ErrorContractFunctionMixin {
  final Uint8List data;
  final Object? error;
  final int timeStamp;

  @override
  StateMutability? get stateMutability => null;

  @override
  List<FunctionParam>? get outputTypes => null;

  @override
  List<FunctionParamWithValue> get parameters {
    return [
      FunctionParamWithValue.fromParam<Uint8List>(
        FunctionParam(name: "data", type: FunctionParamBytes()),
        data,
      ),
    ];
  }

  NotDecodableContractFunction({
    required this.data,
    int? timeStamp,
    this.error,
  })  : timeStamp = timeStamp ?? DateTime.now().millisecondsSinceEpoch,
        super(name: "NotDecodable");

  @override
  Uint8List get functionSelector {
    if (data.length < 4) return Uint8List(0);
    return data.sublist(0, 4);
  }

  @override
  String get functionSelectorHex {
    return functionSelector.toHex;
  }

  @override
  String get function => name;

  String get UTF8 {
    return utf8.decode(data);
  }

  @override
  Json toJson() {
    return {
      "name": name,
      "data": data.toHex,
      "timeStamp": timeStamp,
    };
  }
}

extension on String {
  (String type, String? name) splitParam() {
    final string = trim();

    final splitted = string.split(' ');

    if (splitted.length != 2) return (string, null);

    return (splitted[0], splitted[1]);
  }
}

List<(String type, String? name)> extractParams(String text) {
  text = text.trim();

  var opening = text.indexOf("(");

  final values = <(String type, String? name)>[];
  final start = opening == -1
      ? text
      : opening == 0
          ? ""
          : text.substring(0, opening - 1);

  if (start.isNotEmpty) {
    if (start.startsWith('(')) {
      values.add(start.splitParam());
    } else if (start.contains(',')) {
      values.addAll(
        start.split(',').map((s) => s.splitParam()),
      );
    } else {
      values.add(start.splitParam());
    }
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

    var tuple = text.substring(opening, closing).splitParam();
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
