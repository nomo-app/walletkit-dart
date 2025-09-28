# WalletKit-Dart — Wallet Module Overview (Current Implementation)

This report summarizes what is implemented today across the wallet module and the adjacent crypto/domain layers it depends on. It is intended as a quick orientation for contributors wiring the state engine, HD derivations, and network integrations.

## Scope
- Focuses on `lib/src/wallet` (structure, states, state engine/manager, env-backed DB).
- Notes adjacent modules that power the wallet: EVM, UTXO, Tron, domain entities, and utils.

## Wallet Module
- Structure and derivations
  - `HDWallet` builds a network → purpose → account object graph from a master `HDNode` seed (defaulting to account 0 per purpose) using SLIP-44 coin types per network (lib/src/wallet/wallet_structure.dart:1).
  - UTXO accounts store neutered nodes and `xpub` with correct version per BIP purpose; EVM accounts derive an `address` from `m/…/0/0` (lib/src/wallet/wallet_structure.dart:1).
- State model
  - Purpose and coin-level state aggregates account state, typed by chain family:
    - `EVMCoinAccountState` and `UTXOCoinAccountState` with `EVMTokenState` and `UTXOTokenState` balances/transactions (lib/src/wallet/wallet_states.dart:1).
  - Token-level updates flow through `TokenStateController<T>` with debounced merging of partial updates (lib/src/wallet/state/wallet_state_engine.dart:1).
- Controllers and aggregators
  - `EVMAccountStateController` and `UTXOAccountStateController` expose `stream`/`current`, `refresh()`, and emit granular `AccountEvent`s (balance/tx changes; UTXO address derivations and found UTXOs) (lib/src/wallet/state/wallet_state_engine.dart:1).
  - `EVMPurposeStateAggregator`/`UTXOPurposeStateAggregator` and `EVMCoinStateAggregator`/`UTXOCoinStateAggregator` combine account states up to purpose and coin views (lib/src/wallet/state/wallet_state_engine.dart:260).
- Public API surface
  - `WalletStateManager` wires controllers/aggregators from an `HDWallet` and provides:
    - Account streams/state, native token streams/state, ERC‑20 per-account streams/state, and purpose/coin level streams/state (lib/src/wallet/state/wallet_state_manager.dart:1).
    - `refreshAll()` to trigger fetchers on all accounts.
- Fetchers (placeholders, testable)
  - `fetchEvmTokenState`, `fetchErc20TokenState`, `fetchUtxoTokenState` return zero-balance/empty transactions; function typedefs allow override in tests/mocks (lib/src/wallet/state/wallet_state_engine.dart:560).
- Wallet DB (local dev only)
  - `EnvironmentWalletDB` reads seeds from `.env` keys as comma-separated byte lists and wraps them in `SecureByteData` with explicit `clear()` (lib/src/wallet/wallet_db.dart:1).

## Adjacent Modules (Used by Wallet)
- EVM (lib/src/crypto/evm/evm.dart:1)
  - JSON‑RPC client and Etherscan-compatible explorer; ABI/function utilities; raw tx parsing and ECDSA/EIP‑1559 signing; common ERC20/721/1155 and ENS contracts.
- UTXO (lib/src/crypto/utxo/utxo.dart:1)
  - Raw transaction building, coin selection helpers, proof‑of‑payment, script/types, and electrum JSON‑RPC client.
- Tron (lib/src/crypto/tron/tron.dart:1)
  - HTTP and gRPC‑generated RPC stubs, address and parameter encoding, basic transaction utilities.
- Domain & Utils
  - Core data types: `CoinEntity`, `Amount`, `GenericTransaction`, `Node`, `TokenInfo`, `TransferIntent`, `Fee` (lib/src/domain/entities/coin_entity.dart:1).
  - Network descriptors: `NetworkType` (EVM & UTXO), BIP prefixes, sighash, endpoints (lib/src/crypto/network_type.dart:1).
  - Crypto/utilities: BIP32/39, hashing (keccak/sha), base58/32, DER, varuint, buffers, JSON, address validation.

## Exports and Public API
- Central exports are consolidated in `lib/walletkit_dart.dart` including EVM/UTXO/Tron, wallet types, entities, utils, and constants (lib/walletkit_dart.dart:1).
- The wallet barrel file exports structure, states, DB, and state engine/manager; includes a minimal `main()` demo using `DEV_SEED` (lib/src/wallet/wallet.dart:1).

## Examples
- Minimal CLI scaffolding under `example/` for future commands; currently includes `help` and `exit` with a REPL loop (example/wkdart.dart:1).

## Tests (High-Level Coverage)
- BIP‑39 vectors and BIP‑32 derivation fixtures; derivation path helpers; address derivation (test/ci/bip39/bip39_test.dart:1, test/ci/bip32/bip32-dart_test.dart:1).
- UTXO: script hash, serialization, coin selection, raw tx building, proof‑of‑payment, endpoint/rpc helpers, asset fetch flows (Bitcoin, Litecoin, BCH, Doge, Eurocoin) (test/ci/fetching/assets/bitcoin_fetch_test.dart:1).
- EVM: RLP, raw tx parsing, signing, ERC‑20 metadata/balance, ENS, function selector and ABI encoding/decoding, Etherscan explorer and RPC (test/ci/evm/erc20_test.dart:1).
- Tron: account fetch, parameter encoding, send simulation (test/ci/tron/fetch_account_test.dart:1).
- Wallet state: mocked tests for sync and EVM RPC interactions (test/ci-mocked/wallet_state_sync_test.dart:1).

## Current State Summary
- HD structure and derivation paths are implemented for EVM and UTXO, including correct xpub versions per BIP purpose.
- Stream-driven state controllers and aggregators are in place, with typed TokenState models for each chain family.
- Fetchers are placeholders, designed for override/mocking; no built‑in polling/scheduling yet.
- Environment-backed seed loading is present for local dev; transaction storage is an in‑memory placeholder.

## Gaps and Next Steps
- Replace placeholder fetchers with real backends:
  - EVM: JSON‑RPC for `eth_getBalance`, logs for transfers; integrate pagination and confirmations.
  - ERC‑20: contract calls to `balanceOf` and Transfer logs; indexer/explorer fallback where available.
  - UTXO: Electrum/esplora xpub scanning (receive/change), gap‑limit strategy, mempool polling.
- Add optional polling/scheduling keyed to `NetworkType.blockTime`; auto start/stop via stream subscriptions.
- Persist lightweight snapshots (balances, last-seen heights) and secure transaction storage.
- Expand example CLI: derive addresses, show balances, trigger refresh, and print events.

## Quick Usage Snippet
- Build wallet, then wire state manager and refresh:
  - Construct `HDWallet` with network→purposes map and a master `HDNode` (lib/src/wallet/wallet.dart:1).
  - Create `WalletStateManager(wallet)` and consume account/purpose/coin streams; call `refreshAll()` to fetch initial data (lib/src/wallet/state/wallet_state_manager.dart:1).

---
Generated by repo scan for quick contributor onboarding. Update as APIs evolve.
