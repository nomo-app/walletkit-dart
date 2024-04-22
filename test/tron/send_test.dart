import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_raw_transaction.dart';

void main() {
  test('Send Tron between Accounts', () {
    final hex =
        "0a02c3a42208956374e854a8a6f340a8aad088ef315a69080112650a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412340a15410de86a83909c039b2e64804e4b3743a6f3fdf0bb1215417f9dc8311e51c1685764bbb0f5ceac7ad79b0128188094ebdc0370d4eecc88ef31";

    final trx = TronRawTransaction.fromHex(hex);

    expect(trx.timestamp, 1600086123);
  });
}
