// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tron_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TronTransactionAdapter extends TypeAdapter<TronTransaction> {
  @override
  final int typeId = 26;

  @override
  TronTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TronTransaction(
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
    );
  }

  @override
  void write(BinaryWriter writer, TronTransaction obj) {
    writer
      ..writeByte(11)
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
      other is TronTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
