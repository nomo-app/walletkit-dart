import 'package:bip32/bip32.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

/// TODO: Make sure this only has the privateKey when used for signing. Else EpubKey should be used.

sealed class NodeWithAddress {
  final int type;
  final BIP32? bip32Node;
  final String address;
  final String derivationPath;
  final Map<AddressType, String> addresses;
  final HDWalletPurpose? walletPurpose;
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
    HDWalletPurpose? walletPurpose,
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

  Json toJson() => {
        'type': type,
        'address': address,
        'derivationPath': derivationPath,
        'addresses': addresses.map(
          (key, value) => MapEntry(key.index, value),
        ),
        'walletPurpose': walletPurpose?.index,
        'publicKey': publicKey,
      };

  factory NodeWithAddress.fromJson(Map json) {
    if (json
        case {
          'type': int type,
          'address': String address,
          'derivationPath': String derivationPath,
          'addresses': Map addresses,
          'walletPurpose': int? walletPurpose,
          'publicKey': String publicKey,
        }) {
      return switch (type) {
        0 => ReceiveNode(
            address: address,
            derivationPath: derivationPath,
            addresses: addresses.map(
              (key, value) => MapEntry(
                AddressType.values[key as int],
                value as String,
              ),
            ),
            walletPurpose: walletPurpose != null
                ? HDWalletPurpose.values[walletPurpose]
                : null,
            publicKey: publicKey,
          ),
        1 => ChangeNode(
            address: address,
            derivationPath: derivationPath,
            addresses: addresses.map(
              (key, value) => MapEntry(
                AddressType.values[key as int],
                value as String,
              ),
            ),
            walletPurpose: walletPurpose != null
                ? HDWalletPurpose.values[walletPurpose]
                : null,
            publicKey: publicKey,
          ),
        2 => EmptyNode(),
        _ => throw UnimplementedError(),
      };
    }

    throw UnimplementedError();
  }

  const NodeWithAddress({
    this.bip32Node,
    this.walletPurpose,
    required this.address,
    required this.derivationPath,
    required this.addresses,
    required this.publicKey,
    required this.type,
  });
}

final class ReceiveNode extends NodeWithAddress {
  const ReceiveNode({
    super.bip32Node,
    required super.address,
    required super.derivationPath,
    required super.addresses,
    required super.walletPurpose,
    required super.publicKey,
  }) : super(type: 0);
}

final class ChangeNode extends NodeWithAddress {
  const ChangeNode({
    super.bip32Node,
    required super.address,
    required super.derivationPath,
    required super.addresses,
    required super.walletPurpose,
    required super.publicKey,
  }) : super(type: 1);
}

final class EmptyNode extends NodeWithAddress {
  const EmptyNode()
      : super(
          bip32Node: null,
          address: "",
          derivationPath: "",
          addresses: const {},
          walletPurpose: null,
          publicKey: "",
          type: 2,
        );
}
