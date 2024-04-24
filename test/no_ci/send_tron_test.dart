import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_contract_type.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_transaction.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../tron/derive_address_test.dart';
import '../utils.dart';

void main() {
  test('Send TRX', () async {
    final seed = loadFromEnv("TRON_SEED");

    final txID = await sendTRX(
      from: tronAddress,
      to: tronAddress1,
      amount: Amount(value: 1.toBigInt, decimals: 6),
      seed: seed,
    );

    print(txID);
  });

  test('Send Contract (TRX Transfer)', () async {
    final seed = loadFromEnv("TRON_SEED");
    final tronHTTP = TronHTTPRepository(
      apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
    );

    final contractData = TronTransferContractData(
      from: tronAddress,
      to: tronAddress1,
      amount: Amount.convert(value: 1, decimals: 6),
    );

    final (bandwidth: balance, energy: _) =
        await tronHTTP.getAccountResource(address: tronAddress);
    final bandWidth = await calculateTransactionSize(contractData);
    final feeLimit = balance >= bandWidth ? 0 : bandWidth * bandWidthPrice;

    final rawTx = await buildRawTransaction(contractData, feeLimit: feeLimit);

    final tx = signTransaction(
      rawTx: rawTx,
      seed: seed,
    );

    final serialized = tx.writeToBuffer().toHex;

    final result = await tronHTTP.broadcastCastTransactionHex(serialized);

    print(result);
  });

  test('Send Contract (TRC20 Transfer)', () async {
    final seed = loadFromEnv("TRON_SEED");
    final tronHTTP = TronHTTPRepository(
      apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
    );

    final contractData = TronTRC20TransferContractData(
      contractAddress: tronUSDTAddress,
      ownerAddress: tronAddress,
      recipient: tronAddress1,
      amount: Amount.convert(value: 1, decimals: 6),
    );
    final (bandwidth: balance, energy: energyBalance) =
        await tronHTTP.getAccountResource(address: tronAddress);
    final energyUsed = await tronHTTP.estimateEnergy(contractData.contract);
    final bandwidth = await calculateTransactionSize(contractData);

    final bandWidthFee = balance >= bandwidth ? 0 : bandwidth * bandWidthPrice;
    final energyFee =
        energyBalance >= energyUsed ? 0 : energyUsed * energyPrice;
    final feeLimit = bandWidthFee + energyFee;

    final rawTx = await buildRawTransaction(contractData, feeLimit: feeLimit);

    final tx = signTransaction(
      rawTx: rawTx,
      seed: seed,
    );

    final serialized = tx.writeToBuffer().toHex;

    final result = await tronHTTP.broadcastCastTransactionHex(serialized);

    print(result);
  });
}
