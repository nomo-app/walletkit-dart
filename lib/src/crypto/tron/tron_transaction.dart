import 'dart:convert';

import 'dart:typed_data';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:fixnum/fixnum.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/any.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/asset_issue_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/src/crypto/secp256k1.dart' as secp256k1;

Future<String> sendTRX({
  required String from,
  required String to,
  required Amount amount,
  required Uint8List seed,
}) async {
  assert(amount.value > 0.toBigInt, 'Amount must be greater than 0');
  assert(from != to, 'From and To must be different');
  assert(from.isNotEmpty, 'From address must not be empty');
  assert(to.isNotEmpty, 'To address must not be empty');

  final tronHTTP = TronHTTPRepository(
    apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
  );

  final rawTx = await tronHTTP.createTransaction(
    ownerAddress: from,
    toAddress: to,
    amount: amount,
  );

  final txId = (rawTx['txID'] as String).hexToBytes;

  /// Signatures
  final signature = signTransaction(
    txID: txId,
    seed: seed,
  );

  rawTx['signature'] = [
    signature.toHex,
  ];

  final result = await tronHTTP.broadcastTransaction(json: rawTx);

  final txID = result['txID'] as String;

  return txID;
}

Future<String> sendTRXWithProto({
  required String from,
  required String to,
  required Amount amount,
  required Uint8List seed,
}) async {
  assert(amount.value > 0.toBigInt, 'Amount must be greater than 0');
  assert(from != to, 'From and To must be different');
  assert(from.isNotEmpty, 'From address must not be empty');
  assert(to.isNotEmpty, 'To address must not be empty');

  final tronHTTP = TronHTTPRepository(
    apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
  );

  final block = await tronHTTP.getBlock();

  final blockId = (block['blockID'] as String).hexToBytes;
  final refBlockHash = blockId.sublist(8, 16);

  final blockNumberBytes = (block['block_header']['raw_data']['number'] as int)
      .toBigInt
      .bigIntToBytes;
  final refBlockBytes = blockNumberBytes.sublist(
    blockNumberBytes.length - 2,
    blockNumberBytes.length,
  );

  final now = DateTime.now();
  final timestamp = now.millisecondsSinceEpoch;
  final expiration = now.add(Duration(minutes: 10)).millisecondsSinceEpoch;

  final rawTx = createRawTransaction(
    data: TronTransferContractData(to: to, from: from, amount: amount),
    refBlockBytes: refBlockBytes,
    refBlockHash: refBlockHash,
    expiration: expiration,
    timestamp: timestamp,
    // feeLimit: 1E6.toInt(), // 10 TRX
  );

  final txId = sha256Hash(rawTx.writeToBuffer());

  /// Signatures
  final signature = signTransaction(
    txID: txId,
    seed: seed,
  );

  final tx = tron.Transaction(
    rawData: rawTx,
    signature: [signature],
  );

  // final serializedTx = tx.writeToBuffer().toHex;

  // final result = await tronHTTP.broadcastCastTransactionHex(serializedTx);

  final json = {
    'txID': txId.toHex,
    'signature': [signature.toHex],
    'raw_data': {
      'contract': [
        {
          'type': 'TransferContract',
          'parameter': {
            'value': {
              'amount': amount.value.toInt(),
              'owner_address': from,
              'to_address': to,
            },
            'type_url': 'type.googleapis.com/protocol.TransferContract',
          },
        },
      ],
      'ref_block_bytes': refBlockBytes.toHex,
      'ref_block_hash': refBlockHash.toHex,
      'expiration': expiration,
      'timestamp': timestamp,
    },
  };

  final result = await tronHTTP.broadcastTransaction(json: json);

  final txID = result['txID'] as String;

  return txID;
}

sealed class TronContractData {
  const TronContractData();

  $pb.GeneratedMessage get contract;
}

final class TronTransferContractData extends TronContractData {
  final String to;
  final String from;
  final Amount amount;

  const TronTransferContractData({
    required this.to,
    required this.from,
    required this.amount,
  });

  @override
  TransferContract get contract {
    print("From:" + from);
    print("From decoded:" + base58decode(from).toString());
    print("To:" + to);
    final contract = TransferContract(
      ownerAddress: base58decode(from),
      toAddress: base58decode(to),
      amount: Int64(amount.value.toInt()),
    );

    return contract;
  }
}

final class TronTransferAssetContractData extends TronContractData {
  final String to;
  final String from;
  final String assetName;
  final Amount amount;

  const TronTransferAssetContractData({
    required this.to,
    required this.from,
    required this.amount,
    required this.assetName,
  });

  @override
  TransferAssetContract get contract {
    return TransferAssetContract(
      ownerAddress: from.hexToBytes,
      toAddress: to.hexToBytes,
      assetName: assetName.hexToBytes,
      amount: Int64(amount.value.toInt()),
    );
  }
}

tron.Transaction_raw createRawTransaction({
  required TronTransferContractData data,
  required Uint8List refBlockBytes,
  required Uint8List refBlockHash,
  required int expiration,
  required int timestamp,
  int? feeLimit,
}) {
  final contract = createContract(data);

  final tx = tron.Transaction_raw(
    contract: [
      contract,
    ],
    refBlockBytes: refBlockBytes,
    refBlockHash: refBlockHash,
    expiration: Int64(expiration),
    timestamp: Int64(timestamp),
    feeLimit: feeLimit != null ? Int64(feeLimit) : null,
  );

  return tx;
}

tron.Transaction_Contract createContract(TronContractData data) {
  return switch (data) {
    TronTransferContractData data => tron.Transaction_Contract(
        type: tron.Transaction_Contract_ContractType.TransferContract,
        parameter: Any.pack(data.contract),
      ),
    TronTransferAssetContractData data => tron.Transaction_Contract(
        type: tron.Transaction_Contract_ContractType.TransferAssetContract,
        parameter: Any.pack(data.contract),
      ),
  };
}

// Uint8List signMessage({
//   required String message,
//   required NetworkType type,
//   required Uint8List seed,
// }) {
//   final messageWithoutPrefix = message.replaceAll('0x', '');
//   final messageHeader = utf8.encode(type.messagePrefix);
//   final messageBytes = Uint8List.fromList([
//     ...messageHeader,
//     ...messageWithoutPrefix.hexToBytes,
//   ]);

//   final digest = keccak256(messageBytes);

//   final credentials = getTronCredentials(seed: seed);

//   final sig = credentials.signToEcSignature(digest);

//   final signatureBytes = Uint8List.fromList(
//     [
//       ..."0x".hexToBytes,
//       ...sig.r.bigIntToBytes,
//       ...sig.s.bigIntToBytes,
//       ...sig.v.toHex.hexToBytes,
//     ],
//   );

//   return signatureBytes;
// }

Uint8List signTransaction({
  required Uint8List txID,
  required Uint8List seed,
}) {
  final credentials = getTronCredentials(seed: seed);
  final sig = secp256k1.sign(txID, credentials.$1);

  final r = padUint8ListTo32(sig.r.bigIntToBytes);
  final s = padUint8ListTo32(sig.s.bigIntToBytes);
  final v = (BigInt.from(sig.v)).bigIntToBytes;

  final sigBuffer = uint8ListFromList(r + s + v);

  return sigBuffer;
}

(Uint8List, Uint8List) getTronCredentials({required Uint8List seed}) {
  final node = deriveNode(seed, tronBip44HDPath.defaultPath);
  return (node.privateKey!, node.publicKeyUncompressed);
}
