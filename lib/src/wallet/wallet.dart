import 'dart:math';
import 'dart:typed_data';

import 'package:dotenv/dotenv.dart';
import 'package:walletkit_dart/src/domain/entities/coin_entity.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class MultiHDWallet {
  final Map<String, HDWallet> wallets;

  const MultiHDWallet({required this.wallets});
}

class HDWallet {
  final Map<CoinEntity, HDAccountWallet> coinWallets;

  const HDWallet({required this.coinWallets});
}

class HDAccountWallet {
  final Map<int, HDAccount> accounts;

  const HDAccountWallet({required this.accounts});
}

class HDAccount {
  final CoinEntity coin;
  final int accountIndex;
  final Uint8List publicKey;

  const HDAccount({
    required this.coin,
    required this.accountIndex,
    required this.publicKey,
  });
}

final walletDB = EnvironmentWalletDB();

final wallet = HDWallet(
  coinWallets: {
    btcCoin: HDAccountWallet(
      accounts: {
        0: HDAccount(
          coin: btcCoin,
          accountIndex: 0,
          publicKey: walletDB.loadSeedForId('btc')!.data,
        ),
      },
    ),
    dogeCoin: HDAccountWallet(
      accounts: {
        0: HDAccount(
          coin: dogeCoin,
          accountIndex: 0,
          publicKey: walletDB.loadSeedForId('doge')!.data,
        ),
      },
    ),
  },
);

abstract class WalletDB {
  const WalletDB();

  SecureByteData loadSeedForId(String id);

  void saveSeedForId(String id);
}

final class EnvironmentWalletDB implements WalletDB {
  final _env = DotEnv(includePlatformEnvironment: true);

  EnvironmentWalletDB() {
    _env.load();
  }

  @override
  SecureByteData loadSeedForId(String id) {
    final seedString = _env[id]!.split(",");
    final intList =
        seedString
            .map((i) => int.parse(i))
            .toList(); // Convert to list of integers

    return SecureByteData(Uint8List.fromList(intList));
  }

  @override
  void saveSeedForId(String id) {
    throw UnimplementedError();
  }
}

class SecureByteData {
  final Uint8List _data;
  bool _cleared = false;

  SecureByteData(this._data);

  Uint8List get data {
    if (_cleared) throw StateError('Attempt to access cleared secure data');
    return _data;
  }

  void clear() {
    if (_cleared) return;
    // Overwrite with random data before releasing
    final random = Random.secure();
    for (var i = 0; i < _data.length; i++) {
      _data[i] = random.nextInt(256);
    }
    _cleared = true;
  }
}
