enum AddressType {
  legacy,
  segwit,
  taproot,
  compatibility,
  cashaddr,
  evm,
  tron;

  static AddressType fromIndex(int index) {
    return AddressType.values[index];
  }
}
