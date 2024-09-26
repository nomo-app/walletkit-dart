[![TestSuite](https://github.com/nomo-app/walletkit-dart/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/nomo-app/walletkit-dart/actions/workflows/dart.yml)
# WalletKit-Dart


WalletKit-Dart provides features for interacting with Bitcoin/Ethereum/Tron/ZENIQ/ZENIQ Smartchain/Polygon/Binance Smartchain/Litecoin/Bitcoin Cash/Eurocoin as well as several layer 2 chains.
If needed, it is easy to expand WalletKit-Dart with other chains.

See the [Uniswap WebOn](https://github.com/nomo-app/uniswap-webon) or the Unit-tests for a practical example how to use WalletKit-Dart.

See the [api-docs](https://dev.nomo.app/walletkit-dart) for a list of individual functions.

## Features

- Sending transactions, including legacy/SegWit/P2SH/EVM
- Fetching transactions and balances, including xPub/zPub/ERC20
- Advanced parsing for making smart contract calls readable for humans (EVM)
- Deriving addresses from mnemonics (HD-Wallet)
- Performance by default: Immutable data will be cached in-memory
- A large suite of Unit-tests

## Why WalletKit-Dart?

WalletKit-Dart has been inspired by the [WalletKit-C](https://github.com/blockset-corp/walletkit) from blockset-corp and by [bitcoin_flutter](https://github.com/dart-bitcoin/bitcoin_flutter) from the dart-bitcoin-project.

The WalletKit-C was one of the first WalletKits that combined UTXO-chains and EVM-chains under a unified class hierarchy.
However, the WalletKit-C was plagued by race conditions and memory corruptions.
Also, the WalletKit-C had an "object oriented architecture" that was poorly supported by the C-language.

bitcoin_flutter worked well, but bitcoin_flutter did not support modern null-safe Dart and it was difficult to expand for multiple chains.

WalletKit-Dart has been developed to solve all those problems.
WalletKit-Dart works with modern Dart-versions and is easy to expand for multiple chains.

## How to integrate

First, add this package as a Git-submodule by using Git-commands:

```
git submodule add https://github.com/nomo-app/walletkit-dart.git packages/walletkit-dart
```

Next, expand your pubspec.yaml accordingly:

```
dependencies:
    walletkit_dart:
        path: packages/walletkit-dart
```

Afterwards, clone submodules with:

```
git submodule update --init --recursive
```

The `--recursive` is important because WalletKit-Dart depends on other grandchild-submodules.

## Architecture

WalletKit-Dart is built for both _UTXO-chains_ and _EVM-chains_.
WalletKit-Dart provides a class hierarchy where both `UTXOTransaction` and `EVMTransaction` inherit from a `GenericTransaction` base class.

Here is a quick summary if you do not yet understand the difference between UTXO and EVM:

```
UTXO-based chains and EVM-based chains are two different architectures for blockchain systems.
UTXO (Unspent Transaction Output) is a concept used in Bitcoin and some other cryptocurrencies.
In this architecture, each transaction spends one or more previously unspent outputs and creates new outputs.
The sum of the inputs must be equal to or greater than the sum of the outputs.
EVM (Ethereum Virtual Machine) is used in Ethereum and some other blockchain platforms that support smart contracts.
In this architecture, each transaction is executed in the EVM as a smart contract, which can modify the state of the blockchain and create new contracts.
The state is stored in a database, rather than as a set of unspent outputs.
In summary, UTXO-based chains focus on tracking ownership of tokens, while EVM-based chains focus on executing arbitrary code in the form of smart contracts.
```

## API Philosophy

WalletKit-Dart provides a _stateless API_.
Neither does it store seed phrases, nor does it store transactions.
It is the users responsibility to store any needed data.

By design, WalletKit-Dart does not have any persistent databases.
Instead, WalletKit-Dart only has a few in-memory-caches to improve performance of repeated calls.
This design helps to simplify the API.

Moreover, WalletKit-Dart provides different APIs for UTXO-chains and EVM-chains.
Although every transaction inherits from a generic base transaction, we want to provide APIs that are specifically targeted for the architecture of a chain.
In that sense, we deviate from a traditional object oriented approach.

In other words, while we aim to reuse code between chains, we do not want to create broken abstraction layers by abstracting too much complexity away.

## Backend APIs

Depending on the chain, WalletKit-Dart depends on multiple backend APIs.
For UTXO-chains, WalletKit-Dart depends on the [ElectrumX Protocol](https://electrumx.readthedocs.io/en/latest/protocol-methods.html).

For EVM-chains, WalletKit-Dart depends on several JSON-RPC-providers as well as etherscan-styled APIs.

## The following Unit-tests show how to use WalletKit-Dart

[Get Token Info for a ERC20 Token](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/evm/erc20_test.dart)

[Fetch  EVM Transaction from Explorer](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/evm/evm_explorer_test.dart)

[Walletkit Json RPC Interface](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/evm/evm_rcp_test.dart)

[Fetch Bitcoin Transactions](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/fetching/assets/bitcoin_fetch_test.dart)

[Get best health endpoints utxo](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/fetching/endpoint_test.dart)

[EPubKey Derivation](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/fetching/epubkey_test.dart)

[Fetch UTXO Transaction](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/fetching/fetch_utxo_transactions_test.dart)

[Parse MessageHex into EVM Transaction](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/parsing/parse_hex_transaction_test.dart)

[Decode datafield from EVM Transaction](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/parsing/reverse-hash-computation_test.dart)

[Address Validation](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/sending/address_validation_test.dart)

[Estimate Fee](https://github.com/nomo-app/walletkit-dart/blob/main/test/ci/gasfees_test.dart)

[Send EVM Transaction](https://github.com/nomo-app/walletkit-dart/blob/main/test/no_ci/send_evm_test.dart)

[Fetch Peers from ElectrumX](https://github.com/nomo-app/walletkit-dart/blob/main/test/no_ci/peers_test.dart)

[Broadcast UTXO Transaction](https://github.com/nomo-app/walletkit-dart/blob/main/test/no_ci/wallet_test.dart)


protoc -I. --dart_out=grpc:/home/thomas/src/walletkit-dart/lib/src/crypto/tron/rpc core/Tron.proto core/Discover.proto core/TronInventoryItems.proto core/contract/common.proto core/contract/account_contract.proto core/contract/asset_issue_contract.proto core/contract/balance_contract.proto core/contract/exchange_contract.proto core/contract/market_contract.proto core/contract/proposal_contract.proto core/contract/shield_contract.proto core/contract/smart_contract.proto core/contract/storage_contract.proto core/contract/witness_contract.proto api/api.proto 
