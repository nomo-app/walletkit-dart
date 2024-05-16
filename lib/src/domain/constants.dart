// ignore_for_file: constant_identifier_names

import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/utxo/op_codes.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';

const MAX_PUBKEYS_PER_MULTISIG = 20;

const PUBKEY_SCRIPT_HASH_LENGTH_HEX = "14"; // 20 bytes

const SIG_HASH_ALL = 0x01;

const int EXTERNAL_CHAIN_INDEX = 0;
const int INTERNAL_CHAIN_INDEX = 1;

///
/// Public Key Prefixes & Suffixes
///

final p2pkhPrefix =
    "${OPCODE.OP_DUP}${OPCODE.OP_HASH160}$PUBKEY_SCRIPT_HASH_LENGTH_HEX";
final p2pkhPostfix = "${OPCODE.OP_EQUALVERIFY}${OPCODE.OP_CHECKSIG}";
final p2wpkhPrefix = "${OPCODE.OP_0}$PUBKEY_SCRIPT_HASH_LENGTH_HEX";
final p2shPrefix = "${OPCODE.OP_HASH160}$PUBKEY_SCRIPT_HASH_LENGTH_HEX";
final p2shPostfix = "${OPCODE.OP_EQUAL}";

///
/// Address Prefixes
///
const String P2PKH_PREFIX = '1'; // Legacy
const String P2PKH_PREFIX_LTC = 'L'; // Legacy Litecoin
const String P2PKH_PREFIX_ZENIQ = 'm'; // Legacy ZENIQ prefix
const String P2SH_PREFIX = '3'; // Compatibility Address
const String P2SH_PREFIX_LTC = 'M'; // Compatibility Address Litecoin
const String P2WPKH_PREFIX_BTC = 'bc1'; // Native SegWit Bitcoin
const String P2WPKH_PREFIX_LTC = 'ltc1'; // Native SegWit Litecoin
const List<String> P2WPKH_PREFIXES_BCH = [
  "1q",
  "qq"
]; // Native SegWit Bitcoin Cash
const String P2PKH_PREFIX_EC8 = 'c';

const BITCOIN_NETWORK_BIP = NetworkBIP(
  bip32XpubPrefix: 0x0488b21e,
  bip32XprivPrefix: 0x0488ade4,
  bip49XpubPrefix: 0x049d7cb2,
  bip49XprivPrefix: 0x049d7878,
  bip84XpubPrefix: 0x04b24746,
  bip84XprivPrefix: 0x04b2430c,
  wif: 0x80,
);

const BITCOIN_SIGHASH_INFO = SighashInfo(
  all: 0x01,
  none: 0x02,
  single: 0x03,
  allAnyoneCanPay: 0x81,
  noneAnyoneCanPay: 0x82,
  singleAnyoneCanPay: 0x83,
);

const BCH_SIGHASH_INFO = SighashInfo(
  all: 0x41,
  none: 0x42,
  single: 0x43,
  allAnyoneCanPay: 0xc1,
  noneAnyoneCanPay: 0xc2,
  singleAnyoneCanPay: 0xc3,
);

///
/// Needed for compatibility with old wallets
///
const LITECOIN_NETWORK_BIP_WK_COMPATIBILITY = NetworkBIP(
  bip32XpubPrefix: 0x0488b21e,
  bip32XprivPrefix: 0x0488ade4,
  bip49XpubPrefix: 0x0488b21e,
  bip49XprivPrefix: 0x0488ade4,
  bip84XpubPrefix: 0x0488b21e,
  bip84XprivPrefix: 0x0488ade4,
  wif: 0xb0,
);

const LITECOIN_NETWORK_BIP = NetworkBIP(
  bip32XpubPrefix: 0x019da462,
  bip32XprivPrefix: 0x019d9cfe,
  bip49XpubPrefix: 0x01b26ef6,
  bip49XprivPrefix: 0x01b26792,
  bip84XpubPrefix: 0x01b26ef6,
  bip84XprivPrefix: 0x01b26792,
  wif: 0xb0,
);

///
/// DEV
///

const publicTestMnemonicHello = // this mnemonic should be never used for real funds
    "hello upon mirror situate cradle execute cute negative sudden city mean square";

Uint8List get helloSeed {
  return Uint8List.fromList([
    93,
    37,
    243,
    36,
    240,
    76,
    115,
    228,
    64,
    229,
    10,
    179,
    172,
    124,
    11,
    81,
    118,
    191,
    159,
    146,
    181,
    53,
    122,
    123,
    79,
    222,
    13,
    15,
    123,
    239,
    231,
    251,
    113,
    198,
    32,
    189,
    145,
    38,
    116,
    17,
    138,
    110,
    174,
    197,
    113,
    100,
    145,
    118,
    205,
    162,
    109,
    208,
    161,
    231,
    52,
    27,
    203,
    63,
    140,
    145,
    228,
    193,
    46,
    58
  ]);
}

const helloXpub =
    "xpub69BsBUCquKCgn1u6cum7syZewx5J2fyJE479qzDRJtB6hSHkhLsPZZW2SBfPfJaidDtE9g6wyH7ZFv8bWTkwuLeRJx3H2Kray9AsvY8EJAP";

const rejectXpubBip44 =
    "xpub69QjKT4D1e69hjobnhYXrjDwcMfgdnt7CtuNKrUjsqpUZEy3zRYhKcHCtwo4csQxL9jua7M43xYYkt79PtVmwBhix2QNoofzqhLUWMEJNsN";

const rejectXpub =
    "xpub69QjKT4D1e67mdLGJDUq45wYdQZrVL7DATQ98dPPHiKwkKsrM1uyhbG4UazWemQvmi8GBV5UCpLGrFe8zUebtkw7Ew3bEKzv8bDPA2Difc8";

const rejectZpub =
    "zpub6o5FvnQ3K1B9A2sZqBtUQ1RJ1CL6Szw8SoT1p962NqZDuFCRAKqLk5Z2GRyC5vUUksiw81Ychf5mXoWGMgfELZRMxcMWvunpQdgvhxiATdL";

const devLtub = "";

const devMtub = "";

const wkDebugXPUB =
    "xpub69QjKT4D1e67nyLRRcA76149aJASaFBr9UPJkAW5NVqwJNRmTuzB1t1rYjsKmsFgW5B3uLEcBYe92VJHqwDm2t7zXMsTCwcyrYUGgLGTxtV";

const wkDebugXPUBHello =
    "xpub69BsBUCquKCgooMeNw2a3hW6NBZ9Kwn4kYUxYSjygK6YTa8PRqqAEyAKEwBsNH4GiPpb4BCXZ1QiHDeYCtPJtVJoBWNeF8QFRik7MyUstiZ";

const rejectLTUB =
    "Ltub2Vqqn6GEu5Q81zcCthUpux3miCtRF7dMHjc7xi8VfDAeUhWf12QiXEkVqTWYKApBMvXqmcU23qyexM1FuNk3jgiXY4w3u1kxd5yj4XiYZH3";

const rejectEVM = "0x05870f1507d820212E921e1f39f14660336231D1";
const spoilEVM = "0x1464935f48CA992D1a0bEAA2358471D7Cb6374E5";

///
/// EVM
///
const bnbScanApiKey = "YTQ49EUC6SHSKUA5KE9MDRUZ1IFJVQFQXG";
const etherscanApiKey = "AC72N833U9MKUNXS44MV27T3HKEN4WYYT3";

const bnbScanBaseEndpoint = "https://api.bscscan.com/api";
const etherscanBaseEndpoint = "https://api.etherscan.io/api";
const polygonScanBaseEndpoint = "https://api.polygonscan.com/api";
const polygonScanApiKey = "SUUDUQP2JT7HME5VY5DIRIEZVZWHM1YM3M";

const zeniqSmartRPCEndpoint = "https://smart.zeniq.network:9545";

const arbitrumScanBaseEndpoint = "https://api.arbiscan.io/api";
const arbitrumScanApiKey = "P65DHD52BSM4DP8C9F1MAGFQ44GKCPJZXK";
const arbitrumTestWallet = "0xA7Fa4bB0bba164F999E8C7B83C9da96A3bE44616";

///
/// Staking
///
const mainnetStakingContract = "0x7561DEAf4ECf96dc9F0d50B4136046979ACdAD3e";
const smartChainStakingContract = "0x97F51eCDeEdecdb740DD1ff6236D013aFff0417d";
const testnetStakingContract = "0x7a74a51adabe43a987f7119036faea420fc470cf";
const zenpassContract = "0x967ce6379d65DB5d5b7027bbCfDd6f03476011ea";

enum GasLimits {
  toApprove(60000),
  nftSend(100000),
  ethSend(21000),
  erc20Send(70000),
  toStake(280000);

  final int value;

  const GasLimits(this.value);

  static BigInt toClaim(int numberOfNFTs) {
    var result = 150000 + (numberOfNFTs - 1) * 25000;
    return BigInt.from(result);
  }

  BigInt get asBigInt => BigInt.from(value);
}

const TRON_ADDRESS_PREFIX = 0x41; /// Base58 address prefix for Tron = 'T'
