import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/entities/tron_transaction_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../ci/tron/derive_address_test.dart';
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
    final seed = loadFromEnv("DEV_SEED");
    final tronHTTP = TronHTTPRepository(
      apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
    );

    final contractData = TronTransferContractData(
      from: "TDvoNesroeU7fHtwnvYn9Uw1c2hNZ8iBqX",
      to: tronAddress1,
      amount: Amount.convert(value: 1, decimals: 6).value,
    );

    final (bandwidth: balance, energy: _) = await tronHTTP.getAccountResource(
        address: "TDvoNesroeU7fHtwnvYn9Uw1c2hNZ8iBqX");
    final bandWidth = await calculateTransactionSize(contractData);
    final feeLimit = balance >= bandWidth ? 0 : bandWidth * bandWidthPrice;

    final block = await tronHTTP.getBlock();

    final rawTx = await buildRawTransaction(
      contractData,
      feeLimit: feeLimit,
      block: block,
    );

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

    final block = await tronHTTP.getBlock();

    final rawTx = await buildRawTransaction(
      contractData,
      feeLimit: feeLimit,
      block: block,
    );

    final tx = signTransaction(
      rawTx: rawTx,
      seed: seed,
    );

    final serialized = tx.writeToBuffer().toHex;

    final result = await tronHTTP.broadcastCastTransactionHex(serialized);

    print(result);
  });
}
