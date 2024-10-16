part of '../../../domain/entities/generic_transaction.dart';

base class TronTransaction extends EVMTransaction {
  const TronTransaction({
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
    required super.gasPrice,
    required super.gasUsed,
    required super.gas,
    required super.decodedInput,
    required super.input,
  });

  static TronTransaction? fromJson(
    Json json,
    CoinEntity token,
    String walletAddress,
  ) {
    /// TRC20 Transaction TRONSCAN
    if (json
        case {
          "hash": String hash,
          "from": String from,
          "to": String to,
          "amount": String value_s,
          "block_timestamp": int block_timestamp,
          "block": int block,
          "confirmed": int confirmed,
          "direction": int direction,
        }) {
      final value = BigInt.parse(value_s);
      final amount = Amount(value: value, decimals: token.decimals);

      return TronTransaction(
        token: token,
        hash: hash,
        block: block,
        timeMilli: block_timestamp,
        recipient: to,
        sender: from,
        decodedInput: null,
        gas: null,
        gasPrice: null,
        gasUsed: null,
        amount: amount,
        fee: null,
        transferMethod: switch (direction) {
          2 => TransactionTransferMethod.receive,
          1 => TransactionTransferMethod.send,
          _ => TransactionTransferMethod.unknown,
        },
        confirmations: 0,
        status: switch (confirmed) {
          1 => ConfirmationStatus.confirmed,
          0 => ConfirmationStatus.pending,
          _ => ConfirmationStatus.failed,
        },
        input: Uint8List(0),
      );
    }

    /// TRX Transaction TRONSCAN
    if (json
        case {
          "block": int block,
          "hash": String hash,
          "ownerAddress": String ownerAddress,
          "toAddress": String toAddress,
          "fee": String fee_s,
          "amount": String amount_s,
          "timestamp": int timestamp,
          "confirmed": bool _,
          "riskTransaction": bool riskTransaction,
          "contractData": JSON contractData,
        }) {
      if (riskTransaction) {
        return null;
      }

      final input =
          (contractData['data'] as String?)?.hexToBytes ?? Uint8List(0);

      final fee_bi = BigInt.tryParse(fee_s);
      final feeAmount =
          fee_bi != null ? Amount(value: fee_bi, decimals: 6) : null;

      final amount_bi = BigInt.tryParse(amount_s) ?? BigInt.zero;
      final amount = Amount(value: amount_bi, decimals: 6);

      final transferMethod = walletAddress == ownerAddress
          ? TransactionTransferMethod.send
          : TransactionTransferMethod.receive;

      return TronTransaction(
        hash: hash,
        block: block,
        confirmations: 0,
        timeMilli: timestamp,
        amount: amount,
        fee: feeAmount,
        decodedInput: null,
        gas: null,
        gasPrice: null,
        gasUsed: null,
        sender: ownerAddress,
        recipient: toAddress,
        transferMethod: transferMethod,
        token: token,
        status: ConfirmationStatus.confirmed, // TODO:
        input: input,
      );
    }

    ///
    /// TRX Transaction RPC
    ///
    if (json
        case {
          "txID": String hash,
          "net_usage": int _,
          "net_fee": int netFee,
          "energy_usage": int _,
          "energy_fee": int energyFee,
          "blockNumber": int block,
          "block_timestamp": int block_timestamp,
          "raw_data_hex": String raw_data_hex,
        }) {
      final fee = Amount(
        value: BigInt.from(netFee + energyFee),
        decimals: 6,
      );

      final rawData = raw_data_hex.hexToBytes;
      final tron.Transaction_raw rawTx =
          tron.Transaction_raw.fromBuffer(rawData);

      final contract = rawTx.contract.first;
      final contractType = contract.type;

      final TronContractData contractData;

      try {
        contractData = TronContractData.from(contractType, contract.parameter);
      } on UnsupportedError {
        return null;
      }

      return switch (contractData) {
        TronTransferContractData data => TronTransaction(
            hash: hash,
            block: block,
            confirmations: 1,
            timeMilli: block_timestamp,
            amount: Amount(
              value: data.amount,
              decimals: token.decimals,
            ),
            fee: fee,
            sender: data.from,
            gas: null,
            gasPrice: null,
            gasUsed: null,
            decodedInput: null,
            recipient: data.to,
            transferMethod: data.from == walletAddress
                ? TransactionTransferMethod.send
                : TransactionTransferMethod.receive,
            token: token,
            status: ConfirmationStatus.confirmed,
            input: Uint8List(0),
          ),
        TronTransferAssetContractData data => TronTransaction(
            hash: hash,
            block: block,
            confirmations: 1,
            timeMilli: block_timestamp,
            amount: Amount(
              value: data.amount,
              decimals: token.decimals,
            ),
            fee: fee,
            sender: data.from,
            gas: null,
            gasPrice: null,
            gasUsed: null,
            decodedInput: null,
            recipient: data.to,
            transferMethod: data.from == walletAddress
                ? TransactionTransferMethod.send
                : TransactionTransferMethod.receive,
            token: token,
            status: ConfirmationStatus.confirmed,
            input: Uint8List(0),
          ),
        _ => throw UnimplementedError(),
      };
    }

    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'block': block,
      'confirmations': confirmations,
      'timeMilli': timeMilli,
      'amount': amount.toJson(),
      'fee': fee?.toJson(),
      'sender': sender,
      'recipient': recipient,
      'transferMethod': transferMethod.index,
      'status': status.index,
      'input': input.toHex,
      'token': token.toJson(),
    };
  }
}
