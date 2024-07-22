import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/utils/int.dart';

part 'amount.g.dart';

@HiveType(typeId: 12)
class Amount extends Equatable {
  @HiveField(0)
  final BigInt value;
  @HiveField(1)
  final int decimals;

  const Amount({
    required this.value,
    required this.decimals,
  });

  Amount convertTo(int newDecimals) {
    return Amount(value: value, decimals: newDecimals);
  }

  /// Converts the given value to the smallest unit of the currency
  factory Amount.convert({
    required num value,
    required int decimals,
  }) {
    var value_s = value.toString();

    final parts = value_s.split('.');

    var dec = parts.length == 1 ? 0 : parts[1].length;

    if (dec > decimals) {
      value_s = value_s.substring(0, value_s.length - (dec - decimals));
      dec = decimals;
    }

    var value_int = BigInt.tryParse(value_s.replaceAll('.', ''));

    if (value_int == null) {
      throw Exception('Invalid value: $value');
    }

    value_int = value_int * BigInt.from(10).pow(decimals.toInt() - dec);

    return Amount(
      value: value_int,
      decimals: decimals,
    );
  }

  /// Converts the given value to a BigInt
  /// This is useful when the value is already in the smallest unit of the currency
  Amount.from({
    required int value,
    required this.decimals,
  }) : value = BigInt.from(value);

  static Amount get zero => Amount(value: BigInt.from(0), decimals: 0);

  static Amount get negativeOne => Amount(value: BigInt.from(-1), decimals: 0);

  double get displayDouble {
    return value / BigInt.from(10).pow(decimals);
  }

  String get displayValue {
    final firstBI = value ~/ BigInt.from(10).pow(decimals);

    final secondBI = value % BigInt.from(10).pow(decimals);

    final string = '$firstBI.${secondBI.toString().padLeft(decimals, '0')}';

    final lastNonZeroIndex = string.lastIndexOf(RegExp(r'[^0]'));

    if (lastNonZeroIndex == -1) return string;

    final formatted =
        string.substring(0, lastNonZeroIndex < 3 ? 3 : lastNonZeroIndex + 1);

    if (formatted.endsWith('.')) {
      return formatted.substring(0, formatted.length - 1);
    }

    return formatted;
  }

  Amount copyWith({
    BigInt? value,
    int? decimals,
  }) {
    if (value == null && decimals == null) return this;

    return Amount(
      value: value ?? this.value,
      decimals: decimals ?? this.decimals,
    );
  }

  bool isOther(Amount other) {
    return value == other.value && decimals == other.decimals;
  }

  @override
  List<Object?> get props => [value, decimals];

  @override
  String toString() {
    return 'Amount{value: $value, decimals: $decimals}: $displayDouble';
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value.toString(),
      'decimals': decimals,
    };
  }

  Amount convertToDecimals(int newDecimals) {
    if (newDecimals == decimals) return this;

    final newAmount = value * BigInt.from(10).pow(newDecimals - decimals);

    return Amount(
      value: newAmount,
      decimals: newDecimals,
    );
  }

  /// Operators
  Amount operator *(Amount other) {
    return Amount(
      value: value * other.value,
      decimals: decimals + other.decimals,
    );
  }

  // Plus operator
  Amount operator +(Amount other) {
    // Determine the maximum decimals between the two amounts
    int maxDecimals = max(decimals, other.decimals);

    // Scale both amounts to the same decimal level
    BigInt scaledThisValue =
        value * BigInt.from(pow(10, maxDecimals - decimals));
    BigInt scaledOtherValue =
        other.value * BigInt.from(pow(10, maxDecimals - other.decimals));

    // Perform the addition
    BigInt resultValue = scaledThisValue + scaledOtherValue;

    return Amount(
      value: resultValue,
      decimals: maxDecimals,
    );
  }

  // Minus operator
  Amount operator -(Amount other) {
    // Determine the maximum decimals between the two amounts
    int maxDecimals = max(decimals, other.decimals);

    // Scale both amounts to the same decimal level
    BigInt scaledThisValue =
        value * BigInt.from(pow(10, maxDecimals - decimals));
    BigInt scaledOtherValue =
        other.value * BigInt.from(pow(10, maxDecimals - other.decimals));

    // Perform the subtraction
    BigInt resultValue = scaledThisValue - scaledOtherValue;

    return Amount(
      value: resultValue,
      decimals: maxDecimals,
    );
  }

  // Division operator
  Amount operator /(Amount other) {
    if (other.value == BigInt.zero) {
      throw ArgumentError('Cannot divide by zero.');
    }

    // Determine the maximum decimals between the two amounts
    int maxDecimals = max(decimals, other.decimals);

    // Scale both amounts to the same decimal level
    BigInt scaledThisValue =
        value * BigInt.from(pow(10, maxDecimals - decimals));
    BigInt scaledOtherValue =
        other.value * BigInt.from(pow(10, maxDecimals - other.decimals));

    // Perform the division
    BigInt resultValue =
        (scaledThisValue * BigInt.from(pow(10, maxDecimals))) ~/
            scaledOtherValue;

    return Amount(
      value: resultValue,
      decimals: maxDecimals,
    );
  }

  bool operator >(Amount other) {
    return value > other.value;
  }

  bool operator <(Amount other) {
    return value < other.value;
  }

  Amount multiplyAndCeil(double multiplier) {
    final result = value.toInt() * multiplier;
    final result_int = result.ceil().toBI;

    return Amount(value: result_int, decimals: decimals);
  }
}

extension AmountUtil on int {
  Amount get asAmount {
    return Amount.from(value: this, decimals: 0);
  }

  Amount toAmount(int decimals) {
    return Amount.from(value: this, decimals: decimals);
  }
}

extension AmountUtilDouble on double {
  int get decimals {
    final parts = toString().split('.');

    return parts.length == 1 ? 0 : parts[1].length;
  }

  // operator *(Amount other) {
}

extension AmountUtilBigInt on BigInt {
  BigInt multiply(double other) {
    final _other = shiftLeftBigInt(other, other.decimals);
    final result = this * _other;

    return discardRightBigInt(
      result,
      other.decimals,
    );
  }

  BigInt shiftLeft(int decimalPlaces) =>
      this * BigInt.from(pow(10, decimalPlaces));

  BigInt shiftRight(int decimalPlaces) =>
      this ~/ BigInt.from(pow(10, decimalPlaces));
}

BigInt shiftLeftBigInt(num num1, int decimalPlaces) =>
    BigInt.from(num1 * pow(10, decimalPlaces));

BigInt discardRightBigInt(BigInt num1, int decimalPlaces) =>
    num1 ~/ BigInt.from(pow(10, decimalPlaces));

double shiftRightBigInt(BigInt num1, int decimalPlaces) =>
    num1.toInt() / pow(10, decimalPlaces);
