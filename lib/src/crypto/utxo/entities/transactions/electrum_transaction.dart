import 'package:walletkit_dart/walletkit_dart.dart';

class ElectrumTransactionInfo {
  final int height;
  final String hash;

  const ElectrumTransactionInfo(
    this.height,
    this.hash,
  );

  factory ElectrumTransactionInfo.fromJson(Map<String, dynamic> json) {
    return ElectrumTransactionInfo(json['height'], json['tx_hash']);
  }

  @override
  bool operator ==(Object other) =>
      other is ElectrumTransactionInfo &&
      other.runtimeType == runtimeType &&
      other.hash == hash;

  @override
  int get hashCode => hash.hashCode;

  NotAvaialableUTXOTransaction getNotAvailableUTXOTransaction(
      CoinEntity token) {
    return NotAvaialableUTXOTransaction(hash, height, token);
  }
}
