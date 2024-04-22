//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Return_response_code extends $pb.ProtobufEnum {
  static const Return_response_code SUCCESS = Return_response_code._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const Return_response_code SIGERROR = Return_response_code._(1, _omitEnumNames ? '' : 'SIGERROR');
  static const Return_response_code CONTRACT_VALIDATE_ERROR = Return_response_code._(2, _omitEnumNames ? '' : 'CONTRACT_VALIDATE_ERROR');
  static const Return_response_code CONTRACT_EXE_ERROR = Return_response_code._(3, _omitEnumNames ? '' : 'CONTRACT_EXE_ERROR');
  static const Return_response_code BANDWITH_ERROR = Return_response_code._(4, _omitEnumNames ? '' : 'BANDWITH_ERROR');
  static const Return_response_code DUP_TRANSACTION_ERROR = Return_response_code._(5, _omitEnumNames ? '' : 'DUP_TRANSACTION_ERROR');
  static const Return_response_code TAPOS_ERROR = Return_response_code._(6, _omitEnumNames ? '' : 'TAPOS_ERROR');
  static const Return_response_code TOO_BIG_TRANSACTION_ERROR = Return_response_code._(7, _omitEnumNames ? '' : 'TOO_BIG_TRANSACTION_ERROR');
  static const Return_response_code TRANSACTION_EXPIRATION_ERROR = Return_response_code._(8, _omitEnumNames ? '' : 'TRANSACTION_EXPIRATION_ERROR');
  static const Return_response_code SERVER_BUSY = Return_response_code._(9, _omitEnumNames ? '' : 'SERVER_BUSY');
  static const Return_response_code NO_CONNECTION = Return_response_code._(10, _omitEnumNames ? '' : 'NO_CONNECTION');
  static const Return_response_code NOT_ENOUGH_EFFECTIVE_CONNECTION = Return_response_code._(11, _omitEnumNames ? '' : 'NOT_ENOUGH_EFFECTIVE_CONNECTION');
  static const Return_response_code BLOCK_UNSOLIDIFIED = Return_response_code._(12, _omitEnumNames ? '' : 'BLOCK_UNSOLIDIFIED');
  static const Return_response_code OTHER_ERROR = Return_response_code._(20, _omitEnumNames ? '' : 'OTHER_ERROR');

  static const $core.List<Return_response_code> values = <Return_response_code> [
    SUCCESS,
    SIGERROR,
    CONTRACT_VALIDATE_ERROR,
    CONTRACT_EXE_ERROR,
    BANDWITH_ERROR,
    DUP_TRANSACTION_ERROR,
    TAPOS_ERROR,
    TOO_BIG_TRANSACTION_ERROR,
    TRANSACTION_EXPIRATION_ERROR,
    SERVER_BUSY,
    NO_CONNECTION,
    NOT_ENOUGH_EFFECTIVE_CONNECTION,
    BLOCK_UNSOLIDIFIED,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, Return_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Return_response_code? valueOf($core.int value) => _byValue[value];

  const Return_response_code._($core.int v, $core.String n) : super(v, n);
}

class TransactionSignWeight_Result_response_code extends $pb.ProtobufEnum {
  static const TransactionSignWeight_Result_response_code ENOUGH_PERMISSION = TransactionSignWeight_Result_response_code._(0, _omitEnumNames ? '' : 'ENOUGH_PERMISSION');
  static const TransactionSignWeight_Result_response_code NOT_ENOUGH_PERMISSION = TransactionSignWeight_Result_response_code._(1, _omitEnumNames ? '' : 'NOT_ENOUGH_PERMISSION');
  static const TransactionSignWeight_Result_response_code SIGNATURE_FORMAT_ERROR = TransactionSignWeight_Result_response_code._(2, _omitEnumNames ? '' : 'SIGNATURE_FORMAT_ERROR');
  static const TransactionSignWeight_Result_response_code COMPUTE_ADDRESS_ERROR = TransactionSignWeight_Result_response_code._(3, _omitEnumNames ? '' : 'COMPUTE_ADDRESS_ERROR');
  static const TransactionSignWeight_Result_response_code PERMISSION_ERROR = TransactionSignWeight_Result_response_code._(4, _omitEnumNames ? '' : 'PERMISSION_ERROR');
  static const TransactionSignWeight_Result_response_code OTHER_ERROR = TransactionSignWeight_Result_response_code._(20, _omitEnumNames ? '' : 'OTHER_ERROR');

  static const $core.List<TransactionSignWeight_Result_response_code> values = <TransactionSignWeight_Result_response_code> [
    ENOUGH_PERMISSION,
    NOT_ENOUGH_PERMISSION,
    SIGNATURE_FORMAT_ERROR,
    COMPUTE_ADDRESS_ERROR,
    PERMISSION_ERROR,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, TransactionSignWeight_Result_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionSignWeight_Result_response_code? valueOf($core.int value) => _byValue[value];

  const TransactionSignWeight_Result_response_code._($core.int v, $core.String n) : super(v, n);
}

class TransactionApprovedList_Result_response_code extends $pb.ProtobufEnum {
  static const TransactionApprovedList_Result_response_code SUCCESS = TransactionApprovedList_Result_response_code._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const TransactionApprovedList_Result_response_code SIGNATURE_FORMAT_ERROR = TransactionApprovedList_Result_response_code._(1, _omitEnumNames ? '' : 'SIGNATURE_FORMAT_ERROR');
  static const TransactionApprovedList_Result_response_code COMPUTE_ADDRESS_ERROR = TransactionApprovedList_Result_response_code._(2, _omitEnumNames ? '' : 'COMPUTE_ADDRESS_ERROR');
  static const TransactionApprovedList_Result_response_code OTHER_ERROR = TransactionApprovedList_Result_response_code._(20, _omitEnumNames ? '' : 'OTHER_ERROR');

  static const $core.List<TransactionApprovedList_Result_response_code> values = <TransactionApprovedList_Result_response_code> [
    SUCCESS,
    SIGNATURE_FORMAT_ERROR,
    COMPUTE_ADDRESS_ERROR,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, TransactionApprovedList_Result_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionApprovedList_Result_response_code? valueOf($core.int value) => _byValue[value];

  const TransactionApprovedList_Result_response_code._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
