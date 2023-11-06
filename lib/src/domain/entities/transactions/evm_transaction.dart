import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

abstract base class EVMTransaction extends GenericTransaction {
  @HiveField(11)
  final Uint8List input;

  (String, String, BigInt)? get nftTransferEvent {
    if (input.length != 100) {
      return null;
    }

    final functionSignature = input.sublist(0, 4).toHex;

    if (functionSignature != "23b872dd") {
      return null;
    }

    final param1 = input.sublist(4, 36).toHex.substring(24);
    final param2 = input.sublist(36, 68).toHex.substring(24);
    final param3 = input.sublist(68, 100).toHex.substring(56).toBigIntFromHex;

    return ("0x$param1", "0x$param2", param3);
  }

  List<BigInt>? get nftClaimEvent {
    if (input.length < 4) {
      return null;
    }

    final functionSignature = input.sublist(0, 4).toHex;

    if (functionSignature != "6ba4c138") {
      return null;
    }

    final field_length =
        input.sublist(4, 36).toHex.substring(56).toBigIntFromHex.toInt();

    final length =
        input.sublist(36, 68).toHex.substring(56).toBigIntFromHex.toInt();

    final tokenIds = [
      for (int i = 0; i < length; i++)
        input
            .sublist(68 + i * field_length, 68 + (i + 1) * field_length)
            .toHex
            .substring(field_length * 2 - 8)
            .toBigIntFromHex
    ];

    return tokenIds;
  }

  (int, BigInt)? get nftStakeEvent {
    if (input.length < 4) {
      return null;
    }

    final functionSignature = input.sublist(0, 4).toHex;

    if (functionSignature != "2518b8b3") {
      return null;
    }

    final years =
        input.sublist(4, 36).toHex.substring(62).toBigIntFromHex.toInt();

    final amount = input.sublist(36, 68).toHex.toBigIntFromHex;

    // final sig_field_length =
    //     input.sublist(68, 100).toHex.substring(56).toBigIntFromHex.toInt();

    // final sig_length =
    //     input.sublist(100, 132).toHex.substring(56).toBigIntFromHex.toInt();

    return (years, amount);
  }

  (String, BigInt)? get approveEvent {
    if (input.length < 4) {
      return null;
    }

    final functionSignature = input.sublist(0, 4).toHex;

    if (functionSignature != "095ea7b3") {
      return null;
    }

    final spender = input.sublist(4, 36).toHex.substring(24);
    final amount = input.sublist(36, 68).toHex.toBigIntFromHex;

    return ("0x$spender", amount);
  }

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
}
