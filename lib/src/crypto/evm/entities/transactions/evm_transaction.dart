part of '../../../../domain/entities/generic_transaction.dart';

base class EVMTransaction extends GenericTransaction {
  final Uint8List input;
  final Amount? gasPrice;
  final int gas;
  final int gasUsed;
  final ExternalContractFunctionWithValues? decodedInput;

  const EVMTransaction({
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
    required this.input,
    required this.decodedInput,
    required this.gasPrice,
    required this.gas,
    required this.gasUsed,
  });

  String? get uTF8Input {
    try {
      return utf8.decode(input);
    } catch (e) {
      return null;
    }
  }

  Future<ExternalContractFunctionWithValues?> get getFunctionSignature async {
    if (!_cachedFunctionSigs.containsKey(hash)) {
      _cachedFunctionSigs[hash] =
          await ContractFunctionWithValues.decodeRawWithFetch(data: input);
    }
    return _cachedFunctionSigs[hash];
  }

  EVMTransaction copyWith({ExternalContractFunctionWithValues? decodedInput}) {
    return EVMTransaction(
      hash: hash,
      block: block,
      confirmations: confirmations,
      timeMilli: timeMilli,
      amount: amount,
      fee: fee,
      gasPrice: gasPrice,
      gas: gas,
      gasUsed: gasUsed,
      sender: sender,
      recipient: recipient,
      transferMethod: transferMethod,
      status: status,
      input: input,
      token: token,
      decodedInput: decodedInput ?? this.decodedInput,
    );
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
      'gasPrice': gasPrice?.toJson(),
      'sender': sender,
      'gas': gas,
      'gasUsed': gasUsed,
      'recipient': recipient,
      'transferMethod': transferMethod.index,
      'status': status.index,
      'input': input.toHex,
      'token': token.toJson(),
      'decodedInput': decodedInput?.toJson(),
    };
  }

  factory EVMTransaction.fromJson(Map<dynamic, dynamic> json) {
    if (json
        case {
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
          'gas': int gas,
          'gasPrice': Map? gasPrice,
          'gasUsed': int gasUsed,
          'token': Map token,
          'input': String input,
          'decodedInput': Map? decodedInput,
        }) {
      return EVMTransaction(
        hash: hash,
        block: block,
        confirmations: confirmations,
        timeMilli: timeMilli,
        amount: Amount.fromJson(amount),
        fee: fee != null ? Amount.fromJson(fee) : null,
        sender: sender,
        gas: gas,
        recipient: recipient,
        gasUsed: gasUsed,
        gasPrice: gasPrice != null ? Amount.fromJson(gasPrice) : null,
        transferMethod: TransactionTransferMethod.fromJson(transferMethod),
        status: ConfirmationStatus.fromJson(status),
        input: input.hexToBytesOrNull ?? Uint8List(0),
        token: CoinEntity.fromJson(token),
        decodedInput: decodedInput != null
            ? ExternalContractFunctionWithValues.fromJson(decodedInput)
            : null,
      );
    }
    throw Exception("Could not parse EVMTransaction from $json");
  }
}

Map<String, ExternalContractFunctionWithValues> _cachedFunctionSigs = {};
