import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'fee.g.dart';

enum FeePriority {
  custom(0, 'Custom'),
  tommorow(144, 'Tommorow'),
  threeHours(18, '3 Hours'),
  twoHours(12, '2 Hours'),
  low(6, "slow"),
  medium(3, "medium"),
  high(1, "fast");

  final int blocks;
  final String displayName;

  int get estimatedMinutes => blocks * 10;

  const FeePriority(this.blocks, this.displayName);

  static List<FeePriority> get evm {
    return [
      low,
      medium,
      high,
    ];
  }

  static List<FeePriority> get utxo {
    return [
      tommorow,
      threeHours,
      twoHours,
    ];
  }
}

sealed class FeeInformation {
  Amount get fee;

  const FeeInformation();
}

@HiveType(typeId: 23)
final class EvmFeeInformation extends FeeInformation {
  @HiveField(0)
  final int gasLimit;
  @HiveField(1)
  final Amount gasPrice;

  const EvmFeeInformation({
    required this.gasLimit,
    required this.gasPrice,
  });

  @override
  Amount get fee {
    return gasPrice * Amount.num(value: gasLimit, decimals: 0);
  }
}

final class UtxoFeeInformation {
  final int feeRate;

  const UtxoFeeInformation({
    required this.feeRate,
  });
}
