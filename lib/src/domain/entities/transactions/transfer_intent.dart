import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/fee.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';

class TransferIntent {
  final String recipient;
  final Amount amount;
  final FeePriority feePriority;
  final TransferStatus status;
  final TokenEntity token;

  const TransferIntent({
    required this.recipient,
    required this.amount,
    required this.feePriority,
    required this.token,
    this.status = TransferStatus.notSubmitted,
  });

  factory TransferIntent.initial() {
    return TransferIntent(
      recipient: '',
      amount: Amount.zero(),
      feePriority: FeePriority.medium,
      token: nullToken,
      status: TransferStatus.initial,
    );
  }

  // Copy with
  TransferIntent copyWith({
    String? recipient,
    Amount? amount,
    FeePriority? feePriority,
    TransferStatus? status,
    bool? subtractFee,
    TokenEntity? token,
  }) {
    return TransferIntent(
      recipient: recipient ?? this.recipient,
      amount: amount ?? this.amount,
      feePriority: feePriority ?? this.feePriority,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}

enum TransferStatus {
  initial,
  notSubmitted,
  submitted,
  networkError,
}

enum GasPriority {
  network,
  medium,
  high,
}
