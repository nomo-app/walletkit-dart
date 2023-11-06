import 'package:walletkit_dart/src/domain/entities/fee.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

// TODO: Make abstract for UTXO and EVM Implementations as they differ
class GasFeesEntity {
  final BigInt lastBlock;
  final BigInt safe;
  final BigInt average;
  final BigInt fast;

  const GasFeesEntity({
    required this.lastBlock,
    required this.safe,
    required this.average,
    required this.fast,
  });

  BigInt getFee(FeePriority feePriority) => switch (feePriority) {
        FeePriority.high => fast,
        FeePriority.medium => average,
        FeePriority.low => safe,
        _ => safe,
      };

  factory GasFeesEntity.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          //  'suggestBaseFee': String last,
          'SafeGasPrice': String safe,
          'ProposeGasPrice': String propose,
          'FastGasPrice': String fast,
        })
      return GasFeesEntity(
        lastBlock: safe.toBigInt * BigInt.from(1E9),
        safe: safe.toBigInt * BigInt.from(1E9),
        average: propose.toBigInt * BigInt.from(1E9),
        fast: fast.toBigInt * BigInt.from(1E9),
      );

    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'GasFeesEntity{lastBlock: $lastBlock, safe: $safe, average: $average, fast: $fast}';
  }
}
