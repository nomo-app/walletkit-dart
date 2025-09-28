import 'dart:math';
import 'dart:typed_data';

import 'package:dotenv/dotenv.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

// Seed/key storage abstraction
abstract class WalletDB {
  const WalletDB();

  SecureByteData loadSeedForId(String id);

  void saveSeedForId(String id);
}

// Simple environment-backed implementation for local dev only
final walletDB = EnvironmentWalletDB();

final class EnvironmentWalletDB implements WalletDB {
  final _env = DotEnv(includePlatformEnvironment: true);

  EnvironmentWalletDB() {
    _env.load();
  }

  @override
  SecureByteData loadSeedForId(String id) {
    final raw = _env[id];
    if (raw == null || raw.isEmpty) {
      throw StateError('Missing seed for id: $id');
    }
    final seedString = raw.split(',');
    final intList = seedString.map((i) => int.parse(i)).toList();
    return SecureByteData(Uint8List.fromList(intList));
  }

  @override
  void saveSeedForId(String id) {
    throw UnimplementedError('Persisting seeds is not supported in .env DB');
  }
}

// Secure byte container with explicit clear
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
    final random = Random.secure();
    for (var i = 0; i < _data.length; i++) {
      _data[i] = random.nextInt(256);
    }
    _cleared = true;
  }
}

// Transaction and metadata storage abstraction
abstract class TransactionDB {
  Future<void> storeTransaction(NetworkType network, GenericTransaction tx);
  Future<List<GenericTransaction>> fetchTransactions(
    NetworkType network,
    String address,
  );
}

// Placeholder for a very secure DB. Replace with platform-secure storage.
final transactionDB = VerySecureTransactionDB();

class VerySecureTransactionDB implements TransactionDB {
  // In-memory fallback; do not use in production. Replace with secure storage.
  final Map<String, List<GenericTransaction>> _byAddress = {};

  @override
  Future<void> storeTransaction(NetworkType network, GenericTransaction tx) async {
    final sKey = '${network.coin.symbol}:${tx.sender}';
    final rKey = '${network.coin.symbol}:${tx.recipient}';
    _byAddress.putIfAbsent(sKey, () => <GenericTransaction>[]).add(tx);
    if (rKey != sKey) {
      _byAddress.putIfAbsent(rKey, () => <GenericTransaction>[]).add(tx);
    }
  }

  @override
  Future<List<GenericTransaction>> fetchTransactions(
    NetworkType network,
    String address,
  ) async {
    return _byAddress['${network.coin.symbol}:$address'] ?? const [];
  }
}
