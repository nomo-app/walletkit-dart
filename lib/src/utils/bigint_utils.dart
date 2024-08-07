BigInt parseAsHexBigInt(String str) {
  if (str.isEmpty) return BigInt.zero;

  BigInt result = str.startsWith("0x")
      ? BigInt.parse(str.substring(2), radix: 16)
      : BigInt.parse(str, radix: 16);

  return result;
}
