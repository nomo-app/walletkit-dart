//
//  Generated code. Do not modify.
//  source: core/contract/market_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use marketSellAssetContractDescriptor instead')
const MarketSellAssetContract$json = {
  '1': 'MarketSellAssetContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'sell_token_id', '3': 2, '4': 1, '5': 12, '10': 'sellTokenId'},
    {'1': 'sell_token_quantity', '3': 3, '4': 1, '5': 3, '10': 'sellTokenQuantity'},
    {'1': 'buy_token_id', '3': 4, '4': 1, '5': 12, '10': 'buyTokenId'},
    {'1': 'buy_token_quantity', '3': 5, '4': 1, '5': 3, '10': 'buyTokenQuantity'},
  ],
};

/// Descriptor for `MarketSellAssetContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketSellAssetContractDescriptor = $convert
    .base64Decode('ChdNYXJrZXRTZWxsQXNzZXRDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lck'
        'FkZHJlc3MSIgoNc2VsbF90b2tlbl9pZBgCIAEoDFILc2VsbFRva2VuSWQSLgoTc2VsbF90b2tl'
        'bl9xdWFudGl0eRgDIAEoA1IRc2VsbFRva2VuUXVhbnRpdHkSIAoMYnV5X3Rva2VuX2lkGAQgAS'
        'gMUgpidXlUb2tlbklkEiwKEmJ1eV90b2tlbl9xdWFudGl0eRgFIAEoA1IQYnV5VG9rZW5RdWFu'
        'dGl0eQ==');

@$core.Deprecated('Use marketCancelOrderContractDescriptor instead')
const MarketCancelOrderContract$json = {
  '1': 'MarketCancelOrderContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'order_id', '3': 2, '4': 1, '5': 12, '10': 'orderId'},
  ],
};

/// Descriptor for `MarketCancelOrderContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketCancelOrderContractDescriptor = $convert
    .base64Decode('ChlNYXJrZXRDYW5jZWxPcmRlckNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bm'
        'VyQWRkcmVzcxIZCghvcmRlcl9pZBgCIAEoDFIHb3JkZXJJZA==');
