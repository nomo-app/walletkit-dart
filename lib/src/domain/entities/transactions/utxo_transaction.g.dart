// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utxo_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UTXOTransactionAdapter extends TypeAdapter<UTXOTransaction> {
  @override
  final int typeId = 3;

  @override
  UTXOTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UTXOTransaction(
      block: fields[1] as int,
      fee: fields[6] as Amount,
      hash: fields[0] as String,
      timeMilli: fields[3] as int,
      amount: fields[5] as Amount,
      sender: fields[7] as String,
      recipient: fields[8] as String,
      token: fields[4] as TokenEntity,
      transferMethod: fields[9] as TransactionTransferMethod,
      confirmations: fields[2] as int,
      status: fields[10] as ConfirmationStatus,
      inputs: (fields[12] as List).cast<ElectrumInput>(),
      outputs: (fields[13] as List).cast<ElectrumOutput>(),
      id: fields[11] as String,
      version: fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UTXOTransaction obj) {
    writer
      ..writeByte(15)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.inputs)
      ..writeByte(13)
      ..write(obj.outputs)
      ..writeByte(14)
      ..write(obj.version)
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
      other is UTXOTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ElectrumInputAdapter extends TypeAdapter<ElectrumInput> {
  @override
  final int typeId = 4;

  @override
  ElectrumInput read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElectrumInput(
      scriptSig: fields[0] as String?,
      sequence: fields[1] as int?,
      txid: fields[2] as String?,
      vout: fields[3] as int?,
      txinwitness: (fields[4] as List?)?.cast<String>(),
      coinbase: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ElectrumInput obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.scriptSig)
      ..writeByte(1)
      ..write(obj.sequence)
      ..writeByte(2)
      ..write(obj.txid)
      ..writeByte(3)
      ..write(obj.vout)
      ..writeByte(4)
      ..write(obj.txinwitness)
      ..writeByte(5)
      ..write(obj.coinbase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElectrumInputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ElectrumOutputAdapter extends TypeAdapter<ElectrumOutput> {
  @override
  final int typeId = 5;

  @override
  ElectrumOutput read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElectrumOutput(
      scriptPubKey: fields[0] as ElectrumScriptPubKey,
      value: fields[3] as BigInt,
      n: fields[4] as int,
      belongsToUs: fields[1] as bool,
      spent: fields[2] as bool,
      node: fields[5] as NodeWithAddress,
    );
  }

  @override
  void write(BinaryWriter writer, ElectrumOutput obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.scriptPubKey)
      ..writeByte(1)
      ..write(obj.belongsToUs)
      ..writeByte(2)
      ..write(obj.spent)
      ..writeByte(3)
      ..write(obj.value)
      ..writeByte(4)
      ..write(obj.n)
      ..writeByte(5)
      ..write(obj.node);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElectrumOutputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ElectrumScriptPubKeyAdapter extends TypeAdapter<ElectrumScriptPubKey> {
  @override
  final int typeId = 6;

  @override
  ElectrumScriptPubKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElectrumScriptPubKey(
      addresses: (fields[0] as List?)?.cast<String>(),
      asm: fields[1] as String?,
      hexString: fields[2] as String,
      reqSigs: fields[3] as int?,
      type: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ElectrumScriptPubKey obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.addresses)
      ..writeByte(1)
      ..write(obj.asm)
      ..writeByte(2)
      ..write(obj.hexString)
      ..writeByte(3)
      ..write(obj.reqSigs)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElectrumScriptPubKeyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotAvaialableUTXOTransactionAdapter
    extends TypeAdapter<NotAvaialableUTXOTransaction> {
  @override
  final int typeId = 21;

  @override
  NotAvaialableUTXOTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotAvaialableUTXOTransaction(
      fields[0] as String,
      fields[1] as int,
      fields[4] as TokenEntity,
    );
  }

  @override
  void write(BinaryWriter writer, NotAvaialableUTXOTransaction obj) {
    writer
      ..writeByte(15)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.inputs)
      ..writeByte(13)
      ..write(obj.outputs)
      ..writeByte(14)
      ..write(obj.version)
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
      other is NotAvaialableUTXOTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
