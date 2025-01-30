import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/src/wallet/bip39/bip39.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
// import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;

export 'utxo/utils/derivation.dart';

Future<TokenInfo?> getTokenInfo({
  required String contractAddress,
  required EvmRpcInterface rpc,
}) async {
  final tokenContract = ERC20Contract(
    contractAddress: contractAddress,
    rpc: rpc,
  );

  try {
    final result = await Future.wait(
      [
        tokenContract.getDecimals(),
        tokenContract.getName(),
        tokenContract.getSymbol(),
        tokenContract.getSupply(),
      ],
      eagerError: true,
    );
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
      contractAddress: contractAddress,
    );
  } catch (e) {
    return null;
  }
}

Future<bool> isErc1155({
  required String contractAddress,
  required EvmRpcInterface rpc,
  required String address,
}) async {
  bool isErc1155 = false;
  try {
    await rpc.fetchERC1155BalanceOfToken(
      address: address,
      tokenID: BigInt.from(0),
      contractAddress: contractAddress,
    );
    isErc1155 = true;
  } catch (e) {
    isErc1155 = false;
  }
  return isErc1155;
}

Uint8List publicKeyToAddress(Uint8List publicKey) {
  // 1. Ensure the public key is in the correct format
  if (publicKey.length == 64) {
    // If public key is 64 bytes, prepend 0x04 to indicate uncompressed key
    publicKey = Uint8List.fromList([4, ...publicKey]);
  } else if (publicKey.length != 65) {
    throw ArgumentError(
        'Invalid public key length. Expected 65 bytes (or 64 bytes without prefix).');
  }

  // 2. Take Keccak-256 hash of the public key
  final hash =
      keccak256(publicKey.sublist(1)); // Remove the 0x04 prefix before hashing

  // 3. Take the last 20 bytes of the hash
  return hash.sublist(12, 32);
}

String pubKeytoChecksumETHAddress(Uint8List seed) {
  final publicKey = derivePublicKeyETH(seed);
  final pubKeyWithoutPrefix = keccak256(publicKey.sublist(1));

  final address = '0x${pubKeyWithoutPrefix.sublist(12).toHex}';

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
  final seed = mnemonicToSeed(mnemonic);

  final publicKey = derivePublicKeyETH(seed);

  final publicKeyWithoutPrefix = keccak256(publicKey.sublist(1));

  final address = '0x${publicKeyWithoutPrefix.sublist(12).toHex}';

  return address;
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
