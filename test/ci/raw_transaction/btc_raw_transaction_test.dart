import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/input.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test(
    "Legacy BTC Raw Transaction Test",
    () async {
      final tx = BTCRawTransaction(
        version: BitcoinNetwork.txVersion,
        lockTime: 0,
        inputs: [],
        outputs: [],
      );
    },
  );
}
