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
        EvmLegacyFeeInformation(
          gasLimit: gasLimit,
          gasPrice: Amount.fromJson(gasPrice),
        ),
      {
        'gasLimit': int gasLimit,
        'maxFeePerGas': Map maxFeePerGas,
        'maxPriorityFeePerGas': Map maxPriorityFeePerGas,
      } =>
        EvmType2FeeInformation(
          gasLimit: gasLimit,
          maxFeePerGas: Amount.fromJson(maxFeePerGas),
          maxPriorityFeePerGas: Amount.fromJson(maxPriorityFeePerGas),
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

sealed class EvmFeeInformation extends FeeInformation {
  final int? gasLimit;

  Amount? get maxFee;

  const EvmFeeInformation({
    required this.gasLimit,
  });
}

final class EvmLegacyFeeInformation extends EvmFeeInformation {
  final Amount? gasPrice;

  Amount? get maxFee {
    if (gasPrice == null) {
      return null;
    }
    if (gasLimit == null) {
      return null;
    }

    return gasPrice! * Amount.convert(value: gasLimit!, decimals: 0);
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'gasPrice': gasPrice?.toJson() ?? Amount.zero.toJson(),
    };
  }

  EvmLegacyFeeInformation copyWith({
    int? gasLimit,
    Amount? gasPrice,
  }) {
    return EvmLegacyFeeInformation(
      gasLimit: gasLimit ?? this.gasLimit,
      gasPrice: gasPrice ?? this.gasPrice,
    );
  }

  const EvmLegacyFeeInformation({
    required super.gasLimit,
    required this.gasPrice,
  });
}

final class EvmType2FeeInformation extends EvmFeeInformation {
  final Amount? maxFeePerGas;
  final Amount? maxPriorityFeePerGas;

  Amount? get maxFee {
    if (gasLimit == null) {
      return null;
    }

    if (maxFeePerGas == null) {
      return null;
    }

    return maxFeePerGas! * Amount.convert(value: gasLimit!, decimals: 0);
  }

  const EvmType2FeeInformation({
    required super.gasLimit,
    required this.maxFeePerGas,
    required this.maxPriorityFeePerGas,
  });

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      'maxPriorityFeePerGas': maxPriorityFeePerGas.toString(),
      'maxFeePerGas': maxFeePerGas.toString(),
    };
  }

  EvmType2FeeInformation copyWith({
    int? gasLimit,
    Amount? maxFeePerGas,
    Amount? maxPriorityFeePerGas,
  }) {
    return EvmType2FeeInformation(
      gasLimit: gasLimit ?? this.gasLimit,
      maxFeePerGas: maxFeePerGas ?? this.maxFeePerGas,
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
