//
//  Generated code. Do not modify.
//  source: core/contract/shield_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authenticationPathDescriptor instead')
const AuthenticationPath$json = {
  '1': 'AuthenticationPath',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `AuthenticationPath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationPathDescriptor = $convert.base64Decode(
    'ChJBdXRoZW50aWNhdGlvblBhdGgSFAoFdmFsdWUYASADKAhSBXZhbHVl');

@$core.Deprecated('Use merklePathDescriptor instead')
const MerklePath$json = {
  '1': 'MerklePath',
  '2': [
    {'1': 'authentication_paths', '3': 1, '4': 3, '5': 11, '6': '.protocol.AuthenticationPath', '10': 'authenticationPaths'},
    {'1': 'index', '3': 2, '4': 3, '5': 8, '10': 'index'},
    {'1': 'rt', '3': 3, '4': 1, '5': 12, '10': 'rt'},
  ],
};

/// Descriptor for `MerklePath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merklePathDescriptor = $convert.base64Decode(
    'CgpNZXJrbGVQYXRoEk8KFGF1dGhlbnRpY2F0aW9uX3BhdGhzGAEgAygLMhwucHJvdG9jb2wuQX'
    'V0aGVudGljYXRpb25QYXRoUhNhdXRoZW50aWNhdGlvblBhdGhzEhQKBWluZGV4GAIgAygIUgVp'
    'bmRleBIOCgJydBgDIAEoDFICcnQ=');

@$core.Deprecated('Use outputPointDescriptor instead')
const OutputPoint$json = {
  '1': 'OutputPoint',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'index', '3': 2, '4': 1, '5': 5, '10': 'index'},
  ],
};

/// Descriptor for `OutputPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputPointDescriptor = $convert.base64Decode(
    'CgtPdXRwdXRQb2ludBISCgRoYXNoGAEgASgMUgRoYXNoEhQKBWluZGV4GAIgASgFUgVpbmRleA'
    '==');

@$core.Deprecated('Use outputPointInfoDescriptor instead')
const OutputPointInfo$json = {
  '1': 'OutputPointInfo',
  '2': [
    {'1': 'out_points', '3': 1, '4': 3, '5': 11, '6': '.protocol.OutputPoint', '10': 'outPoints'},
    {'1': 'block_num', '3': 2, '4': 1, '5': 5, '10': 'blockNum'},
  ],
};

/// Descriptor for `OutputPointInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputPointInfoDescriptor = $convert.base64Decode(
    'Cg9PdXRwdXRQb2ludEluZm8SNAoKb3V0X3BvaW50cxgBIAMoCzIVLnByb3RvY29sLk91dHB1dF'
    'BvaW50UglvdXRQb2ludHMSGwoJYmxvY2tfbnVtGAIgASgFUghibG9ja051bQ==');

@$core.Deprecated('Use pedersenHashDescriptor instead')
const PedersenHash$json = {
  '1': 'PedersenHash',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `PedersenHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pedersenHashDescriptor = $convert.base64Decode(
    'CgxQZWRlcnNlbkhhc2gSGAoHY29udGVudBgBIAEoDFIHY29udGVudA==');

@$core.Deprecated('Use incrementalMerkleTreeDescriptor instead')
const IncrementalMerkleTree$json = {
  '1': 'IncrementalMerkleTree',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.protocol.PedersenHash', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.protocol.PedersenHash', '10': 'right'},
    {'1': 'parents', '3': 3, '4': 3, '5': 11, '6': '.protocol.PedersenHash', '10': 'parents'},
  ],
};

/// Descriptor for `IncrementalMerkleTree`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incrementalMerkleTreeDescriptor = $convert.base64Decode(
    'ChVJbmNyZW1lbnRhbE1lcmtsZVRyZWUSKgoEbGVmdBgBIAEoCzIWLnByb3RvY29sLlBlZGVyc2'
    'VuSGFzaFIEbGVmdBIsCgVyaWdodBgCIAEoCzIWLnByb3RvY29sLlBlZGVyc2VuSGFzaFIFcmln'
    'aHQSMAoHcGFyZW50cxgDIAMoCzIWLnByb3RvY29sLlBlZGVyc2VuSGFzaFIHcGFyZW50cw==');

@$core.Deprecated('Use incrementalMerkleVoucherDescriptor instead')
const IncrementalMerkleVoucher$json = {
  '1': 'IncrementalMerkleVoucher',
  '2': [
    {'1': 'tree', '3': 1, '4': 1, '5': 11, '6': '.protocol.IncrementalMerkleTree', '10': 'tree'},
    {'1': 'filled', '3': 2, '4': 3, '5': 11, '6': '.protocol.PedersenHash', '10': 'filled'},
    {'1': 'cursor', '3': 3, '4': 1, '5': 11, '6': '.protocol.IncrementalMerkleTree', '10': 'cursor'},
    {'1': 'cursor_depth', '3': 4, '4': 1, '5': 3, '10': 'cursorDepth'},
    {'1': 'rt', '3': 5, '4': 1, '5': 12, '10': 'rt'},
    {'1': 'output_point', '3': 10, '4': 1, '5': 11, '6': '.protocol.OutputPoint', '10': 'outputPoint'},
  ],
};

/// Descriptor for `IncrementalMerkleVoucher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incrementalMerkleVoucherDescriptor = $convert.base64Decode(
    'ChhJbmNyZW1lbnRhbE1lcmtsZVZvdWNoZXISMwoEdHJlZRgBIAEoCzIfLnByb3RvY29sLkluY3'
    'JlbWVudGFsTWVya2xlVHJlZVIEdHJlZRIuCgZmaWxsZWQYAiADKAsyFi5wcm90b2NvbC5QZWRl'
    'cnNlbkhhc2hSBmZpbGxlZBI3CgZjdXJzb3IYAyABKAsyHy5wcm90b2NvbC5JbmNyZW1lbnRhbE'
    '1lcmtsZVRyZWVSBmN1cnNvchIhCgxjdXJzb3JfZGVwdGgYBCABKANSC2N1cnNvckRlcHRoEg4K'
    'AnJ0GAUgASgMUgJydBI4CgxvdXRwdXRfcG9pbnQYCiABKAsyFS5wcm90b2NvbC5PdXRwdXRQb2'
    'ludFILb3V0cHV0UG9pbnQ=');

@$core.Deprecated('Use incrementalMerkleVoucherInfoDescriptor instead')
const IncrementalMerkleVoucherInfo$json = {
  '1': 'IncrementalMerkleVoucherInfo',
  '2': [
    {'1': 'vouchers', '3': 1, '4': 3, '5': 11, '6': '.protocol.IncrementalMerkleVoucher', '10': 'vouchers'},
    {'1': 'paths', '3': 2, '4': 3, '5': 12, '10': 'paths'},
  ],
};

/// Descriptor for `IncrementalMerkleVoucherInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incrementalMerkleVoucherInfoDescriptor = $convert.base64Decode(
    'ChxJbmNyZW1lbnRhbE1lcmtsZVZvdWNoZXJJbmZvEj4KCHZvdWNoZXJzGAEgAygLMiIucHJvdG'
    '9jb2wuSW5jcmVtZW50YWxNZXJrbGVWb3VjaGVyUgh2b3VjaGVycxIUCgVwYXRocxgCIAMoDFIF'
    'cGF0aHM=');

@$core.Deprecated('Use spendDescriptionDescriptor instead')
const SpendDescription$json = {
  '1': 'SpendDescription',
  '2': [
    {'1': 'value_commitment', '3': 1, '4': 1, '5': 12, '10': 'valueCommitment'},
    {'1': 'anchor', '3': 2, '4': 1, '5': 12, '10': 'anchor'},
    {'1': 'nullifier', '3': 3, '4': 1, '5': 12, '10': 'nullifier'},
    {'1': 'rk', '3': 4, '4': 1, '5': 12, '10': 'rk'},
    {'1': 'zkproof', '3': 5, '4': 1, '5': 12, '10': 'zkproof'},
    {'1': 'spend_authority_signature', '3': 6, '4': 1, '5': 12, '10': 'spendAuthoritySignature'},
  ],
};

/// Descriptor for `SpendDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spendDescriptionDescriptor = $convert.base64Decode(
    'ChBTcGVuZERlc2NyaXB0aW9uEikKEHZhbHVlX2NvbW1pdG1lbnQYASABKAxSD3ZhbHVlQ29tbW'
    'l0bWVudBIWCgZhbmNob3IYAiABKAxSBmFuY2hvchIcCgludWxsaWZpZXIYAyABKAxSCW51bGxp'
    'ZmllchIOCgJyaxgEIAEoDFICcmsSGAoHemtwcm9vZhgFIAEoDFIHemtwcm9vZhI6ChlzcGVuZF'
    '9hdXRob3JpdHlfc2lnbmF0dXJlGAYgASgMUhdzcGVuZEF1dGhvcml0eVNpZ25hdHVyZQ==');

@$core.Deprecated('Use receiveDescriptionDescriptor instead')
const ReceiveDescription$json = {
  '1': 'ReceiveDescription',
  '2': [
    {'1': 'value_commitment', '3': 1, '4': 1, '5': 12, '10': 'valueCommitment'},
    {'1': 'note_commitment', '3': 2, '4': 1, '5': 12, '10': 'noteCommitment'},
    {'1': 'epk', '3': 3, '4': 1, '5': 12, '10': 'epk'},
    {'1': 'c_enc', '3': 4, '4': 1, '5': 12, '10': 'cEnc'},
    {'1': 'c_out', '3': 5, '4': 1, '5': 12, '10': 'cOut'},
    {'1': 'zkproof', '3': 6, '4': 1, '5': 12, '10': 'zkproof'},
  ],
};

/// Descriptor for `ReceiveDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveDescriptionDescriptor = $convert.base64Decode(
    'ChJSZWNlaXZlRGVzY3JpcHRpb24SKQoQdmFsdWVfY29tbWl0bWVudBgBIAEoDFIPdmFsdWVDb2'
    '1taXRtZW50EicKD25vdGVfY29tbWl0bWVudBgCIAEoDFIObm90ZUNvbW1pdG1lbnQSEAoDZXBr'
    'GAMgASgMUgNlcGsSEwoFY19lbmMYBCABKAxSBGNFbmMSEwoFY19vdXQYBSABKAxSBGNPdXQSGA'
    'oHemtwcm9vZhgGIAEoDFIHemtwcm9vZg==');

@$core.Deprecated('Use shieldedTransferContractDescriptor instead')
const ShieldedTransferContract$json = {
  '1': 'ShieldedTransferContract',
  '2': [
    {'1': 'transparent_from_address', '3': 1, '4': 1, '5': 12, '10': 'transparentFromAddress'},
    {'1': 'from_amount', '3': 2, '4': 1, '5': 3, '10': 'fromAmount'},
    {'1': 'spend_description', '3': 3, '4': 3, '5': 11, '6': '.protocol.SpendDescription', '10': 'spendDescription'},
    {'1': 'receive_description', '3': 4, '4': 3, '5': 11, '6': '.protocol.ReceiveDescription', '10': 'receiveDescription'},
    {'1': 'binding_signature', '3': 5, '4': 1, '5': 12, '10': 'bindingSignature'},
    {'1': 'transparent_to_address', '3': 6, '4': 1, '5': 12, '10': 'transparentToAddress'},
    {'1': 'to_amount', '3': 7, '4': 1, '5': 3, '10': 'toAmount'},
  ],
};

/// Descriptor for `ShieldedTransferContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shieldedTransferContractDescriptor = $convert.base64Decode(
    'ChhTaGllbGRlZFRyYW5zZmVyQ29udHJhY3QSOAoYdHJhbnNwYXJlbnRfZnJvbV9hZGRyZXNzGA'
    'EgASgMUhZ0cmFuc3BhcmVudEZyb21BZGRyZXNzEh8KC2Zyb21fYW1vdW50GAIgASgDUgpmcm9t'
    'QW1vdW50EkcKEXNwZW5kX2Rlc2NyaXB0aW9uGAMgAygLMhoucHJvdG9jb2wuU3BlbmREZXNjcm'
    'lwdGlvblIQc3BlbmREZXNjcmlwdGlvbhJNChNyZWNlaXZlX2Rlc2NyaXB0aW9uGAQgAygLMhwu'
    'cHJvdG9jb2wuUmVjZWl2ZURlc2NyaXB0aW9uUhJyZWNlaXZlRGVzY3JpcHRpb24SKwoRYmluZG'
    'luZ19zaWduYXR1cmUYBSABKAxSEGJpbmRpbmdTaWduYXR1cmUSNAoWdHJhbnNwYXJlbnRfdG9f'
    'YWRkcmVzcxgGIAEoDFIUdHJhbnNwYXJlbnRUb0FkZHJlc3MSGwoJdG9fYW1vdW50GAcgASgDUg'
    'h0b0Ftb3VudA==');

