// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hd_wallet_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HDWalletTypeAdapter extends TypeAdapter<HDWalletType> {
  @override
  final int typeId = 20;

  @override
  HDWalletType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HDWalletType.NO_STRUCTURE;
      case 1:
        return HDWalletType.BIP44;
      case 2:
        return HDWalletType.BIP44_LITECOIN;
      case 3:
        return HDWalletType.BIP49;
      case 4:
        return HDWalletType.BIP84;
      default:
        return HDWalletType.NO_STRUCTURE;
    }
  }

  @override
  void write(BinaryWriter writer, HDWalletType obj) {
    switch (obj) {
      case HDWalletType.NO_STRUCTURE:
        writer.writeByte(0);
        break;
      case HDWalletType.BIP44:
        writer.writeByte(1);
        break;
      case HDWalletType.BIP44_LITECOIN:
        writer.writeByte(2);
        break;
      case HDWalletType.BIP49:
        writer.writeByte(3);
        break;
      case HDWalletType.BIP84:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HDWalletTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
