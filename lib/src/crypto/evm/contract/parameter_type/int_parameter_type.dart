part of function_parameter_type;

///
/// Base class for all integer types since encoding and decoding is the same
/// Valid int are: 8 through 256 with increments of 8
/// Valid uint are: 8 through 256 with increments of 8
///
final class FunctionParamInt extends BaseFunctionParamType<BigInt> {
  const FunctionParamInt([String? name]) : super(name ?? 'int');

  @override
  Uint8List encode(BigInt value) {
    if (value < BigInt.zero) {
      throw Exception('Negative value');
    }
    if (value.bitLength > 256) {
      throw Exception('Value is too big');
    }
    final byteData = ByteData(size_unit);
    final bytes = value.toRadixString(16).padLeft(64, '0');
    final bytesList = bytes.hexToBytes;

    for (var i = 0; i < bytesList.length; i++) {
      byteData.setUint8(size_unit - bytesList.length + i, bytesList[i]);
    }

    return byteData.buffer.asUint8List();
  }

  @override
  BigInt decode(Uint8List data) {
    return data.toBigInt(littleEndian: false);
  }
}

final class FunctionParamUint extends FunctionParamInt {
  const FunctionParamUint() : super('uint');
}

final class FunctionParamInt8 extends FunctionParamInt {
  const FunctionParamInt8() : super('int8');
}

final class FunctionParamUint8 extends FunctionParamInt {
  const FunctionParamUint8() : super('uint8');
}

final class FunctionParamInt16 extends FunctionParamInt {
  const FunctionParamInt16() : super('int16');
}

final class FunctionParamUint16 extends FunctionParamInt {
  const FunctionParamUint16() : super('uint16');
}

final class FunctionParamInt24 extends FunctionParamInt {
  const FunctionParamInt24() : super('int24');
}

final class FunctionParamUint24 extends FunctionParamInt {
  const FunctionParamUint24() : super('uint24');
}

final class FunctionParamInt32 extends FunctionParamInt {
  const FunctionParamInt32() : super('int32');
}

final class FunctionParamUint32 extends FunctionParamInt {
  const FunctionParamUint32() : super('uint32');
}

final class FunctionParamInt40 extends FunctionParamInt {
  const FunctionParamInt40() : super('int40');
}

final class FunctionParamUint40 extends FunctionParamInt {
  const FunctionParamUint40() : super('uint40');
}

final class FunctionParamInt48 extends FunctionParamInt {
  const FunctionParamInt48() : super('int48');
}

final class FunctionParamUint48 extends FunctionParamInt {
  const FunctionParamUint48() : super('uint48');
}

final class FunctionParamInt56 extends FunctionParamInt {
  const FunctionParamInt56() : super('int56');
}

final class FunctionParamUint56 extends FunctionParamInt {
  const FunctionParamUint56() : super('uint56');
}

final class FunctionParamInt64 extends FunctionParamInt {
  const FunctionParamInt64() : super('int64');
}

final class FunctionParamUint64 extends FunctionParamInt {
  const FunctionParamUint64() : super('uint64');
}

final class FunctionParamInt72 extends FunctionParamInt {
  const FunctionParamInt72() : super('int72');
}

final class FunctionParamUint72 extends FunctionParamInt {
  const FunctionParamUint72() : super('uint72');
}

final class FunctionParamInt80 extends FunctionParamInt {
  const FunctionParamInt80() : super('int80');
}

final class FunctionParamUint80 extends FunctionParamInt {
  const FunctionParamUint80() : super('uint80');
}

final class FunctionParamInt88 extends FunctionParamInt {
  const FunctionParamInt88() : super('int88');
}

final class FunctionParamUint88 extends FunctionParamInt {
  const FunctionParamUint88() : super('uint88');
}

final class FunctionParamInt96 extends FunctionParamInt {
  const FunctionParamInt96() : super('int96');
}

final class FunctionParamUint96 extends FunctionParamInt {
  const FunctionParamUint96() : super('uint96');
}

final class FunctionParamInt104 extends FunctionParamInt {
  const FunctionParamInt104() : super('int104');
}

final class FunctionParamUint104 extends FunctionParamInt {
  const FunctionParamUint104() : super('uint104');
}

final class FunctionParamInt112 extends FunctionParamInt {
  const FunctionParamInt112() : super('int112');
}

final class FunctionParamUint112 extends FunctionParamInt {
  const FunctionParamUint112() : super('uint112');
}

final class FunctionParamInt120 extends FunctionParamInt {
  const FunctionParamInt120() : super('int120');
}

final class FunctionParamUint120 extends FunctionParamInt {
  const FunctionParamUint120() : super('uint120');
}

final class FunctionParamInt128 extends FunctionParamInt {
  const FunctionParamInt128() : super('int128');
}

final class FunctionParamUint128 extends FunctionParamInt {
  const FunctionParamUint128() : super('uint128');
}

final class FunctionParamInt136 extends FunctionParamInt {
  const FunctionParamInt136() : super('int136');
}

final class FunctionParamUint136 extends FunctionParamInt {
  const FunctionParamUint136() : super('uint136');
}

final class FunctionParamInt144 extends FunctionParamInt {
  const FunctionParamInt144() : super('int144');
}

final class FunctionParamUint144 extends FunctionParamInt {
  const FunctionParamUint144() : super('uint144');
}

final class FunctionParamInt152 extends FunctionParamInt {
  const FunctionParamInt152() : super('int152');
}

final class FunctionParamUint152 extends FunctionParamInt {
  const FunctionParamUint152() : super('uint152');
}

final class FunctionParamInt160 extends FunctionParamInt {
  const FunctionParamInt160() : super('int160');
}

final class FunctionParamUint160 extends FunctionParamInt {
  const FunctionParamUint160() : super('uint160');
}

final class FunctionParamInt168 extends FunctionParamInt {
  const FunctionParamInt168() : super('int168');
}

final class FunctionParamUint168 extends FunctionParamInt {
  const FunctionParamUint168() : super('uint168');
}

final class FunctionParamInt176 extends FunctionParamInt {
  const FunctionParamInt176() : super('int176');
}

final class FunctionParamUint176 extends FunctionParamInt {
  const FunctionParamUint176() : super('uint176');
}

final class FunctionParamInt184 extends FunctionParamInt {
  const FunctionParamInt184() : super('int184');
}

final class FunctionParamUint184 extends FunctionParamInt {
  const FunctionParamUint184() : super('uint184');
}

final class FunctionParamInt192 extends FunctionParamInt {
  const FunctionParamInt192() : super('int192');
}

final class FunctionParamUint192 extends FunctionParamInt {
  const FunctionParamUint192() : super('uint192');
}

final class FunctionParamInt200 extends FunctionParamInt {
  const FunctionParamInt200() : super('int200');
}

final class FunctionParamUint200 extends FunctionParamInt {
  const FunctionParamUint200() : super('uint200');
}

final class FunctionParamInt208 extends FunctionParamInt {
  const FunctionParamInt208() : super('int208');
}

final class FunctionParamUint208 extends FunctionParamInt {
  const FunctionParamUint208() : super('uint208');
}

final class FunctionParamInt216 extends FunctionParamInt {
  const FunctionParamInt216() : super('int216');
}

final class FunctionParamUint216 extends FunctionParamInt {
  const FunctionParamUint216() : super('uint216');
}

final class FunctionParamInt224 extends FunctionParamInt {
  const FunctionParamInt224() : super('int224');
}

final class FunctionParamUint224 extends FunctionParamInt {
  const FunctionParamUint224() : super('uint224');
}

final class FunctionParamInt232 extends FunctionParamInt {
  const FunctionParamInt232() : super('int232');
}

final class FunctionParamUint232 extends FunctionParamInt {
  const FunctionParamUint232() : super('uint232');
}

final class FunctionParamInt240 extends FunctionParamInt {
  const FunctionParamInt240() : super('int240');
}

final class FunctionParamUint240 extends FunctionParamInt {
  const FunctionParamUint240() : super('uint240');
}

final class FunctionParamInt248 extends FunctionParamInt {
  const FunctionParamInt248() : super('int248');
}

final class FunctionParamUint248 extends FunctionParamInt {
  const FunctionParamUint248() : super('uint248');
}

final class FunctionParamInt256 extends FunctionParamInt {
  const FunctionParamInt256() : super('int256');
}

final class FunctionParamUint256 extends FunctionParamInt {
  const FunctionParamUint256() : super('uint256');
}
