import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class ContractABI {
  final List<LocalContractFunction> functions;
  final List<ContractEvent> events;

  const ContractABI(this.functions, this.events);

  factory ContractABI.fromAbi(String jsonAbi) {
    final abi = jsonDecode(jsonAbi);
    final functions = <LocalContractFunction>[];
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
          parameters.add(FunctionParam.fromJson(param));
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
        parameters.add(FunctionParam.fromJson(param));
      }
      if (item["outputs"] != null) {
        for (final param in item["outputs"]) {
          outputs.add(FunctionParam.fromJson(param));
        }
      }
      functions.add(
        LocalContractFunction(
          name: name,
          parameters: parameters,
          stateMutability: stateMutability,
          outputTypes: outputs,
        ),
      );
    }
    return ContractABI(functions, events);
  }

  LocalContractFunction? getFunction(String functionName) {
    return functions.singleWhereOrNull((e) => e.name == functionName);
  }

  LocalContractFunction? getFunctionFromSelector(String selector) {
    return functions
        .singleWhereOrNull((e) => e.functionSelectorHex == selector);
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
