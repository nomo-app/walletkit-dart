part of function_parameter_type;

abstract class FunctionParamFixedBase extends BaseFunctionParamType<Amount> {
  const FunctionParamFixedBase(String name, int decimals)
      : super(
          '${name}x${decimals}',
        );

  @override
  Uint8List encode(Amount value) {
    throw UnimplementedError();
  }

  @override
  Amount decode(Uint8List data) {
    throw UnimplementedError();
  }
}

/// Synonym for [FunctionParamFixed128]
final class FunctionParamFixed extends BaseFunctionParamType<Amount> {
  const FunctionParamFixed() : super('fixed');

  @override
  Uint8List encode(Amount value) {
    return FunctionParamFixed128(18).encode(value);
  }

  @override
  Amount decode(Uint8List data) {
    return FunctionParamFixed128(18).decode(data);
  }
}

/// Synonym for [FunctionParamUFixed128]
final class FunctionParamUFixed extends BaseFunctionParamType<Amount> {
  const FunctionParamUFixed() : super('ufixed');

  @override
  Uint8List encode(Amount value) {
    return FunctionParamUFixed128(18).encode(value);
  }

  @override
  Amount decode(Uint8List data) {
    return FunctionParamUFixed128(18).decode(data);
  }
}

final class FunctionParamFixed8 extends FunctionParamFixedBase {
  const FunctionParamFixed8(int decimals) : super('fixed8', decimals);
}

final class FunctionParamUFixed8 extends FunctionParamFixedBase {
  const FunctionParamUFixed8(int decimals) : super('ufixed8', decimals);
}

final class FunctionParamFixed16 extends FunctionParamFixedBase {
  const FunctionParamFixed16(int decimals) : super('fixed16', decimals);
}

final class FunctionParamUFixed16 extends FunctionParamFixedBase {
  const FunctionParamUFixed16(int decimals) : super('ufixed16', decimals);
}

final class FunctionParamFixed24 extends FunctionParamFixedBase {
  const FunctionParamFixed24(int decimals) : super('fixed24', decimals);
}

final class FunctionParamUFixed24 extends FunctionParamFixedBase {
  const FunctionParamUFixed24(int decimals) : super('ufixed24', decimals);
}

final class FunctionParamFixed32 extends FunctionParamFixedBase {
  const FunctionParamFixed32(int decimals) : super('fixed32', decimals);
}

final class FunctionParamUFixed32 extends FunctionParamFixedBase {
  const FunctionParamUFixed32(int decimals) : super('ufixed32', decimals);
}

final class FunctionParamFixed40 extends FunctionParamFixedBase {
  const FunctionParamFixed40(int decimals) : super('fixed40', decimals);
}

final class FunctionParamUFixed40 extends FunctionParamFixedBase {
  const FunctionParamUFixed40(int decimals) : super('ufixed40', decimals);
}

final class FunctionParamFixed48 extends FunctionParamFixedBase {
  const FunctionParamFixed48(int decimals) : super('fixed48', decimals);
}

final class FunctionParamUFixed48 extends FunctionParamFixedBase {
  const FunctionParamUFixed48(int decimals) : super('ufixed48', decimals);
}

final class FunctionParamFixed56 extends FunctionParamFixedBase {
  const FunctionParamFixed56(int decimals) : super('fixed56', decimals);
}

final class FunctionParamUFixed56 extends FunctionParamFixedBase {
  const FunctionParamUFixed56(int decimals) : super('ufixed56', decimals);
}

final class FunctionParamFixed64 extends FunctionParamFixedBase {
  const FunctionParamFixed64(int decimals) : super('fixed64', decimals);
}

final class FunctionParamUFixed64 extends FunctionParamFixedBase {
  const FunctionParamUFixed64(int decimals) : super('ufixed64', decimals);
}

final class FunctionParamFixed72 extends FunctionParamFixedBase {
  const FunctionParamFixed72(int decimals) : super('fixed72', decimals);
}

final class FunctionParamUFixed72 extends FunctionParamFixedBase {
  const FunctionParamUFixed72(int decimals) : super('ufixed72', decimals);
}

final class FunctionParamFixed80 extends FunctionParamFixedBase {
  const FunctionParamFixed80(int decimals) : super('fixed80', decimals);
}

final class FunctionParamUFixed80 extends FunctionParamFixedBase {
  const FunctionParamUFixed80(int decimals) : super('ufixed80', decimals);
}

final class FunctionParamFixed88 extends FunctionParamFixedBase {
  const FunctionParamFixed88(int decimals) : super('fixed88', decimals);
}

final class FunctionParamUFixed88 extends FunctionParamFixedBase {
  const FunctionParamUFixed88(int decimals) : super('ufixed88', decimals);
}

final class FunctionParamFixed96 extends FunctionParamFixedBase {
  const FunctionParamFixed96(int decimals) : super('fixed96', decimals);
}

final class FunctionParamUFixed96 extends FunctionParamFixedBase {
  const FunctionParamUFixed96(int decimals) : super('ufixed96', decimals);
}

final class FunctionParamFixed104 extends FunctionParamFixedBase {
  const FunctionParamFixed104(int decimals) : super('fixed104', decimals);
}

final class FunctionParamUFixed104 extends FunctionParamFixedBase {
  const FunctionParamUFixed104(int decimals) : super('ufixed104', decimals);
}

final class FunctionParamFixed112 extends FunctionParamFixedBase {
  const FunctionParamFixed112(int decimals) : super('fixed112', decimals);
}

final class FunctionParamUFixed112 extends FunctionParamFixedBase {
  const FunctionParamUFixed112(int decimals) : super('ufixed112', decimals);
}

final class FunctionParamFixed120 extends FunctionParamFixedBase {
  const FunctionParamFixed120(int decimals) : super('fixed120', decimals);
}

final class FunctionParamUFixed120 extends FunctionParamFixedBase {
  const FunctionParamUFixed120(int decimals) : super('ufixed120', decimals);
}

final class FunctionParamFixed128 extends FunctionParamFixedBase {
  const FunctionParamFixed128(int decimals) : super('fixed128', decimals);
}

final class FunctionParamUFixed128 extends FunctionParamFixedBase {
  const FunctionParamUFixed128(int decimals) : super('ufixed128', decimals);
}

final class FunctionParamFixed136 extends FunctionParamFixedBase {
  const FunctionParamFixed136(int decimals) : super('fixed136', decimals);
}

final class FunctionParamUFixed136 extends FunctionParamFixedBase {
  const FunctionParamUFixed136(int decimals) : super('ufixed136', decimals);
}

final class FunctionParamFixed144 extends FunctionParamFixedBase {
  const FunctionParamFixed144(int decimals) : super('fixed144', decimals);
}

final class FunctionParamUFixed144 extends FunctionParamFixedBase {
  const FunctionParamUFixed144(int decimals) : super('ufixed144', decimals);
}

final class FunctionParamFixed152 extends FunctionParamFixedBase {
  const FunctionParamFixed152(int decimals) : super('fixed152', decimals);
}

final class FunctionParamUFixed152 extends FunctionParamFixedBase {
  const FunctionParamUFixed152(int decimals) : super('ufixed152', decimals);
}

final class FunctionParamFixed160 extends FunctionParamFixedBase {
  const FunctionParamFixed160(int decimals) : super('fixed160', decimals);
}

final class FunctionParamUFixed160 extends FunctionParamFixedBase {
  const FunctionParamUFixed160(int decimals) : super('ufixed160', decimals);
}

final class FunctionParamFixed168 extends FunctionParamFixedBase {
  const FunctionParamFixed168(int decimals) : super('fixed168', decimals);
}

final class FunctionParamUFixed168 extends FunctionParamFixedBase {
  const FunctionParamUFixed168(int decimals) : super('ufixed168', decimals);
}

final class FunctionParamFixed176 extends FunctionParamFixedBase {
  const FunctionParamFixed176(int decimals) : super('fixed176', decimals);
}

final class FunctionParamUFixed176 extends FunctionParamFixedBase {
  const FunctionParamUFixed176(int decimals) : super('ufixed176', decimals);
}

final class FunctionParamFixed184 extends FunctionParamFixedBase {
  const FunctionParamFixed184(int decimals) : super('fixed184', decimals);
}

final class FunctionParamUFixed184 extends FunctionParamFixedBase {
  const FunctionParamUFixed184(int decimals) : super('ufixed184', decimals);
}

final class FunctionParamFixed192 extends FunctionParamFixedBase {
  const FunctionParamFixed192(int decimals) : super('fixed192', decimals);
}

final class FunctionParamUFixed192 extends FunctionParamFixedBase {
  const FunctionParamUFixed192(int decimals) : super('ufixed192', decimals);
}

final class FunctionParamFixed200 extends FunctionParamFixedBase {
  const FunctionParamFixed200(int decimals) : super('fixed200', decimals);
}

final class FunctionParamUFixed200 extends FunctionParamFixedBase {
  const FunctionParamUFixed200(int decimals) : super('ufixed200', decimals);
}

final class FunctionParamFixed208 extends FunctionParamFixedBase {
  const FunctionParamFixed208(int decimals) : super('fixed208', decimals);
}

final class FunctionParamUFixed208 extends FunctionParamFixedBase {
  const FunctionParamUFixed208(int decimals) : super('ufixed208', decimals);
}

final class FunctionParamFixed216 extends FunctionParamFixedBase {
  const FunctionParamFixed216(int decimals) : super('fixed216', decimals);
}

final class FunctionParamUFixed216 extends FunctionParamFixedBase {
  const FunctionParamUFixed216(int decimals) : super('ufixed216', decimals);
}

final class FunctionParamFixed224 extends FunctionParamFixedBase {
  const FunctionParamFixed224(int decimals) : super('fixed224', decimals);
}

final class FunctionParamUFixed224 extends FunctionParamFixedBase {
  const FunctionParamUFixed224(int decimals) : super('ufixed224', decimals);
}

final class FunctionParamFixed232 extends FunctionParamFixedBase {
  const FunctionParamFixed232(int decimals) : super('fixed232', decimals);
}

final class FunctionParamUFixed232 extends FunctionParamFixedBase {
  const FunctionParamUFixed232(int decimals) : super('ufixed232', decimals);
}

final class FunctionParamFixed240 extends FunctionParamFixedBase {
  const FunctionParamFixed240(int decimals) : super('fixed240', decimals);
}

final class FunctionParamUFixed240 extends FunctionParamFixedBase {
  const FunctionParamUFixed240(int decimals) : super('ufixed240', decimals);
}

final class FunctionParamFixed248 extends FunctionParamFixedBase {
  const FunctionParamFixed248(int decimals) : super('fixed248', decimals);
}

final class FunctionParamUFixed248 extends FunctionParamFixedBase {
  const FunctionParamUFixed248(int decimals) : super('ufixed248', decimals);
}

final class FunctionParamFixed256 extends FunctionParamFixedBase {
  const FunctionParamFixed256(int decimals) : super('fixed256', decimals);
}

final class FunctionParamUFixed256 extends FunctionParamFixedBase {
  const FunctionParamUFixed256(int decimals) : super('ufixed256', decimals);
}
