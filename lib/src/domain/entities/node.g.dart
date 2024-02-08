// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReceiveNodeAdapter extends TypeAdapter<ReceiveNode> {
  @override
  final int typeId = 15;

  @override
  ReceiveNode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReceiveNode(
      address: fields[0] as String,
      derivationPath: fields[1] as String,
      addresses: (fields[2] as Map).cast<AddressType, String>(),
      walletType: fields[3] as HDWalletType,
    );
  }

  @override
  void write(BinaryWriter writer, ReceiveNode obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.derivationPath)
      ..writeByte(2)
      ..write(obj.addresses)
      ..writeByte(3)
      ..write(obj.walletType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceiveNodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChangeNodeAdapter extends TypeAdapter<ChangeNode> {
  @override
  final int typeId = 16;

  @override
  ChangeNode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChangeNode(
      address: fields[0] as String,
      derivationPath: fields[1] as String,
      addresses: (fields[2] as Map).cast<AddressType, String>(),
      walletType: fields[3] as HDWalletType,
    );
  }

  @override
  void write(BinaryWriter writer, ChangeNode obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.derivationPath)
      ..writeByte(2)
      ..write(obj.addresses)
      ..writeByte(3)
      ..write(obj.walletType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeNodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmptyNodeAdapter extends TypeAdapter<EmptyNode> {
  @override
  final int typeId = 17;

  @override
  EmptyNode read(BinaryReader reader) {
    return EmptyNode();
  }

  @override
  void write(BinaryWriter writer, EmptyNode obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.derivationPath)
      ..writeByte(2)
      ..write(obj.addresses)
      ..writeByte(3)
      ..write(obj.walletType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmptyNodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
