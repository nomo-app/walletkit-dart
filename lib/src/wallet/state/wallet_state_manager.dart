import 'dart:collection';

import 'package:walletkit_dart/walletkit_dart.dart';

class _AccountKey {
  final NetworkType network;
  final HDWalletPurpose purpose;
  final int index;
  const _AccountKey(this.network, this.purpose, this.index);

  @override
  bool operator ==(Object other) =>
      other is _AccountKey &&
      identical(other.network, network) &&
      other.purpose == purpose &&
      other.index == index;

  @override
  int get hashCode => Object.hash(network, purpose, index);
}

class _PurposeKey {
  final NetworkType network;
  final HDWalletPurpose purpose;
  const _PurposeKey(this.network, this.purpose);

  @override
  bool operator ==(Object other) =>
      other is _PurposeKey &&
      identical(other.network, network) &&
      other.purpose == purpose;

  @override
  int get hashCode => Object.hash(network, purpose);
}

class WalletStateManager {
  final HDWallet wallet;

  final Map<_AccountKey, AccountStateController> _accounts = HashMap();
  final Map<_PurposeKey, PurposeStateAggregator> _purposes = HashMap();
  final Map<NetworkType, CoinStateAggregator> _coins = HashMap();

  WalletStateManager(this.wallet) {
    _buildControllers();
    _buildAggregators();
  }

  // --- Public API ---

  // Account-level
  Stream<CoinAccountState> accountStream(
    NetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) => _accountKey(
    network,
    purpose,
    accountIndex,
  ).let((k) => _accounts[k]!.stream);

  CoinAccountState? accountState(
    NetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) => _accountKey(
    network,
    purpose,
    accountIndex,
  ).let((k) => _accounts[k]?.current);

  // ERC20 token-level (within an EVM account)
  Stream<EVMTokenState> erc20TokenStream(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
    ERC20Entity token,
  ) => _evmController(network, purpose, accountIndex).tokenStream(token);

  EVMTokenState? erc20TokenState(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
    ERC20Entity token,
  ) => _evmController(network, purpose, accountIndex).tokenState(token);

  Future<void> refreshErc20Token(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
    ERC20Entity token,
  ) => _evmController(network, purpose, accountIndex).refreshToken(token);

  // Native TokenState per account
  Stream<TokenState> nativeTokenStream(
    NetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) {
    final key = _accountKey(network, purpose, accountIndex);
    final ctrl = _accounts[key];
    if (ctrl is EVMAccountStateController) {
      return ctrl.nativeStream().map((e) => e as TokenState);
    }
    if (ctrl is UTXOAccountStateController) {
      return ctrl.nativeStream().map((e) => e as TokenState);
    }
    throw StateError('Unsupported account for nativeTokenStream');
  }

  TokenState? nativeTokenState(
    NetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) {
    final key = _accountKey(network, purpose, accountIndex);
    final ctrl = _accounts[key];
    if (ctrl is EVMAccountStateController) {
      return ctrl.nativeState();
    }
    if (ctrl is UTXOAccountStateController) {
      return ctrl.nativeState();
    }
    return null;
  }

  // Typed native variants
  Stream<EVMTokenState> nativeEvmTokenStream(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) => _evmController(network, purpose, accountIndex).nativeStream();

  EVMTokenState? nativeEvmTokenState(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) => _evmController(network, purpose, accountIndex).nativeState();

  Stream<UTXOTokenState> nativeUtxoTokenStream(
    UTXONetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) {
    final key = _accountKey(network, purpose, accountIndex);
    final ctrl = _accounts[key];
    if (ctrl is! UTXOAccountStateController) {
      throw StateError('No UTXO account controller found for $network $purpose $accountIndex');
    }
    return ctrl.nativeStream();
  }

  UTXOTokenState? nativeUtxoTokenState(
    UTXONetworkType network,
    HDWalletPurpose purpose,
    int accountIndex,
  ) {
    final key = _accountKey(network, purpose, accountIndex);
    final ctrl = _accounts[key];
    if (ctrl is UTXOAccountStateController) return ctrl.nativeState();
    return null;
  }

  // Purpose-level
  Stream<CoinPurposeWalletState> purposeStream(
    NetworkType network,
    HDWalletPurpose purpose,
  ) => _purposes[_purposeKey(network, purpose)]!.stream;

  CoinPurposeWalletState? purposeState(
    NetworkType network,
    HDWalletPurpose purpose,
  ) => _purposes[_purposeKey(network, purpose)]?.current;

  // Coin-level
  Stream<CoinWalletState> coinStream(NetworkType network) =>
      _coins[network]!.stream;

  CoinWalletState? coinState(NetworkType network) => _coins[network]?.current;

  Future<void> refreshAll() async {
    for (final c in _accounts.values) {
      await c.refresh();
    }
  }

  // --- Builders ---

  void _buildControllers() {
    wallet.coinWallets.forEach((network, coinWallet) {
      coinWallet.purposeWallets.forEach((purpose, pw) {
        for (final acc in pw.accounts) {
          final key = _accountKey(network, purpose, acc.accountIndex);
          if (_accounts.containsKey(key)) continue; // de-dup

          switch (network) {
            case UTXONetworkType n when acc is UTXOCoinAccount:
              _accounts[key] = UTXOAccountStateController(
                network: n,
                accountXpub: acc.xpub,
                decimals: n.coin.decimals,
              );
              break;
            case EVMNetworkType n when acc is EVMCoinAccount:
              final addr = toChecksumAddress('0x${acc.address}');
              _accounts[key] = EVMAccountStateController(
                network: n,
                address: addr,
                decimals: n.coin.decimals,
              );
              break;
            default:
              // Unsupported combination; skip
              break;
          }
        }
      });
    });
  }

  void _buildAggregators() {
    // Build purpose-level aggregators
    wallet.coinWallets.forEach((network, coinWallet) {
      coinWallet.purposeWallets.forEach((purpose, pw) {
        final accControllers = <AccountStateController>[];
        for (final acc in pw.accounts) {
          final key = _accountKey(network, purpose, acc.accountIndex);
          final ctrl = _accounts[key];
          if (ctrl != null) accControllers.add(ctrl);
        }

        final pKey = _purposeKey(network, purpose);
        if (network is UTXONetworkType) {
          final agg = UTXOPurposeStateAggregator(
            accControllers.cast<UTXOAccountStateController>(),
          );
          agg.start();
          _purposes[pKey] = agg;
        } else if (network is EVMNetworkType) {
          final agg = EVMPurposeStateAggregator(
            accControllers.cast<EVMAccountStateController>(),
          );
          agg.start();
          _purposes[pKey] = agg;
        }
      });
    });

    // Build coin-level aggregators
    wallet.coinWallets.forEach((network, coinWallet) {
      final map = <HDWalletPurpose, PurposeStateAggregator>{};
      for (final entry in coinWallet.purposeWallets.entries) {
        final pKey = _purposeKey(network, entry.key);
        final agg = _purposes[pKey];
        if (agg != null) map[entry.key] = agg;
      }
      if (network is UTXONetworkType) {
        final cAgg = UTXOCoinStateAggregator(
          map.cast<HDWalletPurpose, UTXOPurposeStateAggregator>(),
        );
        cAgg.start();
        _coins[network] = cAgg;
      } else if (network is EVMNetworkType) {
        final cAgg = EVMCoinStateAggregator(
          map.cast<HDWalletPurpose, EVMPurposeStateAggregator>(),
        );
        cAgg.start();
        _coins[network] = cAgg;
      }
    });
  }

  

  EVMAccountStateController _evmController(
    EVMNetworkType network,
    HDWalletPurpose purpose,
    int index,
  ) {
    final key = _accountKey(network, purpose, index);
    final ctrl = _accounts[key];
    if (ctrl is! EVMAccountStateController) {
      throw StateError('No EVM account controller found for $network $purpose $index');
    }
    return ctrl;
  }

  _AccountKey _accountKey(NetworkType n, HDWalletPurpose p, int i) =>
      _AccountKey(n, p, i);
  _PurposeKey _purposeKey(NetworkType n, HDWalletPurpose p) =>
      _PurposeKey(n, p);
}

extension _LetExt<T> on T {
  R let<R>(R Function(T it) block) => block(this);
}
