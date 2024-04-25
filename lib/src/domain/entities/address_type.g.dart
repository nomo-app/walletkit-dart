// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressTypeAdapter extends TypeAdapter<AddressType> {
  @override
  final int typeId = 19;

  @override
  AddressType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AddressType.legacy;
      case 1:
        return AddressType.segwit;
      case 2:
        return AddressType.taproot;
      case 3:
        return AddressType.compatibility;
      case 4:
        return AddressType.cashaddr;
      case 5:
        return AddressType.evm;
      case 6:
        return AddressType.tron;
      default:
        return AddressType.legacy;
    }
  }

  @override
  void write(BinaryWriter writer, AddressType obj) {
    switch (obj) {
      case AddressType.legacy:
        writer.writeByte(0);
        break;
      case AddressType.segwit:
        writer.writeByte(1);
        break;
      case AddressType.taproot:
        writer.writeByte(2);
        break;
      case AddressType.compatibility:
        writer.writeByte(3);
        break;
      case AddressType.cashaddr:
        writer.writeByte(4);
        break;
      case AddressType.evm:
        writer.writeByte(5);
        break;
      case AddressType.tron:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
