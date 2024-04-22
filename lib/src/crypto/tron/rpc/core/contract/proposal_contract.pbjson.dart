//
//  Generated code. Do not modify.
//  source: core/contract/proposal_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use proposalApproveContractDescriptor instead')
const ProposalApproveContract$json = {
  '1': 'ProposalApproveContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'proposal_id', '3': 2, '4': 1, '5': 3, '10': 'proposalId'},
    {'1': 'is_add_approval', '3': 3, '4': 1, '5': 8, '10': 'isAddApproval'},
  ],
};

/// Descriptor for `ProposalApproveContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalApproveContractDescriptor = $convert.base64Decode(
    'ChdQcm9wb3NhbEFwcHJvdmVDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
    'FkZHJlc3MSHwoLcHJvcG9zYWxfaWQYAiABKANSCnByb3Bvc2FsSWQSJgoPaXNfYWRkX2FwcHJv'
    'dmFsGAMgASgIUg1pc0FkZEFwcHJvdmFs');

@$core.Deprecated('Use proposalCreateContractDescriptor instead')
const ProposalCreateContract$json = {
  '1': 'ProposalCreateContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.protocol.ProposalCreateContract.ParametersEntry', '10': 'parameters'},
  ],
  '3': [ProposalCreateContract_ParametersEntry$json],
};

@$core.Deprecated('Use proposalCreateContractDescriptor instead')
const ProposalCreateContract_ParametersEntry$json = {
  '1': 'ParametersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ProposalCreateContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalCreateContractDescriptor = $convert.base64Decode(
    'ChZQcm9wb3NhbENyZWF0ZUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQW'
    'RkcmVzcxJQCgpwYXJhbWV0ZXJzGAIgAygLMjAucHJvdG9jb2wuUHJvcG9zYWxDcmVhdGVDb250'
    'cmFjdC5QYXJhbWV0ZXJzRW50cnlSCnBhcmFtZXRlcnMaPQoPUGFyYW1ldGVyc0VudHJ5EhAKA2'
    'tleRgBIAEoA1IDa2V5EhQKBXZhbHVlGAIgASgDUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use proposalDeleteContractDescriptor instead')
const ProposalDeleteContract$json = {
  '1': 'ProposalDeleteContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'proposal_id', '3': 2, '4': 1, '5': 3, '10': 'proposalId'},
  ],
};

/// Descriptor for `ProposalDeleteContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalDeleteContractDescriptor = $convert.base64Decode(
    'ChZQcm9wb3NhbERlbGV0ZUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQW'
    'RkcmVzcxIfCgtwcm9wb3NhbF9pZBgCIAEoA1IKcHJvcG9zYWxJZA==');

