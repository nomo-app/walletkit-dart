@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/repositories/electrum_json_rpc_client.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test("Test", () async {
    const hash =
        "dfbfbe044cd39d1dee8f7d63f9e7107c1e81d453a963c7ec767768f2cde78012";

    for (var i = 0; i < 100; i++) {
      try {
        await fetchRawTxByHash(hash, EurocoinNetwork);
      } catch (e) {
        expect(true, false);
        break;
      }
    }
  });
}
