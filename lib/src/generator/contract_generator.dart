import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:walletkit_dart/src/generator/contract_annotations.dart';

class ContractGenerator extends GeneratorForAnnotation<Contract> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Contract annotation can only be applied to classes.',
        element: element,
      );
    }

    final abiPath = annotation.read('abiPath').stringValue;
    final abiAssetId = AssetId(
      buildStep.inputId.package,
      abiPath,
    );

    return buildStep.readAsString(abiAssetId).then((abiJson) {
      final contractName = element.name;
      final abi = jsonDecode(abiJson) as List;
      final buffer = StringBuffer();

      buffer.writeln('// Generated code - do not modify by hand');
      buffer.writeln('// ignore_for_file: type=lint');
      buffer.writeln();
      buffer.writeln('part of \'${buildStep.inputId.uri.pathSegments.last}\';');
      buffer.writeln();
      buffer.writeln('// Contract ABI definition');
      buffer.writeln(
          'final ${element.name.toLowerCase()}_abi = ContractABI.fromAbi(\'\'\'$abiJson\'\'\');');
      buffer.writeln();
      buffer.writeln('extension ${contractName}Extension on $contractName {');

      // Extract methods from ABI
      final methods = _extractMethods(abi);
      for (final method in methods) {
        _generateMethod(buffer, method);
      }

      buffer.writeln('}');

      return buffer.toString();
    });
  }

  List<Map<String, dynamic>> _extractMethods(List<dynamic> abi) {
    final methods = <Map<String, dynamic>>[];

    for (final item in abi) {
      if (item is Map<String, dynamic> && item['type'] == 'function') {
        if (item.containsKey('name')) {
          methods.add(item);
        }
      }
    }

    return methods;
  }

  void _generateMethod(StringBuffer buffer, Map<String, dynamic> methodData) {
    final methodName = methodData['name'] as String;

    final inputs = methodData['inputs'] as List<dynamic>?;
    final outputs = methodData['outputs'] as List<dynamic>?;
    final stateMutability = methodData['stateMutability'] as String;

    final isViewOrPure = stateMutability == 'view' || stateMutability == 'pure';
    final returnType = _determineReturnType(outputs);

    // Start method definition
    buffer.write('  Future<$returnType> $methodName(');

    // Generate method parameters
    if (inputs != null && inputs.isNotEmpty) {
      final params = <String>[];
      for (final input in inputs) {
        final paramType = _convertSolidityTypeToDart(input['type'] as String);
        final paramName = input['name'] as String;
        params.add('$paramType $paramName');
      }
      buffer.write(params.join(', '));
    }

    buffer.writeln(') async {');
    buffer.writeln('    final function = abi.getFunction(\'$methodName\')!;');

    // Generate function call parameters
    buffer.write('    final result = await ');
    if (isViewOrPure) {
      buffer.writeln('readSafe(');
    } else {
      buffer.writeln('interact(');
    }
    buffer.write('      function: function.addValues(values: [');

    if (inputs != null && inputs.isNotEmpty) {
      buffer.write(inputs.map((input) => input['name'] as String).join(', '));
    }

    buffer.writeln(']),');

    if (!isViewOrPure) {
      buffer.writeln('      seed: seed,');
      buffer.writeln('      sender: sender,');
      if (stateMutability == 'payable') {
        buffer.writeln('      value: value,');
      }
    }

    buffer.writeln('    );');

    // Generate return statement
    if (isViewOrPure && outputs != null && outputs.isNotEmpty) {
      if (outputs.length == 1) {
        buffer.writeln('    return result.outputs.first.value as $returnType;');
      } else {
        // For multiple outputs, generate a tuple return
        final tupleComponents = <String>[];
        for (var i = 0; i < outputs.length; i++) {
          final outputType =
              _convertSolidityTypeToDart(outputs[i]['type'] as String);
          tupleComponents.add('result.outputs[$i].value as $outputType');
        }
        buffer.writeln('    return (${tupleComponents.join(', ')});');
      }
    } else {
      buffer.writeln('    return result;');
    }

    buffer.writeln('  }');
    buffer.writeln();
  }

  String _determineReturnType(List<dynamic>? outputs) {
    if (outputs == null || outputs.isEmpty) {
      return 'String'; // Transaction hash for non-view functions
    }

    if (outputs.length == 1) {
      final outputType = outputs[0]['type'] as String;
      return _convertSolidityTypeToDart(outputType);
    }

    // For multiple outputs, generate a tuple return type
    final types = outputs
        .map((output) => _convertSolidityTypeToDart(output['type'] as String))
        .join(', ');

    return '(${types})';
  }

  String _convertSolidityTypeToDart(String solidityType) {
    if (solidityType.startsWith('uint') || solidityType.startsWith('int')) {
      return 'BigInt';
    } else if (solidityType == 'bool') {
      return 'bool';
    } else if (solidityType == 'address') {
      return 'String';
    } else if (solidityType == 'string') {
      return 'String';
    } else if (solidityType.startsWith('bytes')) {
      return 'Uint8List';
    } else if (solidityType.contains('[]')) {
      final baseType = solidityType.substring(0, solidityType.length - 2);
      return 'List<${_convertSolidityTypeToDart(baseType)}>';
    } else {
      return 'dynamic';
    }
  }
}
