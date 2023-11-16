import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/function_signature.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  /// Send ZeniqSmart to own Wallet
  test('parse hex transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    final Transaction tx = getTransactionFromMessageHash(unsignedTxFromNomo);

    final FunctionSignature functionSignature =
        FunctionSignature.decodeFunctionSignature(tx.data!);

    expect(tx.nonce, 1864);
    expect(tx.gasPrice!.getInWei, BigInt.from(10000000000));
    expect(tx.maxGas, 21000);
    expect(tx.to!.hex, "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(tx.value!.getInWei, BigInt.from(100000000000000000));
    expect(tx.data, []);

    expect(functionSignature.name, "no contractSignature found!");
  });
}
