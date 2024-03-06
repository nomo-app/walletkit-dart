import 'package:walletkit_dart/src/domain/entities/fee.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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

  BigInt getFeeGWEI(FeePriority feePriority) => switch (feePriority) {
        FeePriority.high => fast,
        FeePriority.medium => average,
        FeePriority.low => safe,
        _ => safe,
      };

  Amount getFeeAmount(FeePriority feePriority) => Amount(
        value: getFeeGWEI(feePriority),
        decimals: 9,
      );

  factory GasFeesEntity.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          //  'suggestBaseFee': String last,
          'SafeGasPrice': String safe,
          'ProposeGasPrice': String propose,
          'FastGasPrice': String fast,
        }) {
      final safe_num = toGwei(safe);
      final propose_num = toGwei(propose);
      final fast_num = toGwei(fast);

      return GasFeesEntity(
        lastBlock: safe_num,
        safe: safe_num,
        average: propose_num,
        fast: fast_num,
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
