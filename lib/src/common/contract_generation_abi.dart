library contract_generation_abi;

import 'dart:async';
import 'package:macros/macros.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_abi.dart'; // TODO: Remove this import since we cant depend on it. The macro 'ContractGeneration' can't be applied in the same library cycle where it is defined. Try moving it to a different library that does not import the one where it is applied.dart(macro_definition_application_same_library_cycle)

macro class ContractGeneration
    implements ClassDeclarationsMacro, ClassDefinitionMacro  {
  final String abi;

  const ContractGeneration(this.abi);

  ContractABI get contractAbi => ContractABI.fromAbi(abi);

  @override
  FutureOr<void> buildDeclarationsForClass(
    ParameterizedTypeDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) {
    builder.declareInLibrary(DeclarationCode.fromString(
        "import 'package:walletkit_dart/src/crypto/evm/contract/contract_abi.dart';"));
    builder.declareInLibrary(
        DeclarationCode.fromString("import 'dart:typed_data';"));
    builder.declareInLibrary(DeclarationCode.fromString(
        "import 'package:walletkit_dart/src/domain/entities/fee.dart';"));
    builder.declareInLibrary(DeclarationCode.fromString(
        "final _abi = ContractABI.fromAbi('''$abi''');"));

    final buffer = StringBuffer();
    int i = 0;
    for (final function in contractAbi.functions) {
      var outputs = function.outputs.map((e) {
        return "${e.type.internalType}";
      }).join(", ");

      final hasMultipleOutputs = function.outputs.length > 1;

      if (hasMultipleOutputs) {
        outputs = "($outputs)";
      }
      if (function.stateMutability == StateMutability.payable ||
          function.stateMutability == StateMutability.nonpayable) {
        outputs = "String";
      }

      buffer.write("  Future<$outputs> ${function.name}(");

      var inputs = function.parameters.map((e) {
        return "required ${e.type.internalType} ${e.name.replaceAll("_", "")}";
      }).join(", ");

      if (function.stateMutability == StateMutability.payable ||
          function.stateMutability == StateMutability.nonpayable) {
        inputs =
            "$inputs, required Uint8List seed, required String sender, EvmFeeInformation? feeInfo,";
          if (function.stateMutability == StateMutability.payable) {
            inputs = "$inputs BigInt? txValue,";
          }
      }
      if (function.parameters.isNotEmpty) {
        inputs = "{\n$inputs\n}";
      }

      final inputNames = function.parameters.map((e) {
        return e.name.replaceAll("_", "");
      }).join(", ");

      buffer.write(inputs);
      buffer.write(") async {".indent(1));

      buffer.write("final function = _abi.functions[$i];".indent(2));
      buffer.write("final values = [$inputNames];".indent(2));
      buffer.write(
          "final functionWithValues = function.addValues(values:values);"
              .indent(2));
      if (function.constant) {
        buffer.write("final result = await read(function: functionWithValues);"
            .indent(2));

        if (hasMultipleOutputs) {
          final outputTypes = function.outputs.map((e) {
            return e.type.internalType;
          }).toList();

          buffer.write("return (");
          for (var i = 0; i < outputTypes.length; i++) {
            buffer.write("result.outputs[$i].castValue<${outputTypes[i]}>()");
            if (i < outputTypes.length - 1) {
              buffer.write(", ");
            }
          }
          buffer.write(");");
        } else {
          buffer.write(
              "return result.outputs.first.castValue<$outputs>();".indent(2));
        }
      } else {
        buffer.write(
            "return await interact(function: functionWithValues, seed: seed,sender: sender,feeInfo: feeInfo, ${function.payable ? 'value: txValue,' : ''} );"
                .indent(2));
      }

      buffer.write("}".indent(1));

      builder.declareInType(DeclarationCode.fromString(buffer.toString()));

      buffer.clear();
      i++;
    }
  }

  @override
  FutureOr<void> buildDefinitionForClass(
      ClassDeclaration clazz, TypeDefinitionBuilder builder) {}
}

extension on String {
  String indent(int level) {
    return "${"  " * level}$this\n";
  }
}
