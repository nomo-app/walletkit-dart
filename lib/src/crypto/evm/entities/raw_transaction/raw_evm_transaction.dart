import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/entities/raw_transaction/signature.dart';
import 'package:walletkit_dart/src/crypto/evm/entities/raw_transaction/transaction_type.dart';
import 'package:walletkit_dart/src/utils/bigint_utils.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

sealed class RawEvmTransaction {
  final BigInt nonce;
  final BigInt gasLimit;
  final String to;
  final BigInt value;
  final Uint8List data;

  const RawEvmTransaction({
    required this.nonce,
    required this.gasLimit,
    required this.to,
    required this.value,
    required this.data,
  });

  int? get chainId;

  @override
  int get hashCode => txHash.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RawEvmTransaction && other.txHash == txHash;
  }

  String get txHash => "0x" + keccak256(serialized).toHex;

  Uint8List get signingTxHash;

  bool get hasSignature;

  String get sender;

  /// Used for Signing the transaction
  Uint8List get serialized;

  String get serializedHex => "0x" + serialized.toHex;

  factory RawEvmTransaction.fromHex(String hex) {
    final rawTxHex = hex.replaceFirst("0x", "");

    /// Check if the transaction is a Type 2 transaction
    if (rawTxHex.startsWith("02")) {
      return RawEVMTransactionType2.fromHex(hex);
    }

    /// Check if the transaction is a Type 1 transaction
    if (rawTxHex.startsWith("01")) {
      return RawEVMTransactionType1.fromHex(hex);
    }

    return RawEVMTransactionType0.fromHex(hex);
  }

  factory RawEvmTransaction.fromUnsignedHex(String hex) {
    final rawTxHex = hex.replaceFirst("0x", "");

    /// Check if the transaction is a Type 2 transaction
    if (rawTxHex.startsWith("02")) {
      return RawEVMTransactionType2.fromUnsignedHex(hex);
    }

    /// Check if the transaction is a Type 1 transaction
    if (rawTxHex.startsWith("01")) {
      return RawEVMTransactionType1.fromUnsignedHexing(hex);
    }

    return RawEVMTransactionType0.fromUnsignedHex(hex);
  }

  int get txType => switch (this) {
        RawEVMTransactionType0() => 0,
        RawEVMTransactionType1() => 1,
        RawEVMTransactionType2() => 2,
      };

  RawEvmTransaction addSignature(Signature signature);

  BigInt get gasFee {
    return switch (this) {
      RawEVMTransactionType0 type0 => type0.gasPrice * type0.gasLimit,
      RawEVMTransactionType1 type1 => type1.gasPrice * type1.gasLimit,
      RawEVMTransactionType2 type2 => type2.maxFeePerGas * type2.gasLimit,
    };
  }

  @override
  String toString() {
    return "RawEvmTransaction($txType):{nonce: $nonce, gasLimit: $gasLimit, to: $to, value: $value, data: $data}";
  }
}

class RawEVMTransactionType0 extends RawEvmTransaction {
  final BigInt gasPrice;
  final BigInt r, s;
  final int v;

  /// The chainId is optional for transactions with v = 27 or v = 28 (EIP-155)
  /// For other transactions, chainId is calculated as (v - 35) / 2 for odd v
  /// and (v - 36) / 2 for even v
  int? get chainId {
    if (v == 27 || v == 28) {
      return null;
    }

    if (v.isOdd) {
      return (v - 35) ~/ 2;
    }

    return (v - 36) ~/ 2;
  }

  Uint8List get signingTxHash =>
      keccak256(serializedUnsigned(chainId?.toInt()));

  String get sender {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot recover sender");
    }

    final signature = Signature.fromRSV(r, s, v.toInt());

    final publicKey = recoverPublicKey(signingTxHash, signature);

    final addressBytes = publicKeyToAddress(publicKey);

    final address = addressBytes.toHex;
    return "0x$address";
  }

  Uint8List get serialized {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot serialize");
    }

    final _nonce = nonce.bigIntToBytes.toHex;
    final _gasPrice = gasPrice.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceAll("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;
    final _v = v.toBI.bigIntToBytes.toHex;
    final _r = r.bigIntToBytes.toHex;
    final _s = s.bigIntToBytes.toHex;

    List<String> buffer = [
      _nonce,
      _gasPrice,
      _gasLimit,
      _to,
      _value,
      _data,
      _v,
      _r,
      _s,
    ];

    return rlpEncode(buffer).hexToBytes;
  }

  const RawEVMTransactionType0({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.gasPrice,
    required this.r,
    required this.s,
    required this.v,
  });

  RawEVMTransactionType0.unsigned({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.gasPrice,
    int? chainId,
  })  : r = BigInt.zero,
        s = BigInt.zero,
        v = chainId != null ? chainId * 2 + 35 : 27;

  RawEVMTransactionType0 addSignature(Signature signature) {
    return RawEVMTransactionType0(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      gasPrice: gasPrice,
      r: signature.r,
      s: signature.s,
      v: signature.v.toInt(),
    );
  }

  RawEVMTransactionType0 sign({
    required Uint8List privateKey,
    required int chainId,
  }) {
    final signature = Signature.createSignature(
      serializedUnsigned(chainId),
      privateKey,
      txType: TransactionType.Legacy,
      chainId: chainId,
    );

    return addSignature(signature);
  }

  factory RawEVMTransactionType0.fromUnsignedHex(String messageHex) {
    final rawTxHex = messageHex.replaceFirst("0x", "");
    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    final decodedList = rlpDecoded.whereType<String>().toList();

    if (decodedList.length < 6) {
      throw Exception("Invalid transaction, missing fields: $decodedList");
    }

    final nonce = parseAsHexBigInt(decodedList[0]);
    final gasPrice = parseAsHexBigInt(decodedList[1]);
    final gasLimit = parseAsHexBigInt(decodedList[2]);
    final to = "0x" + decodedList[3];
    final value = parseAsHexBigInt(decodedList[4]);
    final data = decodedList[5].hexToBytes;

    final chainId =
        decodedList.length > 6 ? parseAsHexInt(decodedList[6]) : null;

    return RawEVMTransactionType0.unsigned(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
    );
  }

  factory RawEVMTransactionType0.fromHex(String messageHex) {
    final rawTxHex = messageHex.replaceFirst("0x", "");
    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    final decodedList = rlpDecoded.whereType<String>().toList();

    if (decodedList.length < 9) {
      throw Exception("Invalid transaction, missing fields: $decodedList");
    }

    final nonce = parseAsHexBigInt(decodedList[0]);
    final gasPrice = parseAsHexBigInt(decodedList[1]);
    final gasLimit = parseAsHexBigInt(decodedList[2]);
    final to = "0x" + decodedList[3];
    final value = parseAsHexBigInt(decodedList[4]);
    final data = decodedList[5].hexToBytes;
    final v = parseAsHexInt(decodedList[6]);
    final r = parseAsHexBigInt(decodedList[7]);
    final s = parseAsHexBigInt(decodedList[8]);

    return RawEVMTransactionType0(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      v: v,
      r: r,
      s: s,
    );
  }

  Uint8List serializedUnsigned([int? chainId]) {
    final _nonce = nonce.bigIntToBytes.toHex;
    final _gasPrice = gasPrice.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceFirst("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;

    List<String> buffer = [
      _nonce,
      _gasPrice,
      _gasLimit,
      _to,
      _value,
      _data,
    ];

    /// EIP-155: If the chainId is present, add it to the buffer before encoding
    if (chainId != null) {
      buffer.addAll([
        chainId.toBI.bigIntToBytes.toHex,
        "",
        "",
      ]);
    }

    return rlpEncode(buffer).hexToBytes;
  }

  BigInt get gasFee {
    return gasPrice * gasLimit;
  }

  @override
  bool get hasSignature => r != BigInt.zero && s != BigInt.zero;
}

typedef AccessListItem = ({String address, List<String> storageKeys});

class RawEVMTransactionType1 extends RawEvmTransaction {
  final int chainId;
  final BigInt gasPrice;
  final List<AccessListItem> accessList;
  final int signatureYParity;
  final Uint8List signatureR;
  final Uint8List signatureS;

  const RawEVMTransactionType1({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.chainId,
    required this.gasPrice,
    required this.accessList,
    required this.signatureYParity,
    required this.signatureR,
    required this.signatureS,
  });

  RawEVMTransactionType1.unsigned({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.chainId,
    required this.gasPrice,
    required this.accessList,
  })  : signatureYParity = -1,
        signatureR = Uint8List(0),
        signatureS = Uint8List(0);

  RawEVMTransactionType1 addSignature(Signature signature) {
    return RawEVMTransactionType1(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      gasPrice: gasPrice,
      accessList: accessList,
      signatureYParity: signature.yParity,
      signatureR: signature.rBytes,
      signatureS: signature.sBytes,
    );
  }

  RawEVMTransactionType1 sign({
    required Uint8List privateKey,
  }) {
    final signature = Signature.createSignature(
      serializedUnsigned,
      privateKey,
      txType: TransactionType.Type1,
    );

    return addSignature(signature);
  }

  @override
  String get sender {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot recover sender");
    }

    final signature = Signature.fromBytes(
      Uint8List.fromList([
        ...signatureR,
        ...signatureS,
        signatureYParity.toInt(),
      ]),
    );

    final publicKey = recoverPublicKey(
      signingTxHash,
      signature,
      hasSignatureYParity: true,
    );

    final addressBytes = publicKeyToAddress(publicKey);

    final address = addressBytes.toHex;
    return "0x$address";
  }

  @override
  Uint8List get serialized {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot serialize");
    }

    final _nonce = nonce.bigIntToBytes.toHex;
    final _gasPrice = gasPrice.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceFirst("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;
    final _accessList = accessList.map((item) {
      return [
        item.address.replaceFirst("0x", ""),
        item.storageKeys,
      ];
    }).toList();
    final _signatureYParity = signatureYParity.toBI.bigIntToBytes.toHex;
    final _signatureR = signatureR.toHex;
    final _signatureS = signatureS.toHex;

    List<dynamic> buffer = [
      chainId.toBI.bigIntToBytes.toHex,
      _nonce,
      _gasPrice,
      _gasLimit,
      _to,
      _value,
      _data,
      _accessList,
      _signatureYParity,
      _signatureR,
      _signatureS,
    ];

    return Uint8List.fromList(
      [0x01, ...rlpEncode(buffer).hexToBytes],
    );
  }

  @override
  bool get hasSignature =>
      signatureR.isNotEmpty &&
      signatureS.isNotEmpty &&
      (signatureYParity == 0 || signatureYParity == 1);

  Uint8List get serializedUnsigned {
    final _nonce = nonce.bigIntToBytes.toHex;
    final _gasPrice = gasPrice.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceFirst("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;
    final _accessList = accessList.map((item) {
      return [
        item.address.replaceFirst("0x", ""),
        item.storageKeys,
      ];
    }).toList();

    List<dynamic> buffer = [
      chainId.toBI.bigIntToBytes.toHex,
      _nonce,
      _gasPrice,
      _gasLimit,
      _to,
      _value,
      _data,
      _accessList,
    ];

    return Uint8List.fromList(
      [0x01, ...rlpEncode(buffer).hexToBytes],
    );
  }

  @override
  Uint8List get signingTxHash => keccak256(serializedUnsigned);

  factory RawEVMTransactionType1.fromUnsignedHexing(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    assert(rawTxHex.startsWith("01"), "Invalid Type 1 Transaction");
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 8) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final chainId = parseAsHexInt(rlpDecoded[0]);
    final nonce = parseAsHexBigInt(rlpDecoded[1]);
    final gasPrice = parseAsHexBigInt(rlpDecoded[2]);
    final gasLimit = parseAsHexBigInt(rlpDecoded[3]);
    final to = "0x" + rlpDecoded[4];
    final value = parseAsHexBigInt(rlpDecoded[5]);
    final data = (rlpDecoded[6] as String).hexToBytes;
    final accessList = [
      for (final item in rlpDecoded[7])
        (
          address: "0x" + item[0],
          storageKeys: (item[1] as List<dynamic>).whereType<String>().toList(),
        )
    ];

    return RawEVMTransactionType1.unsigned(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      gasPrice: gasPrice,
      accessList: accessList,
    );
  }

  factory RawEVMTransactionType1.fromHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    assert(rawTxHex.startsWith("01"), "Invalid Type 1 Transaction");
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 11) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final chainId = parseAsHexInt(rlpDecoded[0]);
    final nonce = parseAsHexBigInt(rlpDecoded[1]);
    final gasPrice = parseAsHexBigInt(rlpDecoded[2]);
    final gasLimit = parseAsHexBigInt(rlpDecoded[3]);
    final to = "0x" + rlpDecoded[4];
    final value = parseAsHexBigInt(rlpDecoded[5]);
    final data = (rlpDecoded[6] as String).hexToBytes;
    final accessList = [
      for (final item in rlpDecoded[7])
        (
          address: "0x" + item[0],
          storageKeys: (item[1] as List<dynamic>).whereType<String>().toList(),
        )
    ];
    final signatureYParity = parseAsHexInt(rlpDecoded[8]);
    final signatureR = (rlpDecoded[9] as String).hexToBytes;
    final signatureS = (rlpDecoded[10] as String).hexToBytes;

    return RawEVMTransactionType1(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      gasPrice: gasPrice,
      accessList: accessList,
      signatureYParity: signatureYParity,
      signatureR: signatureR,
      signatureS: signatureS,
    );
  }
}

class RawEVMTransactionType2 extends RawEvmTransaction {
  final int chainId;
  final BigInt maxFeePerGas;
  final BigInt maxPriorityFeePerGas;
  final List<AccessListItem> accessList;
  final int signatureYParity;
  final Uint8List signatureR;
  final Uint8List signatureS;

  const RawEVMTransactionType2({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.chainId,
    required this.maxFeePerGas,
    required this.maxPriorityFeePerGas,
    required this.accessList,
    required this.signatureR,
    required this.signatureS,
    required this.signatureYParity,
  });

  RawEVMTransactionType2.unsigned({
    required super.nonce,
    required super.gasLimit,
    required super.to,
    required super.value,
    required super.data,
    required this.chainId,
    required this.maxFeePerGas,
    required this.maxPriorityFeePerGas,
    required this.accessList,
  })  : signatureYParity = -1,
        signatureR = Uint8List(0),
        signatureS = Uint8List(0);

  RawEVMTransactionType2 addSignature(Signature signature) {
    return RawEVMTransactionType2(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      maxFeePerGas: maxFeePerGas,
      maxPriorityFeePerGas: maxPriorityFeePerGas,
      accessList: accessList,
      signatureYParity: signature.yParity,
      signatureR: signature.rBytes,
      signatureS: signature.sBytes,
    );
  }

  RawEVMTransactionType2 sign({
    required Uint8List privateKey,
  }) {
    final signature = Signature.createSignature(
      serializedUnsigned,
      privateKey,
      txType: TransactionType.Type2,
    );

    return addSignature(signature);
  }

  factory RawEVMTransactionType2.fromUnsignedHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    assert(rawTxHex.startsWith("02"), "Invalid Type 1 Transaction");
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 9) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final chainId = parseAsHexInt(rlpDecoded[0]);
    final nonce = parseAsHexBigInt(rlpDecoded[1]);
    final maxPriorityFeePerGas = parseAsHexBigInt(rlpDecoded[2]);
    final maxFeePerGas = parseAsHexBigInt(rlpDecoded[3]);
    final gasLimit = parseAsHexBigInt(rlpDecoded[4]);
    final to = "0x" + rlpDecoded[5];
    final value = parseAsHexBigInt(rlpDecoded[6]);
    final data = (rlpDecoded[7] as String).hexToBytes;
    final accessList = [
      for (final item in rlpDecoded[8])
        (
          address: "0x" + item[0],
          storageKeys: (item[1] as List<dynamic>).whereType<String>().toList(),
        )
    ];

    return RawEVMTransactionType2.unsigned(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      maxFeePerGas: maxFeePerGas,
      maxPriorityFeePerGas: maxPriorityFeePerGas,
      accessList: accessList,
    );
  }

  factory RawEVMTransactionType2.fromHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    assert(rawTxHex.startsWith("02"), "Invalid Type 1 Transaction");
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes, 0).result;

    if (rlpDecoded is! List) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 12) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final chainId = parseAsHexInt(rlpDecoded[0]);
    final nonce = parseAsHexBigInt(rlpDecoded[1]);
    final maxPriorityFeePerGas = parseAsHexBigInt(rlpDecoded[2]);
    final maxFeePerGas = parseAsHexBigInt(rlpDecoded[3]);
    final gasLimit = parseAsHexBigInt(rlpDecoded[4]);
    final to = "0x" + rlpDecoded[5];
    final value = parseAsHexBigInt(rlpDecoded[6]);
    final data = (rlpDecoded[7] as String).hexToBytes;
    final accessList = [
      for (final item in rlpDecoded[8])
        (
          address: "0x" + item[0],
          storageKeys: (item[1] as List<dynamic>).whereType<String>().toList(),
        )
    ];
    final signatureYParity = parseAsHexInt(rlpDecoded[9]);
    final signatureR = (rlpDecoded[10] as String).hexToBytes;
    final signatureS = (rlpDecoded[11] as String).hexToBytes;

    return RawEVMTransactionType2(
      nonce: nonce,
      gasLimit: gasLimit,
      to: to,
      value: value,
      data: data,
      chainId: chainId,
      maxFeePerGas: maxFeePerGas,
      maxPriorityFeePerGas: maxPriorityFeePerGas,
      accessList: accessList,
      signatureR: signatureR,
      signatureS: signatureS,
      signatureYParity: signatureYParity,
    );
  }

  @override
  String get sender {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot recover sender");
    }

    final signature = Signature.fromBytes(
      Uint8List.fromList([
        ...signatureR,
        ...signatureS,
        signatureYParity.toInt(),
      ]),
    );

    final publicKey = recoverPublicKey(
      signingTxHash,
      signature,
      hasSignatureYParity: true,
    );

    final addressBytes = publicKeyToAddress(publicKey);

    final address = addressBytes.toHex;
    return "0x$address";
  }

  @override
  Uint8List get serialized {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot serialize");
    }

    final _nonce = nonce.bigIntToBytes.toHex;
    final _maxFeePerGas = maxFeePerGas.bigIntToBytes.toHex;
    final _maxPriorityFeePerGas = maxPriorityFeePerGas.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceFirst("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;
    final _accessList = accessList.map((item) {
      return [
        item.address.replaceFirst("0x", ""),
        item.storageKeys,
      ];
    }).toList();
    final _signatureYParity = signatureYParity.toBI.bigIntToBytes.toHex;
    final _signatureR = signatureR.toHex;
    final _signatureS = signatureS.toHex;

    List<dynamic> buffer = [
      chainId.toBI.bigIntToBytes.toHex,
      _nonce,
      _maxPriorityFeePerGas,
      _maxFeePerGas,
      _gasLimit,
      _to,
      _value,
      _data,
      _accessList,
      _signatureYParity,
      _signatureR,
      _signatureS,
    ];

    return Uint8List.fromList(
      [0x02, ...rlpEncode(buffer).hexToBytes],
    );
  }

  @override
  bool get hasSignature =>
      signatureR.isNotEmpty &&
      signatureS.isNotEmpty &&
      (signatureYParity == 0 || signatureYParity == 1);

  Uint8List get serializedUnsigned {
    final _nonce = nonce.bigIntToBytes.toHex;
    final _maxFeePerGas = maxFeePerGas.bigIntToBytes.toHex;
    final _maxPriorityFeePerGas = maxPriorityFeePerGas.bigIntToBytes.toHex;
    final _gasLimit = gasLimit.bigIntToBytes.toHex;
    final _to = to.replaceFirst("0x", "");
    final _value = value.bigIntToBytes.toHex;
    final _data = data.toHex;
    final _accessList = accessList.map((item) {
      return [
        item.address.replaceFirst("0x", ""),
        item.storageKeys,
      ];
    }).toList();

    List<dynamic> buffer = [
      chainId.toBI.bigIntToBytes.toHex,
      _nonce,
      _maxPriorityFeePerGas,
      _maxFeePerGas,
      _gasLimit,
      _to,
      _value,
      _data,
      _accessList,
    ];

    return Uint8List.fromList(
      [0x02, ...rlpEncode(buffer).hexToBytes],
    );
  }

  @override
  Uint8List get signingTxHash => keccak256(serializedUnsigned);
}
