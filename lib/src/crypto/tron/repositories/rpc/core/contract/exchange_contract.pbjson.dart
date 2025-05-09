//
//  Generated code. Do not modify.
//  source: core/contract/exchange_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use exchangeCreateContractDescriptor instead')
const ExchangeCreateContract$json = {
  '1': 'ExchangeCreateContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'first_token_id', '3': 2, '4': 1, '5': 12, '10': 'firstTokenId'},
    {'1': 'first_token_balance', '3': 3, '4': 1, '5': 3, '10': 'firstTokenBalance'},
    {'1': 'second_token_id', '3': 4, '4': 1, '5': 12, '10': 'secondTokenId'},
    {'1': 'second_token_balance', '3': 5, '4': 1, '5': 3, '10': 'secondTokenBalance'},
  ],
};

/// Descriptor for `ExchangeCreateContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeCreateContractDescriptor = $convert
    .base64Decode('ChZFeGNoYW5nZUNyZWF0ZUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQW'
        'RkcmVzcxIkCg5maXJzdF90b2tlbl9pZBgCIAEoDFIMZmlyc3RUb2tlbklkEi4KE2ZpcnN0X3Rv'
        'a2VuX2JhbGFuY2UYAyABKANSEWZpcnN0VG9rZW5CYWxhbmNlEiYKD3NlY29uZF90b2tlbl9pZB'
        'gEIAEoDFINc2Vjb25kVG9rZW5JZBIwChRzZWNvbmRfdG9rZW5fYmFsYW5jZRgFIAEoA1ISc2Vj'
        'b25kVG9rZW5CYWxhbmNl');

@$core.Deprecated('Use exchangeInjectContractDescriptor instead')
const ExchangeInjectContract$json = {
  '1': 'ExchangeInjectContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
  ],
};

/// Descriptor for `ExchangeInjectContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeInjectContractDescriptor = $convert
    .base64Decode('ChZFeGNoYW5nZUluamVjdENvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQW'
        'RkcmVzcxIfCgtleGNoYW5nZV9pZBgCIAEoA1IKZXhjaGFuZ2VJZBIZCgh0b2tlbl9pZBgDIAEo'
        'DFIHdG9rZW5JZBIUCgVxdWFudBgEIAEoA1IFcXVhbnQ=');

@$core.Deprecated('Use exchangeWithdrawContractDescriptor instead')
const ExchangeWithdrawContract$json = {
  '1': 'ExchangeWithdrawContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
  ],
};

/// Descriptor for `ExchangeWithdrawContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeWithdrawContractDescriptor = $convert
    .base64Decode('ChhFeGNoYW5nZVdpdGhkcmF3Q29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZX'
        'JBZGRyZXNzEh8KC2V4Y2hhbmdlX2lkGAIgASgDUgpleGNoYW5nZUlkEhkKCHRva2VuX2lkGAMg'
        'ASgMUgd0b2tlbklkEhQKBXF1YW50GAQgASgDUgVxdWFudA==');

@$core.Deprecated('Use exchangeTransactionContractDescriptor instead')
const ExchangeTransactionContract$json = {
  '1': 'ExchangeTransactionContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
    {'1': 'expected', '3': 5, '4': 1, '5': 3, '10': 'expected'},
  ],
};

/// Descriptor for `ExchangeTransactionContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeTransactionContractDescriptor = $convert
    .base64Decode('ChtFeGNoYW5nZVRyYW5zYWN0aW9uQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3'
        'duZXJBZGRyZXNzEh8KC2V4Y2hhbmdlX2lkGAIgASgDUgpleGNoYW5nZUlkEhkKCHRva2VuX2lk'
        'GAMgASgMUgd0b2tlbklkEhQKBXF1YW50GAQgASgDUgVxdWFudBIaCghleHBlY3RlZBgFIAEoA1'
        'IIZXhwZWN0ZWQ=');
