import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/rlp.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test('Parse a message hex to Transaction', () {
    BigInt parseBigInt(String value) {
      BigInt result = value.startsWith("0x")
          ? BigInt.parse(value.substring(2), radix: 16)
          : BigInt.parse(value, radix: 16);

      return result;
    }

    const String messageHex =
        "0xf38207488502540be4008252089405870f1507d820212e921e1f39f14660336231d188016345785d8a0000808559454e49518080";

    const String evmAddress = "05870f1507d820212E921e1f39f14660336231D1";
    BigInt nonce = BigInt.from(1864);
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
    BigInt nonceFromTx = parseBigInt(en.result[0]);
    BigInt gasPriceFromTx = parseBigInt(en.result[1]);
    BigInt gasLimitFromTx = parseBigInt(en.result[2]);
    String evmAddressFromTx = en.result[3];
    BigInt valueFromTx = parseBigInt(en.result[4]);

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
    expect(evmAddressFromTx.toLowerCase(), evmAddress.toLowerCase());
    expect(valueFromTx, value);
  });
}
