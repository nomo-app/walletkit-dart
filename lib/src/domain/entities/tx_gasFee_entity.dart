import 'package:walletkit_dart/walletkit_dart.dart';

sealed class NetworkFees {
  const NetworkFees();
}

final class UtxoNetworkFees extends NetworkFees {
  final Amount nextBlock;
  final Amount secondBlock;
  final Amount hour;
  final Amount day;

  const UtxoNetworkFees({
    required this.nextBlock,
    required this.secondBlock,
    required this.hour,
    required this.day,
  });

  @override
  String toString() {
    return "UtxoNetworkFees{nextBlock: $nextBlock, secondBlock: $secondBlock, hour: $hour, day: $day}";
  }

  Amount getForPriority(FeePriority priority) => switch (priority) {
        FeePriority.nextBlock => nextBlock,
        FeePriority.secondBlock => secondBlock,
        FeePriority.hour => hour,
        FeePriority.day => day,
        _ => nextBlock,
      };
}

final class EvmNetworkFees extends NetworkFees {
  final BigInt lastBlock;
  final BigInt safe;
  final BigInt average;
  final BigInt fast;

  final BigInt safePriority;
  final BigInt averagePriority;
  final BigInt fastPriority;

  const EvmNetworkFees({
    required this.lastBlock,
    required this.safe,
    required this.average,
    required this.fast,
    required this.safePriority,
    required this.averagePriority,
    required this.fastPriority,
  });

  BigInt getFeeGWEI(FeePriority feePriority) => switch (feePriority) {
        FeePriority.high => fast,
        FeePriority.medium => average,
        FeePriority.low => safe,
        _ => safe,
      };

  BigInt getPriorityGWEI(FeePriority feePriority) => switch (feePriority) {
        FeePriority.high => fastPriority,
        FeePriority.medium => averagePriority,
        FeePriority.low => safePriority,
        _ => safePriority,
      };

  Amount getFeeAmount(FeePriority feePriority) => Amount(
        value: getFeeGWEI(feePriority),
        decimals: 18, // GWEI
      );

  Amount getPriorityAmount(FeePriority feePriority) => Amount(
        value: getPriorityGWEI(feePriority),
        decimals: 18, // GWEI
      );

  const EvmNetworkFees.fromBigInt({
    required BigInt lastBlock,
    required BigInt maxPriorityFeePerGas,
  }) : this(
          lastBlock: lastBlock,
          safe: lastBlock,
          average: lastBlock,
          fast: lastBlock,
          safePriority: maxPriorityFeePerGas,
          averagePriority: maxPriorityFeePerGas,
          fastPriority: maxPriorityFeePerGas,
        );

  factory EvmNetworkFees.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'suggestBaseFee': String last,
          'SafeGasPrice': String safe,
          'ProposeGasPrice': String propose,
          'FastGasPrice': String fast,
        }) {
      final safe_num = toGwei(safe);
      final propose_num = toGwei(propose);
      final fast_num = toGwei(fast);
      final last_num = toGwei(last);

      final safePriority = safe_num - last_num;
      final averagePriority = propose_num - last_num;
      final fastPriority = fast_num - last_num;

      return EvmNetworkFees(
        lastBlock: last_num,
        safe: safe_num,
        average: propose_num,
        fast: fast_num,
        safePriority: safePriority,
        averagePriority: averagePriority,
        fastPriority: fastPriority,
      );
    }

    if (json
        case {
          'SafeGasPrice': String safe,
          'ProposeGasPrice': String average,
          'FastGasPrice': String fast,
        }) {
      final safe_num = toGwei(safe);
      final last_num = safe_num;
      final average_num = toGwei(average);
      final fast_num = toGwei(fast);

      return EvmNetworkFees(
        lastBlock: last_num,
        safe: safe_num,
        average: average_num,
        fast: fast_num,
        safePriority: BigInt.zero,
        averagePriority: BigInt.zero,
        fastPriority: BigInt.zero,
      );
    }

    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'GasFeesEntity{lastBlock: $lastBlock, safe: $safe, average: $average, fast: $fast}';
  }
}

BigInt toGwei(String wei) {
  final decimals = wei.contains('.') ? wei.split('.')[1].length : 0;
  final wei_without_decimals = wei.replaceAll('.', '');
  final val = BigInt.parse(wei_without_decimals);

  final multiplier = BigInt.from(10).pow(9 - decimals);

  return val * multiplier;
}

final class TronNetworkFees extends NetworkFees {
  final int energyPrice = 420; // SUN
  final int bandWidthPrice = 1000; // SUN

  final int energyBalance;
  final int bandwidthBalance;

  final int bandWidthConsumed;
  final int energyConsumed;

  Amount get bandWidthFee {
    return Amount.from(
      value: bandwidthBalance >= bandWidthConsumed ? 0 : bandWidthConsumed * bandWidthPrice,
      decimals: 6,
    );
  }

  Amount get energyFee {
    return Amount.from(
      value: energyBalance >= energyConsumed ? 0 : energyConsumed * energyPrice,
      decimals: 6,
    );
  }

  Amount get fee {
    return bandWidthFee + energyFee;
  }

  int get bandWidthUsed {
    return bandWidthConsumed > bandwidthBalance ? 0 : bandWidthConsumed;
  }

  int get energyUsed {
    return energyConsumed > energyBalance ? 0 : energyConsumed;
  }

  TronNetworkFees({
    required this.bandWidthConsumed,
    required this.energyConsumed,
    required this.energyBalance,
    required this.bandwidthBalance,
  });

  @override
  String toString() {
    return 'TronNetworkFees{energyPrice: $energyPrice, bandWidthPrice: $bandWidthPrice, energyBalance: $energyBalance, bandwidthBalance: $bandwidthBalance, bandWidthConsumed: $bandWidthConsumed, energyConsumed: $energyConsumed}';
  }
}
