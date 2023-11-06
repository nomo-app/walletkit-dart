import 'package:walletkit_dart/walletkit_dart.dart';

final Map<TokenEntity, UtxoInMemoryCache> _utxoCaches = {};

UtxoInMemoryCache getUtxoInMemoryCache(TokenEntity coin) {
  if (_utxoCaches[coin] == null) {
    _utxoCaches[coin] = UtxoInMemoryCache();
  }
  return _utxoCaches[coin]!;
}

class UtxoInMemoryCache {
  final Map<String, UTXOTransaction> _txCache = {};

  UTXOTransaction? getTx({required String txHash}) {
    return _txCache[txHash.toLowerCase()];
  }

  void insertTxIfConfirmed(UTXOTransaction tx) {
    if (tx.isPending) {
      return;
    }
    if (tx.confirmations <= 0) {
      return;
    }
    _txCache[tx.hash.toLowerCase()] = tx;
  }
}
