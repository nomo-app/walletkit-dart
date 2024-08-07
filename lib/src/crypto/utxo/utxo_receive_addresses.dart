import 'package:walletkit_dart/walletkit_dart.dart';

String findUnusedAddress({
  required Iterable<String> addresses,
  required Iterable<UTXOTransaction> txs,
}) {
  for (final address in addresses) {
    if (!txs.any(
      (tx) => tx.outputs.any((output) => output.node.address == address),
    )) {
      return address;
    }
  }

  throw Exception("No address found");
}
