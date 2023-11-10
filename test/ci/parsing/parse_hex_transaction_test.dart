import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:web3dart/web3dart.dart';
import 'package:walletkit_dart/src/utils/bigint_utils.dart';

void main() {
  test('parse hex transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    DecodedRLP en = decodeRLP(message, 0);

    BigInt nonceFromTx = parseAsHexBigInt(en.result[0]);
    BigInt gasPriceFromTx = parseAsHexBigInt(en.result[1]);
    BigInt gasLimitFromTx = parseAsHexBigInt(en.result[2]);
    String evmAddressFromTx = en.result[3];
    BigInt valueFromTx = parseAsHexBigInt(en.result[4]);

    Uint8List data = Uint8List.fromList(hex.decode(en.result[6]));

    String functionSignature = hex.encode(data.sublist(0, 4));

    if (functionSignature == "59454e49") {
      print("ERC 20 Token detected!");
    }

    final Transaction tx = getTransactionFromMessageHash(unsignedTxFromNomo);

    expect(nonceFromTx, BigInt.from(1864));
    expect(gasPriceFromTx, BigInt.from(10000000000));
    expect(gasLimitFromTx, BigInt.from(21000));
    expect(evmAddressFromTx,
        "05870f1507d820212E921e1f39f14660336231D1".toLowerCase());
    expect(valueFromTx, BigInt.from(100000000000000000));
  });
}
