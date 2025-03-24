enum HDWalletPurpose {
  NO_STRUCTURE("m/0'"),
  BIP44("m/44'"),
  BIP49("m/49'"),
  BIP84("m/84'"),
  BIP86("m/86'");

  final String string;

  const HDWalletPurpose(this.string);

  static HDWalletPurpose fromString(String purpose) =>
      HDWalletPurpose.values.firstWhere((item) => item.string == purpose);
}

const noStructurePath = HdDerivationPath(purpose: HDWalletPurpose.NO_STRUCTURE);

const tronBip44HDPath = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP44,
  coinType: 195,
);

const tronBip44HDPathAccountZero = Bip32HdDerivationPathAccount(
  purpose: HDWalletPurpose.BIP44,
  coinType: 195,
  account: 0,
);

const ethereumBip44HDPath = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP44,
  coinType: 44,
);

const bitcoinBip44Path = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP44,
  coinType: 0,
);
const bitcoinBip44PathAccountZero = Bip32HdDerivationPathAccount(
  purpose: HDWalletPurpose.BIP44,
  coinType: 0,
  account: 0,
);
const bitcoinBip49Path = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP49,
  coinType: 0,
);
const bitcoinBip49PathAccountZero = Bip32HdDerivationPathAccount(
  purpose: HDWalletPurpose.BIP49,
  coinType: 0,
  account: 0,
);
const bitcoinBip84Path = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP84,
  coinType: 0,
);
const bitcoinBip84PathAccountZero = Bip32HdDerivationPathAccount(
  purpose: HDWalletPurpose.BIP84,
  coinType: 0,
  account: 0,
);
const bitcoinBip86Path = Bip32HdDerivationPathCoinType(
  purpose: HDWalletPurpose.BIP86,
  coinType: 0,
);
const bitcoinBip86PathAccountZero = Bip32HdDerivationPathAccount(
  purpose: HDWalletPurpose.BIP86,
  coinType: 0,
  account: 0,
);

final class HdDerivationPath {
  final HDWalletPurpose purpose;

  const HdDerivationPath({required this.purpose});

  /// m / purpose'
  String get hardenedPath => purpose.string;

  factory HdDerivationPath.fromString(String path) {
    final regex = new RegExp(r"^(m\/)?(\d+'?\/)*\d+'?$");
    if (!regex.hasMatch(path)) {
      throw ArgumentError("Expected BIP32 Path");
    }

    final split = path.split("/");

    if (split.isEmpty) {
      throw ArgumentError("Expected BIP32 Path with atleast 1 level");
    }

    final purpose = HDWalletPurpose.fromString(split.first);

    return switch (split) {
      [String _] => HdDerivationPath(purpose: purpose),
      [String _, String coinType] => Bip32HdDerivationPathCoinType(
        purpose: purpose,
        coinType: int.parse(coinType.replaceAll("'", "")),
      ),
      [String _, String coinType, String account, ...] =>
        Bip32HdDerivationPathAccount(
          purpose: purpose,
          coinType: int.parse(coinType.replaceAll("'", "")),
          account: int.parse(account.replaceAll("'", "")),
        ),
      _ => throw ArgumentError("Invalid Path"),
    };
  }

  HdDerivationPathWithPublic withChangeAndIndex(int change, int index) {
    return HdDerivationPathWithPublic(
      hardenedPath: this,
      change: change,
      index: index,
    );
  }
}

final class Bip32HdDerivationPathCoinType extends HdDerivationPath {
  final int coinType;

  const Bip32HdDerivationPathCoinType({
    required super.purpose,
    required this.coinType,
  });

  /// m / purpose' / coin_type'
  String get hardenedPath => "${purpose.string}/$coinType'";
}

final class Bip32HdDerivationPathAccount extends Bip32HdDerivationPathCoinType {
  final int account;

  const Bip32HdDerivationPathAccount({
    required super.purpose,
    required super.coinType,
    required this.account,
  });

  /// m / purpose' / coin_type' / account'
  String get hardenedPath => "${purpose.string}/$coinType'/$account'";
}

final class HdDerivationPathWithPublic {
  final HdDerivationPath hardenedPath;
  final int change;
  final int index;

  const HdDerivationPathWithPublic({
    required this.hardenedPath,
    required this.change,
    required this.index,
  });

  factory HdDerivationPathWithPublic.fromString(String path) {
    final regex = new RegExp(r"^(m\/)?(\d+'?\/)*\d+'?$");
    if (!regex.hasMatch(path)) {
      throw ArgumentError("Expected BIP32 Path");
    }

    final split = path.split("/");

    if (split.length < 5) {
      throw ArgumentError("Expected a BIP32 Path with atleast 5 levels");
    }

    final change = int.parse(split[3]);
    final index = int.parse(split[4]);

    return HdDerivationPathWithPublic(
      hardenedPath: HdDerivationPath.fromString(path),
      change: change,
      index: index,
    );
  }

  /// m / purpose' / coin_type' / account' / change / address_index
  String get derivationPath {
    return "${hardenedPath.hardenedPath}/$change/$index";
  }

  HdDerivationPathWithPublic withIndex(int index) {
    return HdDerivationPathWithPublic(
      change: this.change,
      hardenedPath: this.hardenedPath,
      index: index,
    );
  }

  HdDerivationPathWithPublic withChange(int change) {
    return HdDerivationPathWithPublic(
      change: change,
      hardenedPath: this.hardenedPath,
      index: this.index,
    );
  }
}
