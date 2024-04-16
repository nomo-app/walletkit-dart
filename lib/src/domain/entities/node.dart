import 'package:bip32/bip32.dart';
import 'package:hive/hive.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

/// TODO: Make sure this only has the privateKey when used for signing. Else EpubKey should be used.

sealed class NodeWithAddress {
  final BIP32? bip32Node;

  @HiveField(0)
  final String address;

  @HiveField(1)
  final String derivationPath;

  @HiveField(2)
  final Map<AddressType, String> addresses;

  @HiveField(3)
  final HDWalletPurpose walletPurpose;

  @HiveField(4)
  final String publicKey;

  bool get isNeutered => bip32Node?.isNeutered() ?? true;

  List<String> get addressesList => addresses.values.toList();

  int get index => derivationPath.split("/").last.toInt;

  int get chainIndex => switch (this) {
        ReceiveNode() => EXTERNAL_CHAIN_INDEX,
        ChangeNode() => INTERNAL_CHAIN_INDEX,
        EmptyNode() => -1,
      };

  NodeWithAddress get neutered => switch (this) {
        ReceiveNode() => ReceiveNode(
            bip32Node: bip32Node?.neutered(),
            address: address,
            derivationPath: derivationPath,
            addresses: addresses,
            walletPurpose: walletPurpose,
            publicKey: publicKey,
          ),
        ChangeNode() => ChangeNode(
            bip32Node: bip32Node?.neutered(),
            address: address,
            derivationPath: derivationPath,
            addresses: addresses,
            walletPurpose: walletPurpose,
            publicKey: publicKey,
          ),
        EmptyNode() => EmptyNode(),
      };

  factory NodeWithAddress.fromChainIndex({
    required BIP32 node,
    required String address,
    required int chainIndex,
    required String derivationPath,
    required Map<AddressType, String> addresses,
    required HDWalletPurpose walletPurpose,
  }) {
    if (chainIndex == EXTERNAL_CHAIN_INDEX) {
      return ReceiveNode(
        bip32Node: node,
        address: address,
        derivationPath: derivationPath,
        addresses: addresses,
        walletPurpose: walletPurpose,
        publicKey: node.publicKey.toHex,
      );
    }
    if (chainIndex == INTERNAL_CHAIN_INDEX) {
      return ChangeNode(
        bip32Node: node,
        address: address,
        derivationPath: derivationPath,
        addresses: addresses,
        walletPurpose: walletPurpose,
        publicKey: node.publicKey.toHex,
      );
    }
    throw UnsupportedError("unexpected chainIndex");
  }

  const NodeWithAddress({
    this.bip32Node,
    required this.address,
    required this.derivationPath,
    required this.addresses,
    required this.walletPurpose,
    required this.publicKey,
  });
}

@HiveType(typeId: 15)
final class ReceiveNode extends NodeWithAddress {
  const ReceiveNode({
    super.bip32Node,
    required super.address,
    required super.derivationPath,
    required super.addresses,
    required super.walletPurpose,
    required super.publicKey,
  });
}

@HiveType(typeId: 16)
final class ChangeNode extends NodeWithAddress {
  const ChangeNode({
    super.bip32Node,
    required super.address,
    required super.derivationPath,
    required super.addresses,
    required super.walletPurpose,
    required super.publicKey,
  });
}

@HiveType(typeId: 17)
final class EmptyNode extends NodeWithAddress {
  const EmptyNode()
      : super(
          bip32Node: null,
          address: "",
          derivationPath: "",
          addresses: const {},
          walletPurpose: HDWalletPurpose.BIP44,
          publicKey: "",
        );
}

  // 
  // This has to be the read method for the EmptyNodeAdapter
  // The Generated code is wrong.
  // 
  // @override
  // EmptyNode read(BinaryReader reader) {
  //   final numOfFields = reader.readByte();
  //   final _ = <int, dynamic>{
  //     for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  //   };
  //   return EmptyNode();
  // }