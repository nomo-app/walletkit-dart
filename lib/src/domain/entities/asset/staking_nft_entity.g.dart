// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_nft_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StakingNftEntityAdapter extends TypeAdapter<StakingNftEntity> {
  @override
  final int typeId = 11;

  @override
  StakingNftEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StakingNftEntity(
      isActive: fields[0] as bool,
      tokenId: fields[1] as BigInt,
      amount: fields[2] as double,
      payoutFactor: fields[3] as double,
      claimedRewards: fields[4] as double?,
      apy: fields[5] as double?,
      start: fields[6] as DateTime,
      end: fields[7] as DateTime,
      lastClaim: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StakingNftEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.isActive)
      ..writeByte(1)
      ..write(obj.tokenId)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.payoutFactor)
      ..writeByte(4)
      ..write(obj.claimedRewards)
      ..writeByte(5)
      ..write(obj.apy)
      ..writeByte(6)
      ..write(obj.start)
      ..writeByte(7)
      ..write(obj.end)
      ..writeByte(8)
      ..write(obj.lastClaim);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StakingNftEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
