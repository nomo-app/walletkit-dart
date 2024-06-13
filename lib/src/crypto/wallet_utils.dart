import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
// import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;

export './utxo/derivation.dart';

Future<TokenInfo?> getTokenInfo({
  required String contractAddress,
  required EvmRpcClient client,
}) async {
  final tokenContract = ERC20Contract(
    contractAddress: contractAddress,
    client: client,
  );

  try {
    final result = await Future.wait([
      tokenContract.getDecimals(),
      tokenContract.getName(),
      tokenContract.getSymbol(),
      tokenContract.getSupply(),
    ]);
    int decimals = result[0] as int;
    String name = result[1] as String;
    String symbol = result[2] as String;
    BigInt maxSupply = result[3] as BigInt;
    double maxSupplyDouble = maxSupply.toDouble() / pow(10, decimals);

    return TokenInfo(
      decimals: decimals,
      maxSupply: maxSupplyDouble,
      symbol: symbol,
      name: name,
    );
  } catch (e) {
    return null;
  }
}

String publicKeyToAddress(Uint8List publicKey) {
  final pubKeyWithoutPrefix = keccak256(publicKey.sublist(1));
  return '0x' + pubKeyWithoutPrefix.sublist(12).toHex;
}

String pubKeytoChecksumETHAddress(Uint8List seed) {
  final publicKey = derivePublicKeyETH(seed);
  final pubKeyWithoutPrefix = keccak256(publicKey.sublist(1));

  final address = '0x' + pubKeyWithoutPrefix.sublist(12).toHex;

  final addressWithoutPrefix = address.replaceFirst('0x', '').toLowerCase();

  // Compute the keccak-256 hash of the address
  final hash = keccak256(utf8.encode(addressWithoutPrefix));
  final hashHex = hex.encode(hash);

  // Apply the checksum
  final checksummedAddress = StringBuffer('0x');
  for (int i = 0; i < addressWithoutPrefix.length; i++) {
    if (int.parse(hashHex[i], radix: 16) > 7) {
      checksummedAddress.write(addressWithoutPrefix[i].toUpperCase());
    } else {
      checksummedAddress.write(addressWithoutPrefix[i].toLowerCase());
    }
  }

  return checksummedAddress.toString();
}

String getETHAddressFromMnemonic({
  required String mnemonic,
}) {
  final seed = bip39.mnemonicToSeed(mnemonic);
  final publicKey = derivePublicKeyETH(seed);
  return publicKeyToAddress(publicKey);
}

Uint8List derivePrivateKeyETH(Uint8List seed) {
  final node = bip32.BIP32.fromSeed(seed);

  final bip32.BIP32 childNode = node.derivePath(
    ethereumBip44HDPath.defaultPath,
  );
  return childNode.privateKey!;
}

Uint8List derivePublicKeyETH(Uint8List seed) {
  final node = bip32.BIP32.fromSeed(seed);

  final bip32.BIP32 childNode = node.derivePath(
    ethereumBip44HDPath.defaultPath,
  );
  return childNode.publicKeyUncompressed;
}
