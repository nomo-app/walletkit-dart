// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_intent.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransferIntentAdapter extends TypeAdapter<TransferIntent> {
  @override
  final int typeId = 22;

  @override
  TransferIntent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransferIntent(
      recipient: fields[1] as String,
      amount: fields[2] as Amount,
      feeInfo: fields[3] as FeeInformation?,
      token: fields[0] as TokenEntity,
      memo: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransferIntent obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.recipient)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.feeInfo)
      ..writeByte(4)
      ..write(obj.memo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferIntentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
