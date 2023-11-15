import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/nomoDevToken_contract.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/crypto.dart';

void main() {
  test('extract functionSignature mint from the transaction', () {
    const String unsignedTxFromNomo = // from nomo.signEvmTransaction
        "0xf86982074b8504a817c80083029810946d3be2fca848393ee83b2a1d65b312889cacf5e680b84440c10f1900000000000000000000000005870f1507d820212e921e1f39f14660336231d10000000000000000000000000000000000000000000000000000000000f34344";
    final message = Uint8List.fromList(
      hex.decode(
        unsignedTxFromNomo.replaceFirst("0x", ""),
      ),
    );

    final DecodedRLP en = decodeRLP(message, 0);

    final Uint8List data = Uint8List.fromList(hex.decode(en.result[5]));

    final String functionSignature = hex.encode(data.sublist(0, 4));

    final abi = contractNomoDevToken;

    final functions = abi.functions;

    final function = functions.firstWhere(
      (element) {
        String readableFunctionSignature = element.name +
            "(${element.parameters.map((e) => e.type.name).join(",")})";

        Uint8List bytes = Uint8List.fromList(
            hex.decode(hex.encode(readableFunctionSignature.codeUnits)));

        String functionSignatureHash = hex.encode(keccak256(bytes));

        if (functionSignatureHash.substring(0, 8) == functionSignature) {
          return true;
        } else {
          return false;
        }
      },
    );

    String readableFunctionSignature = function.name +
        "(${function.parameters.map((e) => e.type.name).join(",")})";

    expect(readableFunctionSignature, "mint(address,uint256)");
  });
}
