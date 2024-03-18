import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'fee.g.dart';

enum FeePriority {
  custom('Custom'),
  low("slow"),
  medium("medium"),
  high("fast"),
  nextBlock("nextBlock"),
  secondBlock("secondBlock"),
  hour("hour"),
  day("day");

  final String displayName;

  const FeePriority(this.displayName);

  static List<FeePriority> get evm {
    return [
      low,
      medium,
      high,
    ];
  }

  static List<FeePriority> get utxo {
    return [
      nextBlock,
      secondBlock,
      hour,
      day,
    ];
  }
}

sealed class FeeInformation {
  const FeeInformation();

  Json toJson();
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

  Amount get fee {
    return gasPrice * Amount.num(value: gasLimit, decimals: 0);
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'gasPrice': gasPrice.toJson(),
    };
  }
}

final class UtxoFeeInformation extends FeeInformation {
  final double feePerByte;

  const UtxoFeeInformation({
    required this.feePerByte,
  });

  Json toJson() {
    return {
      'feePerByte': feePerByte,
    };
  }
}
