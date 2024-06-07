import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

part "utxo_transaction.g.dart";

typedef Json = Map<String, dynamic>;

typedef JsonList = List<dynamic>;

typedef JsonListNested = List<Json>;

const String ADDRESS_NOT_SUPPORTED = "Address not supported";

@HiveType(typeId: 3)
final class UTXOTransaction extends GenericTransaction {
  @HiveField(11)
  final String id;
  @HiveField(12)
  final List<ElectrumInput> inputs;
  @HiveField(13)
  final List<ElectrumOutput> outputs;
  @HiveField(14)
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
    TokenEntity? token,
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'block': block,
      'confirmations': confirmations,
      'timeMilli': timeMilli,
      'amount': amount.toJson(),
      if (fee != null) 'fee': fee!.toJson(),
      'sender': sender,
      'recipient': recipient,
      'transferMethod': transferMethod.index,
      'status': status.index,
      'id': id,
      'version': version,
      'inputs': inputs.map((e) => e.toJson()).toList(),
      'outputs': outputs.map((e) => e.toJson()).toList(),
    };
  }

  static UTXOTransaction fromJson(Map<String, dynamic> json) {
    return UTXOTransaction(
      block: json['block'] as int,
      fee: json['fee'] != null
          ? Amount.fromJson(json['fee'] as Map<String, dynamic>)
          : null,
      hash: json['hash'] as String,
      timeMilli: json['timeMilli'] as int,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      token: nullToken, // TODO: Add token to json
      transferMethod: TransactionTransferMethod.fromIndex(
        json['transferMethod'] as int,
      ),
      confirmations: json['confirmations'] as int,
      inputs: (json['inputs'] as List<dynamic>)
          .map((e) => ElectrumInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: (json['outputs'] as List<dynamic>)
          .map((e) => ElectrumOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      version: json['version'] as int,
      status: ConfirmationStatus.fromConfirmations(
        json['confirmations'] as int,
      ),
    );
  }
}

@HiveType(typeId: 4)
class ElectrumInput {
  @HiveField(0)
  final String? scriptSig;
  @HiveField(1)
  final int? sequence;
  @HiveField(2)
  final String? txid;
  @HiveField(3)
  final int? vout;
  @HiveField(4)
  final List<String>? txinwitness;
  @HiveField(5)
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

  factory ElectrumInput.fromJson(Json json) {
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
      _ => throw Exception("Could not parse ElectrumInput from $json"),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      if (scriptSig != null) 'scriptSig': scriptSig,
      if (sequence != null) 'sequence': sequence,
      if (txid != null) 'txid': txid,
      if (vout != null) 'vout': vout,
      if (txinwitness != null) 'txinwitness': txinwitness,
      if (coinbase != null) 'coinbase': coinbase,
    };
  }
}

@HiveType(typeId: 5)
class ElectrumOutput {
  @HiveField(0)
  final ElectrumScriptPubKey scriptPubKey;
  @HiveField(1)
  final bool belongsToUs;
  @HiveField(2)
  final bool spent;
  @HiveField(3)
  final BigInt value;
  @HiveField(4)
  final int n;

  ///
  /// Only available if [belongsToUs] is true
  ///
  @HiveField(5)
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

  factory ElectrumOutput.fromJson(Map<String, dynamic> json) {
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
        json['scriptPubKey'] as Map<String, dynamic>,
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

  @override
  String toString() {
    return 'ElectrumOutput{scriptPubKey: $scriptPubKey, belongsToUs: $belongsToUs, spent: $spent, value: $value, n: $n, node: $node}';
  }

  Map<String, dynamic> toJson() {
    return {
      'scriptPubKey': scriptPubKey.toJson(),
      'belongsToUs': belongsToUs,
      'spent': spent,
      'value': value.toString(),
      'n': n,
    };
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

@HiveType(typeId: 6)
class ElectrumScriptPubKey {
  @HiveField(0)
  final List<String>? addresses;
  @HiveField(1)
  final String? asm;
  @HiveField(2)
  final String hexString;
  @HiveField(3)
  final int? reqSigs;
  @HiveField(4)
  final String? type;

  const ElectrumScriptPubKey({
    this.addresses,
    this.asm,
    required this.hexString,
    this.reqSigs,
    this.type,
  });

  bool get isP2SH => type == 'scripthash';
  bool get isP2PKH => type == 'pubkeyhash';
  bool get isP2WSH => type == 'witness_v0_scripthash';
  bool get isSegwit => type == 'witness_v0_keyhash';

  factory ElectrumScriptPubKey.fromJson(Map<String, dynamic> json) {
    final addresses =
        (json['addresses'] as List<dynamic>?)?.whereType<String>().toList();

    return ElectrumScriptPubKey(
      addresses: addresses,
      asm: json['asm'] as String,
      hexString: json['hex'] as String,
      reqSigs: json['reqSigs'] as int?,
      type: json['type'] as String,
    );
  }

  Uint8List get lockingScript {
    return Uint8List.fromList(hex.decode(hexString));
  }

  Map<String, dynamic> toJson() {
    return {
      if (addresses != null) 'addresses': addresses,
      if (asm != null) 'asm': asm,
      'hex': hexString,
      if (reqSigs != null) 'reqSigs': reqSigs,
      if (type != null) 'type': type,
    };
  }
}

extension JsonUtil on Json {
  dynamic get(String key) {
    if (containsKey(key)) return this[key];
    return null;
  }
}

@HiveType(typeId: 21)
final class NotAvaialableUTXOTransaction extends UTXOTransaction {
  NotAvaialableUTXOTransaction(String hash, int block, TokenEntity token)
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
