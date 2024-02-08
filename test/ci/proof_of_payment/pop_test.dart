@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/proof_of_payment.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../utils.dart';

/// Validation
/// 1: Check Format of POP

/// 2: Check that locktime is 499999999
/// 3: Check that the tx has only one output and its value is 0
/// 4: Check that the POP inputs are the same as the RawTx inputs except the sequence
/// 6: Run the Scripts of the inputs and check that they are valid
/// 7: Check that the TxID (in output) of the POP is the same as the TxID of the RawTx

void main() {
  test('Bitcoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: BitcoinNetwork,
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy, AddressType.segwit],
    );
    final selectedTx = txList.first;

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: BitcoinNetwork,
    );

    var publicKey = selectedTx.inputs.first.publicKey;
    var result = popResult.verifiyPop(0, publicKey!);
    expect(result, true);

    publicKey = selectedTx.inputs[1].publicKey;
    result = popResult.verifiyPop(1, publicKey!);
    expect(result, true);

    publicKey = selectedTx.inputs[2].publicKey;
    result = popResult.verifiyPop(2, publicKey!);
    expect(result, true);
  });

  test('Eurcoin Proof of Payment', () async {
    final devSeed = loadDevSeedFromEnv();

    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: devSeed,
      walletTypes: [HDWalletType.NO_STRUCTURE],
      addressTypes: [AddressType.legacy],
    );
    final selectedTx = txList.first;

    final popResult = await proofOfPayment(
      txid: selectedTx.hash,
      nonce: rejectEVM,
      nodes: nodes.toList(),
      seed: devSeed,
      networkType: EurocoinNetwork,
    );

    final publicKey = selectedTx.inputs.first.publicKey;

    expect(publicKey, isNotNull);

    var result = popResult.verifiyPop(0, publicKey!);

    expect(result, true);
  });
}
