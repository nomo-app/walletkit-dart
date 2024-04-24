import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_contract_type.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_transaction.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../utils.dart';
import 'derive_address_test.dart';

void main() {
  test('Decode Raw Transaction & Rebuild it', () {
    final hex =
        "0a8a010a0261202208a3636ac7209ee5bd4087a78dfef0315a67080112630a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412320a15417f9dc8311e51c1685764bbb0f5ceac7ad79b01281215411226d9d2d336d60e42496133790d6a69af045e3318c0843d70c7d7e8fdf0319001c0843d12415db5f02f81c38320a7f1b8566451e2784ed209c6f2fa7b9b81821c6cbc8add12269d61ca867ec18c193917a754129072bc0682ad30f097495269736a877e08e71c";

    final transaction = tron.Transaction.fromBuffer(hex.hexToBytes);

    final contract = transaction.rawData.contract.first.parameter
        .unpackInto(TransferContract());

    expect(transaction.rawData.timestamp.toInt(), 1713955810247);
    expect(contract.amount, Int64(1E6.toInt()));
    expect(contract.ownerAddress, base58ToHex(tronAddress));
    expect(contract.toAddress, base58ToHex(tronAddress1));

    final seed = loadFromEnv("TRON_SEED");

    final result = simulateTrxSendTransaction(
      transaction: transaction,
      seed: seed,
    );
    expect(result, true);
  });

  test('Test TxID', () {
    final raw =
        "0a020fc922085ff2b5033581620340b89786e0f0315a65080112610a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412300a15417f9dc8311e51c1685764bbb0f5ceac7ad79b01281215411226d9d2d336d60e42496133790d6a69af045e33180170d8c282e0f031";

    final id = sha256Hash(raw.hexToBytes);

    expect(id.toHex,
        "6e0323232e2b05d46624ac4a3fb6dd086b222a5f088b74d90620f1c9736af7ba");
  });

  test('Test Transfer Contract Creation', () {
    final contract_ = TransferContract(
      ownerAddress: base58Decode(tronAddress),
      toAddress: base58Decode(tronAddress1),
      amount: Int64(1),
    );

    final value = contract_.writeToBuffer();

    final contractValue =
        "0a15417f9dc8311e51c1685764bbb0f5ceac7ad79b01281215411226d9d2d336d60e42496133790d6a69af045e331801";

    expect(value.toHex, contractValue);

    final contract = TransferContract.fromBuffer(contractValue.hexToBytes);

    expect(
      base58CheckFromHex(contract.ownerAddress.toUint8List),
      tronAddress,
    );
    expect(
      base58CheckFromHex(contract.toAddress.toUint8List),
      tronAddress1,
    );
    expect(contract.amount.toInt(), 1);
  });
}

bool simulateTrxSendTransaction({
  required tron.Transaction transaction,
  required Uint8List seed,
}) {
  final rawTx = transaction.rawData;

  final timestamp = rawTx.timestamp.toInt();
  final expiration = rawTx.expiration.toInt();
  final feeLimit = rawTx.feeLimit.toInt();
  final refBlockBytes = rawTx.refBlockBytes.toUint8List;
  final refBlockHash = rawTx.refBlockHash.toUint8List;

  final contract =
      rawTx.contract.first.parameter.unpackInto(TransferContract());

  final from = base58CheckFromHex(contract.ownerAddress.toUint8List);
  final to = base58CheckFromHex(contract.toAddress.toUint8List);
  final amount_int = contract.amount.toInt().toBigInt;
  final amount = Amount(value: amount_int, decimals: 6);

  final new_raw_tx = createRawTransaction(
    data: TronTransferContractData(to: to, from: from, amount: amount),
    refBlockBytes: refBlockBytes,
    refBlockHash: refBlockHash,
    expiration: expiration,
    timestamp: timestamp,
    feeLimit: feeLimit,
  );

  final txID = sha256Hash(new_raw_tx.writeToBuffer());

  final signature = createTxSignature(
    txID: txID,
    seed: seed,
  );

  if (signature.toHex != transaction.signature.first.toUint8List.toHex) {
    return false;
  }

  return true;
}
