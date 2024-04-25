// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hd_wallet_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HDWalletPurposeAdapter extends TypeAdapter<HDWalletPurpose> {
  @override
  final int typeId = 20;

  @override
  HDWalletPurpose read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HDWalletPurpose.NO_STRUCTURE;
      case 1:
        return HDWalletPurpose.BIP44;
      case 2:
        return HDWalletPurpose.BIP49;
      case 3:
        return HDWalletPurpose.BIP84;
      default:
        return HDWalletPurpose.NO_STRUCTURE;
    }
  }

  @override
  void write(BinaryWriter writer, HDWalletPurpose obj) {
    switch (obj) {
      case HDWalletPurpose.NO_STRUCTURE:
        writer.writeByte(0);
        break;
      case HDWalletPurpose.BIP44:
        writer.writeByte(1);
        break;
      case HDWalletPurpose.BIP49:
        writer.writeByte(2);
        break;
      case HDWalletPurpose.BIP84:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HDWalletPurposeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
