import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/domain/entities/asset/staking_nft_entity.dart';
import 'package:walletkit_dart/src/domain/entities/predefined_assets.dart';

part 'token_entity.g.dart';

const TokenEntity nullToken = TokenEntity(
  name: '',
  symbol: '',
  decimals: 0,
);

@HiveType(typeId: 7)
class TokenEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final int decimals;

  const TokenEntity({
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  String get assetPath {
    return "assets/images/token_logos/${symbol.toLowerCase()}.png";
  }

  bool get isNFT {
    return decimals == 0;
  }

  num get subunits => pow(10, decimals);

  @override
  List<Object> get props => [name, symbol];

  EthBasedTokenEntity? get asEthBased {
    if (this is EthBasedTokenEntity) {
      return this as EthBasedTokenEntity;
    }
    return null;
  }

  bool get isEvm => this is EvmEntity;
  bool get isERC20 => this is EthBasedTokenEntity;

  bool get isUTXO => switch (this) {
        btcCoin || ltcCoin || zeniqCoin || bchCoin => true,
        _ => false,
      };
}

@HiveType(typeId: 8)
class EvmEntity extends TokenEntity {
  const EvmEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
  });
}

@HiveType(typeId: 0)
class EthBasedTokenEntity extends TokenEntity {
  @HiveField(3)
  final String contractAddress;

  @HiveField(4)
  final StakingNftEntity? stakingNft;

  @HiveField(5)
  final bool? allowDeletion;

  const EthBasedTokenEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.contractAddress,
    this.stakingNft,
    this.allowDeletion,
  });

  bool get isNFT {
    return stakingNft != null;
  }

  @override
  List<Object> get props => [name, symbol, contractAddress, decimals];

  factory EthBasedTokenEntity.fromJson(
    Map<String, dynamic> json, {
    required bool allowDeletion,
  }) {
    return EthBasedTokenEntity(
      name: json['name'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      contractAddress: json['contractAddress'],
      stakingNft: null,
      allowDeletion: allowDeletion,
    );
  }
}
