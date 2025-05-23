import 'dart:math';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const CoinEntity nullToken = CoinEntity(
  name: '',
  symbol: '',
  decimals: 0,
);

class CoinEntity {
  final String name;
  final String symbol;
  final int decimals;

  const CoinEntity({
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  num get subunits => pow(10, decimals);

  String get identifier => "$name:$symbol:$decimals";

  ERC20Entity? get asEthBased => this is ERC20Entity ? this as ERC20Entity : null;

  ERC1155Entity? get asERC1155 => this is ERC1155Entity ? this as ERC1155Entity : null;

  bool get isEvm => this is EvmCoinEntity;
  bool get isERC20 => this is ERC20Entity;
  bool get isERC1155 => this is ERC1155Entity;
  bool get isUTXO => switch (this) {
        btcCoin || ltcCoin || zeniqCoin || bchCoin || ec8Coin => true,
        _ => false,
      };

  @override
  int get hashCode => name.hashCode ^ symbol.hashCode ^ decimals.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinEntity &&
        other is! EvmCoinEntity &&
        other.name == name &&
        other.symbol == symbol &&
        other.decimals == decimals;
  }

  @override
  String toString() {
    return '$name ($symbol)';
  }

  Map<String, dynamic> toJson() {
    return switch (this) {
      ERC20Entity ethBasedToken => {
          'name': ethBasedToken.name,
          'symbol': ethBasedToken.symbol,
          'decimals': ethBasedToken.decimals,
          'chainID': ethBasedToken.chainID,
          'contractAddress': ethBasedToken.contractAddress,
          'allowDeletion': ethBasedToken.allowDeletion,
        },
      ERC1155Entity erc1155Token => {
          'name': erc1155Token.name,
          'symbol': erc1155Token.symbol,
          'contractAddress': erc1155Token.contractAddress,
          'tokenId': erc1155Token.tokenId.toString(),
          'allowDeletion': erc1155Token.allowDeletion,
          'chainID': erc1155Token.chainID,
        },
      EvmCoinEntity evmEntity => {
          'name': evmEntity.name,
          'symbol': evmEntity.symbol,
          'decimals': evmEntity.decimals,
          'chainID': evmEntity.chainID,
        },
      CoinEntity tokenEntity => {
          'name': tokenEntity.name,
          'symbol': tokenEntity.symbol,
          'decimals': tokenEntity.decimals,
        },
    };
  }

  factory CoinEntity.fromJson(Map json) {
    return switch (json) {
      {
        'name': String name,
        'symbol': String symbol,
        'decimals': int decimals,
        'chainID': int chainID,
        'contractAddress': String contractAddress,
      } =>
        ERC20Entity(
          name: name,
          symbol: symbol,
          decimals: decimals,
          chainID: chainID,
          contractAddress: contractAddress,
          allowDeletion: json['allowDeletion'] ?? true,
        ),
      {
        "name": String name,
        "symbol": String symbol,
        "contractAddress": String contractAddress,
        "tokenId": String tokenId,
        "chainID": int chainID,
      } =>
        ERC1155Entity(
          name: name,
          symbol: symbol,
          contractAddress: contractAddress,
          tokenId: BigInt.parse(tokenId),
          chainID: chainID,
          allowDeletion: json['allowDeletion'] ?? true,
        ),
      {
        'name': String name,
        'symbol': String symbol,
        'decimals': int decimals,
        'chainID': int chainID,
      } =>
        EvmCoinEntity(
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
        CoinEntity(
          name: name,
          symbol: symbol,
          decimals: decimals,
        ),
      _ => throw Exception("Invalid TokenEntity JSON"),
    };
  }
}

class EvmCoinEntity extends CoinEntity {
  final int chainID;
  final bool? allowDeletion;

  @override
  String get identifier => "$name:$symbol:$decimals:$chainID";

  @override
  int get hashCode => chainID.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvmCoinEntity &&
        other is! ERC20Entity &&
        other is! ERC721Entity &&
        other is! ERC1155Entity &&
        other.chainID == chainID;
  }

  const EvmCoinEntity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required this.chainID,
    this.allowDeletion = false,
  });

  EvmCoinEntity copyWith({
    String? name,
    String? symbol,
    int? decimals,
    int? chainID,
    bool? allowDeletion,
  }) {
    return EvmCoinEntity(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      chainID: chainID ?? this.chainID,
      allowDeletion: allowDeletion ?? this.allowDeletion,
    );
  }
}

class ERC1155Entity extends EvmCoinEntity {
  final String contractAddress;
  final BigInt tokenId;

  const ERC1155Entity({
    required super.name,
    required super.symbol,
    required super.chainID,
    required this.contractAddress,
    required this.tokenId,
    super.allowDeletion,
  }) : super(decimals: 0);

  String get lowerCaseAddress => contractAddress.toLowerCase();

  @override
  int get hashCode => lowerCaseAddress.hashCode ^ chainID.hashCode ^ tokenId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ERC1155Entity &&
        other.lowerCaseAddress == lowerCaseAddress &&
        other.chainID == chainID &&
        other.tokenId == tokenId;
  }

  ERC1155Entity copyWith({
    String? name,
    String? symbol,
    int? decimals,
    String? contractAddress,
    BigInt? tokenId,
    bool? allowDeletion,
    int? chainID,
  }) {
    return ERC1155Entity(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      contractAddress: contractAddress ?? this.contractAddress,
      tokenId: tokenId ?? this.tokenId,
      allowDeletion: allowDeletion ?? this.allowDeletion,
      chainID: chainID ?? this.chainID,
    );
  }

  factory ERC1155Entity.fromJson(
    Map<String, dynamic> json, {
    required bool allowDeletion,
    required int chainID,
  }) {
    return ERC1155Entity(
      name: json['name'],
      symbol: json['symbol'],
      contractAddress: json['contractAddress'],
      tokenId: BigInt.parse(json['tokenId']),
      allowDeletion: allowDeletion,
      chainID: chainID,
    );
  }
}

class ERC20Entity extends EvmCoinEntity {
  final String contractAddress;

  const ERC20Entity({
    required super.name,
    required super.symbol,
    required super.decimals,
    required super.chainID,
    required this.contractAddress,
    super.allowDeletion,
  });

  String get lowerCaseAddress => contractAddress.toLowerCase();

  @override
  String get identifier => "$name:$symbol:$decimals:$contractAddress:$chainID";

  @override
  int get hashCode => lowerCaseAddress.hashCode ^ chainID.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ERC20Entity &&
        other.lowerCaseAddress == lowerCaseAddress &&
        other.chainID == chainID;
  }

  factory ERC20Entity.fromJson(
    Map<String, dynamic> json, {
    required bool allowDeletion,
    required int chainID,
  }) {
    return ERC20Entity(
      name: json['name'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      contractAddress: json['contractAddress'],
      allowDeletion: allowDeletion,
      chainID: chainID,
    );
  }

  ERC20Entity copyWith({
    String? name,
    String? symbol,
    int? decimals,
    String? contractAddress,
    bool? allowDeletion,
    int? chainID,
  }) {
    return ERC20Entity(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      contractAddress: contractAddress ?? this.contractAddress,
      allowDeletion: allowDeletion ?? this.allowDeletion,
      chainID: chainID ?? this.chainID,
    );
  }
}

class ERC721Entity extends EvmCoinEntity {
  final String contractAddress;
  final BigInt tokenId;

  const ERC721Entity({
    required super.name,
    required super.symbol,
    required super.chainID,
    required this.contractAddress,
    required this.tokenId,
  }) : super(decimals: 0);

  String get lowerCaseAddress => contractAddress.toLowerCase();

  @override
  int get hashCode => lowerCaseAddress.hashCode ^ chainID.hashCode ^ tokenId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ERC721Entity &&
        other.lowerCaseAddress == lowerCaseAddress &&
        other.chainID == chainID &&
        other.tokenId == tokenId;
  }
}
