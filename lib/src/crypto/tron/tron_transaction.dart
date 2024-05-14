import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/src/common/http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart';

import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/src/crypto/secp256k1.dart' as secp256k1;
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;

export 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart'
    show Transaction_raw;
export 'package:walletkit_dart/src/crypto/tron/tron_contract_type.dart';

part 'tron_transaction.g.dart';

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
  final blockNumberBytes = block.blockNumber.toBigInt.bigIntToBytes;
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

  print(credentials.$2.toHex);

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

@HiveType(typeId: 26)
final class TronTransaction extends EVMTransaction {
  const TronTransaction({
    required super.hash,
    required super.block,
    required super.confirmations,
    required super.timeMilli,
    required super.amount,
    required super.fee,
    required super.sender,
    required super.recipient,
    required super.transferMethod,
    required super.token,
    required super.status,
    required super.input,
  });

  static TronTransaction? fromJson(
    Json json,
    TokenEntity token,
    String walletAddress,
  ) {
    /// TRC20 Transaction TRONSCAN
    if (json
        case {
          "hash": String hash,
          "from": String from,
          "to": String to,
          "amount": String value_s,
          "block_timestamp": int block_timestamp,
          "block": int block,
          "confirmed": int confirmed,
          "direction": int direction,
        }) {
      final value = BigInt.parse(value_s);
      final amount = Amount(value: value, decimals: token.decimals);

      return TronTransaction(
        token: token,
        hash: hash,
        block: block,
        timeMilli: block_timestamp,
        recipient: to,
        sender: from,
        amount: amount,
        fee: null,
        transferMethod: switch (direction) {
          2 => TransactionTransferMethod.receive,
          1 => TransactionTransferMethod.send,
          _ => TransactionTransferMethod.unknown,
        },
        confirmations: 0,
        status: switch (confirmed) {
          1 => ConfirmationStatus.confirmed,
          0 => ConfirmationStatus.pending,
          _ => ConfirmationStatus.failed,
        },
        input: Uint8List(0),
      );
    }

    /// TRX Transaction TRONSCAN
    if (json
        case {
          "block": int block,
          "hash": String hash,
          "ownerAddress": String ownerAddress,
          "toAddress": String toAddress,
          "fee": String fee_s,
          "amount": String amount_s,
          "timestamp": int timestamp,
          "confirmed": bool confirmed,
          "riskTransaction": bool riskTransaction,
          "contractData": JSON contractData,
        }) {
      if (riskTransaction) {
        return null;
      }

      final input =
          (contractData['data'] as String?)?.hexToBytes ?? Uint8List(0);

      final fee_bi = BigInt.tryParse(fee_s);
      final feeAmount =
          fee_bi != null ? Amount(value: fee_bi, decimals: 6) : null;

      final amount_bi = BigInt.tryParse(amount_s) ?? BigInt.zero;
      final amount = Amount(value: amount_bi, decimals: 6);

      final transferMethod = walletAddress == ownerAddress
          ? TransactionTransferMethod.send
          : TransactionTransferMethod.receive;

      return TronTransaction(
        hash: hash,
        block: block,
        confirmations: 0,
        timeMilli: timestamp,
        amount: amount,
        fee: feeAmount,
        sender: ownerAddress,
        recipient: toAddress,
        transferMethod: transferMethod,
        token: token,
        status: switch (confirmed) {
          true => ConfirmationStatus.confirmed,
          false => ConfirmationStatus.pending,
        },
        input: input,
      );
    }

    ///
    /// TRX Transaction RPC
    ///
    if (json
        case {
          "txID": String hash,
          "net_usage": int _,
          "net_fee": int netFee,
          "energy_usage": int _,
          "energy_fee": int energyFee,
          "blockNumber": int block,
          "block_timestamp": int block_timestamp,
          "raw_data_hex": String raw_data_hex,
        }) {
      final fee = Amount(
        value: BigInt.from(netFee + energyFee),
        decimals: 6,
      );

      final rawData = raw_data_hex.hexToBytes;
      final tron.Transaction_raw rawTx =
          tron.Transaction_raw.fromBuffer(rawData);

      final contract = rawTx.contract.first;
      final contractType = contract.type;

      final TronContractData contractData;

      try {
        contractData = TronContractData.from(contractType, contract.parameter);
      } on UnsupportedError {
        return null;
      }

      return switch (contractData) {
        TronTransferContractData data => TronTransaction(
            hash: hash,
            block: block,
            confirmations: 1,
            timeMilli: block_timestamp,
            amount: Amount(
              value: data.amount,
              decimals: token.decimals,
            ),
            fee: fee,
            sender: data.from,
            recipient: data.to,
            transferMethod: data.from == walletAddress
                ? TransactionTransferMethod.send
                : TransactionTransferMethod.receive,
            token: token,
            status: ConfirmationStatus.confirmed,
            input: Uint8List(0),
          ),
        TronTransferAssetContractData data => TronTransaction(
            hash: hash,
            block: block,
            confirmations: 1,
            timeMilli: block_timestamp,
            amount: Amount(
              value: data.amount,
              decimals: token.decimals,
            ),
            fee: fee,
            sender: data.from,
            recipient: data.to,
            transferMethod: data.from == walletAddress
                ? TransactionTransferMethod.send
                : TransactionTransferMethod.receive,
            token: token,
            status: ConfirmationStatus.confirmed,
            input: Uint8List(0),
          ),
        _ => throw UnimplementedError(),
      };
    }

    throw UnimplementedError();
  }
}
