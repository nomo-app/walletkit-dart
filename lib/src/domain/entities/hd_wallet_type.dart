import 'package:hive/hive.dart';

part 'hd_wallet_type.g.dart';

const NS_PURPOSE = "m/0'";
const BIP44_PURPOSE = "m/44'";
const BIP49_PURPOSE = "m/49'";
const BIP84_PURPOSE = "m/84'";

@HiveType(typeId: 20)
enum HDWalletType {
  @HiveField(0)
  NO_STRUCTURE(NS_PURPOSE), // (P2PKH)

  @HiveField(1)
  BIP44(BIP44_PURPOSE), // (P2PKH)

  @HiveField(2)
  BIP44_LITECOIN("m/44'/2'/0'"), // (P2PKH WK Litecoin)

  @HiveField(3)
  BIP49(BIP49_PURPOSE), // (P2SH)

  @HiveField(4)
  BIP84(BIP84_PURPOSE); // (P2WPKH)

  final String purpose;

  const HDWalletType(this.purpose);
}
