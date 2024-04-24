import 'dart:math';

extension SatoshiUtils on num {
  BigInt get toSatoshi {
    return BigInt.from(this * 100000000);
  }

  BigInt get toBI {
    return BigInt.from(this);
  }

  bool isUint(int bit) {
    return (this >= 0 && this <= pow(2, bit) - 1);
  }
}

extension SatoshiUtilsNullable on num? {
  BigInt? get toBI {
    if (this == null) {
      return null;
    }
    return BigInt.from(this!);
  }
}
