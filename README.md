[![TestSuite](https://img.shields.io/github/actions/workflow/status/nomo-app/walletkit-dart/dart.yml?branch=wallet_interface&style=for-the-badge&logo=testing-library&label=Test%20Suite)](https://github.com/nomo-app/walletkit-dart/actions/workflows/dart.yml)
[![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdev.nomo.app%2Fwalletkit-dart%2Fbadges%2Fcoverage.json&query=message&style=for-the-badge&logo=codecov&logoSize=24&label=Coverage&link=https%3A%2F%2Fdev.nomo.app%2Fwalletkit-dart%2Fcoverage%2F)](https://dev.nomo.app/walletkit-dart/coverage/)

# WalletKit-Dart

A powerful Dart library for interacting with multiple blockchain networks, including Bitcoin, Ethereum, Tron, ZENIQ, Polygon, Binance Smart Chain, Litecoin, Bitcoin Cash, and Eurocoin, as well as various layer 2 chains.

## Features

- **Multi-Chain Support**: Native support for both UTXO-based and EVM-based chains
- **Transaction Management**:
  - Send transactions (legacy/SegWit/P2SH/EVM)
  - Fetch transactions and balances (including xPub/zPub/ERC20)
  - Advanced smart contract call parsing for human readability
- **Wallet Features**:
  - HD-Wallet support with mnemonic phrase derivation
  - Address validation and management
  - Fee estimation
- **Performance Optimized**:
  - In-memory caching for immutable data
  - Stateless API design
- **Comprehensive Testing**:
  - Extensive unit test suite
  - CI/CD integration

## Getting Started

### Installation

Add WalletKit-Dart to your project as a Git submodule:

```bash
git submodule add https://github.com/nomo-app/walletkit-dart.git packages/walletkit-dart
```

Update your `pubspec.yaml`:

```yaml
dependencies:
  walletkit_dart:
    path: packages/walletkit-dart
```

Initialize the submodules:

```bash
git submodule update --init --recursive
```

### Requirements

- Dart SDK: ^3.7.2
- See [pubspec.yaml](pubspec.yaml) for detailed dependencies

## Architecture

WalletKit-Dart is designed to handle both UTXO-based and EVM-based chains efficiently:

### UTXO Chains
- Bitcoin and similar cryptocurrencies
- Tracks ownership through unspent transaction outputs
- Efficient for simple value transfers

### EVM Chains
- Ethereum and compatible networks
- Supports smart contracts and complex transactions
- State-based architecture

## API Design Philosophy

- **Stateless**: No storage of seed phrases or transactions
- **Memory-Efficient**: Uses in-memory caches for performance
- **Chain-Specific APIs**: Specialized interfaces for different chain architectures
- **No Broken Abstractions**: Maintains clear separation between chain types

## Backend Integration

- **UTXO Chains**: Uses the [ElectrumX Protocol](https://electrumx.readthedocs.io/en/latest/protocol-methods.html)
- **EVM Chains**: Integrates with JSON-RPC providers and Etherscan-style APIs

## Examples

Check out these example implementations:

- [Uniswap WebOn](https://github.com/nomo-app/uniswap-webon)
- [API Documentation](https://dev.nomo.app/walletkit-dart)

### Test Examples

The test suite provides practical examples for various use cases:

- [ERC20 Token Info](test/ci/evm/erc20_test.dart)
- [EVM Transaction Fetching](test/ci/evm/evm_explorer_test.dart)
- [Bitcoin Transaction Management](test/ci/fetching/assets/bitcoin_fetch_test.dart)
- [Address Validation](test/ci/sending/address_validation_test.dart)
- [Gas Fee Estimation](test/ci/gasfees_test.dart)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
