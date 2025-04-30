import 'package:walletkit_dart/src/wallet/bip32/hd_node.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

/// TODO: Make sure this only has the privateKey when used for signing. Else EpubKey should be used.

sealed class NodeWithAddress {
  final int type;
  final HDNode? bip32Node;
  final String address;
  final String derivationPath;
  final Map<AddressType, String> addresses;
  final HDWalletPurpose? walletPurpose;
  final String publicKey;

  bool get isNeutered => bip32Node?.isNeutered ?? true;

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
    required HDNode node,
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
    'addresses': {
      for (final entry in addresses.entries)
        entry.key.index.toString(): entry.value,
    },
    'walletPurpose': walletPurpose?.index,
    'publicKey': publicKey,
  };

  factory NodeWithAddress.fromJson(Map json) {
    final type = json['type'] as int;

    if (type == 2) {
      return EmptyNode();
    }

    if (json case {
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
          addresses: {
            for (final MapEntry(:key, :value) in addresses.entries)
              AddressType.fromIndex(int.parse(key as String)): value as String,
          },
          walletPurpose:
              walletPurpose != null
                  ? HDWalletPurpose.values[walletPurpose]
                  : null,
          publicKey: publicKey,
        ),
        1 => ChangeNode(
          address: address,
          derivationPath: derivationPath,
          addresses: {
            for (final MapEntry(:key, :value) in addresses.entries)
              AddressType.fromIndex(int.parse(key as String)): value as String,
          },
          walletPurpose:
              walletPurpose != null
                  ? HDWalletPurpose.values[walletPurpose]
                  : null,
          publicKey: publicKey,
        ),
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
  @override
  Json toJson() {
    return {"type": type};
  }

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
