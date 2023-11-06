import 'dart:typed_data';

extension TypeChecks on Uint8List {
  bool get isHash160 => length == 20;

  bool get isHash256 => length == 32;

  bool isUint(int bits) {
    for (final byte in this) {
      if (!byte.isUint(bits)) return false;
    }
    return true;
  }
}

extension IntTypeChecks on int {
  bool isUint(int bits) => this >= 0 && this < (1 << bits);
}
