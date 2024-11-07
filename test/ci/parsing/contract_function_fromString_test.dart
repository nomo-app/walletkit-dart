import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test(
    "External Contract Function fromString No Parameter Names",
    () {
      const textSignature = "transfer(address,uint256)";

      final contractFunction = ExternalContractFunction.fromString(
        textSignature: textSignature,
      );

      expect(contractFunction.parameters.first.type, FunctionParamAddress());
      expect(contractFunction.parameters.first.name, null);

      expect(contractFunction.parameters.last.type, FunctionParamUint256());
      expect(contractFunction.parameters.last.name, null);
    },
  );

  test(
    "External Contract Function fromString",
    () {
      const textSignature = "transfer(address _to, uint256 _value)";

      final contractFunction = ExternalContractFunction.fromString(
        textSignature: textSignature,
      );

      expect(contractFunction.parameters.first.type, FunctionParamAddress());
      expect(contractFunction.parameters.first.name, "_to");

      expect(contractFunction.parameters.last.type, FunctionParamUint256());
      expect(contractFunction.parameters.last.name, "_value");
    },
  );
}
