//
//  Generated code. Do not modify.
//  source: core/contract/storage_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use buyStorageBytesContractDescriptor instead')
const BuyStorageBytesContract$json = {
  '1': 'BuyStorageBytesContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'bytes', '3': 2, '4': 1, '5': 3, '10': 'bytes'},
  ],
};

/// Descriptor for `BuyStorageBytesContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyStorageBytesContractDescriptor = $convert
    .base64Decode('ChdCdXlTdG9yYWdlQnl0ZXNDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3MSFAoFYnl0ZXMYAiABKANSBWJ5dGVz');

@$core.Deprecated('Use buyStorageContractDescriptor instead')
const BuyStorageContract$json = {
  '1': 'BuyStorageContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'quant', '3': 2, '4': 1, '5': 3, '10': 'quant'},
  ],
};

/// Descriptor for `BuyStorageContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyStorageContractDescriptor = $convert
    .base64Decode('ChJCdXlTdG9yYWdlQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZGRyZX'
        'NzEhQKBXF1YW50GAIgASgDUgVxdWFudA==');

@$core.Deprecated('Use sellStorageContractDescriptor instead')
const SellStorageContract$json = {
  '1': 'SellStorageContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'storage_bytes', '3': 2, '4': 1, '5': 3, '10': 'storageBytes'},
  ],
};

/// Descriptor for `SellStorageContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sellStorageContractDescriptor = $convert
    .base64Decode('ChNTZWxsU3RvcmFnZUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQWRkcm'
        'VzcxIjCg1zdG9yYWdlX2J5dGVzGAIgASgDUgxzdG9yYWdlQnl0ZXM=');

@$core.Deprecated('Use updateBrokerageContractDescriptor instead')
const UpdateBrokerageContract$json = {
  '1': 'UpdateBrokerageContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'brokerage', '3': 2, '4': 1, '5': 5, '10': 'brokerage'},
  ],
};

/// Descriptor for `UpdateBrokerageContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBrokerageContractDescriptor = $convert
    .base64Decode('ChdVcGRhdGVCcm9rZXJhZ2VDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3MSHAoJYnJva2VyYWdlGAIgASgFUglicm9rZXJhZ2U=');
