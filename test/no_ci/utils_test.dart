import 'dart:typed_data';

import 'package:dotenv/dotenv.dart';
import 'package:test/scaffolding.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Broadcast Raw Tx"', () async {
    final client = await createRandomElectrumXClient(
      endpoints: List.from(BitcoinNetwork.endpoints, growable: true),
      excludedEndpoints: List.from([], growable: true),
      token: btcCoin,
    );

    if (client == null) {
      print('client is null');
      return;
    }

    final raw = await client.broadcastTransaction(
      rawTxHex:
          "0200000001eff7aee6ef80269b75de6e86f7aa5ac94f1533dbf0cf488a94174a132cf2e4420000000085483045022100b23c78c976ab6ea96504783164bf7aee3ca0667f09a4452d93c5d29f4c9ab33502204055f1956916b5aa27ce09d80f167f1f223ae17e630056ac9759c3c71ff7518601210265f34bd46e92b57a956f6e12bc3adc886626b074584a04ba1febe38aeb1835b21976a914ef451d74e9f2bd7fe673b1de3cded3a1b09a574988acffffffff0222020000000000001976a9145d0548d68c35fdd74921daf4150e60fec7f155d588ac7fd70400000000001976a9149f490d17fd11f46e58a976d173eec3a489f6208088ac00000000",
    );

    print(raw);
  });
}

Uint8List loadDevSeedFromEnv() {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final rejectSeedString = env["REJECT_SEED"]!.split(",");
  List<int> rejectIntList = rejectSeedString
      .map((i) => int.parse(i))
      .toList(); // Convert to list of integers
  Uint8List rejectSeed = Uint8List.fromList(rejectIntList);
  return rejectSeed;
}
