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

  Amount.num({
    required num value,
    required this.decimals,
  }) : value = BigInt.from(value * pow(10, decimals));

  Amount.zero()
      : value = -1.toBI,
        decimals = 0;

  static Amount get empty => Amount(value: BigInt.from(0), decimals: 0);

  double get displayValue {
    return value / BigInt.from(10).pow(decimals);
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
    return 'Amount{value: $value, decimals: $decimals}: $displayValue';
  }
}
