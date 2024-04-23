import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_transaction.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';
import 'derive_address_test.dart';

void main() {
  test('Decode Raw Transaction', () {
    final hex =
        "0a02c3a42208956374e854a8a6f340a8aad088ef315a69080112650a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412340a15410de86a83909c039b2e64804e4b3743a6f3fdf0bb1215417f9dc8311e51c1685764bbb0f5ceac7ad79b0128188094ebdc0370d4eecc88ef31";

    final trx = tron.Transaction_raw.fromBuffer(hex.hexToBytes);

    expect(trx.timestamp.toInt(), 1713441552212);
  });

  test('Send with JSON', () async {
    final seed = loadFromEnv("TRON_SEED");

    await sendTRX(
      from: tronAddress,
      to: tronAddress1,
      amount: Amount(value: 1.toBigInt, decimals: 6),
      seed: seed,
    );
  });

  test('Send Test with Protobuffers', () async {
    final seed = loadFromEnv("TRON_SEED");

    await sendTRXWithProto(
      from: tronAddress,
      to: tronAddress1,
      amount: Amount(value: 1.toBigInt, decimals: 6),
      seed: seed,
    );
  });

  test('asdasd', () {
    final raw =
        "0a020fc922085ff2b5033581620340b89786e0f0315a65080112610a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412300a15417f9dc8311e51c1685764bbb0f5ceac7ad79b01281215411226d9d2d336d60e42496133790d6a69af045e33180170d8c282e0f031";

    final id = sha256Hash(raw.hexToBytes);

    expect(id.toHex,
        "6e0323232e2b05d46624ac4a3fb6dd086b222a5f088b74d90620f1c9736af7ba");
  });

  test('Test Transfer Contract Creation', () {
    final contract_ = TransferContract(
      ownerAddress: base58decode(tronAddress),
      toAddress: base58decode(tronAddress1),
      amount: Int64(1),
    );

    final value = contract_.writeToBuffer();

    final contractValue =
        "0a147f9dc8311e51c1685764bbb0f5ceac7ad79b012812141226d9d2d336d60e42496133790d6a69af045e331801";

    expect(value.toHex, contractValue);

    final contract = TransferContract.fromBuffer(contractValue.hexToBytes);

    expect(
      base58encode(TRON_ADDRESS_PREFIX, contract.ownerAddress.toUint8List),
      tronAddress,
    );
    expect(
      base58encode(TRON_ADDRESS_PREFIX, contract.toAddress.toUint8List),
      tronAddress1,
    );
    expect(contract.amount.toInt(), 1);
  });

  test('Address Convertion', () {
    final hexAddress = base58ToHex(tronAddress1);
    expect(hexAddress, "411226d9d2d336d60e42496133790d6a69af045e33");
  });
}
