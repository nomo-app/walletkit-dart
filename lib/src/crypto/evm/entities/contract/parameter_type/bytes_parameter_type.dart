part of function_parameter_type;

final class FunctionParamBytes extends DynamicFunctionParamType<Uint8List> {
  const FunctionParamBytes() : super('bytes');

  @override
  Uint8List encode(Uint8List value) {
    final length = FunctionParamInt().encode(value.length.toBigInt);
    return Uint8List.fromList([...length, ...value]);
  }

  @override
  (Uint8List, int) decode(int offset, Uint8List data) {
    final length = FunctionParamInt()
        .decode(data.sublist(offset, offset + size_unit))
        .toInt();
    offset += size_unit;

    final value = data.sublist(offset, offset + length);
    offset += size_unit * ((length + size_unit - 1) ~/ size_unit);
    return (value, offset);
  }
}

abstract class FunctionParamBytesBase extends BaseFunctionParamType<Uint8List> {
  final int size;

  const FunctionParamBytesBase(super.name, this.size);

  @override
  Uint8List encode(Uint8List value) {
    assert(value.length == size, 'Invalid size for $name');
    final buffer = Uint8List(size_unit);
    buffer.writeSlice(size_unit - size, value);
    return buffer;
  }

  @override
  Uint8List decode(Uint8List data) {
    return data.sublist(size_unit - size);
  }
}

final class FunctionParamBytes1 extends FunctionParamBytesBase {
  const FunctionParamBytes1() : super('bytes1', 1);
}

final class FunctionParamBytes2 extends FunctionParamBytesBase {
  const FunctionParamBytes2() : super('bytes2', 2);
}

final class FunctionParamBytes3 extends FunctionParamBytesBase {
  const FunctionParamBytes3() : super('bytes3', 3);
}

final class FunctionParamBytes4 extends FunctionParamBytesBase {
  const FunctionParamBytes4() : super('bytes4', 4);
}

final class FunctionParamBytes5 extends FunctionParamBytesBase {
  const FunctionParamBytes5() : super('bytes5', 5);
}

final class FunctionParamBytes6 extends FunctionParamBytesBase {
  const FunctionParamBytes6() : super('bytes6', 6);
}

final class FunctionParamBytes7 extends FunctionParamBytesBase {
  const FunctionParamBytes7() : super('bytes7', 7);
}

final class FunctionParamBytes8 extends FunctionParamBytesBase {
  const FunctionParamBytes8() : super('bytes8', 8);
}

final class FunctionParamBytes9 extends FunctionParamBytesBase {
  const FunctionParamBytes9() : super('bytes9', 9);
}

final class FunctionParamBytes10 extends FunctionParamBytesBase {
  const FunctionParamBytes10() : super('bytes10', 10);
}

final class FunctionParamBytes11 extends FunctionParamBytesBase {
  const FunctionParamBytes11() : super('bytes11', 11);
}

final class FunctionParamBytes12 extends FunctionParamBytesBase {
  const FunctionParamBytes12() : super('bytes12', 12);
}

final class FunctionParamBytes13 extends FunctionParamBytesBase {
  const FunctionParamBytes13() : super('bytes13', 13);
}

final class FunctionParamBytes14 extends FunctionParamBytesBase {
  const FunctionParamBytes14() : super('bytes14', 14);
}

final class FunctionParamBytes15 extends FunctionParamBytesBase {
  const FunctionParamBytes15() : super('bytes15', 15);
}

final class FunctionParamBytes16 extends FunctionParamBytesBase {
  const FunctionParamBytes16() : super('bytes16', 16);
}

final class FunctionParamBytes17 extends FunctionParamBytesBase {
  const FunctionParamBytes17() : super('bytes17', 17);
}

final class FunctionParamBytes18 extends FunctionParamBytesBase {
  const FunctionParamBytes18() : super('bytes18', 18);
}

final class FunctionParamBytes19 extends FunctionParamBytesBase {
  const FunctionParamBytes19() : super('bytes19', 19);
}

final class FunctionParamBytes20 extends FunctionParamBytesBase {
  const FunctionParamBytes20() : super('bytes20', 20);
}

final class FunctionParamBytes21 extends FunctionParamBytesBase {
  const FunctionParamBytes21() : super('bytes21', 21);
}

final class FunctionParamBytes22 extends FunctionParamBytesBase {
  const FunctionParamBytes22() : super('bytes22', 22);
}

final class FunctionParamBytes23 extends FunctionParamBytesBase {
  const FunctionParamBytes23() : super('bytes23', 23);
}

final class FunctionParamBytes24 extends FunctionParamBytesBase {
  const FunctionParamBytes24() : super('bytes24', 24);
}

final class FunctionParamBytes25 extends FunctionParamBytesBase {
  const FunctionParamBytes25() : super('bytes25', 25);
}

final class FunctionParamBytes26 extends FunctionParamBytesBase {
  const FunctionParamBytes26() : super('bytes26', 26);
}

final class FunctionParamBytes27 extends FunctionParamBytesBase {
  const FunctionParamBytes27() : super('bytes27', 27);
}

final class FunctionParamBytes28 extends FunctionParamBytesBase {
  const FunctionParamBytes28() : super('bytes28', 28);
}

final class FunctionParamBytes29 extends FunctionParamBytesBase {
  const FunctionParamBytes29() : super('bytes29', 29);
}

final class FunctionParamBytes30 extends FunctionParamBytesBase {
  const FunctionParamBytes30() : super('bytes30', 30);
}

final class FunctionParamBytes31 extends FunctionParamBytesBase {
  const FunctionParamBytes31() : super('bytes31', 31);
}

final class FunctionParamBytes32 extends FunctionParamBytesBase {
  const FunctionParamBytes32() : super('bytes32', 32);
}
