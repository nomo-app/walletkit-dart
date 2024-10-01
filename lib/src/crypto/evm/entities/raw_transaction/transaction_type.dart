enum TransactionType {
  Legacy(0),
  Type1(1),
  Type2(2);

  final int value;

  const TransactionType(this.value);

  static TransactionType fromInt(int value) {
    return switch (value) {
      0 => TransactionType.Legacy,
      1 => TransactionType.Type1,
      2 => TransactionType.Type2,
      _ => throw Exception('Invalid TransactionType value: $value'),
    };
  }
}
