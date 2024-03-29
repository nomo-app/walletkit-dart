import 'dart:typed_data';
import 'package:bip32/bip32.dart' as bip32;
import 'package:walletkit_dart/src/crypto/utxo/pubkey_to_address.dart';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:walletkit_dart/walletkit_dart.dart';

typedef BipNode = bip32.BIP32;

String deriveExtendedPubKey({
  required Uint8List seed,
  required UTXONetworkType type,
  required HDWalletType walletType,
}) {
  ///
  /// Walletkit Compatibility
  ///
  if (type == LitecoinNetwork) {
    final depth1MasterNode = _deriveMasterNodeFromSeed(
      seed: seed,
      networkType: type,
      walletType: HDWalletType.BIP44,
    );

    final parentFingerprint = depth1MasterNode.parentFingerprint;

    final masterNode = _deriveMasterNodeFromSeed(
      seed: seed,
      networkType: type,
      walletType: walletType,
    );
    return masterNode.neutered().toBase58wkCompatibility(parentFingerprint, 1);
  }

  final masterNode = _deriveMasterNodeFromSeed(
    seed: seed,
    networkType: type,
    walletType: walletType,
  );
  return masterNode.neutered().toBase58();
}

BipNode _deriveMasterNodeFromSeed({
  required Uint8List seed,
  required UTXONetworkType networkType,
  required HDWalletType walletType,
}) {
  final bipNetworkType = networkType.networkBIP.getForWalletType(walletType);

  final parentNode = BipNode.fromSeed(seed, bipNetworkType);
  final BipNode node = parentNode.derivePath(walletType.purpose);

  return node;
}

BipNode deriveMasterNode({
  Uint8List? seed,
  String? ePubKey,
  required UTXONetworkType networkType,
  required HDWalletType walletType,
}) {
  if (seed == null && ePubKey == null) {
    throw UnsupportedError("seed or ePubKey must be provided");
  }

  if (ePubKey != null && seed == null) {
    return BipNode.fromBase58(
        ePubKey,
        networkType.networkBIP
            .getForWalletType(walletType) //    bipNetworkType,
        );
  }

  return _deriveMasterNodeFromSeed(
    seed: seed!,
    networkType: networkType,
    walletType: walletType,
  );
}

NodeWithAddress deriveChildNode({
  required BipNode masterNode,
  required int chainIndex,
  required int index,
  required UTXONetworkType networkType,
  required Iterable<AddressType> addressTypes,
  required HDWalletType walletType,
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
    walletType: walletType,
  );
}

bip32.BIP32 deriveChildNodeFromPath({
  required Uint8List seed,
  required String childDerivationPath,
  required UTXONetworkType networkType,
  required HDWalletType walletType,
}) {
  final masterNode = deriveMasterNode(
    seed: seed,
    networkType: networkType,
    walletType: walletType,
  );

  final node = masterNode.derivePath(childDerivationPath);

  return node;
}

extension on BipNode {
  String toBase58wkCompatibility(int parentFingerprint, int depth) {
    final version =
        (!isNeutered()) ? network.bip32.private : network.bip32.public;
    Uint8List buffer = new Uint8List(78);
    ByteData bytes = buffer.buffer.asByteData();
    bytes.setUint32(0, version);
    bytes.setUint8(4, depth);
    bytes.setUint32(5, parentFingerprint);
    bytes.setUint32(9, index);
    buffer.setRange(13, 45, chainCode);
    if (!isNeutered()) {
      bytes.setUint8(45, 0);
      buffer.setRange(46, 78, privateKey!);
    } else {
      buffer.setRange(45, 78, publicKey);
    }

    return bs58check.encode(buffer);
  }
}
