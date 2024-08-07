part of 'generic_transaction.dart';

base class EVMTransaction extends GenericTransaction {
  final Uint8List input;
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
      'sender': sender,
      'recipient': recipient,
      'transferMethod': transferMethod.index,
      'status': status.index,
      'input': input.toHex,
      'token': token.toJson(),
      'decodedInput': decodedInput?.toJson(),
    };
  }
}

Map<String, ExternalContractFunctionWithValues> _cachedFunctionSigs = {};
