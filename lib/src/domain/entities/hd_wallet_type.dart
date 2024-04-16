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

enum HDWalletPurpose {
  NO_STRUCTURE("m/0'"), // (P2PKH)
  BIP44("m/44'"), // (P2PKH)
  BIP49("m/49'"), // (P2SH)
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

sealed class HDWalletPath {
  final HDWalletPurpose purpose;
  final String coinType;

  const HDWalletPath(this.purpose, this.coinType);

  String get basePath {
    return "$purpose/$coinType";
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

  factory HDWalletPath.fromString(String path) {
    final parts = path.split("/");
    if (parts.length < 2) {
      throw ArgumentError("Invalid path: $path");
    }
    final purpose = HDWalletPurpose.fromString(parts[0]);
    final coinType = parts[1];
    return switch (purpose) {
      HDWalletPurpose.NO_STRUCTURE => NSHDWalletPath(coinType),
      HDWalletPurpose.BIP44 => Bip44HDWalletPath(coinType),
      HDWalletPurpose.BIP49 => Bip49HDWalletPath(coinType),
      HDWalletPurpose.BIP84 => Bip84HDWalletPath(coinType),
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
