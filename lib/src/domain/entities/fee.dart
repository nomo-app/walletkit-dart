import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'fee.g.dart';

enum FeePriority {
  custom('Custom'),
  low("slow"),
  medium("medium"),
  high("fast"),
  nextBlock("nextBlock", "fast"),
  secondBlock("secondBlock", "medium"),
  hour("hour", "slow"),
  day("day", "slow");

  final String displayName;
  final String assetName;

  const FeePriority(this.displayName, [String? assetName])
      : assetName = assetName ?? displayName;

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
    return gasPrice * Amount.convert(value: gasLimit, decimals: 0);
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'gasPrice': gasPrice.toJson(),
    };
  }

  EvmFeeInformation copyWith({
    int? gasLimit,
    Amount? gasPrice,
  }) {
    return EvmFeeInformation(
      gasLimit: gasLimit ?? this.gasLimit,
      gasPrice: gasPrice ?? this.gasPrice,
    );
  }
}

@HiveType(typeId: 24)
final class UtxoFeeInformation extends FeeInformation {
  @HiveField(0)
  final Amount feePerByte;

  @HiveField(1)
  final Amount? fee;

  const UtxoFeeInformation({
    required this.feePerByte,
    this.fee,
  });

  Json toJson() {
    return {
      'feePerByte': feePerByte.toJson(),
      if (fee != null) 'fee': fee?.toJson(),
    };
  }
}

@HiveType(typeId: 27)
final class TronFeeInformation extends FeeInformation {
  @HiveField(0)
  final Amount feeLimit;

  const TronFeeInformation({
    required this.feeLimit,
  });

  Json toJson() {
    return {
      'feeLimit': feeLimit.toJson(),
    };
  }
}
