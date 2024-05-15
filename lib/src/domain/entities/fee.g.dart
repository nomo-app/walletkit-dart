// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvmFeeInformationAdapter extends TypeAdapter<EvmFeeInformation> {
  @override
  final int typeId = 23;

  @override
  EvmFeeInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvmFeeInformation(
      gasLimit: fields[0] as int,
      gasPrice: fields[1] as Amount,
    );
  }

  @override
  void write(BinaryWriter writer, EvmFeeInformation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gasLimit)
      ..writeByte(1)
      ..write(obj.gasPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvmFeeInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UtxoFeeInformationAdapter extends TypeAdapter<UtxoFeeInformation> {
  @override
  final int typeId = 24;

  @override
  UtxoFeeInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UtxoFeeInformation(
      feePerByte: fields[0] as Amount,
    );
  }

  @override
  void write(BinaryWriter writer, UtxoFeeInformation obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.feePerByte);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UtxoFeeInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TronFeeInformationAdapter extends TypeAdapter<TronFeeInformation> {
  @override
  final int typeId = 27;

  @override
  TronFeeInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TronFeeInformation(
      feeLimit: fields[0] as Amount,
    );
  }

  @override
  void write(BinaryWriter writer, TronFeeInformation obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.feeLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TronFeeInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
