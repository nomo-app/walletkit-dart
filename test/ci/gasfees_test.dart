import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Estimate Fees BTC', () async {
    final btcHighPriority = await estimateFeeForPriority(
      network: BitcoinNetwork,
      priority: FeePriority.high,
    );

    final btcLowPriority = await estimateFeeForPriority(
      network: BitcoinNetwork,
      priority: FeePriority.low,
    );

    final btcMediumPriority = await estimateFeeForPriority(
      network: BitcoinNetwork,
      priority: FeePriority.medium,
    );

    final btcTommorow = await estimateFeeForPriority(
      network: BitcoinNetwork,
      priority: FeePriority.tommorow,
    );

    print('BTC High Priority: $btcHighPriority');
    print('BTC Medium Priority: $btcMediumPriority');
    print('BTC Low Priority: $btcLowPriority');
    print('BTC Tommorow: $btcTommorow');
  });

  test('Estimate Fees ZENIQ', () async {
    final zeniqHighPriority = await estimateFeeForPriority(
      network: ZeniqNetwork,
      priority: FeePriority.high,
    );

    final zeniqLowPriority = await estimateFeeForPriority(
      network: ZeniqNetwork,
      priority: FeePriority.low,
    );

    final zeniqMediumPriority = await estimateFeeForPriority(
      network: ZeniqNetwork,
      priority: FeePriority.medium,
    );

    final zeniqTommorow = await estimateFeeForPriority(
      network: ZeniqNetwork,
      priority: FeePriority.tommorow,
    );

    print('ZENIQ High Priority: $zeniqHighPriority');
    print('ZENIQ Medium Priority: $zeniqMediumPriority');
    print('ZENIQ Low Priority: $zeniqLowPriority');
    print('ZENIQ Tommorow: $zeniqTommorow');
  });

  test('Estimate Fees BCH', () async {
    final bchHighPriority = await estimateFeeForPriority(
      network: BitcoincashNetwork,
      priority: FeePriority.high,
    );

    final bchLowPriority = await estimateFeeForPriority(
      network: BitcoincashNetwork,
      priority: FeePriority.low,
    );

    final bchMediumPriority = await estimateFeeForPriority(
      network: BitcoincashNetwork,
      priority: FeePriority.medium,
    );

    final bchTommorow = await estimateFeeForPriority(
      network: BitcoincashNetwork,
      priority: FeePriority.tommorow,
    );

    print('BCH High Priority: $bchHighPriority');
    print('BCH Medium Priority: $bchMediumPriority');
    print('BCH Low Priority: $bchLowPriority');
    print('BCH Tommorow: $bchTommorow');
  });

  test('Estimate Fees LTC', () async {
    final ltcHighPriority = await estimateFeeForPriority(
      network: LitecoinNetwork,
      priority: FeePriority.high,
    );

    final ltcLowPriority = await estimateFeeForPriority(
      network: LitecoinNetwork,
      priority: FeePriority.low,
    );

    final ltcMediumPriority = await estimateFeeForPriority(
      network: LitecoinNetwork,
      priority: FeePriority.medium,
    );

    final ltcTommorow = await estimateFeeForPriority(
      network: LitecoinNetwork,
      priority: FeePriority.tommorow,
    );

    print('LTC High Priority: $ltcHighPriority');
    print('LTC Medium Priority: $ltcMediumPriority');
    print('LTC Low Priority: $ltcLowPriority');
    print('LTC Tommorow: $ltcTommorow');
  });
}
