import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/avinoc_staking_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/demoContract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc721_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/nomoDevToken_contract.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final List<ContractABI> abiList = [
  contractAbiDemoContract,
  contractAbiNomoDevToken,
  contractAbiErc20,
  contractAbiErc721,
  avinocStakingAbi,
  uniswap_v2_factory_abi,
  uniswap_v2_pair_abi,
  uniswap_v2_router_abi,
];

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

  ContractFunction? getFunction(String functionName) {
    return functions.singleWhereOrNull((e) => e.name == functionName);
  }

  ContractEvent? getEvent(String eventName) {
    return events.singleWhereOrNull((e) => e.name == eventName);
  }

  ContractEvent? getEventFromTopic(String topic) {
    return events.singleWhereOrNull((e) => e.topicHex == topic);
  }

  ContractFunction? getFunctionFromSelector(String selector) {
    return functions
        .singleWhereOrNull((e) => e.functionSelectorHex == selector);
  }
}

class ContractEvent extends ExternalContractEvent {
  final bool anonymous;

  const ContractEvent({
    required super.name,
    required super.parameters,
    required this.anonymous,
  });

  List<FunctionParam> get nonIndexedParameters {
    return parameters.where((param) => param.indexed == false).toList();
  }

  List<FunctionParam> get indexedParameters {
    return parameters.where((param) => param.indexed == true).toList();
  }
}

class ExternalContractEvent {
  final String name;
  final List<FunctionParam> parameters;

  const ExternalContractEvent({
    required this.name,
    required this.parameters,
  });

  factory ExternalContractEvent.fromTextSignature(String signature) {
    final parts = signature.split("(");

    final name = parts[0];
    final params = parts[1]
        .substring(0, parts[1].length - 1)
        .split(",")
        .map(FunctionParam.fromTypeString)
        .toList();

    return ExternalContractEvent(name: name, parameters: params);
  }

  String get function {
    final params = parameters.map((e) => e.type.name).join(',');
    return "$name($params)";
  }

  Uint8List get topic => keccakUtf8(function);

  String get topicHex => topic.toHex;
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
