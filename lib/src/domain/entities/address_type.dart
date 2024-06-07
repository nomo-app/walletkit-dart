import 'package:hive/hive.dart';

part 'address_type.g.dart';

@HiveType(typeId: 19)
enum AddressType {
  @HiveField(0)
  legacy,
  @HiveField(1)
  segwit,
  @HiveField(2)
  taproot,
  @HiveField(3)
  compatibility,
  @HiveField(4)
  cashaddr,
  @HiveField(5)
  evm,
  @HiveField(6)
  tron;

  static AddressType fromIndex(int index) {
    return AddressType.values[index];
  }
}
