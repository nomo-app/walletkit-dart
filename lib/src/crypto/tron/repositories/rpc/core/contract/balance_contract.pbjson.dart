//
//  Generated code. Do not modify.
//  source: core/contract/balance_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use freezeBalanceContractDescriptor instead')
const FreezeBalanceContract$json = {
  '1': 'FreezeBalanceContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'frozen_balance', '3': 2, '4': 1, '5': 3, '10': 'frozenBalance'},
    {'1': 'frozen_duration', '3': 3, '4': 1, '5': 3, '10': 'frozenDuration'},
    {'1': 'resource', '3': 10, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    {'1': 'receiver_address', '3': 15, '4': 1, '5': 12, '10': 'receiverAddress'},
  ],
};

/// Descriptor for `FreezeBalanceContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeBalanceContractDescriptor = $convert
    .base64Decode('ChVGcmVlemVCYWxhbmNlQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZG'
        'RyZXNzEiUKDmZyb3plbl9iYWxhbmNlGAIgASgDUg1mcm96ZW5CYWxhbmNlEicKD2Zyb3plbl9k'
        'dXJhdGlvbhgDIAEoA1IOZnJvemVuRHVyYXRpb24SMgoIcmVzb3VyY2UYCiABKA4yFi5wcm90b2'
        'NvbC5SZXNvdXJjZUNvZGVSCHJlc291cmNlEikKEHJlY2VpdmVyX2FkZHJlc3MYDyABKAxSD3Jl'
        'Y2VpdmVyQWRkcmVzcw==');

@$core.Deprecated('Use unfreezeBalanceContractDescriptor instead')
const UnfreezeBalanceContract$json = {
  '1': 'UnfreezeBalanceContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'resource', '3': 10, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    {'1': 'receiver_address', '3': 15, '4': 1, '5': 12, '10': 'receiverAddress'},
  ],
};

/// Descriptor for `UnfreezeBalanceContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfreezeBalanceContractDescriptor = $convert
    .base64Decode('ChdVbmZyZWV6ZUJhbGFuY2VDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3MSMgoIcmVzb3VyY2UYCiABKA4yFi5wcm90b2NvbC5SZXNvdXJjZUNvZGVSCHJlc291'
        'cmNlEikKEHJlY2VpdmVyX2FkZHJlc3MYDyABKAxSD3JlY2VpdmVyQWRkcmVzcw==');

@$core.Deprecated('Use withdrawBalanceContractDescriptor instead')
const WithdrawBalanceContract$json = {
  '1': 'WithdrawBalanceContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `WithdrawBalanceContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List withdrawBalanceContractDescriptor = $convert
    .base64Decode('ChdXaXRoZHJhd0JhbGFuY2VDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3M=');

@$core.Deprecated('Use transferContractDescriptor instead')
const TransferContract$json = {
  '1': 'TransferContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'to_address', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `TransferContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferContractDescriptor = $convert
    .base64Decode('ChBUcmFuc2ZlckNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQWRkcmVzcx'
        'IdCgp0b19hZGRyZXNzGAIgASgMUgl0b0FkZHJlc3MSFgoGYW1vdW50GAMgASgDUgZhbW91bnQ=');

@$core.Deprecated('Use transactionBalanceTraceDescriptor instead')
const TransactionBalanceTrace$json = {
  '1': 'TransactionBalanceTrace',
  '2': [
    {'1': 'transaction_identifier', '3': 1, '4': 1, '5': 12, '10': 'transactionIdentifier'},
    {
      '1': 'operation',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.protocol.TransactionBalanceTrace.Operation',
      '10': 'operation'
    },
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
  ],
  '3': [TransactionBalanceTrace_Operation$json],
};

@$core.Deprecated('Use transactionBalanceTraceDescriptor instead')
const TransactionBalanceTrace_Operation$json = {
  '1': 'Operation',
  '2': [
    {'1': 'operation_identifier', '3': 1, '4': 1, '5': 3, '10': 'operationIdentifier'},
    {'1': 'address', '3': 2, '4': 1, '5': 12, '10': 'address'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `TransactionBalanceTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionBalanceTraceDescriptor = $convert
    .base64Decode('ChdUcmFuc2FjdGlvbkJhbGFuY2VUcmFjZRI1ChZ0cmFuc2FjdGlvbl9pZGVudGlmaWVyGAEgAS'
        'gMUhV0cmFuc2FjdGlvbklkZW50aWZpZXISSQoJb3BlcmF0aW9uGAIgAygLMisucHJvdG9jb2wu'
        'VHJhbnNhY3Rpb25CYWxhbmNlVHJhY2UuT3BlcmF0aW9uUglvcGVyYXRpb24SEgoEdHlwZRgDIA'
        'EoCVIEdHlwZRIWCgZzdGF0dXMYBCABKAlSBnN0YXR1cxpwCglPcGVyYXRpb24SMQoUb3BlcmF0'
        'aW9uX2lkZW50aWZpZXIYASABKANSE29wZXJhdGlvbklkZW50aWZpZXISGAoHYWRkcmVzcxgCIA'
        'EoDFIHYWRkcmVzcxIWCgZhbW91bnQYAyABKANSBmFtb3VudA==');

@$core.Deprecated('Use blockBalanceTraceDescriptor instead')
const BlockBalanceTrace$json = {
  '1': 'BlockBalanceTrace',
  '2': [
    {
      '1': 'block_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.protocol.BlockBalanceTrace.BlockIdentifier',
      '10': 'blockIdentifier'
    },
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    {
      '1': 'transaction_balance_trace',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.protocol.TransactionBalanceTrace',
      '10': 'transactionBalanceTrace'
    },
  ],
  '3': [BlockBalanceTrace_BlockIdentifier$json],
};

@$core.Deprecated('Use blockBalanceTraceDescriptor instead')
const BlockBalanceTrace_BlockIdentifier$json = {
  '1': 'BlockIdentifier',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

/// Descriptor for `BlockBalanceTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockBalanceTraceDescriptor = $convert
    .base64Decode('ChFCbG9ja0JhbGFuY2VUcmFjZRJWChBibG9ja19pZGVudGlmaWVyGAEgASgLMisucHJvdG9jb2'
        'wuQmxvY2tCYWxhbmNlVHJhY2UuQmxvY2tJZGVudGlmaWVyUg9ibG9ja0lkZW50aWZpZXISHAoJ'
        'dGltZXN0YW1wGAIgASgDUgl0aW1lc3RhbXASXQoZdHJhbnNhY3Rpb25fYmFsYW5jZV90cmFjZR'
        'gDIAMoCzIhLnByb3RvY29sLlRyYW5zYWN0aW9uQmFsYW5jZVRyYWNlUhd0cmFuc2FjdGlvbkJh'
        'bGFuY2VUcmFjZRo9Cg9CbG9ja0lkZW50aWZpZXISEgoEaGFzaBgBIAEoDFIEaGFzaBIWCgZudW'
        '1iZXIYAiABKANSBm51bWJlcg==');

@$core.Deprecated('Use accountTraceDescriptor instead')
const AccountTrace$json = {
  '1': 'AccountTrace',
  '2': [
    {'1': 'balance', '3': 1, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'placeholder', '3': 99, '4': 1, '5': 3, '10': 'placeholder'},
  ],
};

/// Descriptor for `AccountTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountTraceDescriptor = $convert
    .base64Decode('CgxBY2NvdW50VHJhY2USGAoHYmFsYW5jZRgBIAEoA1IHYmFsYW5jZRIgCgtwbGFjZWhvbGRlch'
        'hjIAEoA1ILcGxhY2Vob2xkZXI=');

@$core.Deprecated('Use accountIdentifierDescriptor instead')
const AccountIdentifier$json = {
  '1': 'AccountIdentifier',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
  ],
};

/// Descriptor for `AccountIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountIdentifierDescriptor =
    $convert.base64Decode('ChFBY2NvdW50SWRlbnRpZmllchIYCgdhZGRyZXNzGAEgASgMUgdhZGRyZXNz');

@$core.Deprecated('Use accountBalanceRequestDescriptor instead')
const AccountBalanceRequest$json = {
  '1': 'AccountBalanceRequest',
  '2': [
    {
      '1': 'account_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.protocol.AccountIdentifier',
      '10': 'accountIdentifier'
    },
    {
      '1': 'block_identifier',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.BlockBalanceTrace.BlockIdentifier',
      '10': 'blockIdentifier'
    },
  ],
};

/// Descriptor for `AccountBalanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountBalanceRequestDescriptor = $convert
    .base64Decode('ChVBY2NvdW50QmFsYW5jZVJlcXVlc3QSSgoSYWNjb3VudF9pZGVudGlmaWVyGAEgASgLMhsucH'
        'JvdG9jb2wuQWNjb3VudElkZW50aWZpZXJSEWFjY291bnRJZGVudGlmaWVyElYKEGJsb2NrX2lk'
        'ZW50aWZpZXIYAiABKAsyKy5wcm90b2NvbC5CbG9ja0JhbGFuY2VUcmFjZS5CbG9ja0lkZW50aW'
        'ZpZXJSD2Jsb2NrSWRlbnRpZmllcg==');

@$core.Deprecated('Use accountBalanceResponseDescriptor instead')
const AccountBalanceResponse$json = {
  '1': 'AccountBalanceResponse',
  '2': [
    {'1': 'balance', '3': 1, '4': 1, '5': 3, '10': 'balance'},
    {
      '1': 'block_identifier',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.BlockBalanceTrace.BlockIdentifier',
      '10': 'blockIdentifier'
    },
  ],
};

/// Descriptor for `AccountBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountBalanceResponseDescriptor = $convert
    .base64Decode('ChZBY2NvdW50QmFsYW5jZVJlc3BvbnNlEhgKB2JhbGFuY2UYASABKANSB2JhbGFuY2USVgoQYm'
        'xvY2tfaWRlbnRpZmllchgCIAEoCzIrLnByb3RvY29sLkJsb2NrQmFsYW5jZVRyYWNlLkJsb2Nr'
        'SWRlbnRpZmllclIPYmxvY2tJZGVudGlmaWVy');

@$core.Deprecated('Use freezeBalanceV2ContractDescriptor instead')
const FreezeBalanceV2Contract$json = {
  '1': 'FreezeBalanceV2Contract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'frozen_balance', '3': 2, '4': 1, '5': 3, '10': 'frozenBalance'},
    {'1': 'resource', '3': 3, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
  ],
};

/// Descriptor for `FreezeBalanceV2Contract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeBalanceV2ContractDescriptor = $convert
    .base64Decode('ChdGcmVlemVCYWxhbmNlVjJDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3MSJQoOZnJvemVuX2JhbGFuY2UYAiABKANSDWZyb3plbkJhbGFuY2USMgoIcmVzb3Vy'
        'Y2UYAyABKA4yFi5wcm90b2NvbC5SZXNvdXJjZUNvZGVSCHJlc291cmNl');

@$core.Deprecated('Use unfreezeBalanceV2ContractDescriptor instead')
const UnfreezeBalanceV2Contract$json = {
  '1': 'UnfreezeBalanceV2Contract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'unfreeze_balance', '3': 2, '4': 1, '5': 3, '10': 'unfreezeBalance'},
    {'1': 'resource', '3': 3, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
  ],
};

/// Descriptor for `UnfreezeBalanceV2Contract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfreezeBalanceV2ContractDescriptor = $convert
    .base64Decode('ChlVbmZyZWV6ZUJhbGFuY2VWMkNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bm'
        'VyQWRkcmVzcxIpChB1bmZyZWV6ZV9iYWxhbmNlGAIgASgDUg91bmZyZWV6ZUJhbGFuY2USMgoI'
        'cmVzb3VyY2UYAyABKA4yFi5wcm90b2NvbC5SZXNvdXJjZUNvZGVSCHJlc291cmNl');

@$core.Deprecated('Use withdrawExpireUnfreezeContractDescriptor instead')
const WithdrawExpireUnfreezeContract$json = {
  '1': 'WithdrawExpireUnfreezeContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `WithdrawExpireUnfreezeContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List withdrawExpireUnfreezeContractDescriptor = $convert
    .base64Decode('Ch5XaXRoZHJhd0V4cGlyZVVuZnJlZXplQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDF'
        'IMb3duZXJBZGRyZXNz');

@$core.Deprecated('Use delegateResourceContractDescriptor instead')
const DelegateResourceContract$json = {
  '1': 'DelegateResourceContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'resource', '3': 2, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    {'1': 'balance', '3': 3, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'receiver_address', '3': 4, '4': 1, '5': 12, '10': 'receiverAddress'},
    {'1': 'lock', '3': 5, '4': 1, '5': 8, '10': 'lock'},
    {'1': 'lock_period', '3': 6, '4': 1, '5': 3, '10': 'lockPeriod'},
  ],
};

/// Descriptor for `DelegateResourceContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegateResourceContractDescriptor = $convert
    .base64Decode('ChhEZWxlZ2F0ZVJlc291cmNlQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZX'
        'JBZGRyZXNzEjIKCHJlc291cmNlGAIgASgOMhYucHJvdG9jb2wuUmVzb3VyY2VDb2RlUghyZXNv'
        'dXJjZRIYCgdiYWxhbmNlGAMgASgDUgdiYWxhbmNlEikKEHJlY2VpdmVyX2FkZHJlc3MYBCABKA'
        'xSD3JlY2VpdmVyQWRkcmVzcxISCgRsb2NrGAUgASgIUgRsb2NrEh8KC2xvY2tfcGVyaW9kGAYg'
        'ASgDUgpsb2NrUGVyaW9k');

@$core.Deprecated('Use unDelegateResourceContractDescriptor instead')
const UnDelegateResourceContract$json = {
  '1': 'UnDelegateResourceContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'resource', '3': 2, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    {'1': 'balance', '3': 3, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'receiver_address', '3': 4, '4': 1, '5': 12, '10': 'receiverAddress'},
  ],
};

/// Descriptor for `UnDelegateResourceContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unDelegateResourceContractDescriptor = $convert
    .base64Decode('ChpVbkRlbGVnYXRlUmVzb3VyY2VDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd2'
        '5lckFkZHJlc3MSMgoIcmVzb3VyY2UYAiABKA4yFi5wcm90b2NvbC5SZXNvdXJjZUNvZGVSCHJl'
        'c291cmNlEhgKB2JhbGFuY2UYAyABKANSB2JhbGFuY2USKQoQcmVjZWl2ZXJfYWRkcmVzcxgEIA'
        'EoDFIPcmVjZWl2ZXJBZGRyZXNz');

@$core.Deprecated('Use cancelAllUnfreezeV2ContractDescriptor instead')
const CancelAllUnfreezeV2Contract$json = {
  '1': 'CancelAllUnfreezeV2Contract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `CancelAllUnfreezeV2Contract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelAllUnfreezeV2ContractDescriptor = $convert
    .base64Decode('ChtDYW5jZWxBbGxVbmZyZWV6ZVYyQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3'
        'duZXJBZGRyZXNz');
