import 'dart:typed_data';
import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/domain/entities/coin_entity.dart';
import 'package:walletkit_dart/src/domain/entities/amount.dart';
import 'package:walletkit_dart/src/domain/entities/generic_transaction.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';

base class EtherscanTransaction extends EVMTransaction {
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
    required super.gasPrice,
    super.decodedInput,
    required super.gas,
    required super.gasUsed,
  });

  factory EtherscanTransaction.fromJson(
    Json json, {
    required CoinEntity token,
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
          'gas': String gas_s,
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

      final gas = Amount(
        value: gas_s.toBigInt,
        decimals: 0,
      );

      final gasUsed = Amount(
        value: gasUsed_s.toBigInt,
        decimals: 0,
      );

      final gasPrice = Amount(
        value: gasPrice_s.toBigInt,
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
        gasPrice: gasPrice,
        gasUsed: gasUsed,
        sender: from,
        gas: gas,
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
    required EvmCoinEntity currency,
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
          'gas': String gas_s,
          'gasUsed': String gasUsed_s,
          'gasPrice': String gasPrice_s,
          'input': String input,
          'contractAddress': String contractAddress,
          'tokenDecimal': String decimals_s,
          'tokenSymbol': String symbol,
          'tokenName': String name,
        }) {
      final block = block_s.toIntOrNull ?? -1;
      final confirmations = block_s.toIntOrNull ?? -1;

      final timeMilli = timeStamp_s.toIntOrNull ?? -1;

      final token = ERC20Entity(
        name: name,
        symbol: symbol,
        decimals: decimals_s.toIntOrNull ?? 18,
        contractAddress: contractAddress,
        chainID: currency.chainID,
      );

      final amount = Amount(
        value: BigInt.tryParse(value_s) ?? BigInt.from(-1),
        decimals: token.decimals,
      );

      final fee = Amount(
        value: gasPrice_s.toBigInt * gasUsed_s.toBigInt,
        decimals: currency.decimals,
      );

      final gas = Amount(
        value: gas_s.toBigInt,
        decimals: 0,
      );

      final gasUsed = Amount(
        value: gasUsed_s.toBigInt,
        decimals: 0,
      );

      final gasPrice = Amount(
        value: gasPrice_s.toBigInt,
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
        gasUsed: gasUsed,
        sender: from,
        recipient: to,
        gas: gas,
        gasPrice: gasPrice,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromConfirmations(confirmations),
        input: input.hexToBytesWithPrefixOrNull ?? Uint8List(0),
      );
    }
    throw UnsupportedError("Invalid JSON for EtherscanTransaction");
  }

  factory EtherscanTransaction.fromJsonErc721(
    Json json, {
    required EvmCoinEntity currency,
    required String address,
  }) {
    if (json
        case {
          'blockNumber': String block_s,
          'timeStamp': String timeStamp_s,
          'hash': String hash,
          'from': String from,
          'to': String to,
          'gas': String gas_s,
          'gasUsed': String gasUsed_s,
          'gasPrice': String gasPrice_s,
          'contractAddress': String contractAddress,
          'tokenID': String tokenID_s,
          'tokenName': String name,
          'tokenSymbol': String symbol,
          'tokenDecimal': String _,
        }) {
      final block = block_s.toIntOrNull ?? -1;
      final confirmations = block_s.toIntOrNull ?? -1;

      final timeMilli = timeStamp_s.toIntOrNull ?? -1;

      final tokenId = BigInt.tryParse(tokenID_s) ?? BigInt.from(-1);
      final token = ERC721Entity(
        name: name,
        symbol: symbol,
        contractAddress: contractAddress,
        chainID: currency.chainID,
        tokenId: tokenId,
      );

      final amount = Amount(
        value: BigInt.zero,
        decimals: 0,
      );

      final fee = Amount(
        value: gasPrice_s.toBigInt * gasUsed_s.toBigInt,
        decimals: currency.decimals,
      );

      final gasUsed = Amount(
        value: gasUsed_s.toBigInt,
        decimals: 0,
      );

      final gas = Amount(
        value: gas_s.toBigInt,
        decimals: 0,
      );

      final gasPrice = Amount(
        value: gasPrice_s.toBigInt,
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
        gasPrice: gasPrice,
        gas: gas,
        gasUsed: gasUsed,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromConfirmations(confirmations),
        input: Uint8List(0),
      );
    }
    throw UnsupportedError("Invalid JSON for EtherscanTransaction");
  }
}
