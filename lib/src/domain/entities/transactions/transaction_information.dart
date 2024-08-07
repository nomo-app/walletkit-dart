import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class TransactionInformation {
  TransactionInformation.fromMap(Map<String, dynamic> map)
      : blockHash = map['blockHash'] as String?,
        blockNumber = map['blockNumber'] != null
            ? BlockNum.exact(int.parse(map['blockNumber'] as String))
            : const BlockNum.pending(),
        from = map['from'] as String,
        gas = int.parse(map['gas'] as String),
        gasPrice = BigInt.parse(map['gasPrice'] as String),
        hash = map['hash'] as String,
        input = (map['input'] as String).hexToBytesWithPrefix,
        nonce = (map['nonce'] as String).toInt,
        to = map['to'] != null ? map['to'] as String : null,
        transactionIndex = map['transactionIndex'] != null
            ? int.parse(map['transactionIndex'] as String)
            : null,
        value = BigInt.parse(map['value'] as String),
        v = int.parse(map['v'] as String),
        r = (map['r'] as String).toBigInt,
        s = (map['s'] as String).toBigInt;

  /// The hash of the block containing this transaction. If this transaction has
  /// not been mined yet and is thus in no block, it will be `null`
  final String? blockHash;

  /// [BlockNum] of the block containing this transaction, or [BlockNum.pending]
  /// when the transaction is not part of any block yet.
  final BlockNum blockNumber;

  /// The sender of this transaction.
  final String from;

  /// How many units of gas have been used in this transaction.
  final int gas;

  /// The amount of Ether that was used to pay for one unit of gas.
  final BigInt gasPrice;

  /// A hash of this transaction, in hexadecimal representation.
  final String hash;

  /// The data sent with this transaction.
  final Uint8List input;

  /// The nonce of this transaction. A nonce is incremented per sender and
  /// transaction to make sure the same transaction can't be sent more than
  /// once.
  final int nonce;

  /// Address of the receiver. `null` when its a contract creation transaction
  final String? to;

  /// Integer of the transaction's index position in the block. `null` when it's
  /// pending.
  int? transactionIndex;

  /// The amount of Ether sent with this transaction.
  final BigInt value;

  /// A cryptographic recovery id which can be used to verify the authenticity
  /// of this transaction together with the signature [r] and [s]
  final int v;

  /// ECDSA signature r
  final BigInt r;

  /// ECDSA signature s
  final BigInt s;

  /// The ECDSA full signature used to sign this transaction.
  Signature get signature => Signature(r, s, v);
}
