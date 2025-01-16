import 'dart:typed_data';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

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
    /// Etherscan V2
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
          'input': String input_s,
          'functionName': String functionName, // V2 only
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

      final gasPrice = Amount(
        value: gasPrice_s.toBigInt,
        decimals: token.decimals,
      );

      final transferMethod =
          TransactionTransferMethod.fromAddress(address, to, from);

      final input = input_s.hexToBytesWithPrefixOrNull ?? Uint8List(0);

      final contractFunction = switch (functionName) {
        "" => null,
        _ => ContractFunction.fromTextSignature(textSignature: functionName)
      };

      ContractFunctionWithValues? decodedInput;
      if (contractFunction != null) {
        try {
          decodedInput = ContractFunction.decode(
            data: input,
            function: contractFunction,
          );
        } catch (e, s) {
          Logger.logError(e, s: s, hint: "Failed to decode contract function");
        }
      }

      return EtherscanTransaction(
        hash: hash,
        block: block,
        confirmations: confirmations,
        timeMilli: timeMilli * 1000,
        amount: amount,
        fee: fee,
        gasPrice: gasPrice,
        gasUsed: gasUsed_s.toInt,
        sender: from,
        gas: gas_s.toInt,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromReceiptStatus(
          txreceipt_status_s.toIntOrNull ?? -1,
        ),
        input: input,
        decodedInput: decodedInput,
      );
    }

    /// Etherscan V1
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
          'input': String input_s,
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

      final gasPrice = Amount(
        value: gasPrice_s.toBigInt,
        decimals: token.decimals,
      );

      final transferMethod =
          TransactionTransferMethod.fromAddress(address, to, from);

      final input = input_s.hexToBytesWithPrefixOrNull ?? Uint8List(0);

      return EtherscanTransaction(
        hash: hash,
        block: block,
        confirmations: confirmations,
        timeMilli: timeMilli * 1000,
        amount: amount,
        fee: fee,
        gasPrice: gasPrice,
        gasUsed: gasUsed_s.toInt,
        sender: from,
        gas: gas_s.toInt,
        recipient: to,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromReceiptStatus(
          txreceipt_status_s.toIntOrNull ?? -1,
        ),
        input: input,
      );
    }

    throw UnsupportedError("Invalid JSON for EtherscanTransaction");
  }

  factory EtherscanTransaction.fromJsonErc1155(
    Json json, {
    required EvmCoinEntity currency,
    required String address,
  }) {
    EtherscanTransaction _createTransaction({
      required String block_s,
      required String timeStamp_s,
      required String hash,
      required String from,
      required String to,
      required String gas_s,
      required String gasUsed_s,
      required String gasPrice_s,
      required String contractAddress,
      required String? symbol,
      required String? name,
      required String tokenID_s,
      required String input,
      String? tokenValue,
    }) {
      final block = block_s.toIntOrNull ?? -1;
      final confirmations = block_s.toIntOrNull ?? -1;
      final timeMilli = timeStamp_s.toIntOrNull ?? -1;
      final token = ERC1155Entity(
        name: name ?? "N.Av",
        symbol: symbol ?? "N.Av",
        contractAddress: contractAddress,
        chainID: currency.chainID,
        tokenId: BigInt.tryParse(tokenID_s) ?? BigInt.from(-1),
      );
      final amount = Amount(
        value: tokenValue != null
            ? (BigInt.tryParse(tokenValue) ?? BigInt.from(0))
            : BigInt.from(0),
        decimals: 0,
      );
      final fee = Amount(
        value: gasPrice_s.toBigInt * gasUsed_s.toBigInt,
        decimals: currency.decimals,
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
        gasUsed: gasUsed_s.toInt,
        sender: from,
        recipient: to,
        gas: gas_s.toInt,
        gasPrice: gasPrice,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.fromConfirmations(confirmations),
        input: input.hexToBytesWithPrefixOrNull ?? Uint8List(0),
      );
    }

    if (json
        case {
          'blockNumber': String block_s,
          'timeStamp': String timeStamp_s,
          'hash': String hash,
          'from': String from,
          'to': String to,
          'tokenValue': String value_s,
          'gas': String gas_s,
          'gasUsed': String gasUsed_s,
          'gasPrice': String gasPrice_s,
          'contractAddress': String contractAddress,
          'tokenSymbol': String? symbol,
          'tokenName': String? name,
          'tokenID': String tokenID_s,
          'input': String? input,
        }) {
      return _createTransaction(
        block_s: block_s,
        timeStamp_s: timeStamp_s,
        hash: hash,
        from: from,
        to: to,
        gas_s: gas_s,
        gasUsed_s: gasUsed_s,
        gasPrice_s: gasPrice_s,
        contractAddress: contractAddress,
        symbol: symbol,
        name: name,
        tokenID_s: tokenID_s,
        input: input ?? "",
        tokenValue: value_s,
      );
    }
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
          'tokenSymbol': String? symbol,
          'tokenName': String? name,
          'tokenID': String tokenID_s,
          'input': String input,
        }) {
      return _createTransaction(
        block_s: block_s,
        timeStamp_s: timeStamp_s,
        hash: hash,
        from: from,
        to: to,
        gas_s: gas_s,
        gasUsed_s: gasUsed_s,
        gasPrice_s: gasPrice_s,
        contractAddress: contractAddress,
        symbol: symbol,
        name: name,
        tokenID_s: tokenID_s,
        input: input,
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
        gasUsed: gasUsed_s.toInt,
        sender: from,
        recipient: to,
        gas: gas_s.toInt,
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
        gas: gas_s.toInt,
        gasUsed: gasUsed_s.toInt,
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
