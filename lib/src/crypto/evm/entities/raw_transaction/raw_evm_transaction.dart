import 'dart:typed_data';
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
      return RawEVMTransactionType1.fromUnsignedHex(hex);
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

  Uint8List get signingTxHash => keccak256(serializedUnsigned(chainId));

  String get sender {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot recover sender");
    }

    final signature = Signature.fromRSV(r, s, v);

    final publicKey = recoverPublicKey(signingTxHash, signature);

    final addressBytes = publicKeyToAddress(publicKey);

    final address = addressBytes.toHex;
    return "0x$address";
  }

  Uint8List get serialized {
    if (hasSignature == false) {
      throw Exception("Transaction is not signed, cannot serialize");
    }

    return encodeRLP(
      RLPList(
        [
          RLPBigInt(nonce),
          RLPBigInt(gasPrice),
          RLPBigInt(gasLimit),
          RLPString(to),
          RLPBigInt(value),
          RLPBytes(data),
          RLPInt(v),
          RLPBigInt(r),
          RLPBigInt(s),
        ],
      ),
    );
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
      v: signature.v,
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
    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 6) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final nonce = rlpDecoded[0].buffer.toUBigInt;
    final gasPrice = rlpDecoded[1].buffer.toUBigInt;
    final gasLimit = rlpDecoded[2].buffer.toUBigInt;
    final to = "0x" + rlpDecoded[3].hex;
    final value = rlpDecoded[4].buffer.toUBigInt;
    final data = rlpDecoded[5].buffer;
    final chainId = rlpDecoded.length > 6 ? rlpDecoded[6].buffer.toUInt : null;

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
    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 9) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    final nonce = rlpDecoded[0].buffer.toUBigInt;
    final gasPrice = rlpDecoded[1].buffer.toUBigInt;
    final gasLimit = rlpDecoded[2].buffer.toUBigInt;
    final to = "0x" + rlpDecoded[3].hex;
    final value = rlpDecoded[4].buffer.toUBigInt;
    final data = rlpDecoded[5].buffer;

    final v = rlpDecoded[6].buffer.toUInt;
    final r = rlpDecoded[7].buffer.toUBigInt;
    final s = rlpDecoded[8].buffer.toUBigInt;

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
    return encodeRLP(
      RLPList(
        [
          RLPBigInt(nonce),
          RLPBigInt(gasPrice),
          RLPBigInt(gasLimit),
          RLPString(to),
          RLPBigInt(value),
          RLPBytes(data),
          if (chainId != null) ...[
            RLPInt(chainId),
            RLPNull(),
            RLPNull(),
          ]
        ],
      ),
    );
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
        signatureYParity,
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

    return Uint8List.fromList(
      [
        0x01,
        ...encodeRLP(
          RLPList(
            [
              RLPInt(chainId),
              RLPBigInt(nonce),
              RLPBigInt(gasPrice),
              RLPBigInt(gasLimit),
              RLPString(to),
              RLPBigInt(value),
              RLPBytes(data),
              RLPList(
                accessList.map((item) {
                  return RLPList(
                    [
                      RLPString(item.address),
                      RLPList(
                        item.storageKeys.map((key) => RLPString(key, isHex: true)).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
              RLPInt(signatureYParity),
              RLPBytes(signatureR),
              RLPBytes(signatureS),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get hasSignature =>
      signatureR.isNotEmpty &&
      signatureS.isNotEmpty &&
      (signatureYParity == 0 || signatureYParity == 1);

  Uint8List get serializedUnsigned {
    return Uint8List.fromList(
      [
        0x01,
        ...encodeRLP(
          RLPList(
            [
              RLPInt(chainId),
              RLPBigInt(nonce),
              RLPBigInt(gasPrice),
              RLPBigInt(gasLimit),
              RLPString(to),
              RLPBigInt(value),
              RLPBytes(data),
              RLPList(
                accessList.map((item) {
                  return RLPList(
                    [
                      RLPString(item.address),
                      RLPList(
                        item.storageKeys.map((key) => RLPString(key, isHex: true)).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Uint8List get signingTxHash => keccak256(serializedUnsigned);

  factory RawEVMTransactionType1.fromUnsignedHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix

    if (rawTxHex.startsWith("01") == false) {
      throw Exception("Invalid Type 1 Transaction");
    }

    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 8) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    return RawEVMTransactionType1.unsigned(
      chainId: rlpDecoded[0].buffer.toUInt,
      nonce: rlpDecoded[1].buffer.toUBigInt,
      gasPrice: rlpDecoded[2].buffer.toUBigInt,
      gasLimit: rlpDecoded[3].buffer.toUBigInt,
      to: "0x" + rlpDecoded[4].buffer.toHex,
      value: rlpDecoded[5].buffer.toUBigInt,
      data: rlpDecoded[6].buffer,
      accessList: switch (rlpDecoded[7]) {
        RLPList list => list.value
            .whereType<RLPList>()
            .map((item) {
              final subList = item[1];
              if (subList is RLPList)
                return (
                  address: "0x" + item[0].buffer.toHex,
                  storageKeys: subList.value.map((key) => key.buffer.toHex).toList(),
                );
              return null;
            })
            .nonNulls
            .toList(),
        _ => [],
      },
    );
  }

  factory RawEVMTransactionType1.fromHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    if (rawTxHex.startsWith("01") == false) {
      throw Exception("Invalid Type 1 Transaction");
    }
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 11) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    return RawEVMTransactionType1(
      chainId: rlpDecoded[0].buffer.toUInt,
      nonce: rlpDecoded[1].buffer.toUBigInt,
      gasPrice: rlpDecoded[2].buffer.toUBigInt,
      gasLimit: rlpDecoded[3].buffer.toUBigInt,
      to: "0x" + rlpDecoded[4].buffer.toHex,
      value: rlpDecoded[5].buffer.toUBigInt,
      data: rlpDecoded[6].buffer,
      accessList: switch (rlpDecoded[7]) {
        RLPList list => list.value
            .whereType<RLPList>()
            .map((item) {
              final subList = item[1];
              if (subList is RLPList)
                return (
                  address: "0x" + item[0].buffer.toHex,
                  storageKeys: subList.value.map((key) => key.buffer.toHex).toList(),
                );
              return null;
            })
            .nonNulls
            .toList(),
        _ => [],
      },
      signatureYParity: rlpDecoded[8].buffer.toUInt,
      signatureR: rlpDecoded[9].buffer,
      signatureS: rlpDecoded[10].buffer,
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

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 9) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    return RawEVMTransactionType2.unsigned(
      chainId: rlpDecoded[0].buffer.toUInt,
      nonce: rlpDecoded[1].buffer.toUBigInt,
      maxPriorityFeePerGas: rlpDecoded[2].buffer.toUBigInt,
      maxFeePerGas: rlpDecoded[3].buffer.toUBigInt,
      gasLimit: rlpDecoded[4].buffer.toUBigInt,
      to: "0x" + rlpDecoded[5].buffer.toHex,
      value: rlpDecoded[6].buffer.toUBigInt,
      data: rlpDecoded[7].buffer,
      accessList: switch (rlpDecoded[8]) {
        RLPList list => list.value
            .whereType<RLPList>()
            .map((item) {
              final subList = item[1];
              if (subList is RLPList)
                return (
                  address: "0x" + item[0].buffer.toHex,
                  storageKeys: subList.value.map((key) => key.buffer.toHex).toList(),
                );
              return null;
            })
            .nonNulls
            .toList(),
        _ => [],
      },
    );
  }

  factory RawEVMTransactionType2.fromHex(String rawTxHex) {
    rawTxHex = rawTxHex.replaceFirst("0x", ""); // Remove the 0x prefix
    assert(rawTxHex.startsWith("02"), "Invalid Type 1 Transaction");
    rawTxHex = rawTxHex.substring(2); // Remove the type prefix

    final rlpDecoded = decodeRLP(rawTxHex.hexToBytes).$1;

    if (rlpDecoded is! RLPList) {
      throw Exception("Error RLP decoding transaction: $rlpDecoded");
    }

    if (rlpDecoded.length < 12) {
      throw Exception("Invalid transaction, missing fields: $rlpDecoded");
    }

    return RawEVMTransactionType2(
      chainId: rlpDecoded[0].buffer.toUInt,
      nonce: rlpDecoded[1].buffer.toUBigInt,
      maxPriorityFeePerGas: rlpDecoded[2].buffer.toUBigInt,
      maxFeePerGas: rlpDecoded[3].buffer.toUBigInt,
      gasLimit: rlpDecoded[4].buffer.toUBigInt,
      to: "0x" + rlpDecoded[5].buffer.toHex,
      value: rlpDecoded[6].buffer.toUBigInt,
      data: rlpDecoded[7].buffer,
      accessList: switch (rlpDecoded[8]) {
        RLPList list => list.value
            .whereType<RLPList>()
            .map((item) {
              final subList = item[1];
              if (subList is RLPList)
                return (
                  address: "0x" + item[0].buffer.toHex,
                  storageKeys: subList.value.map((key) => key.buffer.toHex).toList(),
                );
              return null;
            })
            .nonNulls
            .toList(),
        _ => [],
      },
      signatureYParity: rlpDecoded[9].buffer.toUInt,
      signatureR: rlpDecoded[10].buffer,
      signatureS: rlpDecoded[11].buffer,
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
        signatureYParity,
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

    return Uint8List.fromList(
      [
        0x02,
        ...encodeRLP(
          RLPList(
            [
              RLPInt(chainId),
              RLPBigInt(nonce),
              RLPBigInt(maxPriorityFeePerGas),
              RLPBigInt(maxFeePerGas),
              RLPBigInt(gasLimit),
              RLPString(to),
              RLPBigInt(value),
              RLPBytes(data),
              RLPList(
                accessList.map((item) {
                  return RLPList(
                    [
                      RLPString(item.address),
                      RLPList(
                        item.storageKeys.map((key) => RLPString(key, isHex: true)).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
              RLPInt(signatureYParity),
              RLPBytes(signatureR),
              RLPBytes(signatureS),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get hasSignature =>
      signatureR.isNotEmpty &&
      signatureS.isNotEmpty &&
      (signatureYParity == 0 || signatureYParity == 1);

  Uint8List get serializedUnsigned {
    return Uint8List.fromList(
      [
        0x02,
        ...encodeRLP(
          RLPList(
            [
              RLPInt(chainId),
              RLPBigInt(nonce),
              RLPBigInt(maxPriorityFeePerGas),
              RLPBigInt(maxFeePerGas),
              RLPBigInt(gasLimit),
              RLPString(to),
              RLPBigInt(value),
              RLPBytes(data),
              RLPList(
                accessList.map((item) {
                  return RLPList(
                    [
                      RLPString(item.address),
                      RLPList(
                        item.storageKeys.map((key) => RLPString(key, isHex: true)).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Uint8List get signingTxHash => keccak256(serializedUnsigned);
}
