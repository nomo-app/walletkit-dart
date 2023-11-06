// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfirmationStatusAdapter extends TypeAdapter<ConfirmationStatus> {
  @override
  final int typeId = 18;

  @override
  ConfirmationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConfirmationStatus.notSubmitted;
      case 1:
        return ConfirmationStatus.pending;
      case 2:
        return ConfirmationStatus.confirmed;
      case 3:
        return ConfirmationStatus.failed;
      default:
        return ConfirmationStatus.notSubmitted;
    }
  }

  @override
  void write(BinaryWriter writer, ConfirmationStatus obj) {
    switch (obj) {
      case ConfirmationStatus.notSubmitted:
        writer.writeByte(0);
        break;
      case ConfirmationStatus.pending:
        writer.writeByte(1);
        break;
      case ConfirmationStatus.confirmed:
        writer.writeByte(2);
        break;
      case ConfirmationStatus.failed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfirmationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTransferMethodAdapter
    extends TypeAdapter<TransactionTransferMethod> {
  @override
  final int typeId = 9;

  @override
  TransactionTransferMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionTransferMethod.receive;
      case 1:
        return TransactionTransferMethod.send;
      case 2:
        return TransactionTransferMethod.own;
      case 3:
        return TransactionTransferMethod.unknown;
      default:
        return TransactionTransferMethod.receive;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionTransferMethod obj) {
    switch (obj) {
      case TransactionTransferMethod.receive:
        writer.writeByte(0);
        break;
      case TransactionTransferMethod.send:
        writer.writeByte(1);
        break;
      case TransactionTransferMethod.own:
        writer.writeByte(2);
        break;
      case TransactionTransferMethod.unknown:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTransferMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
