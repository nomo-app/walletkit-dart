// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AmountAdapter extends TypeAdapter<Amount> {
  @override
  final int typeId = 12;

  @override
  Amount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Amount(
      value: fields[0] as BigInt,
      decimals: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Amount obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.decimals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
