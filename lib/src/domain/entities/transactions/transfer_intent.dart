import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/fee.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';

part 'transfer_intent.g.dart';

@HiveType(typeId: 22)
class TransferIntent {
  @HiveField(0)
  final TokenEntity token;
  @HiveField(1)
  final String recipient;
  @HiveField(2)
  final Amount amount;

  /// If null, the fee will be calculated by the network
  @HiveField(3)
  final FeeInformation? feeInfo;

  Amount? get fee {
    if (feeInfo == null) return null;
    return feeInfo!.fee;
  }

  Amount get total {
    return amount + (fee ?? Amount.zero);
  }

  const TransferIntent({
    required this.recipient,
    required this.amount,
    required this.feeInfo,
    required this.token,
  });
}
