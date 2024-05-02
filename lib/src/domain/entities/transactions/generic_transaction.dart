library generic_transaction;

import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';

part 'generic_transaction.g.dart';

base class GenericTransaction implements Comparable<GenericTransaction> {
  @HiveField(0)
  final String hash;
  @HiveField(1)
  final int block;
  @HiveField(2)
  final int confirmations;
  @HiveField(3)
  final int timeMilli;
  @HiveField(4)
  final TokenEntity token;
  @HiveField(5)
  final Amount amount;
  @HiveField(6)
  final Amount? fee;
  @HiveField(7)
  final String sender;
  @HiveField(8)
  final String recipient;
  @HiveField(9)
  final TransactionTransferMethod transferMethod;
  @HiveField(10)
  final ConfirmationStatus status;

  const GenericTransaction({
    required this.hash,
    required this.block,
    required this.confirmations,
    required this.timeMilli,
    required this.amount,
    required this.fee,
    required this.sender,
    required this.recipient,
    required this.transferMethod,
    required this.token,
    required this.status,
  });

  BigInt get value => amount.value;

  BigInt get totalValue => value + (fee?.value ?? BigInt.zero);

  @override
  String toString() => "Transaction: $hash";

  bool get isPending => status == ConfirmationStatus.pending;

  bool get isConfirmed => status == ConfirmationStatus.confirmed;

  bool get isFailed => status == ConfirmationStatus.failed;

  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(timeMilli);

  @override
  int compareTo(GenericTransaction other) {
    if (isPending) {
      if (other.isPending) return 0;
      return -1;
    }
    if (other.isPending) return 1;
    return -timeMilli.compareTo(other.timeMilli);
  }

  @override
  int get hashCode => hash.hashCode ^ token.hashCode ^ block.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenericTransaction &&
        other.hash == hash &&
        other.token == token &&
        other.block == block;
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'block': block,
      'confirmations': confirmations,
      'timeMilli': timeMilli,
      'amount': amount.toJson(),
      if (fee != null) 'fee': fee!.toJson(),
      'sender': sender,
      'recipient': recipient,
      'transferMethod': transferMethod.displayName,
      'status': status.displayName,
    };
  }
}

@HiveType(typeId: 18)
enum ConfirmationStatus {
  @HiveField(0)
  notSubmitted("Not Submitted"),

  /// Transaction is not confirmed yet
  @HiveField(1)
  pending("Pending"),

  /// Transaction is confirmed
  @HiveField(2)
  confirmed("Confirmed"),

  /// Transaction is failed
  @HiveField(3)
  failed("Failed");

  /// TODO: When is a transaction failed?
  static ConfirmationStatus fromConfirmations(int? confirmations) {
    if (confirmations == null) return ConfirmationStatus.pending;
    if (confirmations <= 0) return ConfirmationStatus.pending;

    return ConfirmationStatus.confirmed;
  }

  static ConfirmationStatus fromReceiptStatus(int status) {
    if (status == 0) return ConfirmationStatus.failed;
    if (status == 1) return ConfirmationStatus.confirmed;

    return ConfirmationStatus.pending;
  }

  static ConfirmationStatus fromBool(bool? valid) {
    if (valid == null) return ConfirmationStatus.pending;
    if (valid) return ConfirmationStatus.confirmed;
    return ConfirmationStatus.failed;
  }

  final String displayName;

  const ConfirmationStatus(this.displayName);
}

@HiveType(typeId: 9)
enum TransactionTransferMethod {
  @HiveField(0)
  receive("receive"),
  @HiveField(1)
  send("send"),
  @HiveField(2)
  own("own"),
  @HiveField(3)
  unknown("unknown");

  static TransactionTransferMethod fromAddress(
    String address,
    String recipient,
    String sender,
  ) {
    if (address == sender && address == recipient)
      return TransactionTransferMethod.own;
    if (address == recipient) return TransactionTransferMethod.receive;
    return TransactionTransferMethod.send;
  }

  final String displayName;

  const TransactionTransferMethod(this.displayName);
}
