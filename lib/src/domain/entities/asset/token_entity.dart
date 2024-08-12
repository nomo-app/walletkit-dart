import 'dart:math';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';

const TokenEntity nullToken = TokenEntity(
  name: '',
  symbol: '',
  decimals: 0,
);

class TokenEntity {
  final String name;
  final String symbol;
  final int decimals;

  const TokenEntity({
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  num get subunits => pow(10, decimals);

  String get identifier => "$name:$symbol:$decimals";

  EthBasedTokenEntity? get asEthBased =>
      this is EthBasedTokenEntity ? this as EthBasedTokenEntity : null;

  bool get isEvm => this is EvmEntity;
  bool get isERC20 => this is EthBasedTokenEntity;
  bool get isUTXO => switch (this) {
        btcCoin || ltcCoin || zeniqCoin || bchCoin || ec8Coin => true,
        _ => false,
      };

  @override
  int get hashCode => name.hashCode ^ symbol.hashCode ^ decimals.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenEntity &&
        other.name == name &&
        other.symbol == symbol &&
        other.decimals == decimals;
  }

  Map<String, dynamic> toJson() {
    return switch (this) {
      EthBasedTokenEntity ethBasedToken => {
          'name': ethBasedToken.name,
          'symbol': ethBasedToken.symbol,
          'decimals': ethBasedToken.decimals,
          'chainID': ethBasedToken.chainID,
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

class EvmEntity extends TokenEntity {
  final int chainID;

  @override
  String get identifier => "$name:$symbol:$decimals:$chainID";

  @override
  int get hashCode => chainID.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvmEntity && other.chainID == chainID;
  }

  const EvmEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.chainID,
  });
}

class EthBasedTokenEntity extends TokenEntity {
  final String contractAddress;
  final bool? allowDeletion;
  final int chainID;

  const EthBasedTokenEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.contractAddress,
    required this.chainID,
    this.allowDeletion,
  });

  @override
  String get identifier => "$name:$symbol:$decimals:$contractAddress:$chainID";

  @override
  int get hashCode => contractAddress.hashCode ^ chainID.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EthBasedTokenEntity &&
        other.contractAddress == contractAddress &&
        other.chainID == chainID;
  }

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
      allowDeletion: allowDeletion,
      chainID: chainID,
    );
  }

  EthBasedTokenEntity copyWith({
    String? name,
    String? symbol,
    int? decimals,
    String? contractAddress,
    bool? allowDeletion,
    int? chainID,
  }) {
    return EthBasedTokenEntity(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      contractAddress: contractAddress ?? this.contractAddress,
      allowDeletion: allowDeletion ?? this.allowDeletion,
      chainID: chainID ?? this.chainID,
    );
  }
}
