import 'dart:math';
import 'dart:typed_data';
import 'package:walletkit_dart/walletkit_dart.dart';
// import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;

export './utxo/derivation.dart';

Future<TokenInfo?> getTokenInfo({
  required String contractAddress,
  required EvmRpcClient client,
}) async {
  final tokenContract = ERC20Contract(
    contractAddress: contractAddress,
    client: client,
  );

  print("contractAddress : $tokenContract");

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

    print("decimals : $decimals");
    print("name : $name");
    print("symbol : $symbol");
    print("maxSupply : $maxSupplyDouble");

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

// Credentials? _cachedEVMCredentials;

// Credentials getETHCredentials({
//   required Uint8List seed,
//   bool? wipeCache,
// }) {
//   if (wipeCache == true) {
//     _cachedEVMCredentials = null;
//   }
//   // caching: prevent the expensive mnemonicToSeed from being called too often!
//   if (_cachedEVMCredentials == null) {
//     final privateKey = derivePrivateKeyETH(seed);
//     final privKeyHex = privateKey.toHex;
//     _cachedEVMCredentials = EthPrivateKey.fromHex(privKeyHex);
//   }
//   return _cachedEVMCredentials!;
// }

// Credentials getETHCredentialsFromMnemonic({
//   required String mnemonic,
//   bool? wipeCache,
// }) {
//   if (wipeCache == true) {
//     _cachedEVMCredentials = null;
//   }
//   // caching: prevent the expensive mnemonicToSeed from being called too often!
//   if (_cachedEVMCredentials == null) {
//     final seed = bip39.mnemonicToSeed(mnemonic);
//     final privateKey = derivePrivateKeyETH(seed);
//     final privKeyHex = privateKey.toHex;
//     _cachedEVMCredentials = EthPrivateKey.fromHex(privKeyHex);
//   }
//   return _cachedEVMCredentials!;
// }

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
