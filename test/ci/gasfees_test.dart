import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Estimate Fees BTC', () async {
    final gasEntity = await getNetworkFees(network: BitcoinNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);
  });

  test('Estimate Fees LTC', () async {
    final gasEntity = await getNetworkFees(network: LitecoinNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);
  });

  test('Estimate Fees BCH', () async {
    final gasEntity = await getNetworkFees(network: BitcoincashNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);
  });
}
