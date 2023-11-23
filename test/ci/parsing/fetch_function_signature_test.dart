import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/function_signature.dart';

void main() {
  test('fetch human readable function signature from the api', () async {
    final result = await fetchFunctionSignature(
        "https://www.4byte.directory/api/v1/signatures/?hex_signature=0xa9059cbb");

    String functionSignature = result["text_signature"];

    expect(functionSignature, "transfer(address,uint256)");
  });
}
