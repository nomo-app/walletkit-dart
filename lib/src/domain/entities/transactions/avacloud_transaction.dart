import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part "avacloud_transaction.g.dart";

@HiveType(typeId: 1)
final class AvalancheTransaction extends EVMTransaction {
  const AvalancheTransaction({
    required super.hash,
    required super.block,
    // This might need a different source or calculation
    required super.confirmations,
    required super.timeMilli,
    required super.amount,
    required super.fee,
    required super.sender,
    required super.recipient,
    required super.transferMethod,
    required super.token,
    required super.status,
    required super.input,
  });

  factory AvalancheTransaction.fromJson(
    Map<String, dynamic> json, {
    required EvmEntity token,
    required String address,
  }) {
    var nativeTransaction = json['nativeTransaction'];
    if (nativeTransaction != null) {
      final block = int.tryParse(nativeTransaction['blockNumber']) ?? -1;
      final timeMilli = nativeTransaction['blockTimestamp'] * 1000;

      final hash = nativeTransaction['txHash'];
      final from = nativeTransaction['from']['address'];
      final to = nativeTransaction['to']['address'];
      final value = BigInt.parse(nativeTransaction['value']);

      final gasUsed = BigInt.parse(nativeTransaction['gasUsed']);
      final gasPrice = BigInt.parse(nativeTransaction['gasPrice']);
      final fee = Amount(
        value: gasPrice * gasUsed,
        decimals: token.decimals,
      );

      final transferMethod =
          TransactionTransferMethod.fromAddress(address, to, from);

      final status = ConfirmationStatus.fromReceiptStatus(
        int.tryParse(nativeTransaction['txStatus']) ?? -1,
      );

      final data = nativeTransaction['method']['methodHash'].toString();

      return AvalancheTransaction(
        hash: hash,
        block: block,
        // Needs to be calculated or fetched if required
        confirmations: 0,
        timeMilli: timeMilli,
        amount: Amount(value: value, decimals: token.decimals),
        fee: fee,
        sender: from,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: status,
        input: data.hexToBytesWithPrefixOrNull ?? Uint8List(0),
      );
    }

    throw UnsupportedError("Invalid JSON for AvalancheTransaction");
  }

  // factory AvalancheTransaction.fromJsonErc20(
  //   Map<String, dynamic> json, {
  //   required TokenEntity token,
  //   required EvmEntity currency,
  //   required String address,
  // }) {
  //   var nativeTransaction = json['transactions'];
  //   if (nativeTransaction != null) {
  //     final block = int.tryParse(nativeTransaction['blockNumber']) ?? -1;
  //     final timeMilli = nativeTransaction['blockTimestamp'] * 1000;

  //     final hash = nativeTransaction['txHash'];
  //     final from = nativeTransaction['from']['address'];
  //     final to = nativeTransaction['to']['address'];
  //     final value = BigInt.parse(nativeTransaction['value']);

  //     final gasUsed = BigInt.parse(nativeTransaction['gasUsed']);
  //     final gasPrice = BigInt.parse(nativeTransaction['gasPrice']);
  //     final fee = Amount(
  //       value: gasPrice * gasUsed,
  //       decimals: token.decimals,
  //     );

  //     final transferMethod =
  //         TransactionTransferMethod.fromAddress(address, to, from);

  //     final status = ConfirmationStatus.fromReceiptStatus(
  //       int.tryParse(nativeTransaction['txStatus']) ?? -1,
  //     );

  //     final data = nativeTransaction['method']['methodHash'].toString();

  //     return AvalancheTransaction(
  //       hash: hash,
  //       block: block,
  //       // Needs to be calculated or fetched if required
  //       confirmations: 0,
  //       timeMilli: timeMilli,
  //       amount: Amount(value: value, decimals: token.decimals),
  //       fee: fee,
  //       sender: from,
  //       recipient: to,
  //       transferMethod: transferMethod,
  //       token: token,
  //       status: status,
  //       input: data.hexToBytesWithPrefixOrNull ?? Uint8List(0),
  //     );
  //   }

  //   throw UnsupportedError("Invalid JSON for AvalancheTransaction");
  // }
}
