import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/Tron.pb.dart';

import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/Tron.pb.dart'
    as tron;

export 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/Tron.pb.dart'
    show Transaction_raw;
export 'package:walletkit_dart/src/crypto/tron/entities/tron_contract_type.dart';

const energyPrice = 420; // Price per energy unit in SUN
const bandWidthPrice = 1000; // Price per bandwidth unit in SUN

const maxReturnFieldSize = 64;
const protoBufferHeaderSize = 5;

const tronInitialBlockTimestamp = 1529891469000;

const TronBlockInfo tronDummyBlock = (
  blockId: '0000000003accb92e18c15be0680c23f217731bdf0a453d5a89c0bb80d2713f3',
  blockNumber: 1,
);

final dummySeed = helloSeed;

/// Used for calculating the bandwidth of a transaction (Size in Bytes)
/// Builds a Dummy Transaction and calculates the size of the transaction
/// https://github.com/tronprotocol/wallet-cli/issues/292
int calculateTransactionSize(TronContractData contractData) {
  final rawTx = buildRawTransaction(
    contractData,
    block: tronDummyBlock,
  );

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

Transaction_raw buildRawTransaction(
  TronContractData contractData, {
  int feeLimit = 10000000,
  required TronBlockInfo block,
}) {
  final blockId = block.blockId.hexToBytes;
  final refBlockHash = blockId.sublist(8, 16);
  final blockNumberBytes = block.blockNumber.toBigInt.toBytesUnsigned;
  final refBlockBytes = blockNumberBytes.sublist(
    blockNumberBytes.length < 2 ? 0 : blockNumberBytes.length - 2,
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
    feeLimit: feeLimit != null && feeLimit != 0 ? Int64(feeLimit) : null,
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

  final sig =
      Signature.createSignature(txID, credentials.$1, hashPayload: false);

  final r = padUint8ListTo32(sig.r.toBytesUnsigned);
  final s = padUint8ListTo32(sig.s.toBytesUnsigned);
  final v = (BigInt.from(sig.v)).toBytesUnsigned;

  final sigBuffer = uint8ListFromList(r + s + v);

  return sigBuffer;
}

(Uint8List, Uint8List) getTronCredentials({required Uint8List seed}) {
  final node = deriveNode(seed, tronBip44HDPath.defaultPath);
  return (node.privateKey!, node.publicKeyUncompressed);
}
