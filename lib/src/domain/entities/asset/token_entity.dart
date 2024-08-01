import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/domain/entities/asset/staking_nft_entity.dart';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';

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
  List<Object> get props => [name, symbol, decimals];

  String get identifier => "$name:$symbol:$decimals";

  EthBasedTokenEntity? get asEthBased {
    if (this is EthBasedTokenEntity) {
      return this as EthBasedTokenEntity;
    }
    return null;
  }

  bool get isEvm => this is EvmEntity;
  bool get isERC20 => this is EthBasedTokenEntity;

  bool get isUTXO => switch (this) {
        btcCoin || ltcCoin || zeniqCoin || bchCoin || ec8Coin => true,
        _ => false,
      };

  Map<String, dynamic> toJson() {
    return switch (this) {
      EthBasedTokenEntity ethBasedToken => {
          'name': ethBasedToken.name,
          'symbol': ethBasedToken.symbol,
          'decimals': ethBasedToken.decimals,
          'contractAddress': ethBasedToken.contractAddress,
        },
      EvmEntity evmEntity => {
          'name': evmEntity.name,
          'symbol': evmEntity.symbol,
          'decimals': evmEntity.decimals,
          'chainID': evmEntity.chainID,
        },
      TokenEntity tokenEntity => {
          'name': tokenEntity.name,
          'symbol': tokenEntity.symbol,
          'decimals': tokenEntity.decimals,
        },
    };
  }

  factory TokenEntity.fromJson(Map json) {
    return switch (json) {
      {
        'name': String name,
        'symbol': String symbol,
        'decimals': int decimals,
        'chainID': int chainID,
        'contractAddress': String contractAddress,
      } =>
        EthBasedTokenEntity(
          name: name,
          symbol: symbol,
          decimals: decimals,
          chainID: chainID,
          contractAddress: contractAddress,
          stakingNft: null,
          allowDeletion: true,
        ),
      {
        'name': String name,
        'symbol': String symbol,
        'decimals': int decimals,
        'chainID': int chainID,
      } =>
        EvmEntity(
          name: name,
          symbol: symbol,
          decimals: decimals,
          chainID: chainID,
        ),
      {
        'name': String name,
        'symbol': String symbol,
        'decimals': int decimals,
      } =>
        TokenEntity(
          name: name,
          symbol: symbol,
          decimals: decimals,
        ),
      _ => throw Exception("Invalid TokenEntity JSON"),
    };
  }
}

@HiveType(typeId: 8)
class EvmEntity extends TokenEntity {
  @HiveField(3)
  final int chainID;

  @override
  List<Object> get props => [name, symbol, decimals, chainID];

  @override
  String get identifier => "$name:$symbol:$decimals:$chainID";

  const EvmEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.chainID,
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

  @HiveField(6)
  final int chainID;

  const EthBasedTokenEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.contractAddress,
    required this.chainID,
    this.stakingNft,
    this.allowDeletion,
  });

  bool get isNFT {
    return stakingNft != null;
  }

  @override
  String get identifier => "$name:$symbol:$decimals:$contractAddress:$chainID";

  @override
  List<Object> get props => [name, symbol, contractAddress, decimals, chainID];

  factory EthBasedTokenEntity.fromJson(
    Map<String, dynamic> json, {
    required bool allowDeletion,
    required int chainID,
  }) {
    return EthBasedTokenEntity(
      name: json['name'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      contractAddress: json['contractAddress'],
      stakingNft: null,
      allowDeletion: allowDeletion,
      chainID: chainID,
    );
  }

  EthBasedTokenEntity copyWith({
    String? name,
    String? symbol,
    int? decimals,
    String? contractAddress,
    StakingNftEntity? stakingNft,
    bool? allowDeletion,
    int? chainID,
  }) {
    return EthBasedTokenEntity(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      contractAddress: contractAddress ?? this.contractAddress,
      stakingNft: stakingNft ?? this.stakingNft,
      allowDeletion: allowDeletion ?? this.allowDeletion,
      chainID: chainID ?? this.chainID,
    );
  }
}
