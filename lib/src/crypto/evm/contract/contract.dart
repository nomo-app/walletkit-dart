import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class Contract {
  final List<ContractFunction> functions;
  final List<ContractEvent> events;
  Contract(this.functions, this.events);

  factory Contract.fromAbi(String jsonAbi) {
    final abi = jsonDecode(jsonAbi);
    final functions = <ContractFunction>[];
    final events = <ContractEvent>[];
    for (final item in abi) {
      final type = item['type'];
      final name = item['name'];

      if (type == "fallback") {
        continue;
      }

      if (type == "event") {
        final anonymous = item['anonymous'] as bool;
        final parameters = <FunctionParam>[];

        for (final param in item["inputs"]) {
          parameters.add(FunctionParam.fromMap(param));
        }
        events.add(ContractEvent(name, parameters, anonymous));
        continue;
      }
      final stateMutability = item['stateMutability'];
      final parameters = <FunctionParam>[];
      final outputs = <FunctionParam>[];

      for (final param in item["inputs"]) {
        parameters.add(FunctionParam.fromMap(param));
      }

      for (final param in item["outputs"]) {
        outputs.add(FunctionParam.fromMap(param));
      }
      functions
          .add(ContractFunction(name, parameters, stateMutability, outputs));
    }
    return Contract(functions, events);
  }
}

class ContractFunction {
  final String name;
  final List<FunctionParam> parameters;
  final String stateMutability;
  final List<FunctionParam> outputs;

  ContractFunction(
    this.name,
    this.parameters,
    this.stateMutability,
    this.outputs,
  );

  String get function {
    final params = parameters.map((e) => e.type.abiName).join(',');
    return "$name($params)";
  }

  String get functionSelector {
    final buffer = keccakUtf8(function);
    return buffer.sublist(0, 4).toHex;
  }

  String encodFunction(List<dynamic> values) {
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

  ContractEvent(this.name, this.parameters, this.anonymous);
}

class FunctionParam {
  final String name;
  final FunctionParamType type;
  final bool? indexed;

  FunctionParam({required this.name, required this.type, this.indexed});

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
