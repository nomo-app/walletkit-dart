# Wallet Module — Structure, Goals, Current State

This document describes the wallet architecture: how we structure keys and accounts (HD paths), how we represent runtime state, and how to observe updates via streams and events. The design aims to be deterministic, composable, and easy to integrate into Flutter state management.

## Objectives
- Separate wallet structure from runtime state
- Model the BIP HD path hierarchy directly in the object graph
- Keep network/purpose/account boundaries explicit and type-safe
- Provide stream-first updates for easy UI integration

## Files
- `wallet_structure.dart` — structural types and derivation from master seed
- `wallet_states.dart` — state containers (token/account/purpose/coin)
- `state/wallet_state_engine.dart` — controllers, aggregators, and events
- `state/wallet_state_manager.dart` — builds streams from `HDWallet`
- `wallet_db.dart` — DB abstractions (dev `.env` implementation)
- `wallet.dart` — barrel exporting the wallet module

## HD Path Fundamentals
The standard BIP path layout we follow is:
- `m / purpose' / coin_type' / account' / change / address_index`
  - `purpose'` — BIP purpose: 44', 49', 84', 86' (or a custom NO_STRUCTURE)
  - `coin_type'` — SLIP-44 coin type (e.g., BTC=0, ETH=60, TRON=195)
  - `account'` — Account number (hardened). We start with 0'.
  - `change` — 0 = external/receive, 1 = internal/change
  - `address_index` — Sequential index within a chain

See `lib/src/wallet/bip32/hd_wallet_type.dart` for helpers that encode these concepts:
- `HdDerivationPath` → `m / purpose'`
- `Bip32HdDerivationPathCoinType` → `m / purpose' / coin_type'`
- `Bip32HdDerivationPathAccount` → `m / purpose' / coin_type' / account'`
- `HdDerivationPathWithPublic` → full path including `change` and `index`

## Structure (Object Graph)
- `HDWallet` — root wallet for a master seed
  - `Map<NetworkType, CoinWallet> coinWallets`
- `CoinWallet` — per-network view (e.g., Bitcoin, Ethereum)
  - `Map<HDWalletPurpose, CoinPurposeWallet> purposeWallets`
- `CoinPurposeWallet` — a single BIP purpose for a network
  - `HDNode node` anchored at the hardened path for the purpose/coin/account
  - `List<CoinAccount> accounts` (hardened account indexes)
- `CoinAccount` — an account at `... / account'`
  - UTXO: tracks receive/change chains and derived addresses
  - EVM: single account address plus ERC-20 balances

This mirrors the HD tree: NetworkType → Purpose → Account → Change → Index.

## State Layer (Balances & Transactions)
The structural layer is paired with a state layer that is transport/storage-agnostic:
- `TokenState` — balance + transaction list
  - `EVMTokenState`, `UTXOTokenState`
- `CoinAccountState` — per-account state
  - `EthCoinAccountState` with `tokenStates` by `ERC20Entity`
  - `UTXOCoinAccountState` with `receive`/`change` `NodeWithAddress` lists
- `CoinPurposeWalletState` — aggregates account states per purpose
- `CoinWalletState` — aggregates per-purpose states per network

These types let you compute totals, active selections, and drive UI without coupling to RPC providers.

## State Access and Streams
The library provides a lightweight, stream-driven state engine and a simple manager to access current state and listen to changes at different levels:

- Token-level
  - `TokenStateController<T extends TokenState>` exposes `stream` and `current` for a single token.
  - EVM accounts have one native token controller and separate controllers per ERC-20.
- Account-level
  - `EVMAccountStateController` and `UTXOAccountStateController` expose `stream` and `current` for `EthCoinAccountState` and `UTXOCoinAccountState`.
  - `refresh()` fetches placeholders for balance/transactions and emits.
- Aggregation
  - Purpose: `EVMPurposeStateAggregator` / `UTXOPurposeStateAggregator` combine multiple accounts into a `CoinPurposeWalletState`.
  - Coin: `EVMCoinStateAggregator` / `UTXOCoinStateAggregator` combine purposes into a `CoinWalletState`.

Use `WalletStateManager` to wire everything from your `HDWallet` structure and access streams/state:

```dart
final manager = WalletStateManager(wallet);

// Account level
final accStream = manager.accountStream(BitcoinNetwork, HDWalletPurpose.BIP84, 0);
final accState = manager.accountState(BitcoinNetwork, HDWalletPurpose.BIP84, 0);

// Purpose level
final pStream = manager.purposeStream(BitcoinNetwork, HDWalletPurpose.BIP84);
final pState = manager.purposeState(BitcoinNetwork, HDWalletPurpose.BIP84);

// Coin level
final cStream = manager.coinStream(EthereumNetwork);
final cState = manager.coinState(EthereumNetwork);

// ERC-20 per-account token level (TokenState-level stream)
final token = ERC20Entity(
  name: 'USDC', symbol: 'USDC', decimals: 6, chainID: 1, contractAddress: '0xA0b86991...'
);
final tStream = manager.erc20TokenStream(EthereumNetwork, HDWalletPurpose.BIP44, 0, token);
final tState = manager.erc20TokenState(EthereumNetwork, HDWalletPurpose.BIP44, 0, token);
await manager.refreshErc20Token(EthereumNetwork, HDWalletPurpose.BIP44, 0, token);

// Native token per-account (TokenState-level stream)
final nativeStream = manager.nativeTokenStream(EthereumNetwork, HDWalletPurpose.BIP44, 0);
final nativeState = manager.nativeTokenState(EthereumNetwork, HDWalletPurpose.BIP44, 0);

// Typed variants for native tokens
final evmNativeStream = manager.nativeEvmTokenStream(EthereumNetwork, HDWalletPurpose.BIP44, 0);
final evmNativeState = manager.nativeEvmTokenState(EthereumNetwork, HDWalletPurpose.BIP44, 0);
final utxoNativeStream = manager.nativeUtxoTokenStream(BitcoinNetwork, HDWalletPurpose.BIP84, 0);
final utxoNativeState = manager.nativeUtxoTokenState(BitcoinNetwork, HDWalletPurpose.BIP84, 0);
```

Notes:
- Streams are broadcast and lightweight. Only account controllers should perform network work; aggregators just recompute totals.
- Placeholder fetchers return zero balances/empty transactions; wire your RPCs to `fetchEvmTokenState`, `fetchErc20TokenState`, and `fetchUtxoTokenState`.
- In Flutter, use `StreamProvider`/`autoDispose` to start/stop work when views mount/unmount.

### Events
- EVM: `EvmBalanceChanged`, `EvmTransactionsUpdated`
- UTXO: `UtxoBalanceChanged`, `UtxoTransactionsUpdated`, `UtxoAddressesDerived`, `UtxoFound`
- Listen on `EVMAccountStateController.events` or `UTXOAccountStateController.events` to react to granular changes.

## How We Mimic HD Paths in Code
1. Seed → Master node
   - `final master = HDNode.fromSeed(seedBytes);`
2. Choose network and BIP purpose
   - Drive by `NetworkType` and `HDWalletPurpose` (44'/49'/84'/86')
3. Build the hardened path with helpers
   - `final path = Bip32HdDerivationPathAccount(purpose: HDWalletPurpose.BIP84, coinType: 0, account: 0);`
   - Hardened part: `path.hardenedPath` → `m/84'/0'/0'`
4. Add public subpath for chains and indexes when deriving addresses
   - `final withPub = path.withChangeAndIndex(0, 0); // receive, index 0`
   - Full path: `withPub.derivationPath` → `m/84'/0'/0'/0/0`
5. Derive from the master node
   - `final accountNode = master.derivePath(path.hardenedPath);`
   - For UTXO accounts, derive `…/0/i` (receive) and `…/1/i` (change) as needed

These steps are encoded in `wallet_structure.dart` by creating `CoinPurposeWallet` roots at the hardened account level and then deriving chains/indexes for addresses as required.

## Example (Bitcoin, BIP84, Account 0)
```dart
final master = HDNode.fromSeed(seed);
final purpose = HDWalletPurpose.BIP84; // m/84'
final coinType = 0;                    // BTC
final acct = Bip32HdDerivationPathAccount(
  purpose: purpose,
  coinType: coinType,
  account: 0,
);

final accountNode = master.derivePath(acct.hardenedPath); // m/84'/0'/0'
// First receive address at m/84'/0'/0'/0/0
final firstReceive = accountNode.derivePath('0/0');
```

## Environment & Secrets
- For local development, seeds are read from environment variables via `.env`.
- `EnvironmentWalletDB` loads by key (e.g., `REJECT_SEED`) and returns a `SecureByteData`.
- Never log or commit seed material; call `clear()` on `SecureByteData` after use.

## Current State
- Structure and derivations are in place for UTXO/EVM with correct `coinType` per network.
- Streams and aggregators work with on-demand refresh (no polling configured yet).
- Events are emitted on balance/transaction changes; UTXO scanning hooks are exposed.
- Fetchers are placeholders and overrideable for tests.

## Roadmap
- Plug in real fetchers (EVM RPC, ERC-20, Electrum/Esplora xpub scan).
- Add optional polling/scheduling keyed to `NetworkType.blockTime` with auto start/stop.
- Persist lightweight state snapshots for faster reloads.
