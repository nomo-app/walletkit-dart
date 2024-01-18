// ignore_for_file: constant_identifier_names

// TODO: Refactor this class to be more readable

enum OPCODE {
  /// Constants
  OP_0(0x00),
  OP_FALSE(0x00),
  OP_PUSHDATA1(0x4c),
  OP_PUSHDATA2(0x4d),
  OP_PUSHDATA4(0x4e),
  OP_1NEGATE(0x4f),
  OP_RESERVED(0x50),
  OP_1(0x51),
  OP_TRUE(0x51),
  OP_2(0x52),
  OP_3(0x53),
  OP_4(0x54),
  OP_5(0x55),
  OP_6(0x56),
  OP_7(0x57),
  OP_8(0x58),
  OP_9(0x59),
  OP_10(0x5a),
  OP_11(0x5b),
  OP_12(0x5c),
  OP_13(0x5d),
  OP_14(0x5e),
  OP_15(0x5f),
  OP_16(0x60),

  /// Flow control
  OP_NOP(0x61),
  OP_VER(0x62),
  OP_IF(0x63),
  OP_NOTIF(0x64),
  OP_VERIF(0x65),
  OP_VERNOTIF(0x66),
  OP_ELSE(0x67),
  OP_ENDIF(0x68),
  OP_VERIFY(0x69),
  OP_RETURN(0x6a),

  /// Stack
  OP_TOALTSTACK(0x6b),
  OP_FROMALTSTACK(0x6c),
  OP_2DROP(0x6d),
  OP_2DUP(0x6e),
  OP_3DUP(0x6f),
  OP_2OVER(0x70),
  OP_2ROT(0x71),
  OP_2SWAP(0x72),

  /// Splice
  OP_IFDUP(0x73),
  OP_DEPTH(0x74),
  OP_DROP(0x75),
  OP_DUP(0x76),
  OP_NIP(0x77),
  OP_OVER(0x78),
  OP_PICK(0x79),
  OP_ROLL(0x7a),
  OP_ROT(0x7b),
  OP_SWAP(0x7c),
  OP_TUCK(0x7d),
  OP_CAT(0x7e),
  OP_SUBSTR(0x7f),
  OP_LEFT(0x80),
  OP_RIGHT(0x81),
  OP_SIZE(0x82),

  /// Bitwise logic
  OP_INVERT(0x83),
  OP_AND(0x84),
  OP_OR(0x85),
  OP_XOR(0x86),
  OP_EQUAL(0x87),
  OP_EQUALVERIFY(0x88),

  /// Arithmetic
  OP_RESERVED1(0x89),
  OP_RESERVED2(0x8a),
  OP_1ADD(0x8b),
  OP_1SUB(0x8c),
  OP_2MUL(0x8d),
  OP_2DIV(0x8e),
  OP_NEGATE(0x8f),
  OP_ABS(0x90),
  OP_NOT(0x91),
  OP_0NOTEQUAL(0x92),
  OP_ADD(0x93),
  OP_SUB(0x94),
  OP_MUL(0x95),
  OP_DIV(0x96),
  OP_MOD(0x97),
  OP_LSHIFT(0x98),
  OP_RSHIFT(0x99),
  OP_BOOLAND(0x9a),
  OP_BOOLOR(0x9b),
  OP_NUMEQUAL(0x9c),
  OP_NUMEQUALVERIFY(0x9d),
  OP_NUMNOTEQUAL(0x9e),
  OP_LESSTHAN(0x9f),
  OP_GREATERTHAN(0xa0),
  OP_LESSTHANOREQUAL(0xa1),
  OP_GREATERTHANOREQUAL(0xa2),
  OP_MIN(0xa3),
  OP_MAX(0xa4),
  OP_WITHIN(0xa5),

  /// Crypto
  OP_RIPEMD160(0xa6),
  OP_SHA1(0xa7),
  OP_SHA256(0xa8),
  OP_HASH160(0xa9),
  OP_HASH256(0xaa),
  OP_CODESEPARATOR(0xab),
  OP_CHECKSIG(0xac),
  OP_CHECKSIGVERIFY(0xad),
  OP_CHECKMULTISIG(0xae),
  OP_CHECKMULTISIGVERIFY(0xaf),

  /// Expansion
  OP_NOP1(0xb0),
  OP_NOP2(0xb1),
  OP_CHECKLOCKTIMEVERIFY(0xb1),
  OP_NOP3(0xb2),
  OP_CHECKSEQUENCEVERIFY(0xb2),
  OP_NOP4(0xb3),
  OP_NOP5(0xb4),
  OP_NOP6(0xb5),
  OP_NOP7(0xb6),
  OP_NOP8(0xb7),
  OP_NOP9(0xb8),
  OP_NOP10(0xb9),
  OP_UNKNOWN(0xff);

  final int hex;

  const OPCODE(this.hex);

  String get string => toString().split('.').last;

  @override
  String toString() {
    if (this == OPCODE.OP_0) return '00';

    return hex.toRadixString(16);
  }
}

/// Constants
const int OP_0 = 0x00;
const int OP_FALSE = 0x00;
const int OP_PUSHDATA1 = 0x4c;
const int OP_PUSHDATA2 = 0x4d;
const int OP_PUSHDATA4 = 0x4e;
const int OP_1NEGATE = 0x4f;
const int OP_RESERVED = 0x50;
const int OP_1 = 0x51;
const int OP_TRUE = 0x51;
const int OP_2 = 0x52;
const int OP_3 = 0x53;
const int OP_4 = 0x54;
const int OP_5 = 0x55;
const int OP_6 = 0x56;
const int OP_7 = 0x57;
const int OP_8 = 0x58;
const int OP_9 = 0x59;
const int OP_10 = 0x5a;
const int OP_11 = 0x5b;
const int OP_12 = 0x5c;
const int OP_13 = 0x5d;
const int OP_14 = 0x5e;
const int OP_15 = 0x5f;
const int OP_16 = 0x60;

/// Flow control
const int OP_NOP = 0x61;
const int OP_VER = 0x62;
const int OP_IF = 0x63;
const int OP_NOTIF = 0x64;
const int OP_VERIF = 0x65;
const int OP_VERNOTIF = 0x66;
const int OP_ELSE = 0x67;
const int OP_ENDIF = 0x68;
const int OP_VERIFY = 0x69;
const int OP_RETURN = 0x6a;

/// Stack
const int OP_TOALTSTACK = 0x6b;
const int OP_FROMALTSTACK = 0x6c;
const int OP_2DROP = 0x6d;
const int OP_2DUP = 0x6e;
const int OP_3DUP = 0x6f;
const int OP_2OVER = 0x70;
const int OP_2ROT = 0x71;
const int OP_2SWAP = 0x72;

/// Splice
const int OP_IFDUP = 0x73;
const int OP_DEPTH = 0x74;
const int OP_DROP = 0x75;
const int OP_DUP = 0x76;
const int OP_NIP = 0x77;
const int OP_OVER = 0x78;
const int OP_PICK = 0x79;
const int OP_ROLL = 0x7a;
const int OP_ROT = 0x7b;
const int OP_SWAP = 0x7c;
const int OP_TUCK = 0x7d;
const int OP_CAT = 0x7e;
const int OP_SUBSTR = 0x7f;
const int OP_LEFT = 0x80;
const int OP_RIGHT = 0x81;
const int OP_SIZE = 0x82;

/// Bitwise logic
const int OP_INVERT = 0x83;
const int OP_AND = 0x84;
const int OP_OR = 0x85;
const int OP_XOR = 0x86;
const int OP_EQUAL = 0x87;
const int OP_EQUALVERIFY = 0x88;

/// Arithmetic
const int OP_RESERVED1 = 0x89;
const int OP_RESERVED2 = 0x8a;
const int OP_1ADD = 0x8b;
const int OP_1SUB = 0x8c;
const int OP_2MUL = 0x8d;
const int OP_2DIV = 0x8e;
const int OP_NEGATE = 0x8f;
const int OP_ABS = 0x90;
const int OP_NOT = 0x91;
const int OP_0NOTEQUAL = 0x92;
const int OP_ADD = 0x93;
const int OP_SUB = 0x94;
const int OP_MUL = 0x95;
const int OP_DIV = 0x96;
const int OP_MOD = 0x97;
const int OP_LSHIFT = 0x98;
const int OP_RSHIFT = 0x99;
const int OP_BOOLAND = 0x9a;
const int OP_BOOLOR = 0x9b;
const int OP_NUMEQUAL = 0x9c;
const int OP_NUMEQUALVERIFY = 0x9d;
const int OP_NUMNOTEQUAL = 0x9e;
const int OP_LESSTHAN = 0x9f;
const int OP_GREATERTHAN = 0xa0;
const int OP_LESSTHANOREQUAL = 0xa1;
const int OP_GREATERTHANOREQUAL = 0xa2;
const int OP_MIN = 0xa3;
const int OP_MAX = 0xa4;
const int OP_WITHIN = 0xa5;

/// Crypto
const int OP_RIPEMD160 = 0xa6;
const int OP_SHA1 = 0xa7;
const int OP_SHA256 = 0xa8;
const int OP_HASH160 = 0xa9;
const int OP_HASH256 = 0xaa;
const int OP_CODESEPARATOR = 0xab;
const int OP_CHECKSIG = 0xac;
const int OP_CHECKSIGVERIFY = 0xad;
const int OP_CHECKMULTISIG = 0xae;
const int OP_CHECKMULTISIGVERIFY = 0xaf;

/// Expansion
const int OP_NOP1 = 0xb0;
const int OP_NOP2 = 0xb1;
const int OP_CHECKLOCKTIMEVERIFY = 0xb1;
const int OP_NOP3 = 0xb2;
const int OP_CHECKSEQUENCEVERIFY = 0xb2;
const int OP_NOP4 = 0xb3;
const int OP_NOP5 = 0xb4;
const int OP_NOP6 = 0xb5;
const int OP_NOP7 = 0xb6;
const int OP_NOP8 = 0xb7;
const int OP_NOP9 = 0xb8;
const int OP_NOP10 = 0xb9;
const int OP_UNKNOWN = 0xff;
