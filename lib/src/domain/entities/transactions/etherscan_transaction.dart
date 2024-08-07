import 'dart:typed_data';
import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/generic_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

final class EtherscanTransaction extends EVMTransaction {
  const EtherscanTransaction({
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

  factory EtherscanTransaction.fromJson(
    Json json, {
    required TokenEntity token,
    required String address,
  }) {
    if (json
        case {
          'blockNumber': String block_s,
          'timeStamp': String timeStamp_s,
          'hash': String hash,
          'from': String from,
          'to': String to,
          'value': String value_s,
          'gas': String _,
          'gasUsed': String gasUsed_s,
          'gasPrice': String gasPrice_s,
          'txreceipt_status': String txreceipt_status_s,
          'isError': String _,
          'input': String input,
        }) {
      final block = block_s.toIntOrNull ?? -1;
      final confirmations = block_s.toIntOrNull ?? -1;

      final timeMilli = timeStamp_s.toIntOrNull ?? -1;
      final amount = Amount(
        value: BigInt.tryParse(value_s) ?? BigInt.from(-1),
        decimals: token.decimals,
      );

      final fee = Amount(
        value: gasPrice_s.toBigInt * gasUsed_s.toBigInt,
        decimals: token.decimals,
      );

      final transferMethod =
          TransactionTransferMethod.fromAddress(address, to, from);

      return EtherscanTransaction(
        hash: hash,
        block: block,
        confirmations: confirmations,
        timeMilli: timeMilli * 1000,
        amount: amount,
        fee: fee,
        sender: from,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromReceiptStatus(
          txreceipt_status_s.toIntOrNull ?? -1,
        ),
        input: input.hexToBytesWithPrefixOrNull ?? Uint8List(0),
      );
    }

    throw UnsupportedError("Invalid JSON for EtherscanTransaction");
  }

  factory EtherscanTransaction.fromJsonErc20(
    Json json, {
    required TokenEntity token,
    required EvmEntity currency,
    required String address,
  }) {
    if (json
        case {
          'blockNumber': String block_s,
          'timeStamp': String timeStamp_s,
          'hash': String hash,
          'from': String from,
          'to': String to,
          'value': String value_s,
          'gas': String _,
          'gasUsed': String gasUsed_s,
          'gasPrice': String gasPrice_s,
          'input': String input,
        }) {
      final block = block_s.toIntOrNull ?? -1;
      final confirmations = block_s.toIntOrNull ?? -1;

      final timeMilli = timeStamp_s.toIntOrNull ?? -1;
      final amount = Amount(
        value: BigInt.tryParse(value_s) ?? BigInt.from(-1),
        decimals: token.decimals,
      );

      final fee = Amount(
        value: gasPrice_s.toBigInt * gasUsed_s.toBigInt,
        decimals: currency.decimals,
      );

      final transferMethod =
          TransactionTransferMethod.fromAddress(address, to, from);

      return EtherscanTransaction(
        hash: hash,
        block: block,
        confirmations: confirmations,
        timeMilli: timeMilli * 1000,
        amount: amount,
        fee: fee,
        sender: from,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromConfirmations(confirmations),
        input: input.hexToBytesWithPrefixOrNull ?? Uint8List(0),
      );
    }
    throw UnsupportedError("Invalid JSON for EtherscanTransaction");
  }
}
