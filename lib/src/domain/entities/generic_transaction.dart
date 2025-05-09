library generic_transaction;

import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/common/http_repository.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part '../../crypto/evm/entities/transactions/evm_transaction.dart';
part '../../crypto/utxo/entities/transactions/utxo_transaction.dart';
part '../../crypto/tron/entities/tron_transaction.dart';

sealed class GenericTransaction implements Comparable<GenericTransaction> {
  final String hash;
  final int block;
  final int confirmations;
  final int timeMilli;
  final CoinEntity token;
  final Amount amount;
  final Amount? fee;
  final String sender;
  final String recipient;
  final TransactionTransferMethod transferMethod;
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

  EVMTransaction? get evmTx => this is EVMTransaction ? this as EVMTransaction : null;

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

  Map<String, dynamic> toJson();

  factory GenericTransaction.fromJson(Map json) {
    return switch (json) {
      {
        'hash': String _,
        'block': int _,
        'confirmations': int _,
        'timeMilli': int _,
        'amount': Map _,
        'fee': Map? _,
        'sender': String _,
        'recipient': String _,
        'transferMethod': int _,
        'status': int _,
        'token': Map _,
        'input': String _,
        'decodedInput': Map? _,
      } =>
        EVMTransaction.fromJson(json),
      {
        'hash': String _,
        'block': int _,
        'confirmations': int _,
        'timeMilli': int _,
        'amount': Map _,
        'fee': Map? _,
        'sender': String _,
        'recipient': String _,
        'transferMethod': int _,
        'status': int _,
        'token': Map _,
        'id': String _,
        'version': int _,
        'inputs': JsonList _,
        'outputs': JsonList _,
      } =>
        UTXOTransaction.fromJson(json),
      _ => throw UnimplementedError("Unknown json: $json"),
    };
  }
}

enum ConfirmationStatus {
  notSubmitted("not_submitted"),

  /// Transaction is not confirmed yet
  pending("pending"),

  /// Transaction is confirmed
  confirmed("confirmed"),

  /// Transaction is failed
  failed("failed");

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

  static ConfirmationStatus fromJson(int status) => values[status];

  final String displayName;

  const ConfirmationStatus(this.displayName);
}

enum TransactionTransferMethod {
  receive("receive"),

  send("send"),

  own("own"),

  unknown("unknown");

  static TransactionTransferMethod fromAddress(
    String address,
    String recipient,
    String sender,
  ) {
    if (address.toLowerCase() == sender.toLowerCase() &&
        address.toLowerCase() == recipient.toLowerCase()) return TransactionTransferMethod.own;
    if (address == recipient) return TransactionTransferMethod.receive;
    return TransactionTransferMethod.send;
  }

  final String displayName;

  const TransactionTransferMethod(this.displayName);

  static TransactionTransferMethod fromJson(int index) => values[index];
}
