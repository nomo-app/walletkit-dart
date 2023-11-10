import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test('parse hex transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    final DecodedRLP en = decodeRLP(message, 0);

    final Uint8List data = Uint8List.fromList(hex.decode(en.result[6]));

    final String functionSignature = hex.encode(data.sublist(0, 4));
    expect(functionSignature, "59454e49"); // ZEN20

    final Transaction tx = getTransactionFromMessageHash(unsignedTxFromNomo);

    expect(tx.nonce, 1864);
    expect(tx.gasPrice!.getInWei, BigInt.from(10000000000));
    expect(tx.maxGas, 21000);
    expect(tx.to!.hex, "0x05870f1507d820212e921e1f39f14660336231d1");
    expect(tx.value!.getInWei, BigInt.from(100000000000000000));
    //expect(tx.data, ""); // TODO: parse data
  });
}
