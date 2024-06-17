import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  /// Send ZeniqSmart to own Wallet
  const String unsignedTxFromNomo = // from nomo.signEvmTransaction
      "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";
  test('parse hex transaction', () {
    final RawEVMTransaction tx =
        RawEVMTransaction.getFromMessageHex(unsignedTxFromNomo);

    expect(tx.nonce, BigInt.from(1864));
    expect(tx.gasPrice, BigInt.from(10000000000));
    expect(tx.gasLimit, BigInt.from(21000));
    expect(tx.to, "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(tx.value, BigInt.from(100000000000000000));
    expect(tx.data, []);
    expect(tx.chainId, BigInt.from(383414847825));
  });

  test('arrayify test', () {
    int value = 123456;
    Uint8List byteArray = arrayifyInteger(value);

    int result = unarrayifyInteger(byteArray, 0, byteArray.length);

    expect(result, value);
  });

  test('rlp encode', () {
    final message =
        Uint8List.fromList(hex.decode(unsignedTxFromNomo.replaceAll("0x", "")));

    DecodedRLP decoded = decodeRLP(message, 0);

    final encoded = encode(decoded.result);

    expect("0x" + encoded, unsignedTxFromNomo);
  });

  test('serialize tx', () {
    final RawEVMTransaction tx =
        RawEVMTransaction.getFromMessageHex(unsignedTxFromNomo);

    final messageHex = tx.serializedTransactionHex;

    expect(messageHex, unsignedTxFromNomo);
  });
}
