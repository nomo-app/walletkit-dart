//
// message raw {
//   bytes ref_block_bytes = 1;//The bytes from 6 to 8(not included) of the height of the latest block
//   int64 ref_block_num = 3;//The height of the latest block.Optional.
//   bytes ref_block_hash = 4;//The bytes from the 8 to 16(not included) of the hash of the latest block
//   int64 expiration = 8;// Use the latest block time plus N minutes as the value of expiration time('N' can be modified in the configuration file of the local node, if using a public node, the default 'N' is one minute).The network judgment condition is if (expiration > latest block time and expiration < latest block time + 24 hours) means the transaction is in period of validity. Otherwise, it will be an overdue transaction, will not be accepted by the Mainnet.
//   repeated authority auths = 9;//Permission setting
//   // data not used
//   bytes data = 10;//Unused field, can be used for remark information, optional
//   //only support size = 1,  repeated list here for extension
//   repeated Contract contract = 11;//The contract data
//   // scripts not used
//   bytes scripts = 12;//Unused field, can be used for remark information, optional
//   int64 timestamp = 14;//Create transaction time
//   int64 fee_limit = 18;//Threshold for trx consumption due to insufficient resources
// }
//

import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

class TronRawTransaction {
  final int timestamp;
  final int fee_limit;
  final int expiration;
  final String ref_block_bytes;
  final String ref_block_hash;

  const TronRawTransaction({
    required this.timestamp,
    required this.fee_limit,
    required this.expiration,
    required this.ref_block_bytes,
    required this.ref_block_hash,
  });

  Uint8List get bytes {
    final buffer = Uint8List(24);

    return buffer;
  }

  static TronRawTransaction fromHex(String hex) {
    final bytes = hex.hexToBytes;

    final ref_block_bytes = bytes.readSlice(2, 2).$1.toHex;

    final ref_block_hash = bytes.readSlice(6, 8).$1.toHex;

    final expiration = bytes.bytes.readUint64(16).$1.toBigInt;

    throw UnimplementedError();
  }
}

RawTransaction sendTRX({
  required BigInt amount,
  required String from,
  required String to,
}) {
  assert(amount > BigInt.zero, "Amount must be greater than zero");
  assert(from.isNotEmpty, "From address must not be empty");
  assert(to.isNotEmpty, "To address must not be empty");

  final data = {
    "to_address": base58ToHex(to),
    "owner_address": base58ToHex(from),
    "amount": amount.toString(),
  };

  throw UnimplementedError();
}
