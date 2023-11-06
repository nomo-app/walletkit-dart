// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zsc_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZeniqSmartChainTransactionAdapter
    extends TypeAdapter<ZeniqSmartChainTransaction> {
  @override
  final int typeId = 2;

  @override
  ZeniqSmartChainTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZeniqSmartChainTransaction(
      hash: fields[0] as String,
      block: fields[1] as int,
      confirmations: fields[2] as int,
      timeMilli: fields[3] as int,
      amount: fields[5] as Amount,
      fee: fields[6] as Amount,
      sender: fields[7] as String,
      recipient: fields[8] as String,
      transferMethod: fields[9] as TransactionTransferMethod,
      token: fields[4] as TokenEntity,
      status: fields[10] as ConfirmationStatus,
      input: fields[11] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, ZeniqSmartChainTransaction obj) {
    writer
      ..writeByte(12)
      ..writeByte(11)
      ..write(obj.input)
      ..writeByte(0)
      ..write(obj.hash)
      ..writeByte(1)
      ..write(obj.block)
      ..writeByte(2)
      ..write(obj.confirmations)
      ..writeByte(3)
      ..write(obj.timeMilli)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.fee)
      ..writeByte(7)
      ..write(obj.sender)
      ..writeByte(8)
      ..write(obj.recipient)
      ..writeByte(9)
      ..write(obj.transferMethod)
      ..writeByte(10)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZeniqSmartChainTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
