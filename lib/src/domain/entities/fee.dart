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
          gasPrice: EvmLegacyGasPrice(gasPrice: Amount.fromJson(gasPrice)),
        ),
      {
        'gasLimit': int gasLimit,
        'maxFeePerGas': Map maxFeePerGas,
        'maxPriorityFeePerGas': Map maxPriorityFeePerGas,
      } =>
        EvmFeeInformation(
          gasLimit: gasLimit,
          gasPrice: EvmType2GasPrice(
            maxFeePerGas: Amount.fromJson(maxFeePerGas),
            maxPriorityFeePerGas: Amount.fromJson(maxPriorityFeePerGas),
          ),
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
  final EvmGasPrice? gasPrice;

  const EvmFeeInformation({
    this.gasLimit,
    this.gasPrice,
  });

  Amount? get maxFee {
    if (gasLimit == null) {
      return null;
    }
    if (gasPrice == null) {
      return null;
    }

    return switch (gasPrice!) {
      EvmLegacyGasPrice gasPrice => gasPrice.gasPrice *
          Amount.convert(
            value: gasLimit!,
            decimals: 0,
          ),
      EvmType2GasPrice gasPrice =>
        gasPrice.maxFeePerGas * Amount.convert(value: gasLimit!, decimals: 0),
    };
  }

  EvmFeeInformation copyWith({
    int? gasLimit,
    EvmGasPrice? gasPrice,
  }) {
    return EvmFeeInformation(
      gasLimit: gasLimit ?? this.gasLimit,
      gasPrice: gasPrice ?? this.gasPrice,
    );
  }

  Json toJson() {
    return {
      'gasLimit': gasLimit,
      ...?gasPrice?.toJson(),
    };
  }
}

sealed class EvmGasPrice {
  const EvmGasPrice();

  Json toJson();
}

final class EvmLegacyGasPrice extends EvmGasPrice {
  final Amount gasPrice;

  const EvmLegacyGasPrice({
    required this.gasPrice,
  });

  Json toJson() {
    return {
      'gasPrice': gasPrice.toJson(),
    };
  }
}

final class EvmType2GasPrice extends EvmGasPrice {
  final Amount maxFeePerGas;
  final Amount maxPriorityFeePerGas;

  const EvmType2GasPrice({
    required this.maxFeePerGas,
    required this.maxPriorityFeePerGas,
  });

  Json toJson() {
    return {
      'maxPriorityFeePerGas': maxPriorityFeePerGas.toString(),
      'maxFeePerGas': maxFeePerGas.toString(),
    };
  }

  EvmType2GasPrice copyWith({
    Amount? maxFeePerGas,
    Amount? maxPriorityFeePerGas,
  }) {
    return EvmType2GasPrice(
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
