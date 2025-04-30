import 'package:walletkit_dart/src/domain/entities/coin_entity.dart';

///
/// UTXO Assets
///
const zeniqCoin = CoinEntity(
  name: 'ZENIQ',
  symbol: 'ZENIQ Coin',
  decimals: 8,
);
const btcCoin = CoinEntity(
  name: 'Bitcoin',
  symbol: 'BTC',
  decimals: 8,
);
const bchCoin = CoinEntity(
  name: 'Bitcoin Cash',
  symbol: 'BCH',
  decimals: 8,
);
const ltcCoin = CoinEntity(
  name: 'Litecoin',
  symbol: 'LTC',
  decimals: 8,
);
const ec8Coin = CoinEntity(
  name: 'Eurocoin',
  symbol: 'EURO',
  decimals: 5,
);
const dogeCoin = CoinEntity(
  name: 'Dogecoin',
  symbol: 'DOGE',
  decimals: 8,
);

///
/// Ethereum Assets
///
const ethNative = EvmCoinEntity(
  chainID: 1,
  name: 'Ethereum',
  symbol: 'ETH',
  decimals: 18,
);
const wbtcToken = ERC20Entity(
  name: 'Wrapped BTC',
  symbol: 'WBTC',
  contractAddress: "0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599",
  decimals: 8,
  chainID: 1,
);
const usdcToken = ERC20Entity(
  name: 'USD Coin',
  symbol: 'USDC',
  contractAddress: "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
  decimals: 6,
  chainID: 1,
);
const avinocETH = ERC20Entity(
  name: 'AVINOC ETH',
  symbol: 'AVINOC ERC20',
  contractAddress: "0xF1cA9cb74685755965c7458528A36934Df52A3EF",
  decimals: 18,
  chainID: 1,
);
const zeniqETHToken = ERC20Entity(
  name: 'ZENIQ',
  symbol: 'ZENIQ @ETH',
  contractAddress: "0x5b52bfB8062Ce664D74bbCd4Cd6DC7Df53Fd7233",
  decimals: 18,
  chainID: 1,
);
const daiToken = ERC20Entity(
  name: 'Dai Stablecoin',
  symbol: 'DAI',
  contractAddress: "0x6B175474E89094C44Da98b954EedeAC495271d0F",
  decimals: 18,
  chainID: 1,
);
const usdtToken = ERC20Entity(
  name: 'Tether USD',
  symbol: 'USDT',
  contractAddress: "0xdAC17F958D2ee523a2206206994597C13D831ec7",
  decimals: 6,
  chainID: 1,
);

///
/// ZSC Assets
///
const zeniqSmart = EvmCoinEntity(
  chainID: 383414847825,
  name: 'ZENIQ',
  symbol: 'ZENIQ Token',
  decimals: 18,
);
const wrappedZeniqSmart = ERC20Entity(
  name: 'Wrapped ZENIQ',
  symbol: 'WZENIQ',
  decimals: 18,
  contractAddress: "0x74DC1C4ec10abE9F5C8A3EabF1A90b97cDc3Ead8",
  chainID: 383414847825,
);
const avinocZSC = ERC20Entity(
  name: 'AVINOC',
  symbol: 'AVINOC ZEN20',
  contractAddress: "0xF1cA9cb74685755965c7458528A36934Df52A3EF",
  decimals: 18,
  chainID: 383414847825,
);
const tupanToken = ERC20Entity(
  name: 'Tupan Community Token',
  symbol: 'TUPAN',
  contractAddress: "0x12056546AC468aAd5f9D7Fab9f62D3d97ef95b9A",
  decimals: 18,
  chainID: 383414847825,
);
const iLoveSafirToken = ERC20Entity(
  name: "I♡SAFIR",
  symbol: "SAFIR",
  contractAddress: "0xcBd3Dd9a52Beea3D0E4B9356f478e7EEd69438Bf",
  decimals: 18,
  chainID: 383414847825,
);
const sidiToken = ERC20Entity(
  name: "SIDI Token",
  symbol: "SIDI",
  contractAddress: "0xB4EB994f25d3E7E60802fe19f37bc8D5246C26D6",
  decimals: 18,
  chainID: 383414847825,
);
const digitalGoldToken = ERC20Entity(
  name: "Digital Gold Token",
  symbol: "DGT",
  contractAddress: "0xE88CD091695aa5fce94065e5Df044d6444A40cd4",
  decimals: 18,
  chainID: 383414847825,
);
const regardlessToken = ERC20Entity(
  name: "Regardless Community Token",
  symbol: "REGA",
  contractAddress: "0xAf4f8cE05AF30bb8e06a8AFec762609d2394BCd7",
  decimals: 18,
  chainID: 383414847825,
);
const tDroneToken = ERC20Entity(
  name: "TDrone Token",
  symbol: "TDRONE",
  contractAddress: "0x4cb0550c8b6765c15E77ad8b65189D4B865B4cb0",
  decimals: 18,
  chainID: 383414847825,
);
const vooToken = ERC20Entity(
  name: "Voo Token",
  symbol: "VOO",
  contractAddress: "0x12466A65aac83FE1B10F43e43ed21FC81BEF4bb8",
  decimals: 18,
  chainID: 383414847825,
);

///
/// Binance Chain Assets
///
const binanceSmart = EvmCoinEntity(
  chainID: 56,
  name: 'BNB',
  symbol: 'BNB',
  decimals: 18,
);
const zeniqBSCToken = ERC20Entity(
  name: 'ZENIQ',
  symbol: 'ZENIQ @BSC',
  contractAddress: "0x5b52bfB8062Ce664D74bbCd4Cd6DC7Df53Fd7233",
  decimals: 18,
  chainID: 56,
);

///
/// Polygon Assets
///
const polygon = EvmCoinEntity(
  chainID: 137,
  name: 'Polygon',
  symbol: 'MATIC',
  decimals: 18,
);

const cLFi = ERC20Entity(
  name: 'CLFi',
  symbol: 'CLFI',
  decimals: 8,
  contractAddress: "0x08715F5c743F747dE0005ad6C45336C163711137",
  chainID: 137,
);

const LFi = ERC20Entity(
  name: 'LFi',
  symbol: 'LFi',
  decimals: 8,
  contractAddress: "0x9b760D11F63cb80BFFBCf69421cd46511E429f83",
  chainID: 137,
);

///
/// Tron Assets
///

const tron = CoinEntity(
  name: 'Tron',
  symbol: 'TRX',
  decimals: 6,
);

const tronUSDT = ERC20Entity(
  name: 'Tether USD',
  symbol: 'USDT',
  decimals: 6,
  contractAddress: "TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t",
  chainID: -2, // TODO: Make own Object for TRC20
);

///
/// Arbitrum Assets
///
const arbitrum = ERC20Entity(
  name: 'Arbitrum',
  symbol: 'ARB',
  decimals: 18,
  contractAddress: "0x912CE59144191C1204E64559FE8253a0e49E6548",
  chainID: 42161,
);

const ethArbitrum = EvmCoinEntity(
  chainID: 42161,
  name: "Ethereum",
  symbol: "ETH",
  decimals: 18,
);

///
/// Avalanche Assets
///
const avalanche = EvmCoinEntity(
  chainID: 43114,
  name: 'Avalanche',
  symbol: 'AVAX',
  decimals: 18,
);

const wrappedETH = ERC20Entity(
  name: "Wrapped ETH",
  symbol: "WETH.e",
  decimals: 18,
  contractAddress: "0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB",
  chainID: 43114,
);

///
/// Base Assets
///
const ethBase = EvmCoinEntity(
  chainID: 8453,
  name: "Ethereum",
  symbol: "ETH",
  decimals: 18,
);

const mathToken = ERC20Entity(
  name: "MATH Token",
  symbol: "MATH",
  decimals: 18,
  contractAddress: "0x9e81F6495BA29a6B4D48bDdD042C0598fA8abc9F",
  chainID: 8453,
);

///
/// Moonbeam Assets
///
const moonbeam = EvmCoinEntity(
  chainID: 1284,
  name: 'Moonbeam',
  symbol: 'GLMR',
  decimals: 18,
);
const frax = ERC20Entity(
  name: "Frax",
  symbol: "FRAX",
  decimals: 18,
  contractAddress: "0x322E86852e492a7Ee17f28a78c663da38FB33bfb",
  chainID: 1284,
);

///
/// Optimism Assets
///
const optimism = ERC20Entity(
  name: "Optimism",
  symbol: "OP",
  decimals: 18,
  contractAddress: "0x4200000000000000000000000000000000000042",
  chainID: 10,
);

const ethOptimism = EvmCoinEntity(
  chainID: 10,
  name: "Ethereum",
  symbol: "ETH",
  decimals: 18,
);

///
///ZKSync Assets
///
const ethzkSync = EvmCoinEntity(
  chainID: 324,
  name: "Ethereum",
  symbol: "ETH",
  decimals: 18,
);

const wbtcZKSync = ERC20Entity(
  name: "Wrapped BTC",
  symbol: "WBTC",
  decimals: 8,
  contractAddress: "0xBBeB516fb02a01611cBBE0453Fe3c580D7281011",
  chainID: 324,
);
