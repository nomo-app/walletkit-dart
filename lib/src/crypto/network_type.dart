// ignore_for_file: constant_identifier_names

import 'package:bip32/bip32.dart' as bip32;
import 'package:walletkit_dart/walletkit_dart.dart';

sealed class NetworkType {
  final String messagePrefix;
  final TokenEntity coin;

  const NetworkType({
    required this.messagePrefix,
    required this.coin,
  });
}

sealed class EVMNetworkType extends NetworkType {
  final int chainId;
  final String rpcUrl;

  /// URL, API Key
  final (String, Iterable<String>)? blockExplorer;

  const EVMNetworkType({
    required super.coin,
    required super.messagePrefix,
    required this.chainId,
    required this.rpcUrl,
    this.blockExplorer,
  });

  static Iterable<EVMNetworkType> get all => [
        ZeniqSmartNetwork,
        EthereumNetwork,
        BNBNetwork,
      ];
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

  const UTXONetworkType({
    required super.messagePrefix,
    required super.coin,
    required this.networkBIP,
    required this.pubKeyHashPrefix,
    required this.scriptHashPrefix,
    required this.coinType,
    required this.bech32,
    required this.txVersion,
    required this.endpoints,
    required this.sighash,
    required this.addressPrefixes,
  });

  @override
  String toString() {
    return "UTXONetworkType: ${coin.symbol}";
  }
}

class NetworkBIP {
  final int wif;
  final int bip32XpubPrefix;
  final int bip32XprivPrefix;
  // final int bip44XpubPrefix;
  // final int bip44XprivPrefix;
  final int bip49XpubPrefix;
  final int bip49XprivPrefix;
  final int bip84XpubPrefix;
  final int bip84XprivPrefix;

  static const String NS_PURPOSE = "m/0'";
  static const String BIP44_PURPOSE = "m/44'";
  static const String BIP49_PURPOSE = "m/49'";
  static const String BIP84_PURPOSE = "m/84'";

  const NetworkBIP({
    required this.bip32XpubPrefix,
    required this.bip32XprivPrefix,
    // required this.bip44XpubPrefix,
    // required this.bip44XprivPrefix,
    required this.bip49XpubPrefix,
    required this.bip49XprivPrefix,
    required this.bip84XpubPrefix,
    required this.bip84XprivPrefix,
    required this.wif,
  });

  /// TODO: Implement other HDWalletTypes
  bip32.NetworkType getForWalletType(HDWalletType type) => switch (type) {
        HDWalletType.NO_STRUCTURE || HDWalletType.BIP44 => bip32.NetworkType(
            wif: wif,
            bip32: bip32.Bip32Type(
              private: bip32XprivPrefix,
              public: bip32XpubPrefix,
            ),
          ),
        HDWalletType.BIP84 => bip32.NetworkType(
            wif: wif,
            bip32: bip32.Bip32Type(
              private: bip84XprivPrefix,
              public: bip84XpubPrefix,
            ),
          ),
        _ => bip32.NetworkType(
            wif: wif,
            bip32: bip32.Bip32Type(
              private: bip49XprivPrefix,
              public: bip49XpubPrefix,
            ),
          ),
      };
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
            ("94.130.136.185", 50001),
            ("bitcoin.lu.ke", 50001),
            ("188.165.206.215", 50001),
            ("de.poiuty.com", 50001),
            ("node1.btccuracao.com", 50001),
            ("71.73.6.164", 50001),
            ("elx.bitske.com", 50001),
            ("electrum.bitaroo.net", 50001),
            ("104.248.139.211", 50001),
            ("alviss.coinjoined.com", 50001),
            ("api.ordimint.com", 50001),
            ("167.172.42.31", 50001),
            ("electrum.brainshome.de", 50001),
            ("electrum0.snel.it", 50001),
            ("e.keff.org", 50001),
            ("electrumx.info", 50001),
            ("142.93.6.38", 50001),
            ("ru.poiuty.com", 50001),
            ("guichet.centure.cc", 50001),
          },
          coin: btcCoin,
          addressPrefixes: const {
            AddressType.legacy: "1",
            AddressType.compatibility: "3",
            AddressType.segwit: "bc1",
          },
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
            ("46.101.3.154", 50001)
          },
          coin: ltcCoin,
          addressPrefixes: const {
            AddressType.legacy: "L",
            AddressType.compatibility: "M",
            AddressType.segwit: "ltc1",
          },
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
            ("fulcrum.criptolayer.net", 50001)
          },
          coin: bchCoin,
          addressPrefixes: const {
            AddressType.legacy: "1",
            AddressType.compatibility: "3",
            AddressType.cashaddr: "bitcoincash",
          },
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
          addressPrefixes: const {
            AddressType.legacy: "m",
          },
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
          addressPrefixes: const {
            AddressType.legacy: "c",
          },
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
          rpcUrl:
              "https://mainnet.infura.io/v3/b6bf7d3508c941499b10025c0776eaf8",
          blockExplorer: (
            etherscanBaseEndpoint,
            const [
              "RD46SK1466WA991RZ9NZ8ASECAC2GS2YKM",
              "DPN46Q23SK62Q135FWJ8VHH9MGN7VGJ166",
              "AC72N833U9MKUNXS44MV27T3HKEN4WYYT3"
            ]
          ),
        );
}

const ZeniqSmartNetwork = ZENIQ_SMART_NETWORK();

class ZENIQ_SMART_NETWORK extends EVMNetworkType {
  const ZENIQ_SMART_NETWORK()
      : super(
          chainId: 383414847825,
          coin: zeniqSmart,
          messagePrefix: "\x19Zeniq Signed Message:\n",
          rpcUrl: zeniqSmartRPCEndpoint,
        );
}

const BNBNetwork = BNB_NETWORK();

class BNB_NETWORK extends EVMNetworkType {
  const BNB_NETWORK()
      : super(
          chainId: 56,
          rpcUrl: "https://bsc-dataseed.binance.org/",
          blockExplorer: (bnbScanBaseEndpoint, const [bnbScanApiKey]),
          coin: binanceSmart,
          messagePrefix: "\x19Binance Chain Signed Message:\n",
        );
}

const PolygonNetwork = POLYGON_NETWORK();

class POLYGON_NETWORK extends EVMNetworkType {
  const POLYGON_NETWORK()
      : super(
          chainId: 137,
          rpcUrl: "https://polygon.llamarpc.com/",
          blockExplorer: (polygonScanBaseEndpoint, const [polygonScanApiKey]),
          coin: polygon,
          messagePrefix: "\x19Polygon Signed Message:\n",
        );
}
