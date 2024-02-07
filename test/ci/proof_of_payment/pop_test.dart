@Timeout(Duration(minutes: 5))

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';
import '../fetching/serialization_test.dart';

void main() {
  test('Eurocoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );
    final selectedTx = txList.first;

    final usedNodes = [
      for (final input in selectedTx.inputs)
        () {
          final sig = input.getPublicKey(BitcoinNetwork);
          final node = nodes.singleWhereOrNull(
            (node) => node.address == input.getAddress(BitcoinNetwork),
          );
          if (node == null) return null;
          return MapEntry(sig, node);
        }.call()
    ]
        .where((element) => element != null)
        .toList()
        .cast<MapEntry<Uint8List?, NodeWithAddress>>();

    /// Client
    /// 1: We get TxID from other source
    final txId = selectedTx.hash;

    /// 2: We get the RawTx from this TxID
    final serializedTx = await fetchRawTxByHash(txId, BitcoinNetwork);

    final rawTx = BTCRawTransaction.fromHex(serializedTx);

    /// 3: We get the POP from the RawTx
    final (rawUPoP, sigs) = rawTx.toPop(
      networkType: BitcoinNetwork,
      seed: devSeed,
      nonce: 123,
      usedNodes: Map.fromEntries(usedNodes),
    );

    var bip = deriveChildNodeFromPath(
      seed: devSeed,
      childDerivationPath: "1/44",
      networkType: BitcoinNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
    );

    var result = bip.verify(rawUPoP, sigs.first);

    expect(result, true);

    bip = deriveChildNodeFromPath(
      seed: devSeed,
      childDerivationPath: "0/15",
      networkType: BitcoinNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
    );
    result = bip.verify(rawUPoP, sigs[1]);
    expect(result, true);

    bip = deriveChildNodeFromPath(
      seed: devSeed,
      childDerivationPath: "1/43",
      networkType: BitcoinNetwork,
      walletType: HDWalletType.NO_STRUCTURE,
    );
    result = bip.verify(rawUPoP, sigs.last);
    expect(result, true);

    /// 4: We return the POP

    /// Validation
    /// 1: Check Format of POP
    /// 2: Check that locktime is 499999999
    /// 3: Check that the tx has only one output and its value is 0
    /// 4: Check that the POP inputs are the same as the RawTx inputs except the sequence
    /// 6: Run the Scripts of the inputs and check that they are valid
    /// 7: Check that the TxID (in output) of the POP is the same as the TxID of the RawTx
  });
}
