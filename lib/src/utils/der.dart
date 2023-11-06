import 'dart:typed_data';

final zero = Uint8List.fromList([0]);

Uint8List encodeSignature(Uint8List signature, int hashType) {
  // check if hashType is  uint8
  if (hashType < 0 || hashType > 255) {
    throw ArgumentError('Invalid hashType $hashType');
  }
  if (signature.length != 64) throw ArgumentError("Invalid signature");
  // final hashTypeMod = hashType & ~0x80;
  // if (hashTypeMod <= 0 || hashTypeMod >= 4) {
  //   throw ArgumentError('Invalid hashType $hashType');
  // }

  final r = toDER(signature.sublist(0, 32));
  final s = toDER(signature.sublist(32, 64));

  final encoded = bip66encode(r, s);

  return Uint8List.fromList([...encoded, hashType]);
}

Uint8List bip66encode(Uint8List r, Uint8List s) {
  var lenR = r.length;
  var lenS = s.length;
  if (lenR == 0) throw ArgumentError('R length is zero');
  if (lenS == 0) throw ArgumentError('S length is zero');
  if (lenR > 33) throw ArgumentError('R length is too long');
  if (lenS > 33) throw ArgumentError('S length is too long');
  if (r[0] & 0x80 != 0) throw ArgumentError('R value is negative');
  if (s[0] & 0x80 != 0) throw ArgumentError('S value is negative');
  if (lenR > 1 && (r[0] == 0x00) && r[1] & 0x80 == 0) {
    throw ArgumentError('R value excessively padded');
  }
  if (lenS > 1 && (s[0] == 0x00) && s[1] & 0x80 == 0) {
    throw ArgumentError('S value excessively padded');
  }

  var signature = Uint8List(6 + lenR + lenS);

  // 0x30 [total-length] 0x02 [R-length] [R] 0x02 [S-length] [S]
  signature[0] = 0x30;
  signature[1] = signature.length - 2;
  signature[2] = 0x02;
  signature[3] = r.length;
  signature.setRange(4, 4 + lenR, r);
  signature[4 + lenR] = 0x02;
  signature[5 + lenR] = s.length;
  signature.setRange(6 + lenR, 6 + lenR + lenS, s);
  return signature;
}

Uint8List toDER(Uint8List x) {
  var i = 0;
  while (x[i] == 0) {
    ++i;
  }
  if (i == x.length) return zero;
  x = x.sublist(i);
  List<int> combine = List.from(zero);
  combine.addAll(x);
  if (x[0] & 0x80 != 0) return Uint8List.fromList(combine);
  return x;
}
