library web3_client;

import 'dart:math';
import 'dart:typed_data';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;

export './utxo/derivation.dart';

// const _rpcUrlGoerli =
//     "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161";

// final ethTestnetClient = Web3Client(_rpcUrlGoerli, Client());

// const GOERLI_CHAIN_ID = 5;

Future<TokenInfo?> getTokenInfo({
  required String contractAddress,
  required Web3Client client,
  required int chainId,
}) async {
  final address = EthereumAddress.fromHex(contractAddress);

  final tokenContract = ERC20Contract(
    address: address,
    client: client,
    chainId: chainId,
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
    double maxSupply = result[3] as double;
    maxSupply = maxSupply / pow(10, decimals);

    return TokenInfo(
      decimals: decimals,
      maxSupply: maxSupply,
      symbol: symbol,
      name: name,
    );
  } catch (e) {
    return null;
  }
}

Credentials? _cachedEVMCredentials;

Credentials getETHCredentials({
  required Uint8List seed,
  bool? wipeCache,
}) {
  if (wipeCache == true) {
    _cachedEVMCredentials = null;
  }
  // caching: prevent the expensive mnemonicToSeed from being called too often!
  if (_cachedEVMCredentials == null) {
    final privateKey = derivePrivateKeyETH(seed);
    final privKeyHex = privateKey.toHex;
    _cachedEVMCredentials = EthPrivateKey.fromHex(privKeyHex);
  }
  return _cachedEVMCredentials!;
}

Credentials getETHCredentialsFromMnemonic({
  required String mnemonic,
  bool? wipeCache,
}) {
  if (wipeCache == true) {
    _cachedEVMCredentials = null;
  }
  // caching: prevent the expensive mnemonicToSeed from being called too often!
  if (_cachedEVMCredentials == null) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final privateKey = derivePrivateKeyETH(seed);
    final privKeyHex = privateKey.toHex;
    _cachedEVMCredentials = EthPrivateKey.fromHex(privKeyHex);
  }
  return _cachedEVMCredentials!;
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
