import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('Fetch tx Status', () async {
    final result = await polygonscan.fetchEstimatedTime(21000);

    print(result);

    const hash =
        "0x83c5e45216b2f135980ab57505551d486fa923f40735324e643f09405c3ee9cb";

    await polygonRPC.getConfirmationStatus(hash).then((value) {
      print(value);
    });
  });
}
