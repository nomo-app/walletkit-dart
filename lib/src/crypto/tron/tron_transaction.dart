import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart';

import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_contract_type.dart';
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/src/crypto/secp256k1.dart' as secp256k1;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;

const energyPrice = 420; // Price per energy unit in SUN
const bandWidthPrice = 1000; // Price per bandwidth unit in SUN

const maxReturnFieldSize = 64;
const protoBufferHeaderSize = 5;

final dummySeed = helloSeed;

/// Used for calculating the bandwidth of a transaction (Size in Bytes)
/// Builds a Dummy Transaction and calculates the size of the transaction
/// https://github.com/tronprotocol/wallet-cli/issues/292
Future<int> calculateTransactionSize(TronContractData contractData) async {
  final rawTx = await buildRawTransaction(contractData);

  final tx = signTransaction(
    rawTx: rawTx,
    seed: dummySeed,
  );

  final rawDataLength = tx.rawData.writeToBuffer().length;
  final sigLength = tx.signature.first.toUint8List.length;

  final headerSize = (rawDataLength > 127 ? 3 : 2) + 2;

  return rawDataLength + sigLength + headerSize + maxReturnFieldSize;
}

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
  final signature = createTxSignature(
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

// TODO: Convert to Non Future => pass Current Block as parameter
Future<Transaction_raw> buildRawTransaction(
  TronContractData contractData, {
  int feeLimit = 10000000,
}) async {
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
    data: contractData,
    refBlockBytes: refBlockBytes,
    refBlockHash: refBlockHash,
    expiration: expiration,
    timestamp: timestamp,
    feeLimit: feeLimit, // 10 TRX
  );

  return rawTx;
}

Transaction signTransaction({
  required Transaction_raw rawTx,
  required Uint8List seed,
}) {
  final txId = sha256Hash(rawTx.writeToBuffer());

  final signature = createTxSignature(
    txID: txId,
    seed: seed,
  );

  final tx = tron.Transaction(
    rawData: rawTx,
    signature: [signature],
  );

  return tx;
}

tron.Transaction_raw createRawTransaction({
  required TronContractData data,
  required Uint8List refBlockBytes,
  required Uint8List refBlockHash,
  required int expiration,
  required int timestamp,
  int? feeLimit,
}) {
  final contract = data.createContract();

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

Uint8List createTxSignature({
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
