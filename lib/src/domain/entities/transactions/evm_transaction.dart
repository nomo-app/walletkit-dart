import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

abstract base class EVMTransaction extends GenericTransaction {
  @HiveField(11)
  final Uint8List input;

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
  });

  Future<FunctionSignature?> get getFunctionSignature async {
    if (!_cachedFunctionSigs.containsKey(hash)) {
      try {
        _cachedFunctionSigs[hash] = FunctionSignature.fromData(input);
      } catch (e) {
        try {
          _cachedFunctionSigs[hash] =
              await FunctionSignature.fetchFunctionSignature(input);
        } catch (e) {
          return null;
        }
      }
    }
    return _cachedFunctionSigs[hash];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'block': block,
      'confirmations': confirmations,
      'timeMilli': timeMilli,
      'amount': amount.toJson(),
      'fee': fee.toJson(),
      'sender': sender,
      'recipient': recipient,
      'transferMethod': transferMethod.toString(),
      'status': status.toString(),
      'input': input.toHex,
    };
  }
}

Map<String, FunctionSignature> _cachedFunctionSigs = {};
