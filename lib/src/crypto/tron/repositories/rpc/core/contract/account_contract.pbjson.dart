//
//  Generated code. Do not modify.
//  source: core/contract/account_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use accountCreateContractDescriptor instead')
const AccountCreateContract$json = {
  '1': 'AccountCreateContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'account_address', '3': 2, '4': 1, '5': 12, '10': 'accountAddress'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.protocol.AccountType', '10': 'type'},
  ],
};

/// Descriptor for `AccountCreateContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountCreateContractDescriptor = $convert
    .base64Decode('ChVBY2NvdW50Q3JlYXRlQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZG'
        'RyZXNzEicKD2FjY291bnRfYWRkcmVzcxgCIAEoDFIOYWNjb3VudEFkZHJlc3MSKQoEdHlwZRgD'
        'IAEoDjIVLnByb3RvY29sLkFjY291bnRUeXBlUgR0eXBl');

@$core.Deprecated('Use accountUpdateContractDescriptor instead')
const AccountUpdateContract$json = {
  '1': 'AccountUpdateContract',
  '2': [
    {'1': 'account_name', '3': 1, '4': 1, '5': 12, '10': 'accountName'},
    {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `AccountUpdateContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountUpdateContractDescriptor = $convert
    .base64Decode('ChVBY2NvdW50VXBkYXRlQ29udHJhY3QSIQoMYWNjb3VudF9uYW1lGAEgASgMUgthY2NvdW50Tm'
        'FtZRIjCg1vd25lcl9hZGRyZXNzGAIgASgMUgxvd25lckFkZHJlc3M=');

@$core.Deprecated('Use setAccountIdContractDescriptor instead')
const SetAccountIdContract$json = {
  '1': 'SetAccountIdContract',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 12, '10': 'accountId'},
    {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `SetAccountIdContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAccountIdContractDescriptor = $convert
    .base64Decode('ChRTZXRBY2NvdW50SWRDb250cmFjdBIdCgphY2NvdW50X2lkGAEgASgMUglhY2NvdW50SWQSIw'
        'oNb3duZXJfYWRkcmVzcxgCIAEoDFIMb3duZXJBZGRyZXNz');

@$core.Deprecated('Use accountPermissionUpdateContractDescriptor instead')
const AccountPermissionUpdateContract$json = {
  '1': 'AccountPermissionUpdateContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'owner', '3': 2, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'owner'},
    {'1': 'witness', '3': 3, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'witness'},
    {'1': 'actives', '3': 4, '4': 3, '5': 11, '6': '.protocol.Permission', '10': 'actives'},
  ],
};

/// Descriptor for `AccountPermissionUpdateContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountPermissionUpdateContractDescriptor = $convert
    .base64Decode('Ch9BY2NvdW50UGVybWlzc2lvblVwZGF0ZUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKA'
        'xSDG93bmVyQWRkcmVzcxIqCgVvd25lchgCIAEoCzIULnByb3RvY29sLlBlcm1pc3Npb25SBW93'
        'bmVyEi4KB3dpdG5lc3MYAyABKAsyFC5wcm90b2NvbC5QZXJtaXNzaW9uUgd3aXRuZXNzEi4KB2'
        'FjdGl2ZXMYBCADKAsyFC5wcm90b2NvbC5QZXJtaXNzaW9uUgdhY3RpdmVz');
