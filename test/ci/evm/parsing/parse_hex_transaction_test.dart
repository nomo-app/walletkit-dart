import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  /// Send ZeniqSmart to own Wallet
  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "f38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  test('parse hex transaction', () {
    final tx = RawEVMTransactionType0.fromHex(unsignedTxFromNomo);

    expect(tx.nonce, BigInt.from(1864));
    expect(tx.gasPrice, BigInt.from(10000000000));
    expect(tx.gasLimit, BigInt.from(21000));
    expect(tx.to, "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(tx.value, BigInt.from(100000000000000000));
    expect(tx.data, []);
    // expect(tx.chainId, BigInt.from(383414847825));
  });

  test('rlp encode', () {
    final message =
        Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));

    final decoded = decodeRLP(message).$1;

    final encoded = encodeRLP(decoded);

    expect(encoded.toHex, unsignedTxFromNomo);
  });

  test('serialize tx', () {
    final RawEVMTransactionType0 tx =
        RawEVMTransactionType0.fromHex(unsignedTxFromNomo);

    final messageHex = tx.serializedUnsigned(ZeniqSmartNetwork.chainId).toHex;

    expect(messageHex, unsignedTxFromNomo);
  });

  test('Parse hex string to RawEvmTransaction', () {
    STRICT_RLP_DECODE = true;
    const msgHex =
        "f86b8151843b9aca00830124f894e9e7CEA3DedcA5984780Bafc599bD69ADd087D5680b844a9059cbb000000000000000000000000a7fa4bb0bba164f999e8c7b83c9da96a3be44616000000000000000000000000000000000000000000000000000000000000271081388080";

    expect(
      () => RawEvmTransaction.fromUnsignedHex(msgHex),
      throwsA(
        isA<RLPException>(),
      ),
    );

    STRICT_RLP_DECODE = false;

    final tx = RawEvmTransaction.fromUnsignedHex(msgHex);

    expect(tx.nonce, BigInt.from(81));
    expect(tx.value, BigInt.zero);
  });
}
