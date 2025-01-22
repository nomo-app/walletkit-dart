import 'dart:typed_data';

import 'package:walletkit_dart/src/crypto/tron/entities/tron_address.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/src/utils/var_uint.dart';

const defaultParameterSize = 32;

enum TronParameterType {
  ADDRESS(size: 21),
  INT256(size: 32);

  final int? size;
  final bool isDynamicSize;

  const TronParameterType({
    this.size = 32,
    this.isDynamicSize = false,
  }) : assert((size != null && size > 0 && size <= 32) || isDynamicSize);
}

sealed class TronParameter<T> {
  final T value;
  final TronParameterType type;

  const TronParameter(this.value, this.type);

  Uint8List get bytes;
}

final class TronAddressParameter extends TronParameter<String> {
  const TronAddressParameter(String value)
      : super(value, TronParameterType.ADDRESS);

  @override
  Uint8List get bytes => base58ToHex(value);

  static TronAddressParameter decode(Uint8List data) {
    return TronAddressParameter(base58CheckFromHex(data));
  }
}

final class TronIntParameter extends TronParameter<BigInt> {
  const TronIntParameter(BigInt value) : super(value, TronParameterType.INT256);

  @override
  Uint8List get bytes => value.toBytesUnsigned;

  static TronIntParameter decode(Uint8List data) {
    return TronIntParameter(data.toBigInt);
  }
}

Uint8List createParameter(
  Uint8List signature,
  List<TronParameter> subParams,
) {
  final buffer = <int>[];

  for (final param in subParams) {
    final isDynamic = param.type.isDynamicSize;
    final paddedLength = isDynamic
        ? 1 // TODO - Implement dynamic size Parameters
        : defaultParameterSize;

    final paramSize = param.bytes.length;

    final bytes = param.bytes;

    final paddedBytes = Uint8List(paddedLength)
      ..writeSlice(paddedLength - paramSize, bytes);

    buffer.addAll(paddedBytes);
  }

  return Uint8List.fromList(signature + buffer);
}

List<TronParameter> decodeParams(
  Uint8List data,
  List<TronParameterType> parameters,
) {
  var offset = 4;
  final result = <TronParameter>[];

  for (final type in parameters) {
    final paddedSize = type.isDynamicSize
        ? 1 // TODO - Implement dynamic size Parameters
        : defaultParameterSize;
    final size = type.isDynamicSize ? paddedSize : type.size!;
    final paddedBytes = data.sublist(offset, offset + paddedSize);

    final bytes = paddedBytes.sublist(paddedSize - size);

    final param = switch (type) {
      TronParameterType.ADDRESS => TronAddressParameter.decode(bytes),
      TronParameterType.INT256 => TronIntParameter.decode(bytes),
    } as TronParameter;

    result.add(param);

    offset += paddedSize;
  }

  if (offset != data.length) {
    throw Exception("Invalid Parameter Data");
  }

  return result;
}

List<TronParameter> decodeSmartContractParameter({
  required Uint8List data,
  required List<TronParameterType> types,
}) {
  final parameters = decodeParams(data.sublist(4), types);

  return parameters;
}

String getFunctionSelectorFromData(Uint8List data) {
  final hash = keccak256(data);
  return hash.sublist(0, 4).toHex;
}
