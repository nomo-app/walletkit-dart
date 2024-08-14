import 'dart:typed_data';

import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/generic_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

final class ZeniqSmartChainTransaction extends EVMTransaction {
  const ZeniqSmartChainTransaction({
    required super.hash,
    required super.block,
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
    super.decodedInput,
  });

  factory ZeniqSmartChainTransaction.fromTransferEventJson(
    Json json, {
    required TokenEntity token,
    required TransactionTransferMethod transferMethod,
    required int confirmations,
    required int timestamp,
    required ConfirmationStatus status,
  }) {
    if (json
        case {
          // "address": String address,
          "topics": List<dynamic> topics,
          "data": String data,
          "blockNumber": String blockNumber,
          "transactionHash": String transactionHash,
          // "transactionIndex": String transactionIndex,
          // "blockHash": String blockHash,
          // "logIndex": String logIndex,
          // "removed": bool removed,
        }) {
      final topics_s = topics.whereType<String>().toList();

      final block_i = blockNumber.toIntOrNull ?? -1;
      final value_bi = data.toBigIntOrNull ?? BigInt.from(-1);

      final sender = "0x${topics_s[1].substring(26)}";
      final recipient = "0x${topics_s[2].substring(26)}";

      return ZeniqSmartChainTransaction(
        hash: transactionHash,
        block: block_i,
        confirmations: confirmations,
        timeMilli: timestamp * 1000,
        amount: Amount(value: value_bi, decimals: token.decimals),
        fee: Amount(value: BigInt.from(0), decimals: token.decimals),
        sender: sender,
        recipient: recipient,
        transferMethod: transferMethod,
        token: token,
        status: status,
        input: Uint8List(0),
      );
    }

    throw UnimplementedError();
  }
}
