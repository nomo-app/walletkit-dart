import 'dart:typed_data';

const _alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

final _base = BigInt.from(_alphabet.length);

String base58encode(Uint8List inputBuffer) {
  BigInt inputNumber =
      inputBuffer.fold(BigInt.zero, (a, b) => (a << 8) | BigInt.from(b));
  StringBuffer encodedOutput = StringBuffer();

  while (inputNumber >= _base) {
    int remainder = (inputNumber % _base).toInt();
    inputNumber = inputNumber ~/ _base;
    encodedOutput.write(_alphabet[remainder]);
  }

  if (inputNumber > BigInt.zero) {
    encodedOutput.write(_alphabet[inputNumber.toInt()]);
  }

  for (int i = 0; i < inputBuffer.length && inputBuffer[i] == 0; i++) {
    encodedOutput.write(_alphabet[0]);
  }

  return encodedOutput.toString().split('').reversed.join('');
}

Uint8List base58decode(String input) {
  BigInt decoded = BigInt.zero;
  for (int i = 0; i < input.length; i++) {
    decoded = decoded * _base + BigInt.from(_alphabet.indexOf(input[i]));
  }

  int byteCount = (decoded.bitLength + 7) >> 3;
  Uint8List decodedBytes = Uint8List(byteCount);

  for (int i = byteCount - 1; i >= 0; i--) {
    decodedBytes[i] = (decoded & BigInt.from(0xff)).toInt();
    decoded >>= 8;
  }

  return decodedBytes;
}
