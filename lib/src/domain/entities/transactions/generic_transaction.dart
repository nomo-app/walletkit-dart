library generic_transaction;

import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part 'evm_transaction.dart';
part 'utxo_transaction.dart';

sealed class GenericTransaction implements Comparable<GenericTransaction> {
  final String hash;
  final int block;
  final int confirmations;
  final int timeMilli;
  final TokenEntity token;
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
        'hash': String hash,
        'block': int block,
        'confirmations': int confirmations,
        'timeMilli': int timeMilli,
        'amount': Map amount,
        'fee': Map? fee,
        'sender': String sender,
        'recipient': String recipient,
        'transferMethod': int transferMethod,
        'status': int status,
        'token': Map token,
        'input': String input,
        'decodedInput': Json? decodedInput,
      } =>
        EVMTransaction(
          hash: hash,
          block: block,
          confirmations: confirmations,
          timeMilli: timeMilli,
          amount: Amount.fromJson(amount),
          fee: fee != null ? Amount.fromJson(fee) : null,
          sender: sender,
          recipient: recipient,
          transferMethod: TransactionTransferMethod.fromJson(transferMethod),
          status: ConfirmationStatus.fromJson(status),
          input: input.hexToBytesWithPrefixOrNull ?? Uint8List(0),
          token: TokenEntity.fromJson(token),
          decodedInput: decodedInput != null
              ? ExternalContractFunctionWithValues.fromJson(decodedInput)
              : null,
        ),
      {
        'hash': String hash,
        'block': int block,
        'confirmations': int confirmations,
        'timeMilli': int timeMilli,
        'amount': Map amount,
        'fee': Map? fee,
        'sender': String sender,
        'recipient': String recipient,
        'transferMethod': int transferMethod,
        'status': int status,
        'token': Map token,
        'id': String id,
        'version': int version,
        'inputs': JsonList inputs,
        'outputs': JsonList outputs,
      } =>
        UTXOTransaction(
          hash: hash,
          block: block,
          confirmations: confirmations,
          timeMilli: timeMilli,
          amount: Amount.fromJson(amount),
          fee: fee != null ? Amount.fromJson(fee) : null,
          sender: sender,
          recipient: recipient,
          transferMethod: TransactionTransferMethod.fromJson(transferMethod),
          status: ConfirmationStatus.fromJson(status),
          id: id,
          version: version,
          inputs: inputs.map((e) => ElectrumInput.fromJson(e)).toList(),
          outputs: outputs.map((e) => ElectrumOutput.fromJson(e)).toList(),
          token: TokenEntity.fromJson(token),
        ),
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
        address.toLowerCase() == recipient.toLowerCase())
      return TransactionTransferMethod.own;
    if (address == recipient) return TransactionTransferMethod.receive;
    return TransactionTransferMethod.send;
  }

  final String displayName;

  const TransactionTransferMethod(this.displayName);

  static TransactionTransferMethod fromJson(int index) => values[index];
}
