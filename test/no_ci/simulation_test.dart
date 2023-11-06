@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';

void main() {
  test('Simulate Any Tx', () async {
    // final addressTypes = [
    //   AddressType.legacy,
    //   AddressType.segwit,
    //   //AddressType.compatibility,
    // ];
    // final (_, nodes) = await fetchUTXOTransactions(
    //   seed: spoilSeed,
    //   walletTypes: [HDWalletType.BIP44_LITECOIN],
    //   addressTypes: addressTypes,
    //   networkType: LitecoinNetwork,
    //   minEndpoints: 1,
    //   maxLatency: Duration(
    //     milliseconds: 500,
    //   ),
    // );

    // final result = await simulateTx(
    //   hash: "c2587a20341a71094ef69f8ea86b59deef4f087153d14daa0fbd7034b9d3eb01",
    //   nodes: nodes,
    //   seed: spoilSeed,
    //   networkType: LitecoinNetwork,
    //   writeToFile: true,
    //   addressTypes: addressTypes,
    // );
    // print(
    //   "${result.$2}   ${result.$1.dateTime}   ${result.$1.id} ${result.$1.transferMethod}   ${result.$3}",
    // );
    // expect(result.$2, isTrue);
  });
}
