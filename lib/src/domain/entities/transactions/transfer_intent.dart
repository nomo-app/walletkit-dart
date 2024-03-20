import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
    if (feeInfo is EvmFeeInformation) {
      return (feeInfo as EvmFeeInformation).fee;
    }
    return null;
  }

  Amount get total {
    return amount + (fee ?? Amount.zero);
  }

  String getErc20TransferSig() {
    return erc20TransferSig +
        recipient.substring(2).padLeft(64, '0') +
        amount.value.toHex.padLeft(64, '0');
  }

  const TransferIntent({
    required this.recipient,
    required this.amount,
    required this.feeInfo,
    required this.token,
  });

  Json toJson() {
    return {
      'recipient': recipient,
      'amount': amount.toJson(),
      'token': token.symbol,
      'fee': feeInfo?.toJson(),
    };
  }
}
