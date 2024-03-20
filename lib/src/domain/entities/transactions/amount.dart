import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

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

  /// Converts the given value to the smallest unit of the currency
  Amount.convert({
    required num value,
    required this.decimals,
  }) : value = BigInt.from(value * pow(10, decimals));

  /// Converts the given value to a BigInt
  /// This is useful when the value is already in the smallest unit of the currency
  Amount.from({
    required num value,
    required this.decimals,
  }) : value = BigInt.from(value);

  static Amount get zero => Amount(value: BigInt.from(0), decimals: 0);

  double get displayDouble {
    return value / BigInt.from(10).pow(decimals);
  }

  String get displayValue {
    final firstBI = value ~/ BigInt.from(10).pow(decimals);

    final secondBI = value % BigInt.from(10).pow(decimals);

    final string = '$firstBI.${secondBI.toString().padLeft(decimals, '0')}';

    final lastNonZeroIndex = string.lastIndexOf(RegExp(r'[^0]'));

    if (lastNonZeroIndex == -1) return string;

    return string.substring(0, lastNonZeroIndex < 3 ? 3 : lastNonZeroIndex + 1);
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

  Amount operator +(Amount other) {
    return Amount(
      value: value + other.value,
      decimals: decimals,
    );
  }

  Amount operator -(Amount other) {
    return Amount(
      value: value - other.value,
      decimals: decimals,
    );
  }

  Amount operator /(Amount other) {
    if (decimals == other.decimals) {
      return Amount(
        value: value ~/ other.value,
        decimals: decimals,
      );
    }
    final precision = max(decimals, other.decimals);

    if (decimals > other.decimals) {
      final newOther = other.convertToDecimals(decimals);
      final shiftedA = value * BigInt.from(10).pow(precision);
      final shiftedResult = shiftedA ~/ newOther.value;
      return Amount(
        value: shiftedResult,
        decimals: decimals,
      );
    }

    final newThis = convertToDecimals(other.decimals);
    final shiftedA = newThis.value * BigInt.from(10).pow(precision);
    final shiftedResult = shiftedA ~/ other.value;
    return Amount(
      value: shiftedResult,
      decimals: other.decimals,
    );
  }

  bool operator >(Amount other) {
    return value > other.value;
  }

  bool operator <(Amount other) {
    return value < other.value;
  }
}
