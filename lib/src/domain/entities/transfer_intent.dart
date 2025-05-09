import 'dart:convert';
import 'dart:typed_data';
import 'package:walletkit_dart/walletkit_dart.dart';

class TransferIntent<T extends FeeInformation> {
  final CoinEntity token;
  final String recipient;
  final Amount amount;

  /// If null, the fee will be calculated by the network
  final T? feeInfo;

  /// For EVM represents UTF8 Data in the input field
  /// For Tron and UTXO not implemented
  final String? memo;

  /// Is only respected for EVM Transactions
  final List<AccessListItem>? accessList;

  const TransferIntent({
    required this.recipient,
    required this.amount,
    required this.token,
    required this.memo,
    this.accessList,
    this.feeInfo,
  });

  Amount? get fee {
    if (feeInfo is EvmFeeInformation) {
      return (feeInfo as EvmFeeInformation).maxFee;
    }
    if (feeInfo is TronFeeInformation) {
      return (feeInfo as TronFeeInformation).feeLimit;
    }
    if (feeInfo is UtxoFeeInformation) {
      return (feeInfo as UtxoFeeInformation).fee;
    }
    return null;
  }

  Uint8List getErc20TransferSig() {
    return (erc20TransferSig +
            recipient.substring(2).padLeft(64, '0') +
            amount.value.toHex.padLeft(64, '0'))
        .hexToBytes;
  }

  Amount get total {
    if (token.isERC20) {
      return fee ?? Amount.zero;
    }
    return amount + (fee ?? Amount.zero);
  }

  Amount _calcTargetAmount(Amount balance, Amount fee) {
    if ((amount + fee) > balance) {
      return balance - fee;
    }
    return amount;
  }

  ///
  /// Copy the transfer intent with a new fee
  /// If [balance] is provided, the target amount will be recalculated
  ///
  TransferIntent<T> copyWithFee<T extends FeeInformation>(
    T feeInfo, {
    Amount? balance,
  }) {
    final newTargetValue = switch ((balance, feeInfo)) {
      (Amount balance, EvmFeeInformation info) when token.isERC20 == false && info.maxFee != null =>
        _calcTargetAmount(balance, info.maxFee!),
      (Amount balance, TronFeeInformation info) when token.isERC20 == false =>
        _calcTargetAmount(balance, info.feeLimit),
      _ => amount,
    };

    return TransferIntent(
      recipient: recipient,
      amount: newTargetValue,
      feeInfo: feeInfo,
      token: token,
      memo: memo,
      accessList: accessList,
    );
  }

  Json toJson() {
    return {
      'recipient': recipient,
      'amount': amount.toJson(),
      'token': token.toJson(),
      'fee': feeInfo?.toJson(),
      'memo': memo,
    };
  }

  static TransferIntent fromJson(Map json) {
    return switch (json) {
      {
        'recipient': String recipient,
        'amount': Map amount,
        'token': Map token,
        'fee': Map? fee,
        'memo': String? memo,
      } =>
        TransferIntent(
          recipient: recipient,
          amount: Amount.fromJson(amount),
          feeInfo: fee == null ? null : FeeInformation.fromJson(fee),
          token: CoinEntity.fromJson(token),
          memo: memo,
        ),
      _ => throw FormatException('Unknown TransferIntent: $json'),
    };
  }

  TransferIntent<T> copyWith({
    String? memo,
    Amount? amount,
    T? feeInfo,
  }) {
    return TransferIntent<T>(
      recipient: recipient,
      amount: amount ?? this.amount,
      feeInfo: feeInfo ?? this.feeInfo,
      token: token,
      memo: memo ?? this.memo,
    );
  }

  Uint8List? get encodedMemo {
    if (memo == null) {
      return null;
    }
    final utf = utf8.encode(memo!);

    return utf;
  }

  TransferIntent<A> convert<A extends FeeInformation>(A FeeInfo) {
    return TransferIntent<A>(
      recipient: recipient,
      amount: amount,
      feeInfo: feeInfo as A,
      token: token,
      memo: memo,
    );
  }
}
