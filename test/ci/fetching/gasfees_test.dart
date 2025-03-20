import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Estimate Fees BTC', () async {
    final gasEntity = await getNetworkFees(network: BitcoinNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);

    final smartGasEntity = await getNetworkFees(
      network: BitcoinNetwork,
      useSmartFee: true,
    );

    expect(smartGasEntity, isNotNull);

    print(smartGasEntity);
  });

  test('Estimate Fees LTC', () async {
    final gasEntity = await getNetworkFees(network: LitecoinNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);

    final smartGasEntity = await getNetworkFees(
      network: LitecoinNetwork,
      useSmartFee: true,
    );

    expect(smartGasEntity, isNotNull);

    print(smartGasEntity);
  });

  test('Estimate Fees BCH', () async {
    final gasEntity = await getNetworkFees(network: BitcoincashNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);

    final smartGasEntity = await getNetworkFees(
      network: BitcoincashNetwork,
      useSmartFee: true,
    );

    expect(smartGasEntity, isNotNull);

    print(smartGasEntity);
  });

  test('Estimate Fees Zeniq', () async {
    final gasEntity = await getNetworkFees(network: ZeniqNetwork);

    expect(gasEntity, isNotNull);

    print(gasEntity);

    final smartGasEntity = await getNetworkFees(
      network: ZeniqNetwork,
      useSmartFee: true,
    );

    expect(smartGasEntity, isNotNull);

    print(smartGasEntity);
  });
}
