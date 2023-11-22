import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/raw_evm_transaction.dart';

void main() {
  /// Send ZeniqSmart to own Wallet
  test('parse hex transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    final RawEVMTransaction tx =
        getTransactionFromMessageHash(unsignedTxFromNomo);

    expect(tx.nonce, BigInt.from(1864));
    expect(tx.gasPrice, BigInt.from(10000000000));
    expect(tx.gasLimit, BigInt.from(21000));
    expect(tx.to, "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(tx.value, BigInt.from(100000000000000000));
    expect(tx.data, []);
    expect(tx.chainId, BigInt.from(383414847825));
  });
}
