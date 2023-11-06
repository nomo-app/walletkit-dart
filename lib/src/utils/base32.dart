import 'dart:typed_data';

class Base32 {
  static const CHARSET = 'qpzry9x8gf2tvdw0s3jn54khce6mua7l';

  static final Map<String, int> CHARSET_INVERSE_INDEX = {
    'q': 0,
    'p': 1,
    'z': 2,
    'r': 3,
    'y': 4,
    '9': 5,
    'x': 6,
    '8': 7,
    'g': 8,
    'f': 9,
    '2': 10,
    't': 11,
    'v': 12,
    'd': 13,
    'w': 14,
    '0': 15,
    's': 16,
    '3': 17,
    'j': 18,
    'n': 19,
    '5': 20,
    '4': 21,
    'k': 22,
    'h': 23,
    'c': 24,
    'e': 25,
    '6': 26,
    'm': 27,
    'u': 28,
    'a': 29,
    '7': 30,
    'l': 31,
  };

  /// Encodes the given list of 5-bit integers as a base32-encoded string.
  String encode(Uint8List data) {
    String base32 = '';
    for (var i = 0; i < data.length; ++i) {
      var value = data[i];
      if (value < 0 || value >= 32) {
        throw FormatException('Invalid value: $value.');
      }
      base32 += CHARSET[value];
    }
    return base32;
  }

  /// Decodes the given base32-encoded string into a list of 5-bit integers.
  Uint8List decode(String string) {
    final data = Uint8List(string.length);
    for (var i = 0; i < string.length; ++i) {
      var value = string[i];
      if (!CHARSET_INVERSE_INDEX.containsKey(value)) {
        throw FormatException('Invalid value: $value.');
      }
      data[i] = CHARSET_INVERSE_INDEX[value]!;
    }
    return data;
  }
}
