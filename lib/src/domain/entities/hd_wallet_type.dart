import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

part 'hd_wallet_type.g.dart';

const NS_PURPOSE = "m/0'";
const BIP44_PURPOSE = "m/44'";
const BIP49_PURPOSE = "m/49'";
const BIP84_PURPOSE = "m/84'";

// @HiveType(typeId: 20)
// enum HDWalletType {
//   @HiveField(0)
//   NO_STRUCTURE(NS_PURPOSE), // (P2PKH)

//   @HiveField(1)
//   BIP44(BIP44_PURPOSE), // (P2PKH)

//   @HiveField(2)
//   BIP44_LITECOIN("m/44'/2'/0'"), // (P2PKH WK Litecoin)

//   @HiveField(3)
//   BIP49(BIP49_PURPOSE), // (P2SH)

//   @HiveField(4)
//   BIP84(BIP84_PURPOSE); // (P2WPKH)

//   final String purpose;
//   //final String coinType;

//   const HDWalletType(this.purpose);
// }

@HiveType(typeId: 20)
enum HDWalletPurpose {
  @HiveField(0)
  NO_STRUCTURE("m/0'"), // (P2PKH)
  @HiveField(1)
  BIP44("m/44'"), // (P2PKH)
  @HiveField(2)
  BIP49("m/49'"), // (P2SH)
  @HiveField(3)
  BIP84("m/84'"); // (P2WPKH)

  final String string;

  const HDWalletPurpose(this.string);

  static HDWalletPurpose fromString(String purpose) {
    switch (purpose) {
      case "m/0'":
        return NO_STRUCTURE;
      case "m/44'":
        return BIP44;
      case "m/49'":
        return BIP49;
      case "m/84'":
        return BIP84;
      default:
        throw ArgumentError("Invalid purpose: $purpose");
    }
  }
}

final supportedPaths = [
  bitcoinNSHDPath,
  bitcoinBip44HDPath,
  bitcoinBip49HDPath,
  bitcoinBip84HDPath,
  tronBip44HDPath,
  litecoinBip44HDPath,
  ethereumBip44HDPath,
];

sealed class HDWalletPath {
  final HDWalletPurpose purpose;
  final String coinType;

  const HDWalletPath(this.purpose, this.coinType);

  static HDWalletPath? fromBasePath(String basePath) {
    return supportedPaths.singleWhereOrNull(
      (hdPath) => hdPath.basePath == basePath,
    );
  }

  String get basePath {
    return "${purpose.string}/$coinType";
  }

  String get account0Path {
    return "$basePath/0'";
  }

  String get defaultPath {
    return getPath(0, 0, 0);
  }

  String getWithAccount(int account) {
    return "$basePath/$account'";
  }

  String getPath(int account, int change, int index) {
    return "$basePath/$account'/$change/$index";
  }

  factory HDWalletPath.fromPurpose(HDWalletPurpose purpose) {
    return switch (purpose) {
      HDWalletPurpose.NO_STRUCTURE => NSHDWalletPath(''),
      HDWalletPurpose.BIP44 => Bip44HDWalletPath(''),
      HDWalletPurpose.BIP49 => Bip49HDWalletPath(''),
      HDWalletPurpose.BIP84 => Bip84HDWalletPath(''),
    };
  }
}

final class NSHDWalletPath extends HDWalletPath {
  final String coinType;

  const NSHDWalletPath(this.coinType)
      : super(HDWalletPurpose.NO_STRUCTURE, coinType);
}

final class Bip44HDWalletPath extends HDWalletPath {
  final String coinType;

  const Bip44HDWalletPath(this.coinType)
      : super(HDWalletPurpose.BIP44, coinType);
}

final class Bip49HDWalletPath extends HDWalletPath {
  final String coinType;

  const Bip49HDWalletPath(this.coinType)
      : super(HDWalletPurpose.BIP49, coinType);
}

final class Bip84HDWalletPath extends HDWalletPath {
  final String coinType;

  const Bip84HDWalletPath(this.coinType)
      : super(HDWalletPurpose.BIP84, coinType);
}

///
/// No Structure HD Wallet Paths
///
const bitcoinNSHDPath = BitcoinNSHDPath();

final class BitcoinNSHDPath extends NSHDWalletPath {
  const BitcoinNSHDPath() : super("0'");
}

///
/// BIP44 HD Wallet Paths
///

const bitcoinBip44HDPath = BitcoinBip44HDPath();

final class BitcoinBip44HDPath extends Bip44HDWalletPath {
  const BitcoinBip44HDPath() : super("0'");
}

const tronBip44HDPath = TronBip44HDPath();

final class TronBip44HDPath extends Bip44HDWalletPath {
  const TronBip44HDPath() : super("195'");
}

const litecoinBip44HDPath = LitecoinBip44HDPath();

final class LitecoinBip44HDPath extends Bip44HDWalletPath {
  const LitecoinBip44HDPath() : super("2'");
}

const ethereumBip44HDPath = EthereumBip44HDPath();

final class EthereumBip44HDPath extends Bip44HDWalletPath {
  const EthereumBip44HDPath() : super("60'");
}

///
/// BIP49 HD Wallet Paths
///

const bitcoinBip49HDPath = BitcoinBip49HDPath();

final class BitcoinBip49HDPath extends Bip49HDWalletPath {
  const BitcoinBip49HDPath() : super("0'");
}

///
/// BIP84 HD Wallet Paths
///

const bitcoinBip84HDPath = BitcoinBip84HDPath();

final class BitcoinBip84HDPath extends Bip84HDWalletPath {
  const BitcoinBip84HDPath() : super("0'");
}
