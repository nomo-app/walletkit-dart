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
    final path = element.source.uri.path;
    if (path.contains('.g.dart')) {
      return '';
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
    String returnType = _determineReturnType(outputs);

    if (!isViewOrPure) {
      returnType = "String";
    }
    // Start method definition
    buffer.write('  Future<$returnType> $methodName(');

    // Generate method parameters
    if (inputs != null && inputs.isNotEmpty) {
      buffer.write("{");
      final params = <String>[];
      for (final input in inputs) {
        final paramType = _convertSolidityTypeToDart(input['type'] as String);
        final paramName = (input['name'] as String).replaceAll("_", "");
        params.add('required $paramType $paramName');
      }
      buffer.write(params.join(', '));
      if (!isViewOrPure) {
        buffer.writeln(",required String sender,");
        buffer.writeln("required Uint8List seed,");
        buffer.writeln("EvmFeeInformation? feeInfo,");
      }
      buffer.write("}");
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
      buffer.write(inputs
          .map((input) => (input['name'] as String).replaceAll("_", ""))
          .join(', '));
    }

    buffer.writeln(']),');

    if (!isViewOrPure) {
      buffer.writeln("      seed: seed,");
      buffer.writeln('      sender: sender,');
      buffer.writeln('      feeInfo: feeInfo,');
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
    // First check if it's an array type
    if (solidityType.endsWith('[]')) {
      final baseType = solidityType.substring(0, solidityType.length - 2);
      return 'List<${_convertSolidityTypeToDart(baseType)}>';
    }

    // Handle fixed-size arrays like bytes32[4]
    final fixedArrayMatch = RegExp(r'(.*)\[(\d+)\]$').firstMatch(solidityType);
    if (fixedArrayMatch != null) {
      final baseType = fixedArrayMatch.group(1)!;
      return 'List<${_convertSolidityTypeToDart(baseType)}>';
    }

    // Handle tuples
    if (solidityType.startsWith('tuple')) {
      // For complex tuple types, we'll use dynamic
      return 'dynamic';
    }

    // Handle primitive types
    switch (solidityType) {
      case 'address':
      case 'string':
        return 'String';
      case 'bool':
        return 'bool';
      case 'bytes':
      case 'bytes32':
        return 'Uint8List';
      default:
        // Handle uint/int types of various sizes
        if (solidityType.startsWith('uint') || solidityType.startsWith('int')) {
          return 'BigInt';
        }
        // Handle fixed size bytes like bytes16
        if (RegExp(r'^bytes\d+$').hasMatch(solidityType)) {
          return 'Uint8List';
        }
        return 'dynamic';
    }
  }
}
