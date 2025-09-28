import 'package:walletkit_dart/walletkit_dart.dart';

class HDWallet {
  final Map<NetworkType, CoinWallet> coinWallets = {};
  final HDNode masterNode;

  HDWallet({
    required Map<NetworkType, List<HDWalletPurpose>> coins,
    required this.masterNode,
  }) {
    // Default to account 0 per purpose for initialization
    init({
      for (final entry in coins.entries)
        entry.key: {
          for (final p in entry.value) p: const [0],
        },
    });
  }

  // Preferred accessor
  CoinWallet? forNetwork(NetworkType network) => coinWallets[network];

  // Back-compat: find by coin entity
  CoinWallet? forCoin(CoinEntity coin) {
    final match =
        coinWallets.entries
            .where((e) => e.key.coin == coin)
            .map((e) => e.value)
            .toList();
    return match.isNotEmpty ? match.first : null;
  }

  /// Initialize the wallet structure using the master private node.
  /// plan: Network -> Purpose -> List of account indices to materialize
  void init(Map<NetworkType, Map<HDWalletPurpose, List<int>>> plan) {
    coinWallets.clear();

    for (final entry in plan.entries) {
      final network = entry.key;
      final purposes = entry.value;

      final purposeWallets = <HDWalletPurpose, CoinPurposeWallet>{};

      for (final pEntry in purposes.entries) {
        final purpose = pEntry.key;
        final accountIndices = pEntry.value;

        final coinType = switch (network) {
          UTXONetworkType n => n.coinType,
          EVMNetworkType n => n.coinType,
        };
        final coinTypePath = Bip32HdDerivationPathCoinType(
          purpose: purpose,
          coinType: coinType,
        ); // m/purpose'/coin_type'

        // Derive coin-type root from master
        final coinRoot = masterNode.derivePath(coinTypePath.hardenedPath);

        final accounts = <CoinAccount>[];
        for (final idx in accountIndices) {
          final accountNode = coinRoot.deriveHardened(idx);

          if (network is UTXONetworkType) {
            final pubVersion = network.networkBIP.getForPurpose(purpose).keyPrefixes.public;
            accounts.add(
              UTXOCoinAccount(
                accountIndex: idx,
                node: accountNode.neutered(),
                xpub: accountNode.extendedPublicKey(version: pubVersion),
              ),
            );
          } else if (network is EVMNetworkType) {
            final addr = publicKeyToAddress(
              accountNode.derivePath('0/0').publicKeyUncompressed,
            ).toHex;
            accounts.add(
              EVMCoinAccount(
                accountIndex: idx,
                node: accountNode.neutered(),
                address: addr,
              ),
            );
          }
        }

        purposeWallets[purpose] = CoinPurposeWallet(
          purpose: purpose,
          node: coinRoot,
          accounts: accounts,
        );
      }

      coinWallets[network] = CoinWallet(
        purposeWallets: purposeWallets,
        networkType: network,
      );
    }
  }
}

class CoinWallet {
  final NetworkType networkType;
  final Map<HDWalletPurpose, CoinPurposeWallet> purposeWallets;
  const CoinWallet({required this.purposeWallets, required this.networkType});
}

class CoinPurposeWallet {
  final HDWalletPurpose purpose;
  final HDNode node;
  final List<CoinAccount> accounts;

  CoinPurposeWallet({
    required this.purpose,
    required this.node,
    required this.accounts,
  });
}

sealed class CoinAccount {
  final int accountIndex;
  final HDNode node;

  const CoinAccount({required this.accountIndex, required this.node});
}

final class EVMCoinAccount extends CoinAccount {
  final String address;

  const EVMCoinAccount({
    required super.accountIndex,
    required super.node,
    required this.address,
  });
}

final class UTXOCoinAccount extends CoinAccount {
  final String xpub;

  const UTXOCoinAccount({
    required super.accountIndex,
    required super.node,
    required this.xpub,
  });
}
