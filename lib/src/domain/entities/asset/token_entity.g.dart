// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenEntityAdapter extends TypeAdapter<TokenEntity> {
  @override
  final int typeId = 7;

  @override
  TokenEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenEntity(
      name: fields[0] as String,
      symbol: fields[1] as String,
      decimals: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TokenEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.decimals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EvmEntityAdapter extends TypeAdapter<EvmEntity> {
  @override
  final int typeId = 8;

  @override
  EvmEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvmEntity(
      name: fields[0] as String,
      symbol: fields[1] as String,
      decimals: fields[2] as int,
      chainID: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EvmEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.chainID)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.decimals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvmEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EthBasedTokenEntityAdapter extends TypeAdapter<EthBasedTokenEntity> {
  @override
  final int typeId = 0;

  @override
  EthBasedTokenEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EthBasedTokenEntity(
      name: fields[0] as String,
      symbol: fields[1] as String,
      decimals: fields[2] as int,
      contractAddress: fields[3] as String,
      chainID: fields.length > 6 ? fields[6] as int : -1,
      stakingNft: fields[4] as StakingNftEntity?,
      allowDeletion: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, EthBasedTokenEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.contractAddress)
      ..writeByte(4)
      ..write(obj.stakingNft)
      ..writeByte(5)
      ..write(obj.allowDeletion)
      ..writeByte(6)
      ..write(obj.chainID)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.decimals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EthBasedTokenEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
