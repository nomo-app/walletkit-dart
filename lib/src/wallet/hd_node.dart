import 'dart:convert';
import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/utxo/utils/ecurve.dart' as ecurve;
import 'package:walletkit_dart/src/utils/base58.dart';
import 'package:walletkit_dart/src/utils/crypto.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const HIGHEST_BIT = 0x80000000;
const UINT31_MAX = 2147483647; // 2^31 - 1
const UINT32_MAX = 4294967295; // 2^32 - 1

///
/// Inspired by https://github.com/dart-bitcoin/
///
class HDNode {
  final NetworkBIP? network;
  final Uint8List _q;
  final Uint8List? _p;
  final Uint8List chainCode;
  final int depth;
  final int index;
  final int parentFingerprint;

  bool get isNeutered => _p == null;

  Uint8List? get privateKey => _p;

  Uint8List get publicKey => _q;

  Uint8List get identifier => ripmed160Sha256Hash(publicKey);

  Uint8List get fingerprint => identifier.sublist(0, 4);

  Uint8List get publicKeyUncompressed {
    if (privateKey == null) {
      throw UnsupportedError("privateKey is null");
    }
    return ecurve.pointFromScalar(privateKey!, false)!;
  }

  HDNode derivePath(String path) {
    final regex = new RegExp(r"^(m\/)?(\d+'?\/)*\d+'?$");
    if (!regex.hasMatch(path)) {
      throw ArgumentError("Expected BIP32 Path");
    }

    var splitPath = path.split("/");
    if (splitPath[0] == "m") {
      if (parentFingerprint != 0) {
        throw ArgumentError("Expected master node but got child node");
      }
      splitPath = splitPath.sublist(1);
    }

    return splitPath.fold(
      this,
      (HDNode prevHd, String indexStr) {
        int index;
        if (indexStr.substring(indexStr.length - 1) == "'") {
          index = int.parse(indexStr.substring(0, indexStr.length - 1));
          return prevHd.deriveHardened(index);
        } else {
          index = int.parse(indexStr);
          return prevHd.derive(index);
        }
      },
    );
  }

  String? extendedPrivateKey({
    int? version,
  }) {
    version ??= network?.bip32.private;
    if (version == null) {
      throw ArgumentError("Missing version");
    }

    if (version.isUint(32) == false) {
      throw ArgumentError("Expected UInt32 for version");
    }

    if (isNeutered) {
      return null;
    }

    final buffer = Uint8List(78);
    final bytes = buffer.buffer.asByteData();

    bytes.setUint32(0, version);
    bytes.setUint8(4, depth);
    bytes.setUint32(5, parentFingerprint);
    bytes.setUint32(9, index);
    buffer.setRange(13, 45, chainCode);
    bytes.setUint8(45, 0);
    buffer.setRange(46, 78, privateKey!);

    return base58CheckEncode2(buffer);
  }

  String extendedPublicKey({int? version}) {
    version ??= network?.bip32.public;
    if (version == null) {
      throw ArgumentError("Missing version");
    }
    if (version.isUint(32) == false) {
      throw ArgumentError("Expected UInt32 for version");
    }

    final buffer = Uint8List(78);
    final bytes = buffer.buffer.asByteData();

    bytes.setUint32(0, version);
    bytes.setUint8(4, depth);
    bytes.setUint32(5, parentFingerprint);
    bytes.setUint32(9, index);
    buffer.setRange(13, 45, chainCode);
    buffer.setRange(45, 78, publicKey);

    return base58CheckEncode2(buffer);
  }

  String toWIF({
    int? version,
  }) {
    if (privateKey == null) {
      throw new ArgumentError("Missing private key");
    }
    version ??= network?.wif;
    if (version == null) {
      throw ArgumentError("Missing version");
    }
    return WIF(version: version, privateKey: privateKey!, compressed: true)
        .toBase58;
  }

  HDNode deriveHardened(int index) {
    if (index > UINT31_MAX || index < 0) {
      throw ArgumentError("Expected UInt31");
    }
    return derive(index + HIGHEST_BIT);
  }

  HDNode derive(int index) {
    if (index > UINT32_MAX || index < 0) {
      throw ArgumentError("Expected UInt32");
    }
    final isHardened = index >= HIGHEST_BIT;
    final data = Uint8List(37);

    if (isHardened) {
      if (isNeutered) {
        throw ArgumentError("Cannot derive hardened key from neutered parent");
      }
      data[0] = 0x00;
      data.setRange(1, 33, privateKey!);
    } else {
      data.setRange(0, 33, publicKey);
    }
    data.buffer.asByteData().setUint32(33, index);

    final I = hmacSHA512(chainCode, data);
    final IL = I.sublist(0, 32);
    final IR = I.sublist(32);
    if (ecurve.isPrivate(IL) == false) {
      return derive(index + 1);
    }

    if (isNeutered) {
      final ki = ecurve.pointAddScalar(publicKey, IL, true);
      if (ki == null) {
        return derive(index + 1);
      }
      return HDNode.fromPublicKey(
        publicKey: ki,
        chainCode: IR,
        depth: depth + 1,
        index: index,
        parentFingerprint: fingerprint.buffer.asByteData().getUint32(0),
        network: network,
      );
    } else {
      final ki = ecurve.privateAdd(privateKey!, IL);
      if (ki == null) {
        return derive(index + 1);
      }
      return HDNode.fromI(
        IL: ki,
        IR: IR,
        depth: depth + 1,
        index: index,
        parentFingerprint: fingerprint.buffer.asByteData().getUint32(0),
        network: network,
      );
    }
  }

  HDNode neutered() {
    return HDNode(
      q: _q,
      p: null,
      chainCode: chainCode,
      depth: depth,
      index: index,
      parentFingerprint: parentFingerprint,
      network: network,
    );
  }

  factory HDNode.fromI({
    required Uint8List IL,
    required Uint8List IR,
    required int depth,
    required int index,
    required int parentFingerprint,
    NetworkBIP? network,
  }) {
    if (IL.length != 32) {
      throw ArgumentError("IL should be 32 bytes");
    }
    if (ecurve.isPrivate(IL) == false) {
      throw ArgumentError("IL should be a private key");
    }

    final q = ecurve.pointFromScalar(IL, true)!;

    return HDNode(
      q: q,
      p: IL,
      chainCode: IR,
      depth: depth,
      index: index,
      parentFingerprint: parentFingerprint,
      network: network,
    );
  }

  bool verify(Uint8List hash, Uint8List signature) {
    return ecurve.verify(hash, _q, signature);
  }

  Uint8List sign(Uint8List hash) {
    if (_p == null) {
      throw ArgumentError("HDNode is not private");
    }

    return ecurve.sign(hash, _p!);
  }

  factory HDNode.fromPublicKey({
    required Uint8List publicKey,
    required Uint8List chainCode,
    required int depth,
    required int index,
    required int parentFingerprint,
    NetworkBIP? network,
  }) {
    if (ecurve.isPoint(publicKey) == false) {
      throw ArgumentError("Point is not on the curve");
    }

    return HDNode(
      q: publicKey,
      p: null,
      chainCode: chainCode,
      depth: depth,
      index: index,
      network: network,
      parentFingerprint: parentFingerprint,
    );
  }

  const HDNode({
    required Uint8List q,
    required Uint8List? p,
    required this.chainCode,
    required this.network,
    required this.depth,
    required this.index,
    required this.parentFingerprint,
  })  : _q = q,
        _p = p;

  factory HDNode.fromSeed(
    Uint8List seed, {
    NetworkBIP? network,
  }) {
    if (seed.length < 16) {
      throw new ArgumentError("Seed should be at least 128 bits");
    }
    if (seed.length > 64) {
      throw new ArgumentError("Seed should be at most 512 bits");
    }

    final key = utf8.encode("Bitcoin seed");
    final I = hmacSHA512(key, seed);
    final IL = I.sublist(0, 32);
    final IR = I.sublist(32);

    return HDNode.fromI(
      IL: IL,
      IR: IR,
      depth: 0,
      index: 0,
      parentFingerprint: 0,
      network: network,
    );
  }

  ///
  factory HDNode.fromExtendedKey(
    String key, {
    NetworkBIP? network,
  }) {
    final buffer = base58CheckDecodeWithVersion(key);
    if (buffer.length != 78) {
      throw ArgumentError("Invalid buffer length");
    }

    final bytes = buffer.buffer.asByteData();

    final version = bytes.getUint32(0);

    final BIP32Prefixes? networkPrefixes;

    /// Check if the version is valid if network is provided
    if (network != null) {
      networkPrefixes = network.fromVersion(version);
      if (networkPrefixes == null) {
        throw ArgumentError("Invalid version for given network");
      }
    } else {
      final result = NetworkBIP.findPrefixesFromVersion(version);

      if (result == null) {
        throw ArgumentError("No NetworkBIP found for $version");
      }

      network = result.$2;
      networkPrefixes = result.$1;
    }

    final depth = bytes.getUint8(4);

    final parentFingerprint = bytes.getUint32(5);

    if (depth == 0 && parentFingerprint != 0) {
      throw ArgumentError("Invalid parent fingerprint");
    }

    final index = bytes.getUint32(9);
    if (depth == 0 && index != 0) {
      throw ArgumentError("Invalid index");
    }

    final chainCode = buffer.sublist(13, 45);

    final isPrivate = networkPrefixes.private == version;

    if (isPrivate) {
      if (bytes.getUint8(45) != 0) {
        throw ArgumentError("Invalid private key");
      }
      final IL = buffer.sublist(46, 78);
      return HDNode.fromI(
        IL: IL,
        IR: chainCode,
        depth: depth,
        index: index,
        parentFingerprint: parentFingerprint,
        network: network,
      );
    } else {
      final publicKey = buffer.sublist(45, 78);
      return HDNode.fromPublicKey(
        publicKey: publicKey,
        chainCode: chainCode,
        depth: depth,
        index: index,
        parentFingerprint: parentFingerprint,
        network: network,
      );
    }
  }
}

class WIF {
  final int version;
  final Uint8List privateKey;
  final bool compressed;

  const WIF({
    required this.version,
    required this.privateKey,
    required this.compressed,
  });

  factory WIF.fromBuffer(
    Uint8List buffer, {
    int? version,
  }) {
    if (version != null && buffer[0] != version) {
      throw ArgumentError("Invalid Network version");
    }
    if (buffer.length == 33) {
      return WIF(
        version: buffer[0],
        privateKey: buffer.sublist(1, 33),
        compressed: false,
      );
    }
    if (buffer.length != 34) {
      throw ArgumentError("Invalid buffer length");
    }
    if (buffer[33] != 0x01) {
      throw ArgumentError("Invalid compression flag");
    }
    return WIF(
      version: buffer[0],
      privateKey: buffer.sublist(1, 33),
      compressed: true,
    );
  }

  Uint8List get buffer {
    if (privateKey.length != 32) {
      throw ArgumentError("Private key should be 32 bytes");
    }
    final buffer = Uint8List(compressed ? 34 : 33);
    final byteData = buffer.buffer.asByteData();
    byteData.setUint8(0, version);
    buffer.setRange(1, 33, privateKey);
    if (compressed) {
      buffer[33] = 0x01;
    }
    return buffer;
  }

  String get toBase58 {
    return base58CheckEncode2(buffer);
  }

  factory WIF.fromBase58(String base58) {
    final buffer = base58CheckDecodeWithVersion(base58);
    return WIF.fromBuffer(buffer);
  }
}
