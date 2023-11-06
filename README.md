# WalletKit-Dart

WalletKit-Dart provides features for interacting with Bitcoin/Ethereum/ZENIQ/ZENIQ Smartchain/Binance Smartchain/Litecoin/Bitcoin Cash.
If needed, it is easy to expand WalletKit-Dart with other chains.

## Features

- Sending transactions, including legacy/Segwit/P2SH/EVM
- Fetching transactions and balances, including xPub/zPub/ERC20
- Functions on Smart Contracts (EVM)
- Deriving addresses from mnemonics (HD-Wallet)
- A large suite of Unit-tests

## Why WalletKit-Dart?

WalletKit-Dart has been inspired by the [C-WalletKit](https://github.com/blockset-corp/walletkit) from blockset-corp and by [bitcoin_flutter](https://github.com/dart-bitcoin/bitcoin_flutter) from the dart-bitcoin-project.

The C-WalletKit was one of the first WalletKits that combined UTXO-chains and EVM-chains under a unified class-hierarchy.
However, the C-WalletKit was plagued by race conditions and memory corruptions, and the C-language did not provide a good support for object-oriented programming.

bitcoin_flutter worked reasonably well, but bitcoin_flutter did not support modern null-safe Dart and it was difficult to expand for multiple chains.

WalletKit-Dart has been developed to solve all those problems.
WalletKit-Dart works with modern Dart-versions and provides a class-hierarchy that is easy to expand for multiple chains.

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

For UTXO-chains, most of the functionality is implemented by WalletKit-Dart itself.
For EVM-chains, most of the functionality is implemented by https://pub.dev/packages/web3dart.

WalletKit-Dart provides a class-hierarchy where both `UTXOTransaction` and `EVMTransaction` inherit from a `GenericTransaction` base class.

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
Although every chain is part of a unified class hierarchy, we want to provide APIs that are specifically targeted for the architecture of a chain.

In other words, while we aim to reuse code between chains, we do not want to create broken abstraction layers by abstracting too much complexity away.

## Backend APIs

Depending on the chain, WalletKit-Dart depends on multiple backend APIs.
For UTXO-chains, WalletKit-Dart depends on the [ElectrumX Protocol](https://electrumx.readthedocs.io/en/latest/protocol-methods.html).

For EVM-chains, WalletKit-Dart depends on several JSON-RPC-providers as well as etherscan-styled APIs.
