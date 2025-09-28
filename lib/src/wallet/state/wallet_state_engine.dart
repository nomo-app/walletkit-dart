import 'dart:async' show StreamController, Timer;

import 'package:walletkit_dart/walletkit_dart.dart';

// Simple, stream-driven state engine scaffolding.
// Placeholder fetchers are used to simulate RPC calls.

// --- Token-level controller ---

class TokenStateController<T extends TokenState> {
  final StreamController<T> _controller = StreamController.broadcast();
  final T Function(T current, TokenStateUpdate update) merge;
  final Duration? debounce;

  T? _last;
  TokenStateUpdate? _pending;
  Timer? _timer;

  TokenStateController({
    required this.merge,
    this.debounce,
  });

  Stream<T> get stream => _controller.stream;
  T? get current => _last;

  void set(T next) {
    _timer?.cancel();
    _pending = null;
    _last = next;
    _controller.add(next);
  }

  void update(TokenStateUpdate delta) {
    if (_last == null) return; // require initial state
    _pending = _combine(_pending, delta);
    if (debounce == null) {
      _applyPending();
      return;
    }
    _timer?.cancel();
    _timer = Timer(debounce!, _applyPending);
  }

  void _applyPending() {
    if (_pending == null || _last == null) return;
    _last = merge(_last as T, _pending!);
    _pending = null;
    _controller.add(_last as T);
  }

  static TokenStateUpdate _combine(
    TokenStateUpdate? a,
    TokenStateUpdate b,
  ) {
    return TokenStateUpdate(
      balance: b.balance ?? a?.balance,
      transactions: b.transactions ?? a?.transactions,
    );
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

// --- Account Controllers ---

abstract class AccountStateController<T extends CoinAccountState> {
  final StreamController<T> _controller = StreamController.broadcast();
  T? _last;

  Stream<T> get stream => _controller.stream;
  T? get current => _last;

  Future<void> refresh();

  void _emit(T next) {
    _last = next;
    _controller.add(next);
  }

  void dispose() {
    _controller.close();
  }
}

class EVMAccountStateController
    extends AccountStateController<EthCoinAccountState> {
  final EVMNetworkType network;
  final String address;
  final int decimals;
  final TokenStateController<EVMTokenState> _native =
      TokenStateController<EVMTokenState>(
        debounce: const Duration(milliseconds: 300),
        merge: (current, upd) => EVMTokenState(
          balance: upd.balance ?? current.balance,
          transactions:
              (upd.transactions?.whereType<EVMTransaction>().toList()) ??
                  current.transactions,
        ),
      );
  final Map<ERC20Entity, TokenStateController<EVMTokenState>> _erc20 = {};
  final StreamController<AccountEvent> _events =
      StreamController<AccountEvent>.broadcast();
  Stream<AccountEvent> get events => _events.stream;

  EVMAccountStateController({
    required this.network,
    required this.address,
    this.decimals = 18,
  });

  @override
  Future<void> refresh() async {
    final token = await fetchEvmTokenStateFn(
      network: network,
      address: address,
      decimals: decimals,
    );
    final prev = _native.current;
    if (prev != null) {
      if (prev.balance != token.balance) {
        _events.add(EvmBalanceChanged(
          address: address,
          oldBalance: prev.balance,
          newBalance: token.balance,
        ));
      }
      final added = token.transactions.length - prev.transactions.length;
      if (added != 0) {
        _events.add(EvmTransactionsUpdated(
          address: address,
          added: added,
          total: token.transactions.length,
        ));
      }
    }
    _native.set(token);
    _emit(EthCoinAccountState(coinState: token, tokenStates: const {}));
  }

  // Native TokenState
  Stream<EVMTokenState> nativeStream() => _native.stream;
  EVMTokenState? nativeState() => _native.current;

  // ERC20 TokenState
  Stream<EVMTokenState> tokenStream(ERC20Entity token) =>
      (_erc20[token] ??= TokenStateController<EVMTokenState>(
        debounce: const Duration(milliseconds: 300),
        merge: (current, upd) => EVMTokenState(
          balance: upd.balance ?? current.balance,
          transactions:
              (upd.transactions?.whereType<EVMTransaction>().toList()) ??
                  current.transactions,
        ),
      )).stream;

  EVMTokenState? tokenState(ERC20Entity token) => _erc20[token]?.current;

  Future<void> refreshToken(ERC20Entity token) async {
    final next = await fetchErc20TokenStateFn(
      network: network,
      address: address,
      token: token,
    );
    final prev = _erc20[token]?.current;
    if (prev != null && prev.balance != next.balance) {
      _events.add(EvmBalanceChanged(
        address: address,
        oldBalance: prev.balance,
        newBalance: next.balance,
        token: token,
      ));
    }
    final added = (prev == null)
        ? next.transactions.length
        : next.transactions.length - prev.transactions.length;
    if (added != 0) {
      _events.add(EvmTransactionsUpdated(
        address: address,
        added: added,
        total: next.transactions.length,
        token: token,
      ));
    }
    (_erc20[token] ??= TokenStateController<EVMTokenState>(
      debounce: const Duration(milliseconds: 300),
      merge: (current, upd) => EVMTokenState(
        balance: upd.balance ?? current.balance,
        transactions:
            (upd.transactions?.whereType<EVMTransaction>().toList()) ??
                current.transactions,
      ),
    )).set(next);
  }
}

class UTXOAccountStateController
    extends AccountStateController<UTXOCoinAccountState> {
  final UTXONetworkType network;
  final String accountXpub;
  final int decimals;
  final TokenStateController<UTXOTokenState> _native =
      TokenStateController<UTXOTokenState>(
        debounce: const Duration(milliseconds: 300),
        merge: (current, upd) => UTXOTokenState(
          balance: upd.balance ?? current.balance,
          transactions:
              (upd.transactions?.whereType<UTXOTransaction>().toList()) ??
                  current.transactions,
        ),
      );
  final StreamController<AccountEvent> _events =
      StreamController<AccountEvent>.broadcast();
  Stream<AccountEvent> get events => _events.stream;

  UTXOAccountStateController({
    required this.network,
    required this.accountXpub,
    this.decimals = 8,
  });

  @override
  Future<void> refresh() async {
    final token = await fetchUtxoTokenStateFn(
      network: network,
      accountXpub: accountXpub,
      decimals: decimals,
    );
    final prev = _native.current;
    if (prev != null) {
      if (prev.balance != token.balance) {
        _events.add(UtxoBalanceChanged(
          xpub: accountXpub,
          oldBalance: prev.balance,
          newBalance: token.balance,
        ));
      }
      final added = token.transactions.length - prev.transactions.length;
      if (added != 0) {
        _events.add(UtxoTransactionsUpdated(
          xpub: accountXpub,
          added: added,
          total: token.transactions.length,
        ));
      }
    }
    _native.set(token);
    _emit(
      UTXOCoinAccountState(
        receive: const [],
        change: const [],
        coinState: token,
      ),
    );
  }

  Stream<UTXOTokenState> nativeStream() => _native.stream;
  UTXOTokenState? nativeState() => _native.current;

  // Hooks for UTXO scanners to announce progress
  void notifyAddressesDerived({required int receive, required int change}) {
    _events.add(UtxoAddressesDerived(xpub: accountXpub, receive: receive, change: change));
  }

  void notifyUtxoFound(UTXOTransaction tx) {
    _events.add(UtxoFound(xpub: accountXpub, tx: tx));
  }
}

// --- Purpose Aggregators ---

abstract class PurposeStateAggregator<
  S extends CoinPurposeWalletState,
  A extends CoinAccountState
> {
  final List<AccountStateController<A>> accounts;
  final StreamController<S> _controller = StreamController.broadcast();
  final Map<int, A> _latest = {};

  Stream<S> get stream => _controller.stream;
  S? _last;
  S? get current => _last;

  PurposeStateAggregator(this.accounts);

  void start() {
    for (var i = 0; i < accounts.length; i++) {
      final index = i;
      accounts[i].stream.listen((state) {
        _latest[index] = state;
        final next = build(_latest);
        _last = next;
        _controller.add(next);
      });
    }
  }

  S build(Map<int, A> latest);

  void dispose() {
    _controller.close();
    for (final a in accounts) {
      a.dispose();
    }
  }
}

class EVMPurposeStateAggregator
    extends
        PurposeStateAggregator<EVMCoinPurposeWalletState, EthCoinAccountState> {
  EVMPurposeStateAggregator(super.accounts);

  @override
  EVMCoinPurposeWalletState build(Map<int, EthCoinAccountState> latest) {
    final balances =
        latest.values
            .map((s) => s.coinState.balance)
            .fold<Amount?>(null, (acc, a) => acc == null ? a : acc + a) ??
        Amount(value: BigInt.zero, decimals: 18);
    final allTxs = <EVMTransaction>[];
    for (final s in latest.values) {
      allTxs.addAll(s.coinState.transactions);
    }
    final coinState = EVMTokenState(balance: balances, transactions: allTxs);
    final active = latest.keys.toList()..sort();
    return EVMCoinPurposeWalletState(
      coinState: coinState,
      accountStates: latest,
      activeAccounts: active,
    );
  }
}

class UTXOPurposeStateAggregator
    extends
        PurposeStateAggregator<
          UTXOCoinPurposeWalletState,
          UTXOCoinAccountState
        > {
  UTXOPurposeStateAggregator(super.accounts);

  @override
  UTXOCoinPurposeWalletState build(Map<int, UTXOCoinAccountState> latest) {
    final balances =
        latest.values
            .map((s) => s.coinState.balance)
            .fold<Amount?>(null, (acc, a) => acc == null ? a : acc + a) ??
        Amount(value: BigInt.zero, decimals: 8);
    final allTxs = <UTXOTransaction>[];
    for (final s in latest.values) {
      allTxs.addAll(s.coinState.transactions);
    }
    final coinState = UTXOTokenState(balance: balances, transactions: allTxs);
    final active = latest.keys.toList()..sort();
    return UTXOCoinPurposeWalletState(
      coinState: coinState,
      accountStates: latest,
      activeAccounts: active,
    );
  }
}

// --- Coin Aggregators ---

abstract class CoinStateAggregator<
  C extends CoinWalletState,
  P extends CoinPurposeWalletState
> {
  final Map<HDWalletPurpose, PurposeStateAggregator<P, dynamic>> purposes;
  final StreamController<C> _controller = StreamController.broadcast();
  final Map<HDWalletPurpose, P> _latest = {};

  Stream<C> get stream => _controller.stream;
  C? _last;
  C? get current => _last;

  CoinStateAggregator(this.purposes);

  void start() {
    purposes.forEach((purpose, agg) {
      agg.stream.listen((state) {
        _latest[purpose] = state;
        final next = build(_latest);
        _last = next;
        _controller.add(next);
      });
    });
  }

  C build(Map<HDWalletPurpose, P> latest);

  void dispose() {
    _controller.close();
    for (final p in purposes.values) {
      p.dispose();
    }
  }
}

class EVMCoinStateAggregator
    extends CoinStateAggregator<EVMCoinWalletState, EVMCoinPurposeWalletState> {
  EVMCoinStateAggregator(super.purposes);

  @override
  EVMCoinWalletState build(
    Map<HDWalletPurpose, EVMCoinPurposeWalletState> latest,
  ) {
    final balances =
        latest.values
            .map((s) => s.coinState.balance)
            .fold<Amount?>(null, (acc, a) => acc == null ? a : acc + a) ??
        Amount(value: BigInt.zero, decimals: 18);
    final allTxs = <EVMTransaction>[];
    for (final s in latest.values) {
      allTxs.addAll(s.coinState.transactions);
    }
    final coinState = EVMTokenState(balance: balances, transactions: allTxs);
    return EVMCoinWalletState(
      coinState: coinState,
      purposeStates: latest,
      activePurposes: latest.keys.toSet(),
    );
  }
}

class UTXOCoinStateAggregator
    extends
        CoinStateAggregator<UTXOCoinWalletState, UTXOCoinPurposeWalletState> {
  UTXOCoinStateAggregator(super.purposes);

  @override
  UTXOCoinWalletState build(
    Map<HDWalletPurpose, UTXOCoinPurposeWalletState> latest,
  ) {
    final balances =
        latest.values
            .map((s) => s.coinState.balance)
            .fold<Amount?>(null, (acc, a) => acc == null ? a : acc + a) ??
        Amount(value: BigInt.zero, decimals: 8);
    final allTxs = <UTXOTransaction>[];
    for (final s in latest.values) {
      allTxs.addAll(s.coinState.transactions);
    }
    final coinState = UTXOTokenState(balance: balances, transactions: allTxs);
    return UTXOCoinWalletState(
      coinState: coinState,
      purposeStates: latest,
      activePurposes: latest.keys.toSet(),
    );
  }
}

// --- Placeholder fetchers ---

Future<EVMTokenState> fetchEvmTokenState({
  required EVMNetworkType network,
  required String address,
  int decimals = 18,
}) async {
  // TODO: Replace with actual RPC calls (eth_getBalance, logs, etc.)
  return EVMTokenState(
    balance: Amount(value: BigInt.zero, decimals: decimals),
    transactions: const <EVMTransaction>[],
  );
}

Future<EVMTokenState> fetchErc20TokenState({
  required EVMNetworkType network,
  required String address,
  required ERC20Entity token,
}) async {
  // TODO: Replace with contract calls to ERC20 balanceOf and Transfer logs
  return EVMTokenState(
    balance: Amount(value: BigInt.zero, decimals: token.decimals),
    transactions: const <EVMTransaction>[],
  );
}

Future<UTXOTokenState> fetchUtxoTokenState({
  required UTXONetworkType network,
  required String accountXpub,
  int decimals = 8,
}) async {
  // TODO: Replace with Electrum/esplora/xpub walker
  return UTXOTokenState(
    balance: Amount(value: BigInt.zero, decimals: decimals),
    transactions: const <UTXOTransaction>[],
  );
}

// Testability: allow overriding fetchers in tests/mocks
typedef EvmNativeFetcher = Future<EVMTokenState> Function({
  required EVMNetworkType network,
  required String address,
  int decimals,
});

typedef Erc20Fetcher = Future<EVMTokenState> Function({
  required EVMNetworkType network,
  required String address,
  required ERC20Entity token,
});

typedef UtxoFetcher = Future<UTXOTokenState> Function({
  required UTXONetworkType network,
  required String accountXpub,
  int decimals,
});

EvmNativeFetcher fetchEvmTokenStateFn = fetchEvmTokenState;
Erc20Fetcher fetchErc20TokenStateFn = fetchErc20TokenState;
UtxoFetcher fetchUtxoTokenStateFn = fetchUtxoTokenState;
// Update events emitted by account controllers
sealed class AccountEvent {}

final class EvmBalanceChanged extends AccountEvent {
  final String address;
  final Amount oldBalance;
  final Amount newBalance;
  final ERC20Entity? token; // null for native

  EvmBalanceChanged({
    required this.address,
    required this.oldBalance,
    required this.newBalance,
    this.token,
  });
}

final class EvmTransactionsUpdated extends AccountEvent {
  final String address;
  final int added;
  final int total;
  final ERC20Entity? token; // null for native

  EvmTransactionsUpdated({
    required this.address,
    required this.added,
    required this.total,
    this.token,
  });
}

final class UtxoBalanceChanged extends AccountEvent {
  final String xpub;
  final Amount oldBalance;
  final Amount newBalance;

  UtxoBalanceChanged({
    required this.xpub,
    required this.oldBalance,
    required this.newBalance,
  });
}

final class UtxoTransactionsUpdated extends AccountEvent {
  final String xpub;
  final int added;
  final int total;

  UtxoTransactionsUpdated({
    required this.xpub,
    required this.added,
    required this.total,
  });
}

final class UtxoAddressesDerived extends AccountEvent {
  final String xpub;
  final int receive;
  final int change;

  UtxoAddressesDerived({
    required this.xpub,
    required this.receive,
    required this.change,
  });
}

final class UtxoFound extends AccountEvent {
  final String xpub;
  final UTXOTransaction tx;

  UtxoFound({
    required this.xpub,
    required this.tx,
  });
}
