import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/utxo/utils/pubkey_to_address.dart';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:walletkit_dart/src/wallet/hd_node.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

String deriveExtendedPubKey({
  required Uint8List seed,
  required HDWalletPath walletPurpose,
  required UTXONetworkType type,
}) {
  ///
  /// Walletkit Compatibility
  ///
  if (type == LitecoinNetwork) {
    final depth1MasterNode = deriveMasterNodeFromSeed(
      seed: seed,
      networkType: type,
      walletPath: bitcoinBip44HDPath, // TODO: Check if still valid
    );

    final parentFingerprint = depth1MasterNode.parentFingerprint;

    final masterNode = deriveMasterNodeFromSeed(
      seed: seed,
      networkType: type,
      walletPath: walletPurpose,
    );
    return masterNode.neutered().toBase58wkCompatibility(parentFingerprint, 1);
  }

  final masterNode = deriveMasterNodeFromSeed(
    seed: seed,
    networkType: type,
    walletPath: walletPurpose,
  );
  return masterNode.neutered().extendedPublicKey();
}

HDNode deriveMasterNodeFromSeed({
  required Uint8List seed,
  required HDWalletPath walletPath,
  required UTXONetworkType networkType,
}) {
  final parentNode = HDNode.fromSeed(seed, network: networkType.networkBIP);
  final derivationPath = switch (walletPath.basePath) {
    "m/44'/2'" => walletPath.account0Path,
    _ => walletPath.purpose.string,
  };
  final node =
      parentNode.derivePath(derivationPath); // TODO: Use base Path with Account

  return node;
}

HDNode deriveMasterNodeFromExtendedKey(
  String ePubKey, {
  UTXONetworkType? networkType,
}) {
  return HDNode.fromExtendedKey(
    ePubKey,
    network: networkType?.networkBIP,
  );
}

NodeWithAddress deriveChildNode({
  required HDNode masterNode,
  required int chainIndex,
  required int index,
  required UTXONetworkType networkType,
  required Iterable<AddressType> addressTypes,
  required HDWalletPurpose? walletPurpose,
}) {
  if (index < 0) {
    throw UnsupportedError("index must not be negative");
  }
  if (chainIndex != EXTERNAL_CHAIN_INDEX &&
      chainIndex != INTERNAL_CHAIN_INDEX) {
    throw UnsupportedError("unexpected chainIndex");
  }

  final childDerivationPath = "$chainIndex/$index";

  final node = masterNode.derivePath(childDerivationPath);

  final publicKey = node.publicKey;

  final addressMap = {
    for (final addressType in addressTypes)
      addressType: pubKeyToAddress(publicKey, addressType, networkType),
  };

  final mainAddress = addressMap[addressTypes.first]!;

  return NodeWithAddress.fromChainIndex(
    node: node,
    address: mainAddress,
    chainIndex: chainIndex,
    derivationPath: childDerivationPath,
    addresses: addressMap,
    walletPurpose: walletPurpose,
  );
}

HDNode deriveChildNodeFromPath({
  required Uint8List seed,
  required String childDerivationPath,
  required HDWalletPath walletPath,
  required UTXONetworkType networkType,
}) {
  final masterNode = deriveMasterNodeFromSeed(
    seed: seed,
    networkType: networkType,
    walletPath: walletPath,
  );

  final node = masterNode.derivePath(childDerivationPath);

  return node;
}

extension on HDNode {
  String toBase58wkCompatibility(int parentFingerprint, int depth) {
    final version =
        (!isNeutered) ? network!.bip32.private : network!.bip32.public;
    Uint8List buffer = new Uint8List(78);
    ByteData bytes = buffer.buffer.asByteData();
    bytes.setUint32(0, version);
    bytes.setUint8(4, depth);
    bytes.setUint32(5, parentFingerprint);
    bytes.setUint32(9, index);
    buffer.setRange(13, 45, chainCode);
    if (!isNeutered) {
      bytes.setUint8(45, 0);
      buffer.setRange(46, 78, privateKey!);
    } else {
      buffer.setRange(45, 78, publicKey);
    }

    return bs58check.encode(buffer);
  }
}

HDNode deriveNode(Uint8List seed, String path) {
  final node = HDNode.fromSeed(seed);
  return node.derivePath(path);
}
