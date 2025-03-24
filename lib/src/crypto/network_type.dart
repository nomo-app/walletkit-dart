// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:collection/collection.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

sealed class NetworkType {
  final String messagePrefix;
  final CoinEntity coin;

  /// Block time in seconds
  final int blockTime;

  const NetworkType({
    required this.messagePrefix,
    required this.coin,
    required this.blockTime,
  });
}

sealed class EVMNetworkType extends NetworkType {
  final int chainId;
  final bool useEIP1559;

  const EVMNetworkType({
    required super.messagePrefix,
    required super.coin,
    required super.blockTime,
    required this.chainId,
    this.useEIP1559 = true,
  });
}

sealed class UTXONetworkType extends NetworkType {
  /// Bech32 address prefix
  final String bech32;

  final NetworkBIP networkBIP;

  /// BIP32 pubkey hash prefix
  final int pubKeyHashPrefix;

  /// BIP32 script hash prefix
  final int scriptHashPrefix;

  final int coinType;

  final int txVersion;

  final Iterable<(String, int)> endpoints;

  final Map<AddressType, String> addressPrefixes;

  final SighashInfo sighash;

  final ({int legacy, int segwit}) dustTreshhold;

  const UTXONetworkType({
    required super.messagePrefix,
    required super.coin,
    required super.blockTime,
    required this.networkBIP,
    required this.pubKeyHashPrefix,
    required this.scriptHashPrefix,
    required this.coinType,
    required this.bech32,
    required this.txVersion,
    required this.endpoints,
    required this.sighash,
    required this.addressPrefixes,
    required this.dustTreshhold,
  });

  @override
  String toString() {
    return "UTXONetworkType: ${coin.symbol}";
  }
}

typedef BIP32Prefixes = ({int private, int public});

class NetworkNodeInfo {
  final int wif;
  final BIP32Prefixes keyPrefixes;

  const NetworkNodeInfo({required this.wif, required this.keyPrefixes});
}

class NetworkBIP {
  final int wif;

  final BIP32Prefixes bip32;
  final BIP32Prefixes bip49;
  final BIP32Prefixes bip84;
  final BIP32Prefixes bip49MultiSig;
  final BIP32Prefixes bip84MultiSig;
  final BIP32Prefixes bip86;
  final BIP32Prefixes bip86MultiSig;

  static const String NS_PURPOSE = "m/0'";
  static const String BIP44_PURPOSE = "m/44'";
  static const String BIP49_PURPOSE = "m/49'";
  static const String BIP84_PURPOSE = "m/84'";

  static List<NetworkBIP> defaults = [
    BITCOIN_NETWORK_BIP,
    LTC_NETWORK_BIP,
    DOGECOIN_NETWORK_BIP,
  ];

  static NetworkNodeInfo? findPrefixesFromVersion(int version) {
    return defaults
        .map((e) {
          final prefixes = e.fromVersion(version);
          if (prefixes != null) {
            return NetworkNodeInfo(wif: e.wif, keyPrefixes: prefixes);
          }
          return null;
        })
        .nonNulls
        .firstOrNull;
  }

  NetworkNodeInfo getForPurpose(HDWalletPurpose purpose) => switch (purpose) {
    HDWalletPurpose.NO_STRUCTURE ||
    HDWalletPurpose.BIP44 => NetworkNodeInfo(wif: wif, keyPrefixes: bip32),
    HDWalletPurpose.BIP49 => NetworkNodeInfo(wif: wif, keyPrefixes: bip49),
    HDWalletPurpose.BIP84 => NetworkNodeInfo(wif: wif, keyPrefixes: bip84),
    HDWalletPurpose.BIP86 => NetworkNodeInfo(wif: wif, keyPrefixes: bip86),
  };

  const NetworkBIP({
    required this.bip32,
    required this.bip49,
    required this.bip84,
    required this.bip49MultiSig,
    required this.bip84MultiSig,
    required this.bip86,
    required this.bip86MultiSig,
    required this.wif,
  });

  BIP32Prefixes? fromVersion(int version) {
    if (version == bip32.private || version == bip32.public) {
      return bip32;
    }
    if (version == bip49.private || version == bip49.public) {
      return bip49;
    }
    if (version == bip84.private || version == bip84.public) {
      return bip84;
    }
    if (version == bip49MultiSig.private || version == bip49MultiSig.public) {
      return bip49MultiSig;
    }
    if (version == bip84MultiSig.private || version == bip84MultiSig.public) {
      return bip84MultiSig;
    }
    return null;
  }

  // bip32.NetworkType getForWalletType(HDWalletPurpose purpose) =>
  //     switch (purpose) {
  //       HDWalletPurpose.NO_STRUCTURE ||
  //       HDWalletPurpose.BIP44 =>
  //         bip32.NetworkType(
  //           wif: wif,
  //           bip32: bip32.Bip32Type(
  //             private: bip32PrivPrefix,
  //             public: bip32PubPrefix,
  //           ),
  //         ),
  //       HDWalletPurpose.BIP84 => bip32.NetworkType(
  //           wif: wif,
  //           bip32: bip32.Bip32Type(
  //             private: bip84PrivPrefix,
  //             public: bip84PubPrefix,
  //           ),
  //         ),
  //       HDWalletPurpose.BIP49 => bip32.NetworkType(
  //           wif: wif,
  //           bip32: bip32.Bip32Type(
  //             private: bip49PrivPrefix,
  //             public: bip49PubPrefix,
  //           ),
  //         ),
  //     };
}

class SighashInfo {
  final int all;
  final int none;
  final int single;
  final int allAnyoneCanPay;
  final int noneAnyoneCanPay;
  final int singleAnyoneCanPay;

  const SighashInfo({
    required this.all,
    required this.none,
    required this.single,
    required this.allAnyoneCanPay,
    required this.noneAnyoneCanPay,
    required this.singleAnyoneCanPay,
  });
}

///
/// UTXO Networks
///
const UTXO_Network_List = [
  BitcoinNetwork,
  LitecoinNetwork,
  BitcoincashNetwork,
  ZeniqNetwork,
  EurocoinNetwork,
];

const BTC_DUSTTRESHOLD = (legacy: 546, segwit: 294);

const NO_DUSTTRESHOLD = (legacy: 0, segwit: 0);

const DOGE_DUSTTRESHOLD = (legacy: 100000000, segwit: 100000000);

const BitcoinNetwork = BITCOIN_NETWORK();

class BITCOIN_NETWORK extends UTXONetworkType {
  const BITCOIN_NETWORK()
    : super(
        messagePrefix: '\x18Bitcoin Signed Message:\n',
        bech32: 'bc',
        networkBIP: BITCOIN_NETWORK_BIP,
        pubKeyHashPrefix: 0x00,
        scriptHashPrefix: 0x05,
        coinType: 0,
        txVersion: 1,
        sighash: BITCOIN_SIGHASH_INFO,
        endpoints: const {
          ("bitcoin.lu.ke", 50001),
          ("node1.btccuracao.com", 50001),
          ("elx.bitske.com", 50001),
          ("electrum.bitaroo.net", 50001),
          ("104.248.139.211", 50001),
          ("alviss.coinjoined.com", 50001),
          ("api.ordimint.com", 50001),
          ("167.172.42.31", 50001),
          ("electrum.brainshome.de", 50001),
          ("electrum0.snel.it", 50001),
          ("electrumx.info", 50001),
          ("142.93.6.38", 50001),
          ("guichet.centure.cc", 50001),
        },
        coin: btcCoin,
        addressPrefixes: const {
          AddressType.legacy: "1",
          AddressType.compatibility: "3",
          AddressType.segwit: "bc1",
        },
        dustTreshhold: BTC_DUSTTRESHOLD,
        blockTime: 600, // 10 minutes
      );
}

const LitecoinNetwork = LITECOIN_NETWORK();

class LITECOIN_NETWORK extends UTXONetworkType {
  const LITECOIN_NETWORK()
    : super(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        networkBIP: LITECOIN_NETWORK_BIP_WK_COMPATIBILITY,
        pubKeyHashPrefix: 0x30,
        scriptHashPrefix: 0x32,
        coinType: 2,
        bech32: 'ltc',
        txVersion: 1,
        sighash: BITCOIN_SIGHASH_INFO,
        endpoints: const {
          //    ("ltc.rentonisk.com", 50001),
          ("backup.electrum-ltc.org", 50001),
          ("electrum-ltc.bysh.me", 50001),
          ("electrum-ltc.qortal.online", 50001),
          ("electrum.ltc.xurious.com", 50001),
          ("electrum.qortal.link", 50001),
          ("46.101.3.154", 50001),
        },
        coin: ltcCoin,
        addressPrefixes: const {
          AddressType.legacy: "L",
          AddressType.compatibility: "M",
          AddressType.segwit: "ltc1",
        },
        dustTreshhold: BTC_DUSTTRESHOLD,
        blockTime: 150, // 2.5 minutes
      );
}

const BitcoincashNetwork = BITCOINCASH_NETWORK();

class BITCOINCASH_NETWORK extends UTXONetworkType {
  const BITCOINCASH_NETWORK()
    : super(
        messagePrefix: '\x18Bitcoin Signed Message:\n',
        networkBIP: BITCOIN_NETWORK_BIP,
        pubKeyHashPrefix: 0x00,
        scriptHashPrefix: 0x05,
        coinType: 145,
        bech32: 'bitcoincash',
        txVersion: 1,
        sighash: BCH_SIGHASH_INFO,
        endpoints: const {
          ("100.11.85.230", 50001),
          ("80.209.87.103", 50001),
          ("135.148.236.246", 50001),
          ("electroncash.dk", 50001),
          ("cashnode.bch.ninja", 50001),
          ("fulcrum.apecs.dev", 50001),
          ("niblerino.com", 50001),
          ("bch0.kister.net", 50001),
          ("blackie.c3-soft.com", 50001),
          ("fulcrum.jettscythe.xyz", 50001),
          ("bch.loping.net", 50001),
          ("electrum.imaginary.cash", 50001),
          ("bch.imaginary.cash", 50001),
          ("electroncash.de", 50001),
          ("fulcrum.criptolayer.net", 50001),
        },
        coin: bchCoin,
        addressPrefixes: const {
          AddressType.legacy: "1",
          AddressType.compatibility: "3",
          AddressType.cashaddr: "bitcoincash",
        },
        dustTreshhold: BTC_DUSTTRESHOLD,
        blockTime: 600, // 10 minutes
      );
}

const ZeniqNetwork = ZENIQ_NETWORK();

class ZENIQ_NETWORK extends UTXONetworkType {
  const ZENIQ_NETWORK()
    : super(
        messagePrefix: '\x18Bitcoin Signed Message:\n',
        networkBIP: BITCOIN_NETWORK_BIP,
        pubKeyHashPrefix: 0x6e,
        scriptHashPrefix: 0x6F,
        coinType: 0,
        bech32: 'znq',
        txVersion: 2,
        sighash: BCH_SIGHASH_INFO,
        endpoints: const [
          ("node1.zeniq.network", 50001),
          ("node2.zeniq.network", 50001),
          ("node3.zeniq.network", 50001),
          ("node4.zeniq.network", 50001),
          ("node5.zeniq.network", 50001),
          ("node6.zeniq.network", 50001),
          ("node7.zeniq.network", 50001),
          ("node8.zeniq.network", 50001),
          ("node9.zeniq.network", 50001),
          ("node10.zeniq.network", 50001),
          ("node11.zeniq.network", 50001),
          ("node12.zeniq.network", 50001),
          ("node13.zeniq.network", 50001),
          ("node14.zeniq.network", 50001),
          ("node15.zeniq.network", 50001),
          ("node16.zeniq.network", 50001),
          ("node17.zeniq.network", 50001),
          ("node18.zeniq.network", 50001),
          ("node19.zeniq.network", 50001),
          ("node20.zeniq.network", 50001),
        ],
        coin: zeniqCoin,
        addressPrefixes: const {AddressType.legacy: "m"},
        dustTreshhold: NO_DUSTTRESHOLD,
        blockTime: 600, // 10 minutes
      );
}

const EurocoinNetwork = EUROCOIN_NETWORK();

class EUROCOIN_NETWORK extends UTXONetworkType {
  const EUROCOIN_NETWORK()
    : super(
        pubKeyHashPrefix: 87, // Only Used Value
        bech32: "",
        scriptHashPrefix: 88,
        coinType: -1,
        coin: ec8Coin,
        endpoints: const {
          ("195.201.227.129", 50001),
          ("95.216.218.225", 50001),
        },
        messagePrefix: "\x18Eurocoin Signed Message:\n",
        networkBIP: BITCOIN_NETWORK_BIP,
        sighash: BITCOIN_SIGHASH_INFO,
        txVersion: 2,
        addressPrefixes: const {AddressType.legacy: "c"},
        dustTreshhold: NO_DUSTTRESHOLD,
        blockTime: 600, // 10 minutes
      );
}

const DogecoinNetwork = DOGECOIN_NETWORK();

class DOGECOIN_NETWORK extends UTXONetworkType {
  const DOGECOIN_NETWORK()
    : super(
        messagePrefix: '\x19Dogecoin Signed Message:\n',
        bech32: 'dc',
        networkBIP: DOGECOIN_NETWORK_BIP,
        pubKeyHashPrefix: 0x1e, // 30 in hex
        scriptHashPrefix: 0x16,
        coinType: 3,
        txVersion: 1,
        sighash: BITCOIN_SIGHASH_INFO,
        endpoints: const {
          ("doge.aftrek.org", 50001),
          // ("electrum1.cipig.net", 10060),
          // ("electrum2.cipig.net", 10060),
          // ("electrum3.cipig.net", 10060),
        },
        coin: dogeCoin,
        addressPrefixes: const {
          AddressType.legacy: "D",
          AddressType.compatibility: "9",
          AddressType.segwit: "dc1",
        },
        dustTreshhold: DOGE_DUSTTRESHOLD,
        blockTime: 60, // 1 minute
      );
}

///
/// EVM Networks
///
const EthereumNetwork = ETHEREUM_NETWORK();

class ETHEREUM_NETWORK extends EVMNetworkType {
  const ETHEREUM_NETWORK()
    : super(
        chainId: 1,
        coin: ethNative,
        messagePrefix: "\x19Ethereum Signed Message:\n",
        blockTime: 12,
      );
}

const ZeniqSmartNetwork = ZENIQ_SMART_NETWORK();

class ZENIQ_SMART_NETWORK extends EVMNetworkType {
  const ZENIQ_SMART_NETWORK()
    : super(
        chainId: 383414847825,
        coin: zeniqSmart,
        messagePrefix: "\x19Zeniq Signed Message:\n",
        blockTime: 3,
        useEIP1559: false,
      );
}

const BNBNetwork = BNB_NETWORK();

class BNB_NETWORK extends EVMNetworkType {
  const BNB_NETWORK()
    : super(
        chainId: 56,
        coin: binanceSmart,
        messagePrefix: "\x19Binance Chain Signed Message:\n",
        blockTime: 3,
        useEIP1559: true,
      );
}

const PolygonNetwork = POLYGON_NETWORK();

class POLYGON_NETWORK extends EVMNetworkType {
  const POLYGON_NETWORK()
    : super(
        chainId: 137,
        coin: polygon,
        messagePrefix: "\x19Polygon Signed Message:\n",
        blockTime: 2,
      );
}

///
/// TRON Networks
///

const TRON_Network = TRON_NETWORK();

class TRON_NETWORK extends EVMNetworkType {
  const TRON_NETWORK()
    : super(
        chainId: -1,
        coin: tron,
        messagePrefix: "\x19Tron Signed Message:\n",
        blockTime: 3,
      );
}

// const TronNileTestNet = TRON_NILE_TEST_NETWORK();

// class TRON_NILE_TEST_NETWORK extends TRON_NETWORK {
//   const TRON_NILE_TEST_NETWORK()
//       : super(
//           chainId: 1,
//           rpcUrl: "https://api.nileex.io",
//           coin: tron,
//           messagePrefix: "\x19Tron Signed Message:\n",
//           blockTime: 3,
//         );
// }

const ArbitrumNetwork = ARBITRUM_NETWORK();

class ARBITRUM_NETWORK extends EVMNetworkType {
  const ARBITRUM_NETWORK()
    : super(
        chainId: 42161,
        coin: arbitrum,
        messagePrefix: "\x19Arbitrum Signed Message:\n",
        blockTime: 2,
      );
}

const BaseNetwork = BASE_NETWORK();

class BASE_NETWORK extends EVMNetworkType {
  const BASE_NETWORK()
    : super(
        chainId: 8453,
        coin: ethBase,
        messagePrefix: "\x19Base Chain Signed Message:\n",
        blockTime: 2,
      );
}

const MoonbeamNetwork = MOONBEAM_NETWORK();

class MOONBEAM_NETWORK extends EVMNetworkType {
  const MOONBEAM_NETWORK()
    : super(
        chainId: 1284,
        coin: moonbeam,
        messagePrefix: "\x19Moonbeam Signed Message:\n",
        blockTime: 2,
      );
}

const AvalancheNetwork = AVALANCHE_NETWORK();

class AVALANCHE_NETWORK extends EVMNetworkType {
  const AVALANCHE_NETWORK()
    : super(
        chainId: 43114,
        coin: avalanche,
        messagePrefix: "\x19Avalanche Signed Message:\n",
        blockTime: 2,
      );
}

const OptimismNetwork = OPTIMISM_NETWORK();

class OPTIMISM_NETWORK extends EVMNetworkType {
  const OPTIMISM_NETWORK()
    : super(
        chainId: 10,
        coin: optimism,
        messagePrefix: "\x19Optimism Signed Message:\n",
        blockTime: 2,
      );
}

const ZKSyncNetwork = ZKSYNC_NETWORK();

class ZKSYNC_NETWORK extends EVMNetworkType {
  const ZKSYNC_NETWORK()
    : super(
        chainId: 324,
        coin: ethzkSync,
        messagePrefix: "\x19ZKSync Signed Message:\n",
        blockTime: 2,
      );
}
