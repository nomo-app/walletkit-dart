part of '../../../../domain/entities/generic_transaction.dart';

const String ADDRESS_NOT_SUPPORTED = "Address not supported";

final class UTXOTransaction extends GenericTransaction {
  final String id;
  final List<ElectrumInput> inputs;
  final List<ElectrumOutput> outputs;
  final int version;

  const UTXOTransaction({
    required super.block,
    required super.fee,
    required super.hash,
    required super.timeMilli,
    required super.amount,
    required super.sender,
    required super.recipient,
    required super.token,
    required super.transferMethod,
    required super.confirmations,
    required super.status,
    required this.inputs,
    required this.outputs,
    required this.id,
    required this.version,
  });

  UTXOTransaction copyWith({
    int? block,
    Amount? fee,
    String? hash,
    int? timeMilli,
    Amount? amount,
    String? sender,
    String? recipient,
    CoinEntity? token,
    TransactionTransferMethod? transferMethod,
    int? confirmations,
    List<ElectrumInput>? inputs,
    List<ElectrumOutput>? outputs,
    String? id,
    int? version,
    ConfirmationStatus? status,
  }) {
    return UTXOTransaction(
      block: block ?? this.block,
      fee: fee ?? this.fee,
      hash: hash ?? this.hash,
      timeMilli: timeMilli ?? this.timeMilli,
      amount: amount ?? this.amount,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
      token: token ?? this.token,
      transferMethod: transferMethod ?? this.transferMethod,
      confirmations: confirmations ?? this.confirmations,
      inputs: inputs ?? this.inputs,
      outputs: outputs ?? this.outputs,
      id: id ?? this.id,
      version: version ?? this.version,
      status: status ?? this.status,
    );
  }

  factory UTXOTransaction.create({
    required Map<String, dynamic> json,
    required UTXONetworkType type,
    required Iterable<AddressType> addressTypes,
    required Iterable<NodeWithAddress> nodes,
    required Iterable<ElectrumOutput> spentOutputs,
  }) {
    final coin = type.coin;
    final id = json['txid'] as String;
    //final hash = json['hash'] as String;

    final inputs = (json['vin'] as List<dynamic>)
        .map((e) => ElectrumInput.fromJson(e as Map<String, dynamic>))
        .toList();

    final rawOutputs = (json['vout'] as List<dynamic>)
        .map((e) => ElectrumOutput.fromJson(e as Map<String, dynamic>))
        .toList();

    final outputs = findOurOwnCoins(rawOutputs, nodes, addressTypes, type);

    final sender = inputs.first.getAddress(
      type,
      addressType: addressTypes.first,
    );

    final transferMethod = determineSendDirection(
      inputs: inputs,
      outputs: outputs,
      nodes: nodes,
      type: type,
      addressTypes: addressTypes,
    );

    final (value, totalOutputValue) = determineTransactionValue(
      outputs,
      transferMethod,
      nodes,
      type,
    );

    final totalInputValue = spentOutputs.fold(
      BigInt.zero,
      (prev, spentOutput) => prev + spentOutput.value,
    );

    final fee_int = json['fee_int'] as int?;
    var fee = fee_int != null ? BigInt.from(fee_int) : null;
    fee ??= spentOutputs.isEmpty ? null : totalInputValue - totalOutputValue;

    final recipient = determineTransactionTarget(
          outputs,
          transferMethod,
          type,
          addressTypes.first,
        ) ??
        ADDRESS_NOT_SUPPORTED;

    //final blockHash = json['blockhash'] as String;

    final timestamp = (json['time'] ?? -1) * 1000;
    final height = int.tryParse(json['height'].toString()) ?? -1;
    final confirmations = int.tryParse(json['confirmations'].toString()) ?? -1;
    final version = json['version'] as int;

    return UTXOTransaction(
      block: height,
      fee: fee != null ? Amount(value: fee, decimals: coin.decimals) : null,
      hash: id,
      timeMilli: timestamp,
      amount: Amount(value: value, decimals: coin.decimals),
      sender: sender,
      recipient: recipient,
      token: coin,
      transferMethod: transferMethod,
      confirmations: confirmations,
      inputs: inputs,
      outputs: outputs,
      id: id,
      version: version,
      status: ConfirmationStatus.fromConfirmations(confirmations),
    );
  }

  factory UTXOTransaction.fromJson(Map<dynamic, dynamic> json) {
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
          'token': Map token,
          'id': String id,
          'version': int version,
          'inputs': JsonList inputs,
          'outputs': JsonList outputs,
        }) {
      return UTXOTransaction(
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
        token: CoinEntity.fromJson(token),
      );
    }

    throw Exception("Could not parse UTXOTransaction from $json");
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
      'id': id,
      'version': version,
      'token': token.toJson(),
      'inputs': inputs.map((e) => e.toJson()).toList(),
      'outputs': outputs.map((e) => e.toJson()).toList(),
    };
  }
}

class ElectrumInput {
  final String? scriptSig;
  final int? sequence;
  final String? txid;
  final int? vout;
  final List<String>? txinwitness;
  final String? coinbase;

  bool get isCoinbase => coinbase != null;

  const ElectrumInput({
    this.scriptSig,
    this.sequence,
    this.txid,
    this.vout,
    this.txinwitness,
    this.coinbase,
  });

  String getAddress(UTXONetworkType type, {AddressType? addressType}) {
    try {
      return getAddressFromInput(type, this, addressType: addressType);
    } catch (e) {
      return ADDRESS_NOT_SUPPORTED;
    }
  }

  Uint8List? get publicKey {
    try {
      return getPubKeyFromInput(this).$1;
    } catch (e) {
      return null;
    }
  }

  List<String> getAddresses({
    required Iterable<AddressType> addressTypes,
    required UTXONetworkType networkType,
  }) {
    final pubKey = publicKey;

    if (pubKey == null) {
      return throw Exception("Cannot get public key from input");
    }
    return [
      for (final addressType in addressTypes)
        pubKeyToAddress(pubKey, addressType, networkType)
    ];
  }

  factory ElectrumInput.fromJson(Map json) {
    return switch (json) {
      {
        "txinwitness": [String sig, String pubKey],
        "scriptSig": {
          "asm": _,
          "hex": String hex,
        },
        "sequence": int sequence,
        "txid": String txid,
        "vout": int vout,
      } =>
        ElectrumInput(
          txinwitness: [sig, pubKey],
          scriptSig: hex,
          sequence: sequence,
          txid: txid,
          vout: vout,
        ),
      {
        "scriptSig": {
          "asm": _,
          "hex": String hex,
        },
        "sequence": int sequence,
        "txid": String txid,
        "vout": int vout,
      } =>
        ElectrumInput(
          scriptSig: hex,
          sequence: sequence,
          txid: txid,
          vout: vout,
        ),
      {
        "coinbase": String coinbase,
        "sequence": int sequence,
      } =>
        ElectrumInput(
          coinbase: coinbase,
          sequence: sequence,
        ),
      {
        "scriptSig": {
          "asm": _,
          "hex": String hex,
        },
        "txid": String txid,
        "vout": int vout,
        "value_int": int _,
        "weight": int weight,
      } =>
        ElectrumInput(
          scriptSig: hex,
          txid: txid,
          vout: vout,
          sequence: weight,
        ),
      {
        'scriptSig': String? scriptSig,
        'sequence': int? sequence,
        'txid': String? txid,
        'vout': int? vout,
        'txinwitness': List<String>? txinwitness,
        'coinbase': String? coinbase,
      } =>
        ElectrumInput(
          scriptSig: scriptSig,
          sequence: sequence,
          txid: txid,
          vout: vout,
          txinwitness: txinwitness,
          coinbase: coinbase,
        ),
      _ => throw Exception("Could not parse ElectrumInput from $json"),
    };
  }

  Json toJson() {
    return {
      'scriptSig': scriptSig,
      'sequence': sequence,
      'txid': txid,
      'vout': vout,
      'txinwitness': txinwitness,
      'coinbase': coinbase,
    };
  }
}

class ElectrumOutput {
  final ElectrumScriptPubKey scriptPubKey;
  final bool belongsToUs;
  final bool spent;
  final BigInt value;
  final int n;

  ///
  /// Only available if [belongsToUs] is true
  ///
  final NodeWithAddress node;

  const ElectrumOutput({
    required this.scriptPubKey,
    required this.value,
    required this.n,
    this.belongsToUs = false,
    this.spent = false,
    required this.node,
  });

  /// Zeniq: { value_coin || value_satoshi: int, ... }
  /// Bitcoin: { value: float, ... }

  factory ElectrumOutput.fromJson(Map json) {
    if (json
        case {
          'value': int value,
          'n': int n,
          'spent': bool spent,
          'belongsToUs': bool belongsToUs,
          'scriptPubKey': Map scriptPubKey,
          'node': Map node,
        }) {
      return ElectrumOutput(
        value: value.toBigInt,
        n: n,
        spent: spent,
        belongsToUs: belongsToUs,
        scriptPubKey: ElectrumScriptPubKey.fromJson(scriptPubKey),
        node: NodeWithAddress.fromJson(node),
      );
    }

    final valIsSatoshi =
        json.containsKey('value_satoshi') || json.containsKey('value_int');

    var value =
        json['value_int'] ?? json['value'] ?? json['value_satoshi'] ?? 0;

    value =
        valIsSatoshi ? BigInt.from(value) : BigInt.from(toSatoshiValue(value));

    final n = json['n'] ?? -1;

    return ElectrumOutput(
      value: value,
      n: n,
      scriptPubKey: ElectrumScriptPubKey.fromJson(
        json['scriptPubKey'],
      ),
      node: EmptyNode(),
    );
  }

  String getAddress(UTXONetworkType type, {AddressType? addressType}) {
    try {
      return getAddressFromLockingScript(scriptPubKey, type,
          addressType: addressType);
    } catch (e) {
      return ADDRESS_NOT_SUPPORTED;
    }
  }

  Iterable<String> getAddresses({
    required UTXONetworkType networkType,
    required Iterable<AddressType> addressTypes,
  }) {
    try {
      final (pubKey, _) =
          getPublicKeyFromLockingScript(scriptPubKey, networkType);

      return [
        for (final addressType in addressTypes)
          pubKeyHashToAddress(pubKey, addressType, networkType)
      ];
    } catch (e) {
      return [];
    }
  }

  ElectrumOutput copyWith({
    bool? belongsToUs,
    bool? spent,
    NodeWithAddress? node,
  }) {
    return ElectrumOutput(
      scriptPubKey: scriptPubKey,
      value: value,
      n: n,
      spent: spent ?? this.spent,
      belongsToUs: belongsToUs ?? this.belongsToUs,
      node: node ?? this.node,
    );
  }

  Json toJson() {
    return {
      'value': value.toInt(),
      'n': n,
      'spent': spent,
      'belongsToUs': belongsToUs,
      'scriptPubKey': scriptPubKey.toJson(),
      'node': node.toJson(),
    };
  }

  @override
  String toString() {
    return 'ElectrumOutput{scriptPubKey: $scriptPubKey, belongsToUs: $belongsToUs, spent: $spent, value: $value, n: $n, node: $node}';
  }
}

int toSatoshiValue(num val) {
  final value_s = val.toString();
  final splits = value_s.split('.');

  if (splits.length == 2) {
    final intPart = splits[0];
    var decPart = splits[1];
    decPart = decPart.padRight(8, '0');
    return int.parse(intPart + decPart);
  }
  return (val * 1E8).toInt();
}

class ElectrumScriptPubKey {
  final String hexString;
  final String type;

  const ElectrumScriptPubKey({
    required this.hexString,
    required this.type,
  });

  bool get isP2SH => type == 'scripthash';
  bool get isP2PKH => type == 'pubkeyhash';
  bool get isP2WSH => type == 'witness_v0_scripthash';
  bool get isSegwit => type == 'witness_v0_keyhash';

  factory ElectrumScriptPubKey.fromJson(Map json) {
    return ElectrumScriptPubKey(
      hexString: json['hex'] as String,
      type: json['type'] as String,
    );
  }

  BTCLockingScript get lockingScript {
    return BTCLockingScript.fromBuffer(hex.decode(hexString).toUint8List);
  }

  Json toJson() {
    return {
      'hex': hexString,
      'type': type,
    };
  }
}

final class NotAvaialableUTXOTransaction extends UTXOTransaction {
  NotAvaialableUTXOTransaction(String hash, int block, CoinEntity token)
      : super(
          block: block,
          hash: hash,
          id: hash,
          version: -1,
          confirmations: -1,
          amount: Amount.zero,
          fee: Amount.zero,
          inputs: const [],
          outputs: const [],
          recipient: "",
          sender: "",
          status: ConfirmationStatus.notSubmitted,
          timeMilli: -1,
          token: token,
          transferMethod: TransactionTransferMethod.unknown,
        );
}

extension OutputConverter on ElectrumOutput {
  Output get toOutput {
    return BTCOutput(
      value: value,
      script: scriptPubKey.lockingScript,
    );
  }
}
