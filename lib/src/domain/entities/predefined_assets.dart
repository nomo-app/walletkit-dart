import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';

///
/// UTXO Assets
///
const zeniqCoin = TokenEntity(
  name: 'ZENIQ',
  symbol: 'ZENIQ Coin',
  decimals: 8,
);
const btcCoin = TokenEntity(
  name: 'Bitcoin',
  symbol: 'BTC',
  decimals: 8,
);
const bchCoin = TokenEntity(
  name: 'Bitcoin Cash',
  symbol: 'BCH',
  decimals: 8,
);
const ltcCoin = TokenEntity(
  name: 'Litecoin',
  symbol: 'LTC',
  decimals: 8,
);
const ec8Coin = TokenEntity(
  name: 'Eurocoin',
  symbol: 'EC8',
  decimals: 5,
);

///
/// Ethereum Assets
///
const ethNative = EvmEntity(
  name: 'Ethereum',
  symbol: 'ETH',
  decimals: 18,
);
const wbtcToken = EthBasedTokenEntity(
  name: 'Wrapped BTC',
  symbol: 'WBTC',
  contractAddress: "0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599",
  decimals: 8,
);
const usdcToken = EthBasedTokenEntity(
  name: 'USD Coin',
  symbol: 'USDC',
  contractAddress: "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
  decimals: 6,
);
const avinocETH = EthBasedTokenEntity(
  name: 'AVINOC ETH',
  symbol: 'AVINOC ERC20',
  contractAddress: "0xF1cA9cb74685755965c7458528A36934Df52A3EF",
  decimals: 18,
);
const avinocZSC = EthBasedTokenEntity(
  name: 'AVINOC',
  symbol: 'AVINOC ZEN20',
  contractAddress: "0xF1cA9cb74685755965c7458528A36934Df52A3EF",
  decimals: 18,
);
const zeniqETHToken = EthBasedTokenEntity(
  name: 'ZENIQ',
  symbol: 'ZENIQ @ETH',
  contractAddress: "0x5b52bfB8062Ce664D74bbCd4Cd6DC7Df53Fd7233",
  decimals: 18,
);
const daiToken = EthBasedTokenEntity(
  name: 'Dai Stablecoin',
  symbol: 'DAI',
  contractAddress: "0x6B175474E89094C44Da98b954EedeAC495271d0F",
  decimals: 18,
);
const usdtToken = EthBasedTokenEntity(
  name: 'Tether USD',
  symbol: 'USDT',
  contractAddress: "0xdAC17F958D2ee523a2206206994597C13D831ec7",
  decimals: 6,
);

///
/// ZSC Assets
///
const zeniqSmart = EvmEntity(
  name: 'ZENIQ',
  symbol: 'ZENIQ Token',
  decimals: 18,
);
const tupanToken = EthBasedTokenEntity(
  name: 'Tupan Community Token',
  symbol: 'TUPAN',
  contractAddress: "0x12056546AC468aAd5f9D7Fab9f62D3d97ef95b9A",
  decimals: 18,
);
const iLoveSafirToken = EthBasedTokenEntity(
  name: "I♡SAFIR",
  symbol: "SAFIR",
  contractAddress: "0xcBd3Dd9a52Beea3D0E4B9356f478e7EEd69438Bf",
  decimals: 18,
);
const sidiToken = EthBasedTokenEntity(
  name: "SIDI Token",
  symbol: "SIDI",
  contractAddress: "0xB4EB994f25d3E7E60802fe19f37bc8D5246C26D6",
  decimals: 18,
);
const digitalGoldToken = EthBasedTokenEntity(
  name: "Digital Gold Token",
  symbol: "DGT",
  contractAddress: "0xE88CD091695aa5fce94065e5Df044d6444A40cd4",
  decimals: 18,
);
const regardlessToken = EthBasedTokenEntity(
  name: "Regardless Community Token",
  symbol: "REGA",
  contractAddress: "0xAf4f8cE05AF30bb8e06a8AFec762609d2394BCd7",
  decimals: 18,
);
const tDroneToken = EthBasedTokenEntity(
  name: "TDrone Token",
  symbol: "TDRONE",
  contractAddress: "0x4cb0550c8b6765c15E77ad8b65189D4B865B4cb0",
  decimals: 18,
);
const vooToken = EthBasedTokenEntity(
  name: "Voo Token",
  symbol: "VOO",
  contractAddress: "0x12466A65aac83FE1B10F43e43ed21FC81BEF4bb8",
  decimals: 18,
);

///
/// Binance Chain Assets
///
const binanceSmart = EvmEntity(
  name: 'BNB',
  symbol: 'BNB',
  decimals: 18,
);
const zeniqBSCToken = EthBasedTokenEntity(
  name: 'ZENIQ',
  symbol: 'ZENIQ @BSC',
  contractAddress: "0x5b52bfB8062Ce664D74bbCd4Cd6DC7Df53Fd7233",
  decimals: 18,
);

///
/// Arbitrum Assets
///
const arbitrumToken = EthBasedTokenEntity(
  name: 'Arbitrum',
  symbol: 'ARB',
  contractAddress: "0x912CE59144191C1204E64559FE8253a0e49E6548",
  decimals: 18,
);
const usdtArbitrumToken = EthBasedTokenEntity(
  name: 'Tether USD',
  symbol: 'USDT',
  contractAddress: "0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9",
  decimals: 6,
);

///
/// OASIS
///
const roseCoin = TokenEntity(
  name: 'ROSE',
  symbol: 'ROSE',
  decimals: 18,
);
