import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'transfer_intent.g.dart';

@HiveType(typeId: 22)
class TransferIntent<T extends FeeInformation?> {
  @HiveField(0)
  final TokenEntity token;
  @HiveField(1)
  final String recipient;
  @HiveField(2)
  final Amount amount;

  /// If null, the fee will be calculated by the network
  @HiveField(3)
  final T? feeInfo;

  const TransferIntent({
    required this.recipient,
    required this.amount,
    required this.feeInfo,
    required this.token,
  });

  Amount? get fee {
    if (feeInfo is EvmFeeInformation) {
      return (feeInfo as EvmFeeInformation).fee;
    }
    return null;
  }

  Amount get total {
    return amount + (fee ?? Amount.zero);
  }

  Amount _calcTargetAmount(Amount balance, Amount fee) {
    if ((amount + fee) > balance) {
      return balance - fee;
    }
    return amount;
  }

  ///
  /// Copy the transfer intent with a new fee
  /// If [balance] is provided, the target amount will be recalculated
  ///
  TransferIntent<T> copyWithFee<T extends FeeInformation>(
    T feeInfo, {
    Amount? balance,
  }) {
    final newTargetValue = switch ((balance, feeInfo)) {
      (Amount balance, EvmFeeInformation info) when token.isERC20 == false =>
        _calcTargetAmount(balance, info.fee),
      _ => amount,
    };

    return TransferIntent(
      recipient: recipient,
      amount: newTargetValue,
      feeInfo: feeInfo,
      token: token,
    );
  }

  String getErc20TransferSig() {
    return erc20TransferSig +
        recipient.substring(2).padLeft(64, '0') +
        amount.value.toHex.padLeft(64, '0');
  }

  Json toJson() {
    return {
      'recipient': recipient,
      'amount': amount.toJson(),
      'token': token.symbol,
      'fee': feeInfo?.toJson(),
    };
  }
}
