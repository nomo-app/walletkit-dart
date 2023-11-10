import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test('Parse a message hex to Transaction', () {
    const String messageHex =
        "0xf38207418502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    const String evmAddress = "05870f1507d820212e921e1f39f14660336231d1";
    BigInt nonce = BigInt.from(1857);
    BigInt gasPrice = BigInt.from(10000000000);
    BigInt gasLimit = BigInt.from(21000);
    BigInt value = BigInt.from(100000000000000000);

    final message = Uint8List.fromList(
      hex.decode(
        messageHex.replaceFirst("0x", ""),
      ),
    );

    DecodedRLP en = decodeRLP(message, 0);
    print(en.result);

    BigInt nonceFromTx = BigInt.parse(en.result[0], radix: 16);
    BigInt gasPriceFromTx = BigInt.parse(en.result[1], radix: 16);
    BigInt gasLimitFromTx = BigInt.parse(en.result[2], radix: 16);
    String evmAddressFromTx = en.result[3];
    BigInt valueFromTx = BigInt.parse(en.result[4], radix: 16);

    Uint8List data = Uint8List.fromList(hex.decode(en.result[6]));

    print(data);
    String functionSignature = hex.encode(data.sublist(0, 4));

    if (functionSignature == "59454e49") {
      print("ERC 20 Token detected!");
    }

    Transaction tx = getTransactionFromMessageHash(messageHex);
    expect(nonceFromTx, nonce);
    expect(gasPriceFromTx, gasPrice);
    expect(gasLimitFromTx, gasLimit);
    expect(evmAddressFromTx, evmAddress);
    expect(valueFromTx, value);
  });
}
