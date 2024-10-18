import 'package:walletkit_dart/walletkit_dart.dart';

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

  factory FeeInformation.fromJson(Map json) {
    return switch (json) {
      {
        'gasLimit': int gasLimit,
        'gasPrice': Map gasPrice,
      } =>
        EvmFeeInformation(
          gasLimit: gasLimit,
          gasPrice: Amount.fromJson(gasPrice),
        ),
      {
        'feePerByte': Map feePerByte,
        'fee': Map? fee,
      } =>
        UtxoFeeInformation(
          feePerByte: Amount.fromJson(feePerByte),
          fee: fee != null ? Amount.fromJson(fee) : null,
        ),
      {
        'feeLimit': Map feeLimit,
      } =>
        TronFeeInformation(
          feeLimit: Amount.fromJson(feeLimit),
        ),
      _ => throw FormatException('Unknown FeeInformation'),
    };
  }
}

final class EvmFeeInformation extends FeeInformation {
  final int? gasLimit;
  final Amount? gasPrice;

  const EvmFeeInformation({
    required this.gasLimit,
    required this.gasPrice,
  });

  Amount get fee {
    return gasPrice ??
        Amount.zero * Amount.convert(value: gasLimit ?? 0, decimals: 0);
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'gasPrice': gasPrice?.toJson() ?? Amount.zero.toJson(),
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

  static EvmFeeInformation get zero {
    return EvmFeeInformation(gasLimit: null, gasPrice: null);
  }
}

final class EvmType2FeeInformation extends EvmFeeInformation {
  final Amount? maxPriorityFeePerGas;

  const EvmType2FeeInformation({
    required super.gasLimit,
    required super.gasPrice,
    required this.maxPriorityFeePerGas,
  });

  static EvmType2FeeInformation get zero {
    return EvmType2FeeInformation(
      gasLimit: null,
      gasPrice: null,
      maxPriorityFeePerGas: null,
    );
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'maxPriorityFeePerGas': maxPriorityFeePerGas.toString(),
      'gasPrice': gasPrice?.toJson() ?? Amount.zero.toJson(),
    };
  }

  EvmType2FeeInformation copyWith({
    int? gasLimit,
    Amount? gasPrice,
    Amount? maxPriorityFeePerGas,
  }) {
    return EvmType2FeeInformation(
      gasLimit: gasLimit ?? this.gasLimit,
      gasPrice: gasPrice ?? this.gasPrice,
      maxPriorityFeePerGas: maxPriorityFeePerGas ?? this.maxPriorityFeePerGas,
    );
  }
}

final class UtxoFeeInformation extends FeeInformation {
  final Amount feePerByte;
  final Amount? fee;

  const UtxoFeeInformation({
    required this.feePerByte,
    this.fee,
  });

  Json toJson() {
    return {
      'feePerByte': feePerByte.toJson(),
      'fee': fee?.toJson(),
    };
  }
}

final class TronFeeInformation extends FeeInformation {
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
