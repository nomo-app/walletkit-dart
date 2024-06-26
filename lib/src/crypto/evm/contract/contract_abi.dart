import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class ContractABI {
  final List<ContractFunction> functions;
  final List<ContractEvent> events;

  const ContractABI(this.functions, this.events);

  factory ContractABI.fromAbi(String jsonAbi) {
    final abi = jsonDecode(jsonAbi);
    final functions = <ContractFunction>[];
    final events = <ContractEvent>[];
    for (final item in abi) {
      final type = item['type'];
      final name = item['name'];

      if (name == null) {
        continue;
      }

      if (type == "fallback" || type == "constructor" || type == "error") {
        continue;
      }

      if (type == "event") {
        final anonymous = item['anonymous'] as bool;
        final parameters = <FunctionParam>[];

        for (final param in item["inputs"]) {
          parameters.add(FunctionParam.fromMap(param));
        }
        events.add(
          ContractEvent(
            name: name,
            parameters: parameters,
            anonymous: anonymous,
          ),
        );
        continue;
      }
      final stateMutability = StateMutability.fromString(
        item['stateMutability'] as String,
      );
      final parameters = <FunctionParam>[];
      final outputs = <FunctionParam>[];

      for (final param in item["inputs"]) {
        parameters.add(FunctionParam.fromMap(param));
      }
      if (item["outputs"] != null) {
        for (final param in item["outputs"]) {
          outputs.add(FunctionParam.fromMap(param));
        }
      }
      functions.add(
        ContractFunction(
          name: name,
          parameters: parameters,
          stateMutability: stateMutability,
          outputs: outputs,
        ),
      );
    }
    return ContractABI(functions, events);
  }

  String encodedFunctionForString(String functionName, List<dynamic> values) {
    final function = functions.firstWhereOrNull((e) => e.name == functionName);
    if (function == null) {
      throw Exception('Function not found');
    }
    return function.encodeFunction(values);
  }

  String encodedFunction(ContractFunction function, List<dynamic> values) {
    return function.encodeFunction(values);
  }

  ContractFunction? getFunction(String functionName) {
    return functions.singleWhereOrNull((e) => e.name == functionName);
  }
}

class ContractFunction {
  final String name;
  final List<FunctionParam> parameters;
  final StateMutability stateMutability;
  final List<FunctionParam> outputs;

  const ContractFunction({
    required this.name,
    required this.parameters,
    required this.stateMutability,
    required this.outputs,
  });

  String get function {
    final params = parameters.map((e) => e.type.abiName).join(',');
    return "$name($params)";
  }

  String get functionSelector {
    final buffer = keccakUtf8(function);
    return buffer.sublist(0, 4).toHex;
  }

  String encodeFunction(List<dynamic> values) {
    String functionData = "";
    final selector = functionSelector;
    functionData += selector;
    for (var param in parameters) {
      int index = parameters.indexOf(param);
      final encodedParam = switch (param.type) {
        FunctionParamType.address => param.type.encodeParameter(values[index]),
        FunctionParamType.uint256 => param.type.encodeParameter(values[index]),
        FunctionParamType.uint => param.type.encodeParameter(values[index]),
        _ => throw UnimplementedError(),
      };
      functionData += encodedParam;
    }
    return functionData;
  }
}

class ContractEvent {
  final String name;
  final List<FunctionParam> parameters;
  final bool anonymous;

  const ContractEvent({
    required this.name,
    required this.parameters,
    required this.anonymous,
  });
}

class FunctionParam {
  final String name;
  final FunctionParamType type;
  final bool? indexed;

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

enum FunctionParamType {
  address("address"),
  uint256("uint256"),
  uint8("uint8"),
  int("int"),
  int256("int256"),
  uint("uint"),
  bytes("bytes"),
  bytesArray("bytes[]"),
  uint256Array("uint256[]"),
  addressArray("address[]"),
  bool("bool"),
  boolArray("bool[]"),
  int256Array("int256[]"),
  stringArray("string[]"),
  int8Array("int8[]"),
  uint8Array("uint8[]"),
  bytes32("bytes32"),
  int8("int8"),
  bytes4("bytes4"),
  uint32("uint32"),
  string("string");

  final String abiName;
  const FunctionParamType(
    this.abiName,
  );

  static FunctionParamType fromString(String type) {
    final enumType = FunctionParamType.values.singleWhereOrNull((e) {
      return e.abiName == type;
    });

    if (enumType == null) throw Exception('Unknown type: $type');

    return enumType;
  }

  String get name => abiName;
}

enum StateMutability {
  pure,
  view,
  nonpayable,
  payable;

  static StateMutability fromString(String type) {
    return StateMutability.values.singleWhere((e) {
      return e.name == type;
    });
  }
}

extension FunctionParamTypeExtension on FunctionParamType {
  String encodeParameter(dynamic value) {
    switch (this) {
      case FunctionParamType.address:
        return _encodeAddress(value as String).toHex;
      case FunctionParamType.uint256:
        return _encodeUint256(value as BigInt).toHex;
      case FunctionParamType.uint8:
        return "uint8";
      case FunctionParamType.int:
        return "int";
      case FunctionParamType.int256:
        return "int256";
      case FunctionParamType.uint:
        return _encodeUint256(value as BigInt).toHex;
      case FunctionParamType.bytes:
        return "bytes";
      case FunctionParamType.bytesArray:
        return "bytes[]";
      case FunctionParamType.uint256Array:
        return "uint256[]";
      case FunctionParamType.addressArray:
        return "address[]";
      case FunctionParamType.bool:
        return "bool";
      case FunctionParamType.string:
        return "string";
      case FunctionParamType.boolArray:
        return "bool[]";
      case FunctionParamType.int256Array:
        return "int256[]";
      case FunctionParamType.stringArray:
        return "string[]";
      case FunctionParamType.int8Array:
        return "int8[]";
      case FunctionParamType.uint8Array:
        return "uint8[]";
      case FunctionParamType.bytes32:
        return "bytes32";
      case FunctionParamType.int8:
        return "int8";
      case FunctionParamType.bytes4:
        return "bytes4";
      case FunctionParamType.uint32:
        return "uint32";
    }
  }

  Uint8List _encodeUint256(BigInt value) {
    if (value < BigInt.zero) {
      throw Exception('Negative value');
    }
    if (value.bitLength > 256) {
      throw Exception('Value is too big');
    }
    final byteData = ByteData(32);
    final bytes = value.toRadixString(16).padLeft(64, '0');
    final bytesList = bytes.hexToBytes;

    for (var i = 0; i < bytesList.length; i++) {
      byteData.setUint8(32 - bytesList.length + i, bytesList[i]);
    }

    return byteData.buffer.asUint8List();
  }

  Uint8List _encodeAddress(String address) {
    if (address.length != 42) {
      throw Exception('Invalid address');
    }

    final bytes = address.substring(2).hexToBytes;
    final byteData = ByteData(32);

    for (var i = 0; i < bytes.length; i++) {
      byteData.setUint8(12 + i, bytes[i]);
    }

    return byteData.buffer.asUint8List();
  }
}

String decodeString(Uint8List encoded) {
  if (encoded.length < 64) {
    throw ArgumentError("Invalid encoded string");
  }

  final offsetHex = hex.encode(encoded.sublist(0, 32));
  final offset = BigInt.parse(offsetHex, radix: 16).toInt();

  final lengthHex = hex.encode(encoded.sublist(offset, offset + 32));
  final length = BigInt.parse(lengthHex, radix: 16).toInt();
  final stringDataHex =
      hex.encode(encoded.sublist(offset + 32, offset + 32 + length));
  final stringBytes = Uint8List.fromList(hex.decode(stringDataHex));

  return String.fromCharCodes(stringBytes);
}
