import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/api/api.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/web3dart.dart';

import 'derive_address_test.dart';

void main() {
  test('Decode Raw Transaction', () {
    final hex =
        "0a02c3a42208956374e854a8a6f340a8aad088ef315a69080112650a2d747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e5472616e73666572436f6e747261637412340a15410de86a83909c039b2e64804e4b3743a6f3fdf0bb1215417f9dc8311e51c1685764bbb0f5ceac7ad79b0128188094ebdc0370d4eecc88ef31";

    final trx = tron.Transaction_raw.fromBuffer(hex.hexToBytes);

    expect(trx.timestamp.toInt(), 1713441552212);
  });

  test('Create Raw Transaction', () async {
    await sendTRX(
      from: tronAddress,
      to: tronAddress1,
      amount: Amount(value: 1.toBigInt, decimals: 6),
    );
  });
}

Future<void> sendTRX({
  required String from,
  required String to,
  required Amount amount,
}) async {
  assert(amount.value > 0.toBigInt, 'Amount must be greater than 0');
  assert(from != to, 'From and To must be different');
  assert(from.isNotEmpty, 'From address must not be empty');
  assert(to.isNotEmpty, 'To address must not be empty');

  final tronHTTP = TronHTTPRepository(
    apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
  );

  final latestBlock = await tronHTTP.getBlock();

  // BlockExtention.fromJson(latestBlock);

  final blockId = latestBlock['blockID'] as String;
  final ref_block_hash = blockId.substring(16, 32).hexToBytes;

  final blockHeight = (latestBlock['block_header']['raw_data']['number'] as int)
      .toBigInt
      .bigIntToBytes;
  print('Block Height: $blockHeight');
  // final ref_block_bytes = blockHeight.substring(12, 16).hexToBytes;

  final rawTx = tron.Transaction_raw(
    //refBlockBytes: ref_block_bytes,
    refBlockHash: ref_block_hash,
  );
}
