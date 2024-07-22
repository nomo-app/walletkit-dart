import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test(
    "Function Parameter Encoding and Decoding",
    () async {
      var function = uniswap_v2_router_abi.getFunction("getAmountsOut")!;
      var dataFieldBuilder = DataFieldBuilder.fromFunction(
        function: function.addValues(values: [
          1.toBigInt,
          [
            wrappedZeniqSmart.contractAddress.toLowerCase(),
            avinocZSC.contractAddress.toLowerCase(),
          ],
        ]),
      );

      var data = dataFieldBuilder.buildDataField();
      var hex = data.toHex;

      expect(
        hex,
        "d06ca61f00000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000074dc1c4ec10abe9f5c8a3eabf1a90b97cdc3ead8000000000000000000000000f1ca9cb74685755965c7458528a36934df52a3ef",
      );

      final decodedFunction = ContractFunctionWithValues.decode(
        function: function,
        data: data,
      );

      expect(decodedFunction.name, "getAmountsOut");
      expect(decodedFunction.parameters[0].type, FunctionParamUint256());
      expect(decodedFunction.parameters[0].value, 1.toBigInt);
      expect(decodedFunction.parameters[1].type, FunctionParamAddressArray());
      expect(decodedFunction.parameters[1].value[0],
          wrappedZeniqSmart.contractAddress.toLowerCase());
      expect(decodedFunction.parameters[1].value[1],
          avinocZSC.contractAddress.toLowerCase());
    },
  );
}
