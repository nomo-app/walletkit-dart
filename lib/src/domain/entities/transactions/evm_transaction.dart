import 'dart:convert';
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

  String? get uTF8Input {
    try {
      return utf8.decode(input);
    } catch (e) {
      return null;
    }
  }

  // Future<FunctionSignatureWithArgs?> get getFunctionSignature async {
  //   if (!_cachedFunctionSigs.containsKey(hash)) {
  //     try {
  //       _cachedFunctionSigs[hash] = FunctionSignatureWithArgs.fromData(input);
  //     } catch (e) {
  //       try {
  //         _cachedFunctionSigs[hash] =
  //             await FunctionSignatureWithArgs.fetchFunctionSignature(input);
  //       } catch (e) {
  //         return null;
  //       }
  //     }
  //   }
  //   return _cachedFunctionSigs[hash];
  // }

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
      'transferMethod': transferMethod.toString(),
      'status': status.toString(),
      'input': input.toHex,
    };
  }
}

// Map<String, FunctionSignatureWithArgs> _cachedFunctionSigs = {};
