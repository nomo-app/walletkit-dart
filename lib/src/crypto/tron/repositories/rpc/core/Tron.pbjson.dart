//
//  Generated code. Do not modify.
//  source: core/Tron.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use accountTypeDescriptor instead')
const AccountType$json = {
  '1': 'AccountType',
  '2': [
    {'1': 'Normal', '2': 0},
    {'1': 'AssetIssue', '2': 1},
    {'1': 'Contract', '2': 2},
  ],
};

/// Descriptor for `AccountType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accountTypeDescriptor = $convert
    .base64Decode('CgtBY2NvdW50VHlwZRIKCgZOb3JtYWwQABIOCgpBc3NldElzc3VlEAESDAoIQ29udHJhY3QQAg'
        '==');

@$core.Deprecated('Use reasonCodeDescriptor instead')
const ReasonCode$json = {
  '1': 'ReasonCode',
  '2': [
    {'1': 'REQUESTED', '2': 0},
    {'1': 'BAD_PROTOCOL', '2': 2},
    {'1': 'TOO_MANY_PEERS', '2': 4},
    {'1': 'DUPLICATE_PEER', '2': 5},
    {'1': 'INCOMPATIBLE_PROTOCOL', '2': 6},
    {'1': 'RANDOM_ELIMINATION', '2': 7},
    {'1': 'PEER_QUITING', '2': 8},
    {'1': 'UNEXPECTED_IDENTITY', '2': 9},
    {'1': 'LOCAL_IDENTITY', '2': 10},
    {'1': 'PING_TIMEOUT', '2': 11},
    {'1': 'USER_REASON', '2': 16},
    {'1': 'RESET', '2': 17},
    {'1': 'SYNC_FAIL', '2': 18},
    {'1': 'FETCH_FAIL', '2': 19},
    {'1': 'BAD_TX', '2': 20},
    {'1': 'BAD_BLOCK', '2': 21},
    {'1': 'FORKED', '2': 22},
    {'1': 'UNLINKABLE', '2': 23},
    {'1': 'INCOMPATIBLE_VERSION', '2': 24},
    {'1': 'INCOMPATIBLE_CHAIN', '2': 25},
    {'1': 'TIME_OUT', '2': 32},
    {'1': 'CONNECT_FAIL', '2': 33},
    {'1': 'TOO_MANY_PEERS_WITH_SAME_IP', '2': 34},
    {'1': 'LIGHT_NODE_SYNC_FAIL', '2': 35},
    {'1': 'BELOW_THAN_ME', '2': 36},
    {'1': 'NOT_WITNESS', '2': 37},
    {'1': 'NO_SUCH_MESSAGE', '2': 38},
    {'1': 'UNKNOWN', '2': 255},
  ],
};

/// Descriptor for `ReasonCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reasonCodeDescriptor = $convert
    .base64Decode('CgpSZWFzb25Db2RlEg0KCVJFUVVFU1RFRBAAEhAKDEJBRF9QUk9UT0NPTBACEhIKDlRPT19NQU'
        '5ZX1BFRVJTEAQSEgoORFVQTElDQVRFX1BFRVIQBRIZChVJTkNPTVBBVElCTEVfUFJPVE9DT0wQ'
        'BhIWChJSQU5ET01fRUxJTUlOQVRJT04QBxIQCgxQRUVSX1FVSVRJTkcQCBIXChNVTkVYUEVDVE'
        'VEX0lERU5USVRZEAkSEgoOTE9DQUxfSURFTlRJVFkQChIQCgxQSU5HX1RJTUVPVVQQCxIPCgtV'
        'U0VSX1JFQVNPThAQEgkKBVJFU0VUEBESDQoJU1lOQ19GQUlMEBISDgoKRkVUQ0hfRkFJTBATEg'
        'oKBkJBRF9UWBAUEg0KCUJBRF9CTE9DSxAVEgoKBkZPUktFRBAWEg4KClVOTElOS0FCTEUQFxIY'
        'ChRJTkNPTVBBVElCTEVfVkVSU0lPThAYEhYKEklOQ09NUEFUSUJMRV9DSEFJThAZEgwKCFRJTU'
        'VfT1VUECASEAoMQ09OTkVDVF9GQUlMECESHwobVE9PX01BTllfUEVFUlNfV0lUSF9TQU1FX0lQ'
        'ECISGAoUTElHSFRfTk9ERV9TWU5DX0ZBSUwQIxIRCg1CRUxPV19USEFOX01FECQSDwoLTk9UX1'
        'dJVE5FU1MQJRITCg9OT19TVUNIX01FU1NBR0UQJhIMCgdVTktOT1dOEP8B');

@$core.Deprecated('Use accountIdDescriptor instead')
const AccountId$json = {
  '1': 'AccountId',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 12, '10': 'name'},
    {'1': 'address', '3': 2, '4': 1, '5': 12, '10': 'address'},
  ],
};

/// Descriptor for `AccountId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountIdDescriptor = $convert
    .base64Decode('CglBY2NvdW50SWQSEgoEbmFtZRgBIAEoDFIEbmFtZRIYCgdhZGRyZXNzGAIgASgMUgdhZGRyZX'
        'Nz');

@$core.Deprecated('Use voteDescriptor instead')
const Vote$json = {
  '1': 'Vote',
  '2': [
    {'1': 'vote_address', '3': 1, '4': 1, '5': 12, '10': 'voteAddress'},
    {'1': 'vote_count', '3': 2, '4': 1, '5': 3, '10': 'voteCount'},
  ],
};

/// Descriptor for `Vote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteDescriptor = $convert
    .base64Decode('CgRWb3RlEiEKDHZvdGVfYWRkcmVzcxgBIAEoDFILdm90ZUFkZHJlc3MSHQoKdm90ZV9jb3VudB'
        'gCIAEoA1IJdm90ZUNvdW50');

@$core.Deprecated('Use proposalDescriptor instead')
const Proposal$json = {
  '1': 'Proposal',
  '2': [
    {'1': 'proposal_id', '3': 1, '4': 1, '5': 3, '10': 'proposalId'},
    {'1': 'proposer_address', '3': 2, '4': 1, '5': 12, '10': 'proposerAddress'},
    {
      '1': 'parameters',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.protocol.Proposal.ParametersEntry',
      '10': 'parameters'
    },
    {'1': 'expiration_time', '3': 4, '4': 1, '5': 3, '10': 'expirationTime'},
    {'1': 'create_time', '3': 5, '4': 1, '5': 3, '10': 'createTime'},
    {'1': 'approvals', '3': 6, '4': 3, '5': 12, '10': 'approvals'},
    {'1': 'state', '3': 7, '4': 1, '5': 14, '6': '.protocol.Proposal.State', '10': 'state'},
  ],
  '3': [Proposal_ParametersEntry$json],
  '4': [Proposal_State$json],
};

@$core.Deprecated('Use proposalDescriptor instead')
const Proposal_ParametersEntry$json = {
  '1': 'ParametersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use proposalDescriptor instead')
const Proposal_State$json = {
  '1': 'State',
  '2': [
    {'1': 'PENDING', '2': 0},
    {'1': 'DISAPPROVED', '2': 1},
    {'1': 'APPROVED', '2': 2},
    {'1': 'CANCELED', '2': 3},
  ],
};

/// Descriptor for `Proposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalDescriptor = $convert
    .base64Decode('CghQcm9wb3NhbBIfCgtwcm9wb3NhbF9pZBgBIAEoA1IKcHJvcG9zYWxJZBIpChBwcm9wb3Nlcl'
        '9hZGRyZXNzGAIgASgMUg9wcm9wb3NlckFkZHJlc3MSQgoKcGFyYW1ldGVycxgDIAMoCzIiLnBy'
        'b3RvY29sLlByb3Bvc2FsLlBhcmFtZXRlcnNFbnRyeVIKcGFyYW1ldGVycxInCg9leHBpcmF0aW'
        '9uX3RpbWUYBCABKANSDmV4cGlyYXRpb25UaW1lEh8KC2NyZWF0ZV90aW1lGAUgASgDUgpjcmVh'
        'dGVUaW1lEhwKCWFwcHJvdmFscxgGIAMoDFIJYXBwcm92YWxzEi4KBXN0YXRlGAcgASgOMhgucH'
        'JvdG9jb2wuUHJvcG9zYWwuU3RhdGVSBXN0YXRlGj0KD1BhcmFtZXRlcnNFbnRyeRIQCgNrZXkY'
        'ASABKANSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBIkEKBVN0YXRlEgsKB1BFTkRJTk'
        'cQABIPCgtESVNBUFBST1ZFRBABEgwKCEFQUFJPVkVEEAISDAoIQ0FOQ0VMRUQQAw==');

@$core.Deprecated('Use exchangeDescriptor instead')
const Exchange$json = {
  '1': 'Exchange',
  '2': [
    {'1': 'exchange_id', '3': 1, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'creator_address', '3': 2, '4': 1, '5': 12, '10': 'creatorAddress'},
    {'1': 'create_time', '3': 3, '4': 1, '5': 3, '10': 'createTime'},
    {'1': 'first_token_id', '3': 6, '4': 1, '5': 12, '10': 'firstTokenId'},
    {'1': 'first_token_balance', '3': 7, '4': 1, '5': 3, '10': 'firstTokenBalance'},
    {'1': 'second_token_id', '3': 8, '4': 1, '5': 12, '10': 'secondTokenId'},
    {'1': 'second_token_balance', '3': 9, '4': 1, '5': 3, '10': 'secondTokenBalance'},
  ],
};

/// Descriptor for `Exchange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeDescriptor = $convert
    .base64Decode('CghFeGNoYW5nZRIfCgtleGNoYW5nZV9pZBgBIAEoA1IKZXhjaGFuZ2VJZBInCg9jcmVhdG9yX2'
        'FkZHJlc3MYAiABKAxSDmNyZWF0b3JBZGRyZXNzEh8KC2NyZWF0ZV90aW1lGAMgASgDUgpjcmVh'
        'dGVUaW1lEiQKDmZpcnN0X3Rva2VuX2lkGAYgASgMUgxmaXJzdFRva2VuSWQSLgoTZmlyc3RfdG'
        '9rZW5fYmFsYW5jZRgHIAEoA1IRZmlyc3RUb2tlbkJhbGFuY2USJgoPc2Vjb25kX3Rva2VuX2lk'
        'GAggASgMUg1zZWNvbmRUb2tlbklkEjAKFHNlY29uZF90b2tlbl9iYWxhbmNlGAkgASgDUhJzZW'
        'NvbmRUb2tlbkJhbGFuY2U=');

@$core.Deprecated('Use marketOrderDescriptor instead')
const MarketOrder$json = {
  '1': 'MarketOrder',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 12, '10': 'orderId'},
    {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'create_time', '3': 3, '4': 1, '5': 3, '10': 'createTime'},
    {'1': 'sell_token_id', '3': 4, '4': 1, '5': 12, '10': 'sellTokenId'},
    {'1': 'sell_token_quantity', '3': 5, '4': 1, '5': 3, '10': 'sellTokenQuantity'},
    {'1': 'buy_token_id', '3': 6, '4': 1, '5': 12, '10': 'buyTokenId'},
    {'1': 'buy_token_quantity', '3': 7, '4': 1, '5': 3, '10': 'buyTokenQuantity'},
    {'1': 'sell_token_quantity_remain', '3': 9, '4': 1, '5': 3, '10': 'sellTokenQuantityRemain'},
    {'1': 'sell_token_quantity_return', '3': 10, '4': 1, '5': 3, '10': 'sellTokenQuantityReturn'},
    {'1': 'state', '3': 11, '4': 1, '5': 14, '6': '.protocol.MarketOrder.State', '10': 'state'},
    {'1': 'prev', '3': 12, '4': 1, '5': 12, '10': 'prev'},
    {'1': 'next', '3': 13, '4': 1, '5': 12, '10': 'next'},
  ],
  '4': [MarketOrder_State$json],
};

@$core.Deprecated('Use marketOrderDescriptor instead')
const MarketOrder_State$json = {
  '1': 'State',
  '2': [
    {'1': 'ACTIVE', '2': 0},
    {'1': 'INACTIVE', '2': 1},
    {'1': 'CANCELED', '2': 2},
  ],
};

/// Descriptor for `MarketOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderDescriptor = $convert
    .base64Decode('CgtNYXJrZXRPcmRlchIZCghvcmRlcl9pZBgBIAEoDFIHb3JkZXJJZBIjCg1vd25lcl9hZGRyZX'
        'NzGAIgASgMUgxvd25lckFkZHJlc3MSHwoLY3JlYXRlX3RpbWUYAyABKANSCmNyZWF0ZVRpbWUS'
        'IgoNc2VsbF90b2tlbl9pZBgEIAEoDFILc2VsbFRva2VuSWQSLgoTc2VsbF90b2tlbl9xdWFudG'
        'l0eRgFIAEoA1IRc2VsbFRva2VuUXVhbnRpdHkSIAoMYnV5X3Rva2VuX2lkGAYgASgMUgpidXlU'
        'b2tlbklkEiwKEmJ1eV90b2tlbl9xdWFudGl0eRgHIAEoA1IQYnV5VG9rZW5RdWFudGl0eRI7Ch'
        'pzZWxsX3Rva2VuX3F1YW50aXR5X3JlbWFpbhgJIAEoA1IXc2VsbFRva2VuUXVhbnRpdHlSZW1h'
        'aW4SOwoac2VsbF90b2tlbl9xdWFudGl0eV9yZXR1cm4YCiABKANSF3NlbGxUb2tlblF1YW50aX'
        'R5UmV0dXJuEjEKBXN0YXRlGAsgASgOMhsucHJvdG9jb2wuTWFya2V0T3JkZXIuU3RhdGVSBXN0'
        'YXRlEhIKBHByZXYYDCABKAxSBHByZXYSEgoEbmV4dBgNIAEoDFIEbmV4dCIvCgVTdGF0ZRIKCg'
        'ZBQ1RJVkUQABIMCghJTkFDVElWRRABEgwKCENBTkNFTEVEEAI=');

@$core.Deprecated('Use marketOrderListDescriptor instead')
const MarketOrderList$json = {
  '1': 'MarketOrderList',
  '2': [
    {'1': 'orders', '3': 1, '4': 3, '5': 11, '6': '.protocol.MarketOrder', '10': 'orders'},
  ],
};

/// Descriptor for `MarketOrderList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderListDescriptor = $convert
    .base64Decode('Cg9NYXJrZXRPcmRlckxpc3QSLQoGb3JkZXJzGAEgAygLMhUucHJvdG9jb2wuTWFya2V0T3JkZX'
        'JSBm9yZGVycw==');

@$core.Deprecated('Use marketOrderPairListDescriptor instead')
const MarketOrderPairList$json = {
  '1': 'MarketOrderPairList',
  '2': [
    {
      '1': 'orderPair',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.protocol.MarketOrderPair',
      '10': 'orderPair'
    },
  ],
};

/// Descriptor for `MarketOrderPairList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderPairListDescriptor = $convert
    .base64Decode('ChNNYXJrZXRPcmRlclBhaXJMaXN0EjcKCW9yZGVyUGFpchgBIAMoCzIZLnByb3RvY29sLk1hcm'
        'tldE9yZGVyUGFpclIJb3JkZXJQYWly');

@$core.Deprecated('Use marketOrderPairDescriptor instead')
const MarketOrderPair$json = {
  '1': 'MarketOrderPair',
  '2': [
    {'1': 'sell_token_id', '3': 1, '4': 1, '5': 12, '10': 'sellTokenId'},
    {'1': 'buy_token_id', '3': 2, '4': 1, '5': 12, '10': 'buyTokenId'},
  ],
};

/// Descriptor for `MarketOrderPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderPairDescriptor = $convert
    .base64Decode('Cg9NYXJrZXRPcmRlclBhaXISIgoNc2VsbF90b2tlbl9pZBgBIAEoDFILc2VsbFRva2VuSWQSIA'
        'oMYnV5X3Rva2VuX2lkGAIgASgMUgpidXlUb2tlbklk');

@$core.Deprecated('Use marketAccountOrderDescriptor instead')
const MarketAccountOrder$json = {
  '1': 'MarketAccountOrder',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'orders', '3': 2, '4': 3, '5': 12, '10': 'orders'},
    {'1': 'count', '3': 3, '4': 1, '5': 3, '10': 'count'},
    {'1': 'total_count', '3': 4, '4': 1, '5': 3, '10': 'totalCount'},
  ],
};

/// Descriptor for `MarketAccountOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketAccountOrderDescriptor = $convert
    .base64Decode('ChJNYXJrZXRBY2NvdW50T3JkZXISIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZGRyZX'
        'NzEhYKBm9yZGVycxgCIAMoDFIGb3JkZXJzEhQKBWNvdW50GAMgASgDUgVjb3VudBIfCgt0b3Rh'
        'bF9jb3VudBgEIAEoA1IKdG90YWxDb3VudA==');

@$core.Deprecated('Use marketPriceDescriptor instead')
const MarketPrice$json = {
  '1': 'MarketPrice',
  '2': [
    {'1': 'sell_token_quantity', '3': 1, '4': 1, '5': 3, '10': 'sellTokenQuantity'},
    {'1': 'buy_token_quantity', '3': 2, '4': 1, '5': 3, '10': 'buyTokenQuantity'},
  ],
};

/// Descriptor for `MarketPrice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketPriceDescriptor = $convert
    .base64Decode('CgtNYXJrZXRQcmljZRIuChNzZWxsX3Rva2VuX3F1YW50aXR5GAEgASgDUhFzZWxsVG9rZW5RdW'
        'FudGl0eRIsChJidXlfdG9rZW5fcXVhbnRpdHkYAiABKANSEGJ1eVRva2VuUXVhbnRpdHk=');

@$core.Deprecated('Use marketPriceListDescriptor instead')
const MarketPriceList$json = {
  '1': 'MarketPriceList',
  '2': [
    {'1': 'sell_token_id', '3': 1, '4': 1, '5': 12, '10': 'sellTokenId'},
    {'1': 'buy_token_id', '3': 2, '4': 1, '5': 12, '10': 'buyTokenId'},
    {'1': 'prices', '3': 3, '4': 3, '5': 11, '6': '.protocol.MarketPrice', '10': 'prices'},
  ],
};

/// Descriptor for `MarketPriceList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketPriceListDescriptor = $convert
    .base64Decode('Cg9NYXJrZXRQcmljZUxpc3QSIgoNc2VsbF90b2tlbl9pZBgBIAEoDFILc2VsbFRva2VuSWQSIA'
        'oMYnV5X3Rva2VuX2lkGAIgASgMUgpidXlUb2tlbklkEi0KBnByaWNlcxgDIAMoCzIVLnByb3Rv'
        'Y29sLk1hcmtldFByaWNlUgZwcmljZXM=');

@$core.Deprecated('Use marketOrderIdListDescriptor instead')
const MarketOrderIdList$json = {
  '1': 'MarketOrderIdList',
  '2': [
    {'1': 'head', '3': 1, '4': 1, '5': 12, '10': 'head'},
    {'1': 'tail', '3': 2, '4': 1, '5': 12, '10': 'tail'},
  ],
};

/// Descriptor for `MarketOrderIdList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderIdListDescriptor = $convert
    .base64Decode('ChFNYXJrZXRPcmRlcklkTGlzdBISCgRoZWFkGAEgASgMUgRoZWFkEhIKBHRhaWwYAiABKAxSBH'
        'RhaWw=');

@$core.Deprecated('Use chainParametersDescriptor instead')
const ChainParameters$json = {
  '1': 'ChainParameters',
  '2': [
    {
      '1': 'chainParameter',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.protocol.ChainParameters.ChainParameter',
      '10': 'chainParameter'
    },
  ],
  '3': [ChainParameters_ChainParameter$json],
};

@$core.Deprecated('Use chainParametersDescriptor instead')
const ChainParameters_ChainParameter$json = {
  '1': 'ChainParameter',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
};

/// Descriptor for `ChainParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainParametersDescriptor = $convert
    .base64Decode('Cg9DaGFpblBhcmFtZXRlcnMSUAoOY2hhaW5QYXJhbWV0ZXIYASADKAsyKC5wcm90b2NvbC5DaG'
        'FpblBhcmFtZXRlcnMuQ2hhaW5QYXJhbWV0ZXJSDmNoYWluUGFyYW1ldGVyGjgKDkNoYWluUGFy'
        'YW1ldGVyEhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgDUgV2YWx1ZQ==');

@$core.Deprecated('Use accountDescriptor instead')
const Account$json = {
  '1': 'Account',
  '2': [
    {'1': 'account_name', '3': 1, '4': 1, '5': 12, '10': 'accountName'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.protocol.AccountType', '10': 'type'},
    {'1': 'address', '3': 3, '4': 1, '5': 12, '10': 'address'},
    {'1': 'balance', '3': 4, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'votes', '3': 5, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'votes'},
    {'1': 'asset', '3': 6, '4': 3, '5': 11, '6': '.protocol.Account.AssetEntry', '10': 'asset'},
    {
      '1': 'assetV2',
      '3': 56,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.AssetV2Entry',
      '10': 'assetV2'
    },
    {'1': 'frozen', '3': 7, '4': 3, '5': 11, '6': '.protocol.Account.Frozen', '10': 'frozen'},
    {'1': 'net_usage', '3': 8, '4': 1, '5': 3, '10': 'netUsage'},
    {
      '1': 'acquired_delegated_frozen_balance_for_bandwidth',
      '3': 41,
      '4': 1,
      '5': 3,
      '10': 'acquiredDelegatedFrozenBalanceForBandwidth'
    },
    {
      '1': 'delegated_frozen_balance_for_bandwidth',
      '3': 42,
      '4': 1,
      '5': 3,
      '10': 'delegatedFrozenBalanceForBandwidth'
    },
    {'1': 'old_tron_power', '3': 46, '4': 1, '5': 3, '10': 'oldTronPower'},
    {
      '1': 'tron_power',
      '3': 47,
      '4': 1,
      '5': 11,
      '6': '.protocol.Account.Frozen',
      '10': 'tronPower'
    },
    {'1': 'asset_optimized', '3': 60, '4': 1, '5': 8, '10': 'assetOptimized'},
    {'1': 'create_time', '3': 9, '4': 1, '5': 3, '10': 'createTime'},
    {'1': 'latest_opration_time', '3': 10, '4': 1, '5': 3, '10': 'latestOprationTime'},
    {'1': 'allowance', '3': 11, '4': 1, '5': 3, '10': 'allowance'},
    {'1': 'latest_withdraw_time', '3': 12, '4': 1, '5': 3, '10': 'latestWithdrawTime'},
    {'1': 'code', '3': 13, '4': 1, '5': 12, '10': 'code'},
    {'1': 'is_witness', '3': 14, '4': 1, '5': 8, '10': 'isWitness'},
    {'1': 'is_committee', '3': 15, '4': 1, '5': 8, '10': 'isCommittee'},
    {
      '1': 'frozen_supply',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.Frozen',
      '10': 'frozenSupply'
    },
    {'1': 'asset_issued_name', '3': 17, '4': 1, '5': 12, '10': 'assetIssuedName'},
    {'1': 'asset_issued_ID', '3': 57, '4': 1, '5': 12, '10': 'assetIssuedID'},
    {
      '1': 'latest_asset_operation_time',
      '3': 18,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.LatestAssetOperationTimeEntry',
      '10': 'latestAssetOperationTime'
    },
    {
      '1': 'latest_asset_operation_timeV2',
      '3': 58,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.LatestAssetOperationTimeV2Entry',
      '10': 'latestAssetOperationTimeV2'
    },
    {'1': 'free_net_usage', '3': 19, '4': 1, '5': 3, '10': 'freeNetUsage'},
    {
      '1': 'free_asset_net_usage',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.FreeAssetNetUsageEntry',
      '10': 'freeAssetNetUsage'
    },
    {
      '1': 'free_asset_net_usageV2',
      '3': 59,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.FreeAssetNetUsageV2Entry',
      '10': 'freeAssetNetUsageV2'
    },
    {'1': 'latest_consume_time', '3': 21, '4': 1, '5': 3, '10': 'latestConsumeTime'},
    {'1': 'latest_consume_free_time', '3': 22, '4': 1, '5': 3, '10': 'latestConsumeFreeTime'},
    {'1': 'account_id', '3': 23, '4': 1, '5': 12, '10': 'accountId'},
    {'1': 'net_window_size', '3': 24, '4': 1, '5': 3, '10': 'netWindowSize'},
    {'1': 'net_window_optimized', '3': 25, '4': 1, '5': 8, '10': 'netWindowOptimized'},
    {
      '1': 'account_resource',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.protocol.Account.AccountResource',
      '10': 'accountResource'
    },
    {'1': 'codeHash', '3': 30, '4': 1, '5': 12, '10': 'codeHash'},
    {
      '1': 'owner_permission',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.protocol.Permission',
      '10': 'ownerPermission'
    },
    {
      '1': 'witness_permission',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.protocol.Permission',
      '10': 'witnessPermission'
    },
    {
      '1': 'active_permission',
      '3': 33,
      '4': 3,
      '5': 11,
      '6': '.protocol.Permission',
      '10': 'activePermission'
    },
    {
      '1': 'frozenV2',
      '3': 34,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.FreezeV2',
      '10': 'frozenV2'
    },
    {
      '1': 'unfrozenV2',
      '3': 35,
      '4': 3,
      '5': 11,
      '6': '.protocol.Account.UnFreezeV2',
      '10': 'unfrozenV2'
    },
    {
      '1': 'delegated_frozenV2_balance_for_bandwidth',
      '3': 36,
      '4': 1,
      '5': 3,
      '10': 'delegatedFrozenV2BalanceForBandwidth'
    },
    {
      '1': 'acquired_delegated_frozenV2_balance_for_bandwidth',
      '3': 37,
      '4': 1,
      '5': 3,
      '10': 'acquiredDelegatedFrozenV2BalanceForBandwidth'
    },
  ],
  '3': [
    Account_Frozen$json,
    Account_AssetEntry$json,
    Account_AssetV2Entry$json,
    Account_LatestAssetOperationTimeEntry$json,
    Account_LatestAssetOperationTimeV2Entry$json,
    Account_FreeAssetNetUsageEntry$json,
    Account_FreeAssetNetUsageV2Entry$json,
    Account_AccountResource$json,
    Account_FreezeV2$json,
    Account_UnFreezeV2$json
  ],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_Frozen$json = {
  '1': 'Frozen',
  '2': [
    {'1': 'frozen_balance', '3': 1, '4': 1, '5': 3, '10': 'frozenBalance'},
    {'1': 'expire_time', '3': 2, '4': 1, '5': 3, '10': 'expireTime'},
  ],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_AssetEntry$json = {
  '1': 'AssetEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_AssetV2Entry$json = {
  '1': 'AssetV2Entry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_LatestAssetOperationTimeEntry$json = {
  '1': 'LatestAssetOperationTimeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_LatestAssetOperationTimeV2Entry$json = {
  '1': 'LatestAssetOperationTimeV2Entry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_FreeAssetNetUsageEntry$json = {
  '1': 'FreeAssetNetUsageEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_FreeAssetNetUsageV2Entry$json = {
  '1': 'FreeAssetNetUsageV2Entry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_AccountResource$json = {
  '1': 'AccountResource',
  '2': [
    {'1': 'energy_usage', '3': 1, '4': 1, '5': 3, '10': 'energyUsage'},
    {
      '1': 'frozen_balance_for_energy',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.Account.Frozen',
      '10': 'frozenBalanceForEnergy'
    },
    {
      '1': 'latest_consume_time_for_energy',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'latestConsumeTimeForEnergy'
    },
    {
      '1': 'acquired_delegated_frozen_balance_for_energy',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'acquiredDelegatedFrozenBalanceForEnergy'
    },
    {
      '1': 'delegated_frozen_balance_for_energy',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'delegatedFrozenBalanceForEnergy'
    },
    {'1': 'storage_limit', '3': 6, '4': 1, '5': 3, '10': 'storageLimit'},
    {'1': 'storage_usage', '3': 7, '4': 1, '5': 3, '10': 'storageUsage'},
    {
      '1': 'latest_exchange_storage_time',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'latestExchangeStorageTime'
    },
    {'1': 'energy_window_size', '3': 9, '4': 1, '5': 3, '10': 'energyWindowSize'},
    {
      '1': 'delegated_frozenV2_balance_for_energy',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'delegatedFrozenV2BalanceForEnergy'
    },
    {
      '1': 'acquired_delegated_frozenV2_balance_for_energy',
      '3': 11,
      '4': 1,
      '5': 3,
      '10': 'acquiredDelegatedFrozenV2BalanceForEnergy'
    },
    {'1': 'energy_window_optimized', '3': 12, '4': 1, '5': 8, '10': 'energyWindowOptimized'},
  ],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_FreezeV2$json = {
  '1': 'FreezeV2',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'type'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
  ],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_UnFreezeV2$json = {
  '1': 'UnFreezeV2',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'type'},
    {'1': 'unfreeze_amount', '3': 3, '4': 1, '5': 3, '10': 'unfreezeAmount'},
    {'1': 'unfreeze_expire_time', '3': 4, '4': 1, '5': 3, '10': 'unfreezeExpireTime'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert
    .base64Decode('CgdBY2NvdW50EiEKDGFjY291bnRfbmFtZRgBIAEoDFILYWNjb3VudE5hbWUSKQoEdHlwZRgCIA'
        'EoDjIVLnByb3RvY29sLkFjY291bnRUeXBlUgR0eXBlEhgKB2FkZHJlc3MYAyABKAxSB2FkZHJl'
        'c3MSGAoHYmFsYW5jZRgEIAEoA1IHYmFsYW5jZRIkCgV2b3RlcxgFIAMoCzIOLnByb3RvY29sLl'
        'ZvdGVSBXZvdGVzEjIKBWFzc2V0GAYgAygLMhwucHJvdG9jb2wuQWNjb3VudC5Bc3NldEVudHJ5'
        'UgVhc3NldBI4Cgdhc3NldFYyGDggAygLMh4ucHJvdG9jb2wuQWNjb3VudC5Bc3NldFYyRW50cn'
        'lSB2Fzc2V0VjISMAoGZnJvemVuGAcgAygLMhgucHJvdG9jb2wuQWNjb3VudC5Gcm96ZW5SBmZy'
        'b3plbhIbCgluZXRfdXNhZ2UYCCABKANSCG5ldFVzYWdlEmMKL2FjcXVpcmVkX2RlbGVnYXRlZF'
        '9mcm96ZW5fYmFsYW5jZV9mb3JfYmFuZHdpZHRoGCkgASgDUiphY3F1aXJlZERlbGVnYXRlZEZy'
        'b3plbkJhbGFuY2VGb3JCYW5kd2lkdGgSUgomZGVsZWdhdGVkX2Zyb3plbl9iYWxhbmNlX2Zvcl'
        '9iYW5kd2lkdGgYKiABKANSImRlbGVnYXRlZEZyb3plbkJhbGFuY2VGb3JCYW5kd2lkdGgSJAoO'
        'b2xkX3Ryb25fcG93ZXIYLiABKANSDG9sZFRyb25Qb3dlchI3Cgp0cm9uX3Bvd2VyGC8gASgLMh'
        'gucHJvdG9jb2wuQWNjb3VudC5Gcm96ZW5SCXRyb25Qb3dlchInCg9hc3NldF9vcHRpbWl6ZWQY'
        'PCABKAhSDmFzc2V0T3B0aW1pemVkEh8KC2NyZWF0ZV90aW1lGAkgASgDUgpjcmVhdGVUaW1lEj'
        'AKFGxhdGVzdF9vcHJhdGlvbl90aW1lGAogASgDUhJsYXRlc3RPcHJhdGlvblRpbWUSHAoJYWxs'
        'b3dhbmNlGAsgASgDUglhbGxvd2FuY2USMAoUbGF0ZXN0X3dpdGhkcmF3X3RpbWUYDCABKANSEm'
        'xhdGVzdFdpdGhkcmF3VGltZRISCgRjb2RlGA0gASgMUgRjb2RlEh0KCmlzX3dpdG5lc3MYDiAB'
        'KAhSCWlzV2l0bmVzcxIhCgxpc19jb21taXR0ZWUYDyABKAhSC2lzQ29tbWl0dGVlEj0KDWZyb3'
        'plbl9zdXBwbHkYECADKAsyGC5wcm90b2NvbC5BY2NvdW50LkZyb3plblIMZnJvemVuU3VwcGx5'
        'EioKEWFzc2V0X2lzc3VlZF9uYW1lGBEgASgMUg9hc3NldElzc3VlZE5hbWUSJgoPYXNzZXRfaX'
        'NzdWVkX0lEGDkgASgMUg1hc3NldElzc3VlZElEEm4KG2xhdGVzdF9hc3NldF9vcGVyYXRpb25f'
        'dGltZRgSIAMoCzIvLnByb3RvY29sLkFjY291bnQuTGF0ZXN0QXNzZXRPcGVyYXRpb25UaW1lRW'
        '50cnlSGGxhdGVzdEFzc2V0T3BlcmF0aW9uVGltZRJ0Ch1sYXRlc3RfYXNzZXRfb3BlcmF0aW9u'
        'X3RpbWVWMhg6IAMoCzIxLnByb3RvY29sLkFjY291bnQuTGF0ZXN0QXNzZXRPcGVyYXRpb25UaW'
        '1lVjJFbnRyeVIabGF0ZXN0QXNzZXRPcGVyYXRpb25UaW1lVjISJAoOZnJlZV9uZXRfdXNhZ2UY'
        'EyABKANSDGZyZWVOZXRVc2FnZRJZChRmcmVlX2Fzc2V0X25ldF91c2FnZRgUIAMoCzIoLnByb3'
        'RvY29sLkFjY291bnQuRnJlZUFzc2V0TmV0VXNhZ2VFbnRyeVIRZnJlZUFzc2V0TmV0VXNhZ2US'
        'XwoWZnJlZV9hc3NldF9uZXRfdXNhZ2VWMhg7IAMoCzIqLnByb3RvY29sLkFjY291bnQuRnJlZU'
        'Fzc2V0TmV0VXNhZ2VWMkVudHJ5UhNmcmVlQXNzZXROZXRVc2FnZVYyEi4KE2xhdGVzdF9jb25z'
        'dW1lX3RpbWUYFSABKANSEWxhdGVzdENvbnN1bWVUaW1lEjcKGGxhdGVzdF9jb25zdW1lX2ZyZW'
        'VfdGltZRgWIAEoA1IVbGF0ZXN0Q29uc3VtZUZyZWVUaW1lEh0KCmFjY291bnRfaWQYFyABKAxS'
        'CWFjY291bnRJZBImCg9uZXRfd2luZG93X3NpemUYGCABKANSDW5ldFdpbmRvd1NpemUSMAoUbm'
        'V0X3dpbmRvd19vcHRpbWl6ZWQYGSABKAhSEm5ldFdpbmRvd09wdGltaXplZBJMChBhY2NvdW50'
        'X3Jlc291cmNlGBogASgLMiEucHJvdG9jb2wuQWNjb3VudC5BY2NvdW50UmVzb3VyY2VSD2FjY2'
        '91bnRSZXNvdXJjZRIaCghjb2RlSGFzaBgeIAEoDFIIY29kZUhhc2gSPwoQb3duZXJfcGVybWlz'
        'c2lvbhgfIAEoCzIULnByb3RvY29sLlBlcm1pc3Npb25SD293bmVyUGVybWlzc2lvbhJDChJ3aX'
        'RuZXNzX3Blcm1pc3Npb24YICABKAsyFC5wcm90b2NvbC5QZXJtaXNzaW9uUhF3aXRuZXNzUGVy'
        'bWlzc2lvbhJBChFhY3RpdmVfcGVybWlzc2lvbhghIAMoCzIULnByb3RvY29sLlBlcm1pc3Npb2'
        '5SEGFjdGl2ZVBlcm1pc3Npb24SNgoIZnJvemVuVjIYIiADKAsyGi5wcm90b2NvbC5BY2NvdW50'
        'LkZyZWV6ZVYyUghmcm96ZW5WMhI8Cgp1bmZyb3plblYyGCMgAygLMhwucHJvdG9jb2wuQWNjb3'
        'VudC5VbkZyZWV6ZVYyUgp1bmZyb3plblYyElYKKGRlbGVnYXRlZF9mcm96ZW5WMl9iYWxhbmNl'
        'X2Zvcl9iYW5kd2lkdGgYJCABKANSJGRlbGVnYXRlZEZyb3plblYyQmFsYW5jZUZvckJhbmR3aW'
        'R0aBJnCjFhY3F1aXJlZF9kZWxlZ2F0ZWRfZnJvemVuVjJfYmFsYW5jZV9mb3JfYmFuZHdpZHRo'
        'GCUgASgDUixhY3F1aXJlZERlbGVnYXRlZEZyb3plblYyQmFsYW5jZUZvckJhbmR3aWR0aBpQCg'
        'ZGcm96ZW4SJQoOZnJvemVuX2JhbGFuY2UYASABKANSDWZyb3plbkJhbGFuY2USHwoLZXhwaXJl'
        'X3RpbWUYAiABKANSCmV4cGlyZVRpbWUaOAoKQXNzZXRFbnRyeRIQCgNrZXkYASABKAlSA2tleR'
        'IUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBGjoKDEFzc2V0VjJFbnRyeRIQCgNrZXkYASABKAlS'
        'A2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBGksKHUxhdGVzdEFzc2V0T3BlcmF0aW9uVG'
        'ltZUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgDUgV2YWx1ZToCOAEaTQof'
        'TGF0ZXN0QXNzZXRPcGVyYXRpb25UaW1lVjJFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YW'
        'x1ZRgCIAEoA1IFdmFsdWU6AjgBGkQKFkZyZWVBc3NldE5ldFVzYWdlRW50cnkSEAoDa2V5GAEg'
        'ASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4ARpGChhGcmVlQXNzZXROZXRVc2FnZV'
        'YyRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4ARqgBgoP'
        'QWNjb3VudFJlc291cmNlEiEKDGVuZXJneV91c2FnZRgBIAEoA1ILZW5lcmd5VXNhZ2USUwoZZn'
        'JvemVuX2JhbGFuY2VfZm9yX2VuZXJneRgCIAEoCzIYLnByb3RvY29sLkFjY291bnQuRnJvemVu'
        'UhZmcm96ZW5CYWxhbmNlRm9yRW5lcmd5EkIKHmxhdGVzdF9jb25zdW1lX3RpbWVfZm9yX2VuZX'
        'JneRgDIAEoA1IabGF0ZXN0Q29uc3VtZVRpbWVGb3JFbmVyZ3kSXQosYWNxdWlyZWRfZGVsZWdh'
        'dGVkX2Zyb3plbl9iYWxhbmNlX2Zvcl9lbmVyZ3kYBCABKANSJ2FjcXVpcmVkRGVsZWdhdGVkRn'
        'JvemVuQmFsYW5jZUZvckVuZXJneRJMCiNkZWxlZ2F0ZWRfZnJvemVuX2JhbGFuY2VfZm9yX2Vu'
        'ZXJneRgFIAEoA1IfZGVsZWdhdGVkRnJvemVuQmFsYW5jZUZvckVuZXJneRIjCg1zdG9yYWdlX2'
        'xpbWl0GAYgASgDUgxzdG9yYWdlTGltaXQSIwoNc3RvcmFnZV91c2FnZRgHIAEoA1IMc3RvcmFn'
        'ZVVzYWdlEj8KHGxhdGVzdF9leGNoYW5nZV9zdG9yYWdlX3RpbWUYCCABKANSGWxhdGVzdEV4Y2'
        'hhbmdlU3RvcmFnZVRpbWUSLAoSZW5lcmd5X3dpbmRvd19zaXplGAkgASgDUhBlbmVyZ3lXaW5k'
        'b3dTaXplElAKJWRlbGVnYXRlZF9mcm96ZW5WMl9iYWxhbmNlX2Zvcl9lbmVyZ3kYCiABKANSIW'
        'RlbGVnYXRlZEZyb3plblYyQmFsYW5jZUZvckVuZXJneRJhCi5hY3F1aXJlZF9kZWxlZ2F0ZWRf'
        'ZnJvemVuVjJfYmFsYW5jZV9mb3JfZW5lcmd5GAsgASgDUilhY3F1aXJlZERlbGVnYXRlZEZyb3'
        'plblYyQmFsYW5jZUZvckVuZXJneRI2ChdlbmVyZ3lfd2luZG93X29wdGltaXplZBgMIAEoCFIV'
        'ZW5lcmd5V2luZG93T3B0aW1pemVkGk4KCEZyZWV6ZVYyEioKBHR5cGUYASABKA4yFi5wcm90b2'
        'NvbC5SZXNvdXJjZUNvZGVSBHR5cGUSFgoGYW1vdW50GAIgASgDUgZhbW91bnQakwEKClVuRnJl'
        'ZXplVjISKgoEdHlwZRgBIAEoDjIWLnByb3RvY29sLlJlc291cmNlQ29kZVIEdHlwZRInCg91bm'
        'ZyZWV6ZV9hbW91bnQYAyABKANSDnVuZnJlZXplQW1vdW50EjAKFHVuZnJlZXplX2V4cGlyZV90'
        'aW1lGAQgASgDUhJ1bmZyZWV6ZUV4cGlyZVRpbWU=');

@$core.Deprecated('Use keyDescriptor instead')
const Key$json = {
  '1': 'Key',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    {'1': 'weight', '3': 2, '4': 1, '5': 3, '10': 'weight'},
  ],
};

/// Descriptor for `Key`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyDescriptor = $convert
    .base64Decode('CgNLZXkSGAoHYWRkcmVzcxgBIAEoDFIHYWRkcmVzcxIWCgZ3ZWlnaHQYAiABKANSBndlaWdodA'
        '==');

@$core.Deprecated('Use delegatedResourceDescriptor instead')
const DelegatedResource$json = {
  '1': 'DelegatedResource',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 12, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 12, '10': 'to'},
    {
      '1': 'frozen_balance_for_bandwidth',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'frozenBalanceForBandwidth'
    },
    {'1': 'frozen_balance_for_energy', '3': 4, '4': 1, '5': 3, '10': 'frozenBalanceForEnergy'},
    {'1': 'expire_time_for_bandwidth', '3': 5, '4': 1, '5': 3, '10': 'expireTimeForBandwidth'},
    {'1': 'expire_time_for_energy', '3': 6, '4': 1, '5': 3, '10': 'expireTimeForEnergy'},
  ],
};

/// Descriptor for `DelegatedResource`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatedResourceDescriptor = $convert
    .base64Decode('ChFEZWxlZ2F0ZWRSZXNvdXJjZRISCgRmcm9tGAEgASgMUgRmcm9tEg4KAnRvGAIgASgMUgJ0bx'
        'I/Chxmcm96ZW5fYmFsYW5jZV9mb3JfYmFuZHdpZHRoGAMgASgDUhlmcm96ZW5CYWxhbmNlRm9y'
        'QmFuZHdpZHRoEjkKGWZyb3plbl9iYWxhbmNlX2Zvcl9lbmVyZ3kYBCABKANSFmZyb3plbkJhbG'
        'FuY2VGb3JFbmVyZ3kSOQoZZXhwaXJlX3RpbWVfZm9yX2JhbmR3aWR0aBgFIAEoA1IWZXhwaXJl'
        'VGltZUZvckJhbmR3aWR0aBIzChZleHBpcmVfdGltZV9mb3JfZW5lcmd5GAYgASgDUhNleHBpcm'
        'VUaW1lRm9yRW5lcmd5');

@$core.Deprecated('Use authorityDescriptor instead')
const authority$json = {
  '1': 'authority',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.protocol.AccountId', '10': 'account'},
    {'1': 'permission_name', '3': 2, '4': 1, '5': 12, '10': 'permissionName'},
  ],
};

/// Descriptor for `authority`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorityDescriptor = $convert
    .base64Decode('CglhdXRob3JpdHkSLQoHYWNjb3VudBgBIAEoCzITLnByb3RvY29sLkFjY291bnRJZFIHYWNjb3'
        'VudBInCg9wZXJtaXNzaW9uX25hbWUYAiABKAxSDnBlcm1pc3Npb25OYW1l');

@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = {
  '1': 'Permission',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protocol.Permission.PermissionType',
      '10': 'type'
    },
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'permission_name', '3': 3, '4': 1, '5': 9, '10': 'permissionName'},
    {'1': 'threshold', '3': 4, '4': 1, '5': 3, '10': 'threshold'},
    {'1': 'parent_id', '3': 5, '4': 1, '5': 5, '10': 'parentId'},
    {'1': 'operations', '3': 6, '4': 1, '5': 12, '10': 'operations'},
    {'1': 'keys', '3': 7, '4': 3, '5': 11, '6': '.protocol.Key', '10': 'keys'},
  ],
  '4': [Permission_PermissionType$json],
};

@$core.Deprecated('Use permissionDescriptor instead')
const Permission_PermissionType$json = {
  '1': 'PermissionType',
  '2': [
    {'1': 'Owner', '2': 0},
    {'1': 'Witness', '2': 1},
    {'1': 'Active', '2': 2},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert
    .base64Decode('CgpQZXJtaXNzaW9uEjcKBHR5cGUYASABKA4yIy5wcm90b2NvbC5QZXJtaXNzaW9uLlBlcm1pc3'
        'Npb25UeXBlUgR0eXBlEg4KAmlkGAIgASgFUgJpZBInCg9wZXJtaXNzaW9uX25hbWUYAyABKAlS'
        'DnBlcm1pc3Npb25OYW1lEhwKCXRocmVzaG9sZBgEIAEoA1IJdGhyZXNob2xkEhsKCXBhcmVudF'
        '9pZBgFIAEoBVIIcGFyZW50SWQSHgoKb3BlcmF0aW9ucxgGIAEoDFIKb3BlcmF0aW9ucxIhCgRr'
        'ZXlzGAcgAygLMg0ucHJvdG9jb2wuS2V5UgRrZXlzIjQKDlBlcm1pc3Npb25UeXBlEgkKBU93bm'
        'VyEAASCwoHV2l0bmVzcxABEgoKBkFjdGl2ZRAC');

@$core.Deprecated('Use witnessDescriptor instead')
const Witness$json = {
  '1': 'Witness',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    {'1': 'voteCount', '3': 2, '4': 1, '5': 3, '10': 'voteCount'},
    {'1': 'pubKey', '3': 3, '4': 1, '5': 12, '10': 'pubKey'},
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    {'1': 'totalProduced', '3': 5, '4': 1, '5': 3, '10': 'totalProduced'},
    {'1': 'totalMissed', '3': 6, '4': 1, '5': 3, '10': 'totalMissed'},
    {'1': 'latestBlockNum', '3': 7, '4': 1, '5': 3, '10': 'latestBlockNum'},
    {'1': 'latestSlotNum', '3': 8, '4': 1, '5': 3, '10': 'latestSlotNum'},
    {'1': 'isJobs', '3': 9, '4': 1, '5': 8, '10': 'isJobs'},
  ],
};

/// Descriptor for `Witness`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List witnessDescriptor = $convert
    .base64Decode('CgdXaXRuZXNzEhgKB2FkZHJlc3MYASABKAxSB2FkZHJlc3MSHAoJdm90ZUNvdW50GAIgASgDUg'
        'l2b3RlQ291bnQSFgoGcHViS2V5GAMgASgMUgZwdWJLZXkSEAoDdXJsGAQgASgJUgN1cmwSJAoN'
        'dG90YWxQcm9kdWNlZBgFIAEoA1INdG90YWxQcm9kdWNlZBIgCgt0b3RhbE1pc3NlZBgGIAEoA1'
        'ILdG90YWxNaXNzZWQSJgoObGF0ZXN0QmxvY2tOdW0YByABKANSDmxhdGVzdEJsb2NrTnVtEiQK'
        'DWxhdGVzdFNsb3ROdW0YCCABKANSDWxhdGVzdFNsb3ROdW0SFgoGaXNKb2JzGAkgASgIUgZpc0'
        'pvYnM=');

@$core.Deprecated('Use votesDescriptor instead')
const Votes$json = {
  '1': 'Votes',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    {'1': 'old_votes', '3': 2, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'oldVotes'},
    {'1': 'new_votes', '3': 3, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'newVotes'},
  ],
};

/// Descriptor for `Votes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List votesDescriptor = $convert
    .base64Decode('CgVWb3RlcxIYCgdhZGRyZXNzGAEgASgMUgdhZGRyZXNzEisKCW9sZF92b3RlcxgCIAMoCzIOLn'
        'Byb3RvY29sLlZvdGVSCG9sZFZvdGVzEisKCW5ld192b3RlcxgDIAMoCzIOLnByb3RvY29sLlZv'
        'dGVSCG5ld1ZvdGVz');

@$core.Deprecated('Use tXOutputDescriptor instead')
const TXOutput$json = {
  '1': 'TXOutput',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
    {'1': 'pubKeyHash', '3': 2, '4': 1, '5': 12, '10': 'pubKeyHash'},
  ],
};

/// Descriptor for `TXOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tXOutputDescriptor = $convert
    .base64Decode('CghUWE91dHB1dBIUCgV2YWx1ZRgBIAEoA1IFdmFsdWUSHgoKcHViS2V5SGFzaBgCIAEoDFIKcH'
        'ViS2V5SGFzaA==');

@$core.Deprecated('Use tXInputDescriptor instead')
const TXInput$json = {
  '1': 'TXInput',
  '2': [
    {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.TXInput.raw', '10': 'rawData'},
    {'1': 'signature', '3': 4, '4': 1, '5': 12, '10': 'signature'},
  ],
  '3': [TXInput_raw$json],
};

@$core.Deprecated('Use tXInputDescriptor instead')
const TXInput_raw$json = {
  '1': 'raw',
  '2': [
    {'1': 'txID', '3': 1, '4': 1, '5': 12, '10': 'txID'},
    {'1': 'vout', '3': 2, '4': 1, '5': 3, '10': 'vout'},
    {'1': 'pubKey', '3': 3, '4': 1, '5': 12, '10': 'pubKey'},
  ],
};

/// Descriptor for `TXInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tXInputDescriptor = $convert
    .base64Decode('CgdUWElucHV0EjAKCHJhd19kYXRhGAEgASgLMhUucHJvdG9jb2wuVFhJbnB1dC5yYXdSB3Jhd0'
        'RhdGESHAoJc2lnbmF0dXJlGAQgASgMUglzaWduYXR1cmUaRQoDcmF3EhIKBHR4SUQYASABKAxS'
        'BHR4SUQSEgoEdm91dBgCIAEoA1IEdm91dBIWCgZwdWJLZXkYAyABKAxSBnB1YktleQ==');

@$core.Deprecated('Use tXOutputsDescriptor instead')
const TXOutputs$json = {
  '1': 'TXOutputs',
  '2': [
    {'1': 'outputs', '3': 1, '4': 3, '5': 11, '6': '.protocol.TXOutput', '10': 'outputs'},
  ],
};

/// Descriptor for `TXOutputs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tXOutputsDescriptor = $convert
    .base64Decode('CglUWE91dHB1dHMSLAoHb3V0cHV0cxgBIAMoCzISLnByb3RvY29sLlRYT3V0cHV0UgdvdXRwdX'
        'Rz');

@$core.Deprecated('Use resourceReceiptDescriptor instead')
const ResourceReceipt$json = {
  '1': 'ResourceReceipt',
  '2': [
    {'1': 'energy_usage', '3': 1, '4': 1, '5': 3, '10': 'energyUsage'},
    {'1': 'energy_fee', '3': 2, '4': 1, '5': 3, '10': 'energyFee'},
    {'1': 'origin_energy_usage', '3': 3, '4': 1, '5': 3, '10': 'originEnergyUsage'},
    {'1': 'energy_usage_total', '3': 4, '4': 1, '5': 3, '10': 'energyUsageTotal'},
    {'1': 'net_usage', '3': 5, '4': 1, '5': 3, '10': 'netUsage'},
    {'1': 'net_fee', '3': 6, '4': 1, '5': 3, '10': 'netFee'},
    {
      '1': 'result',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.protocol.Transaction.Result.contractResult',
      '10': 'result'
    },
    {'1': 'energy_penalty_total', '3': 8, '4': 1, '5': 3, '10': 'energyPenaltyTotal'},
  ],
};

/// Descriptor for `ResourceReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceReceiptDescriptor = $convert
    .base64Decode('Cg9SZXNvdXJjZVJlY2VpcHQSIQoMZW5lcmd5X3VzYWdlGAEgASgDUgtlbmVyZ3lVc2FnZRIdCg'
        'plbmVyZ3lfZmVlGAIgASgDUgllbmVyZ3lGZWUSLgoTb3JpZ2luX2VuZXJneV91c2FnZRgDIAEo'
        'A1IRb3JpZ2luRW5lcmd5VXNhZ2USLAoSZW5lcmd5X3VzYWdlX3RvdGFsGAQgASgDUhBlbmVyZ3'
        'lVc2FnZVRvdGFsEhsKCW5ldF91c2FnZRgFIAEoA1IIbmV0VXNhZ2USFwoHbmV0X2ZlZRgGIAEo'
        'A1IGbmV0RmVlEkMKBnJlc3VsdBgHIAEoDjIrLnByb3RvY29sLlRyYW5zYWN0aW9uLlJlc3VsdC'
        '5jb250cmFjdFJlc3VsdFIGcmVzdWx0EjAKFGVuZXJneV9wZW5hbHR5X3RvdGFsGAggASgDUhJl'
        'bmVyZ3lQZW5hbHR5VG90YWw=');

@$core.Deprecated('Use marketOrderDetailDescriptor instead')
const MarketOrderDetail$json = {
  '1': 'MarketOrderDetail',
  '2': [
    {'1': 'makerOrderId', '3': 1, '4': 1, '5': 12, '10': 'makerOrderId'},
    {'1': 'takerOrderId', '3': 2, '4': 1, '5': 12, '10': 'takerOrderId'},
    {'1': 'fillSellQuantity', '3': 3, '4': 1, '5': 3, '10': 'fillSellQuantity'},
    {'1': 'fillBuyQuantity', '3': 4, '4': 1, '5': 3, '10': 'fillBuyQuantity'},
  ],
};

/// Descriptor for `MarketOrderDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOrderDetailDescriptor = $convert
    .base64Decode('ChFNYXJrZXRPcmRlckRldGFpbBIiCgxtYWtlck9yZGVySWQYASABKAxSDG1ha2VyT3JkZXJJZB'
        'IiCgx0YWtlck9yZGVySWQYAiABKAxSDHRha2VyT3JkZXJJZBIqChBmaWxsU2VsbFF1YW50aXR5'
        'GAMgASgDUhBmaWxsU2VsbFF1YW50aXR5EigKD2ZpbGxCdXlRdWFudGl0eRgEIAEoA1IPZmlsbE'
        'J1eVF1YW50aXR5');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction.raw', '10': 'rawData'},
    {'1': 'signature', '3': 2, '4': 3, '5': 12, '10': 'signature'},
    {'1': 'ret', '3': 5, '4': 3, '5': 11, '6': '.protocol.Transaction.Result', '10': 'ret'},
  ],
  '3': [Transaction_Contract$json, Transaction_Result$json, Transaction_raw$json],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Contract$json = {
  '1': 'Contract',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protocol.Transaction.Contract.ContractType',
      '10': 'type'
    },
    {'1': 'parameter', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'parameter'},
    {'1': 'provider', '3': 3, '4': 1, '5': 12, '10': 'provider'},
    {'1': 'ContractName', '3': 4, '4': 1, '5': 12, '10': 'ContractName'},
    {'1': 'Permission_id', '3': 5, '4': 1, '5': 5, '10': 'PermissionId'},
  ],
  '4': [Transaction_Contract_ContractType$json],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Contract_ContractType$json = {
  '1': 'ContractType',
  '2': [
    {'1': 'AccountCreateContract', '2': 0},
    {'1': 'TransferContract', '2': 1},
    {'1': 'TransferAssetContract', '2': 2},
    {'1': 'VoteAssetContract', '2': 3},
    {'1': 'VoteWitnessContract', '2': 4},
    {'1': 'WitnessCreateContract', '2': 5},
    {'1': 'AssetIssueContract', '2': 6},
    {'1': 'WitnessUpdateContract', '2': 8},
    {'1': 'ParticipateAssetIssueContract', '2': 9},
    {'1': 'AccountUpdateContract', '2': 10},
    {'1': 'FreezeBalanceContract', '2': 11},
    {'1': 'UnfreezeBalanceContract', '2': 12},
    {'1': 'WithdrawBalanceContract', '2': 13},
    {'1': 'UnfreezeAssetContract', '2': 14},
    {'1': 'UpdateAssetContract', '2': 15},
    {'1': 'ProposalCreateContract', '2': 16},
    {'1': 'ProposalApproveContract', '2': 17},
    {'1': 'ProposalDeleteContract', '2': 18},
    {'1': 'SetAccountIdContract', '2': 19},
    {'1': 'CustomContract', '2': 20},
    {'1': 'CreateSmartContract', '2': 30},
    {'1': 'TriggerSmartContract', '2': 31},
    {'1': 'GetContract', '2': 32},
    {'1': 'UpdateSettingContract', '2': 33},
    {'1': 'ExchangeCreateContract', '2': 41},
    {'1': 'ExchangeInjectContract', '2': 42},
    {'1': 'ExchangeWithdrawContract', '2': 43},
    {'1': 'ExchangeTransactionContract', '2': 44},
    {'1': 'UpdateEnergyLimitContract', '2': 45},
    {'1': 'AccountPermissionUpdateContract', '2': 46},
    {'1': 'ClearABIContract', '2': 48},
    {'1': 'UpdateBrokerageContract', '2': 49},
    {'1': 'ShieldedTransferContract', '2': 51},
    {'1': 'MarketSellAssetContract', '2': 52},
    {'1': 'MarketCancelOrderContract', '2': 53},
    {'1': 'FreezeBalanceV2Contract', '2': 54},
    {'1': 'UnfreezeBalanceV2Contract', '2': 55},
    {'1': 'WithdrawExpireUnfreezeContract', '2': 56},
    {'1': 'DelegateResourceContract', '2': 57},
    {'1': 'UnDelegateResourceContract', '2': 58},
    {'1': 'CancelAllUnfreezeV2Contract', '2': 59},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Result$json = {
  '1': 'Result',
  '2': [
    {'1': 'fee', '3': 1, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'ret', '3': 2, '4': 1, '5': 14, '6': '.protocol.Transaction.Result.code', '10': 'ret'},
    {
      '1': 'contractRet',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.protocol.Transaction.Result.contractResult',
      '10': 'contractRet'
    },
    {'1': 'assetIssueID', '3': 14, '4': 1, '5': 9, '10': 'assetIssueID'},
    {'1': 'withdraw_amount', '3': 15, '4': 1, '5': 3, '10': 'withdrawAmount'},
    {'1': 'unfreeze_amount', '3': 16, '4': 1, '5': 3, '10': 'unfreezeAmount'},
    {'1': 'exchange_received_amount', '3': 18, '4': 1, '5': 3, '10': 'exchangeReceivedAmount'},
    {
      '1': 'exchange_inject_another_amount',
      '3': 19,
      '4': 1,
      '5': 3,
      '10': 'exchangeInjectAnotherAmount'
    },
    {
      '1': 'exchange_withdraw_another_amount',
      '3': 20,
      '4': 1,
      '5': 3,
      '10': 'exchangeWithdrawAnotherAmount'
    },
    {'1': 'exchange_id', '3': 21, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'shielded_transaction_fee', '3': 22, '4': 1, '5': 3, '10': 'shieldedTransactionFee'},
    {'1': 'orderId', '3': 25, '4': 1, '5': 12, '10': 'orderId'},
    {
      '1': 'orderDetails',
      '3': 26,
      '4': 3,
      '5': 11,
      '6': '.protocol.MarketOrderDetail',
      '10': 'orderDetails'
    },
    {'1': 'withdraw_expire_amount', '3': 27, '4': 1, '5': 3, '10': 'withdrawExpireAmount'},
    {
      '1': 'cancel_unfreezeV2_amount',
      '3': 28,
      '4': 3,
      '5': 11,
      '6': '.protocol.Transaction.Result.CancelUnfreezeV2AmountEntry',
      '10': 'cancelUnfreezeV2Amount'
    },
  ],
  '3': [Transaction_Result_CancelUnfreezeV2AmountEntry$json],
  '4': [Transaction_Result_code$json, Transaction_Result_contractResult$json],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Result_CancelUnfreezeV2AmountEntry$json = {
  '1': 'CancelUnfreezeV2AmountEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Result_code$json = {
  '1': 'code',
  '2': [
    {'1': 'SUCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Result_contractResult$json = {
  '1': 'contractResult',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'SUCCESS', '2': 1},
    {'1': 'REVERT', '2': 2},
    {'1': 'BAD_JUMP_DESTINATION', '2': 3},
    {'1': 'OUT_OF_MEMORY', '2': 4},
    {'1': 'PRECOMPILED_CONTRACT', '2': 5},
    {'1': 'STACK_TOO_SMALL', '2': 6},
    {'1': 'STACK_TOO_LARGE', '2': 7},
    {'1': 'ILLEGAL_OPERATION', '2': 8},
    {'1': 'STACK_OVERFLOW', '2': 9},
    {'1': 'OUT_OF_ENERGY', '2': 10},
    {'1': 'OUT_OF_TIME', '2': 11},
    {'1': 'JVM_STACK_OVER_FLOW', '2': 12},
    {'1': 'UNKNOWN', '2': 13},
    {'1': 'TRANSFER_FAILED', '2': 14},
    {'1': 'INVALID_CODE', '2': 15},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_raw$json = {
  '1': 'raw',
  '2': [
    {'1': 'ref_block_bytes', '3': 1, '4': 1, '5': 12, '10': 'refBlockBytes'},
    {'1': 'ref_block_num', '3': 3, '4': 1, '5': 3, '10': 'refBlockNum'},
    {'1': 'ref_block_hash', '3': 4, '4': 1, '5': 12, '10': 'refBlockHash'},
    {'1': 'expiration', '3': 8, '4': 1, '5': 3, '10': 'expiration'},
    {'1': 'auths', '3': 9, '4': 3, '5': 11, '6': '.protocol.authority', '10': 'auths'},
    {'1': 'data', '3': 10, '4': 1, '5': 12, '10': 'data'},
    {
      '1': 'contract',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.protocol.Transaction.Contract',
      '10': 'contract'
    },
    {'1': 'scripts', '3': 12, '4': 1, '5': 12, '10': 'scripts'},
    {'1': 'timestamp', '3': 14, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'fee_limit', '3': 18, '4': 1, '5': 3, '10': 'feeLimit'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert
    .base64Decode('CgtUcmFuc2FjdGlvbhI0CghyYXdfZGF0YRgBIAEoCzIZLnByb3RvY29sLlRyYW5zYWN0aW9uLn'
        'Jhd1IHcmF3RGF0YRIcCglzaWduYXR1cmUYAiADKAxSCXNpZ25hdHVyZRIuCgNyZXQYBSADKAsy'
        'HC5wcm90b2NvbC5UcmFuc2FjdGlvbi5SZXN1bHRSA3JldBrvCgoIQ29udHJhY3QSPwoEdHlwZR'
        'gBIAEoDjIrLnByb3RvY29sLlRyYW5zYWN0aW9uLkNvbnRyYWN0LkNvbnRyYWN0VHlwZVIEdHlw'
        'ZRIyCglwYXJhbWV0ZXIYAiABKAsyFC5nb29nbGUucHJvdG9idWYuQW55UglwYXJhbWV0ZXISGg'
        'oIcHJvdmlkZXIYAyABKAxSCHByb3ZpZGVyEiIKDENvbnRyYWN0TmFtZRgEIAEoDFIMQ29udHJh'
        'Y3ROYW1lEiMKDVBlcm1pc3Npb25faWQYBSABKAVSDFBlcm1pc3Npb25JZCKICQoMQ29udHJhY3'
        'RUeXBlEhkKFUFjY291bnRDcmVhdGVDb250cmFjdBAAEhQKEFRyYW5zZmVyQ29udHJhY3QQARIZ'
        'ChVUcmFuc2ZlckFzc2V0Q29udHJhY3QQAhIVChFWb3RlQXNzZXRDb250cmFjdBADEhcKE1ZvdG'
        'VXaXRuZXNzQ29udHJhY3QQBBIZChVXaXRuZXNzQ3JlYXRlQ29udHJhY3QQBRIWChJBc3NldElz'
        'c3VlQ29udHJhY3QQBhIZChVXaXRuZXNzVXBkYXRlQ29udHJhY3QQCBIhCh1QYXJ0aWNpcGF0ZU'
        'Fzc2V0SXNzdWVDb250cmFjdBAJEhkKFUFjY291bnRVcGRhdGVDb250cmFjdBAKEhkKFUZyZWV6'
        'ZUJhbGFuY2VDb250cmFjdBALEhsKF1VuZnJlZXplQmFsYW5jZUNvbnRyYWN0EAwSGwoXV2l0aG'
        'RyYXdCYWxhbmNlQ29udHJhY3QQDRIZChVVbmZyZWV6ZUFzc2V0Q29udHJhY3QQDhIXChNVcGRh'
        'dGVBc3NldENvbnRyYWN0EA8SGgoWUHJvcG9zYWxDcmVhdGVDb250cmFjdBAQEhsKF1Byb3Bvc2'
        'FsQXBwcm92ZUNvbnRyYWN0EBESGgoWUHJvcG9zYWxEZWxldGVDb250cmFjdBASEhgKFFNldEFj'
        'Y291bnRJZENvbnRyYWN0EBMSEgoOQ3VzdG9tQ29udHJhY3QQFBIXChNDcmVhdGVTbWFydENvbn'
        'RyYWN0EB4SGAoUVHJpZ2dlclNtYXJ0Q29udHJhY3QQHxIPCgtHZXRDb250cmFjdBAgEhkKFVVw'
        'ZGF0ZVNldHRpbmdDb250cmFjdBAhEhoKFkV4Y2hhbmdlQ3JlYXRlQ29udHJhY3QQKRIaChZFeG'
        'NoYW5nZUluamVjdENvbnRyYWN0ECoSHAoYRXhjaGFuZ2VXaXRoZHJhd0NvbnRyYWN0ECsSHwob'
        'RXhjaGFuZ2VUcmFuc2FjdGlvbkNvbnRyYWN0ECwSHQoZVXBkYXRlRW5lcmd5TGltaXRDb250cm'
        'FjdBAtEiMKH0FjY291bnRQZXJtaXNzaW9uVXBkYXRlQ29udHJhY3QQLhIUChBDbGVhckFCSUNv'
        'bnRyYWN0EDASGwoXVXBkYXRlQnJva2VyYWdlQ29udHJhY3QQMRIcChhTaGllbGRlZFRyYW5zZm'
        'VyQ29udHJhY3QQMxIbChdNYXJrZXRTZWxsQXNzZXRDb250cmFjdBA0Eh0KGU1hcmtldENhbmNl'
        'bE9yZGVyQ29udHJhY3QQNRIbChdGcmVlemVCYWxhbmNlVjJDb250cmFjdBA2Eh0KGVVuZnJlZX'
        'plQmFsYW5jZVYyQ29udHJhY3QQNxIiCh5XaXRoZHJhd0V4cGlyZVVuZnJlZXplQ29udHJhY3QQ'
        'OBIcChhEZWxlZ2F0ZVJlc291cmNlQ29udHJhY3QQORIeChpVbkRlbGVnYXRlUmVzb3VyY2VDb2'
        '50cmFjdBA6Eh8KG0NhbmNlbEFsbFVuZnJlZXplVjJDb250cmFjdBA7Gu0JCgZSZXN1bHQSEAoD'
        'ZmVlGAEgASgDUgNmZWUSMwoDcmV0GAIgASgOMiEucHJvdG9jb2wuVHJhbnNhY3Rpb24uUmVzdW'
        'x0LmNvZGVSA3JldBJNCgtjb250cmFjdFJldBgDIAEoDjIrLnByb3RvY29sLlRyYW5zYWN0aW9u'
        'LlJlc3VsdC5jb250cmFjdFJlc3VsdFILY29udHJhY3RSZXQSIgoMYXNzZXRJc3N1ZUlEGA4gAS'
        'gJUgxhc3NldElzc3VlSUQSJwoPd2l0aGRyYXdfYW1vdW50GA8gASgDUg53aXRoZHJhd0Ftb3Vu'
        'dBInCg91bmZyZWV6ZV9hbW91bnQYECABKANSDnVuZnJlZXplQW1vdW50EjgKGGV4Y2hhbmdlX3'
        'JlY2VpdmVkX2Ftb3VudBgSIAEoA1IWZXhjaGFuZ2VSZWNlaXZlZEFtb3VudBJDCh5leGNoYW5n'
        'ZV9pbmplY3RfYW5vdGhlcl9hbW91bnQYEyABKANSG2V4Y2hhbmdlSW5qZWN0QW5vdGhlckFtb3'
        'VudBJHCiBleGNoYW5nZV93aXRoZHJhd19hbm90aGVyX2Ftb3VudBgUIAEoA1IdZXhjaGFuZ2VX'
        'aXRoZHJhd0Fub3RoZXJBbW91bnQSHwoLZXhjaGFuZ2VfaWQYFSABKANSCmV4Y2hhbmdlSWQSOA'
        'oYc2hpZWxkZWRfdHJhbnNhY3Rpb25fZmVlGBYgASgDUhZzaGllbGRlZFRyYW5zYWN0aW9uRmVl'
        'EhgKB29yZGVySWQYGSABKAxSB29yZGVySWQSPwoMb3JkZXJEZXRhaWxzGBogAygLMhsucHJvdG'
        '9jb2wuTWFya2V0T3JkZXJEZXRhaWxSDG9yZGVyRGV0YWlscxI0ChZ3aXRoZHJhd19leHBpcmVf'
        'YW1vdW50GBsgASgDUhR3aXRoZHJhd0V4cGlyZUFtb3VudBJyChhjYW5jZWxfdW5mcmVlemVWMl'
        '9hbW91bnQYHCADKAsyOC5wcm90b2NvbC5UcmFuc2FjdGlvbi5SZXN1bHQuQ2FuY2VsVW5mcmVl'
        'emVWMkFtb3VudEVudHJ5UhZjYW5jZWxVbmZyZWV6ZVYyQW1vdW50GkkKG0NhbmNlbFVuZnJlZX'
        'plVjJBbW91bnRFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6'
        'AjgBIh4KBGNvZGUSCgoGU1VDRVNTEAASCgoGRkFJTEVEEAEiwwIKDmNvbnRyYWN0UmVzdWx0Eg'
        'sKB0RFRkFVTFQQABILCgdTVUNDRVNTEAESCgoGUkVWRVJUEAISGAoUQkFEX0pVTVBfREVTVElO'
        'QVRJT04QAxIRCg1PVVRfT0ZfTUVNT1JZEAQSGAoUUFJFQ09NUElMRURfQ09OVFJBQ1QQBRITCg'
        '9TVEFDS19UT09fU01BTEwQBhITCg9TVEFDS19UT09fTEFSR0UQBxIVChFJTExFR0FMX09QRVJB'
        'VElPThAIEhIKDlNUQUNLX09WRVJGTE9XEAkSEQoNT1VUX09GX0VORVJHWRAKEg8KC09VVF9PRl'
        '9USU1FEAsSFwoTSlZNX1NUQUNLX09WRVJfRkxPVxAMEgsKB1VOS05PV04QDRITCg9UUkFOU0ZF'
        'Ul9GQUlMRUQQDhIQCgxJTlZBTElEX0NPREUQDxrnAgoDcmF3EiYKD3JlZl9ibG9ja19ieXRlcx'
        'gBIAEoDFINcmVmQmxvY2tCeXRlcxIiCg1yZWZfYmxvY2tfbnVtGAMgASgDUgtyZWZCbG9ja051'
        'bRIkCg5yZWZfYmxvY2tfaGFzaBgEIAEoDFIMcmVmQmxvY2tIYXNoEh4KCmV4cGlyYXRpb24YCC'
        'ABKANSCmV4cGlyYXRpb24SKQoFYXV0aHMYCSADKAsyEy5wcm90b2NvbC5hdXRob3JpdHlSBWF1'
        'dGhzEhIKBGRhdGEYCiABKAxSBGRhdGESOgoIY29udHJhY3QYCyADKAsyHi5wcm90b2NvbC5Ucm'
        'Fuc2FjdGlvbi5Db250cmFjdFIIY29udHJhY3QSGAoHc2NyaXB0cxgMIAEoDFIHc2NyaXB0cxIc'
        'Cgl0aW1lc3RhbXAYDiABKANSCXRpbWVzdGFtcBIbCglmZWVfbGltaXQYEiABKANSCGZlZUxpbW'
        'l0');

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo$json = {
  '1': 'TransactionInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'fee', '3': 2, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'blockNumber', '3': 3, '4': 1, '5': 3, '10': 'blockNumber'},
    {'1': 'blockTimeStamp', '3': 4, '4': 1, '5': 3, '10': 'blockTimeStamp'},
    {'1': 'contractResult', '3': 5, '4': 3, '5': 12, '10': 'contractResult'},
    {'1': 'contract_address', '3': 6, '4': 1, '5': 12, '10': 'contractAddress'},
    {'1': 'receipt', '3': 7, '4': 1, '5': 11, '6': '.protocol.ResourceReceipt', '10': 'receipt'},
    {'1': 'log', '3': 8, '4': 3, '5': 11, '6': '.protocol.TransactionInfo.Log', '10': 'log'},
    {'1': 'result', '3': 9, '4': 1, '5': 14, '6': '.protocol.TransactionInfo.code', '10': 'result'},
    {'1': 'resMessage', '3': 10, '4': 1, '5': 12, '10': 'resMessage'},
    {'1': 'assetIssueID', '3': 14, '4': 1, '5': 9, '10': 'assetIssueID'},
    {'1': 'withdraw_amount', '3': 15, '4': 1, '5': 3, '10': 'withdrawAmount'},
    {'1': 'unfreeze_amount', '3': 16, '4': 1, '5': 3, '10': 'unfreezeAmount'},
    {
      '1': 'internal_transactions',
      '3': 17,
      '4': 3,
      '5': 11,
      '6': '.protocol.InternalTransaction',
      '10': 'internalTransactions'
    },
    {'1': 'exchange_received_amount', '3': 18, '4': 1, '5': 3, '10': 'exchangeReceivedAmount'},
    {
      '1': 'exchange_inject_another_amount',
      '3': 19,
      '4': 1,
      '5': 3,
      '10': 'exchangeInjectAnotherAmount'
    },
    {
      '1': 'exchange_withdraw_another_amount',
      '3': 20,
      '4': 1,
      '5': 3,
      '10': 'exchangeWithdrawAnotherAmount'
    },
    {'1': 'exchange_id', '3': 21, '4': 1, '5': 3, '10': 'exchangeId'},
    {'1': 'shielded_transaction_fee', '3': 22, '4': 1, '5': 3, '10': 'shieldedTransactionFee'},
    {'1': 'orderId', '3': 25, '4': 1, '5': 12, '10': 'orderId'},
    {
      '1': 'orderDetails',
      '3': 26,
      '4': 3,
      '5': 11,
      '6': '.protocol.MarketOrderDetail',
      '10': 'orderDetails'
    },
    {'1': 'packingFee', '3': 27, '4': 1, '5': 3, '10': 'packingFee'},
    {'1': 'withdraw_expire_amount', '3': 28, '4': 1, '5': 3, '10': 'withdrawExpireAmount'},
    {
      '1': 'cancel_unfreezeV2_amount',
      '3': 29,
      '4': 3,
      '5': 11,
      '6': '.protocol.TransactionInfo.CancelUnfreezeV2AmountEntry',
      '10': 'cancelUnfreezeV2Amount'
    },
  ],
  '3': [TransactionInfo_Log$json, TransactionInfo_CancelUnfreezeV2AmountEntry$json],
  '4': [TransactionInfo_code$json],
};

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo_Log$json = {
  '1': 'Log',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    {'1': 'topics', '3': 2, '4': 3, '5': 12, '10': 'topics'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo_CancelUnfreezeV2AmountEntry$json = {
  '1': 'CancelUnfreezeV2AmountEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo_code$json = {
  '1': 'code',
  '2': [
    {'1': 'SUCESS', '2': 0},
    {'1': 'FAILED', '2': 1},
  ],
};

/// Descriptor for `TransactionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInfoDescriptor = $convert
    .base64Decode('Cg9UcmFuc2FjdGlvbkluZm8SDgoCaWQYASABKAxSAmlkEhAKA2ZlZRgCIAEoA1IDZmVlEiAKC2'
        'Jsb2NrTnVtYmVyGAMgASgDUgtibG9ja051bWJlchImCg5ibG9ja1RpbWVTdGFtcBgEIAEoA1IO'
        'YmxvY2tUaW1lU3RhbXASJgoOY29udHJhY3RSZXN1bHQYBSADKAxSDmNvbnRyYWN0UmVzdWx0Ei'
        'kKEGNvbnRyYWN0X2FkZHJlc3MYBiABKAxSD2NvbnRyYWN0QWRkcmVzcxIzCgdyZWNlaXB0GAcg'
        'ASgLMhkucHJvdG9jb2wuUmVzb3VyY2VSZWNlaXB0UgdyZWNlaXB0Ei8KA2xvZxgIIAMoCzIdLn'
        'Byb3RvY29sLlRyYW5zYWN0aW9uSW5mby5Mb2dSA2xvZxI2CgZyZXN1bHQYCSABKA4yHi5wcm90'
        'b2NvbC5UcmFuc2FjdGlvbkluZm8uY29kZVIGcmVzdWx0Eh4KCnJlc01lc3NhZ2UYCiABKAxSCn'
        'Jlc01lc3NhZ2USIgoMYXNzZXRJc3N1ZUlEGA4gASgJUgxhc3NldElzc3VlSUQSJwoPd2l0aGRy'
        'YXdfYW1vdW50GA8gASgDUg53aXRoZHJhd0Ftb3VudBInCg91bmZyZWV6ZV9hbW91bnQYECABKA'
        'NSDnVuZnJlZXplQW1vdW50ElIKFWludGVybmFsX3RyYW5zYWN0aW9ucxgRIAMoCzIdLnByb3Rv'
        'Y29sLkludGVybmFsVHJhbnNhY3Rpb25SFGludGVybmFsVHJhbnNhY3Rpb25zEjgKGGV4Y2hhbm'
        'dlX3JlY2VpdmVkX2Ftb3VudBgSIAEoA1IWZXhjaGFuZ2VSZWNlaXZlZEFtb3VudBJDCh5leGNo'
        'YW5nZV9pbmplY3RfYW5vdGhlcl9hbW91bnQYEyABKANSG2V4Y2hhbmdlSW5qZWN0QW5vdGhlck'
        'Ftb3VudBJHCiBleGNoYW5nZV93aXRoZHJhd19hbm90aGVyX2Ftb3VudBgUIAEoA1IdZXhjaGFu'
        'Z2VXaXRoZHJhd0Fub3RoZXJBbW91bnQSHwoLZXhjaGFuZ2VfaWQYFSABKANSCmV4Y2hhbmdlSW'
        'QSOAoYc2hpZWxkZWRfdHJhbnNhY3Rpb25fZmVlGBYgASgDUhZzaGllbGRlZFRyYW5zYWN0aW9u'
        'RmVlEhgKB29yZGVySWQYGSABKAxSB29yZGVySWQSPwoMb3JkZXJEZXRhaWxzGBogAygLMhsucH'
        'JvdG9jb2wuTWFya2V0T3JkZXJEZXRhaWxSDG9yZGVyRGV0YWlscxIeCgpwYWNraW5nRmVlGBsg'
        'ASgDUgpwYWNraW5nRmVlEjQKFndpdGhkcmF3X2V4cGlyZV9hbW91bnQYHCABKANSFHdpdGhkcm'
        'F3RXhwaXJlQW1vdW50Em8KGGNhbmNlbF91bmZyZWV6ZVYyX2Ftb3VudBgdIAMoCzI1LnByb3Rv'
        'Y29sLlRyYW5zYWN0aW9uSW5mby5DYW5jZWxVbmZyZWV6ZVYyQW1vdW50RW50cnlSFmNhbmNlbF'
        'VuZnJlZXplVjJBbW91bnQaSwoDTG9nEhgKB2FkZHJlc3MYASABKAxSB2FkZHJlc3MSFgoGdG9w'
        'aWNzGAIgAygMUgZ0b3BpY3MSEgoEZGF0YRgDIAEoDFIEZGF0YRpJChtDYW5jZWxVbmZyZWV6ZV'
        'YyQW1vdW50RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4'
        'ASIeCgRjb2RlEgoKBlNVQ0VTUxAAEgoKBkZBSUxFRBAB');

@$core.Deprecated('Use transactionRetDescriptor instead')
const TransactionRet$json = {
  '1': 'TransactionRet',
  '2': [
    {'1': 'blockNumber', '3': 1, '4': 1, '5': 3, '10': 'blockNumber'},
    {'1': 'blockTimeStamp', '3': 2, '4': 1, '5': 3, '10': 'blockTimeStamp'},
    {
      '1': 'transactioninfo',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.protocol.TransactionInfo',
      '10': 'transactioninfo'
    },
  ],
};

/// Descriptor for `TransactionRet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionRetDescriptor = $convert
    .base64Decode('Cg5UcmFuc2FjdGlvblJldBIgCgtibG9ja051bWJlchgBIAEoA1ILYmxvY2tOdW1iZXISJgoOYm'
        'xvY2tUaW1lU3RhbXAYAiABKANSDmJsb2NrVGltZVN0YW1wEkMKD3RyYW5zYWN0aW9uaW5mbxgD'
        'IAMoCzIZLnByb3RvY29sLlRyYW5zYWN0aW9uSW5mb1IPdHJhbnNhY3Rpb25pbmZv');

@$core.Deprecated('Use transactionsDescriptor instead')
const Transactions$json = {
  '1': 'Transactions',
  '2': [
    {
      '1': 'transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.protocol.Transaction',
      '10': 'transactions'
    },
  ],
};

/// Descriptor for `Transactions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionsDescriptor = $convert
    .base64Decode('CgxUcmFuc2FjdGlvbnMSOQoMdHJhbnNhY3Rpb25zGAEgAygLMhUucHJvdG9jb2wuVHJhbnNhY3'
        'Rpb25SDHRyYW5zYWN0aW9ucw==');

@$core.Deprecated('Use blockHeaderDescriptor instead')
const BlockHeader$json = {
  '1': 'BlockHeader',
  '2': [
    {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.BlockHeader.raw', '10': 'rawData'},
    {'1': 'witness_signature', '3': 2, '4': 1, '5': 12, '10': 'witnessSignature'},
  ],
  '3': [BlockHeader_raw$json],
};

@$core.Deprecated('Use blockHeaderDescriptor instead')
const BlockHeader_raw$json = {
  '1': 'raw',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'txTrieRoot', '3': 2, '4': 1, '5': 12, '10': 'txTrieRoot'},
    {'1': 'parentHash', '3': 3, '4': 1, '5': 12, '10': 'parentHash'},
    {'1': 'number', '3': 7, '4': 1, '5': 3, '10': 'number'},
    {'1': 'witness_id', '3': 8, '4': 1, '5': 3, '10': 'witnessId'},
    {'1': 'witness_address', '3': 9, '4': 1, '5': 12, '10': 'witnessAddress'},
    {'1': 'version', '3': 10, '4': 1, '5': 5, '10': 'version'},
    {'1': 'accountStateRoot', '3': 11, '4': 1, '5': 12, '10': 'accountStateRoot'},
  ],
};

/// Descriptor for `BlockHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockHeaderDescriptor = $convert
    .base64Decode('CgtCbG9ja0hlYWRlchI0CghyYXdfZGF0YRgBIAEoCzIZLnByb3RvY29sLkJsb2NrSGVhZGVyLn'
        'Jhd1IHcmF3RGF0YRIrChF3aXRuZXNzX3NpZ25hdHVyZRgCIAEoDFIQd2l0bmVzc1NpZ25hdHVy'
        'ZRqJAgoDcmF3EhwKCXRpbWVzdGFtcBgBIAEoA1IJdGltZXN0YW1wEh4KCnR4VHJpZVJvb3QYAi'
        'ABKAxSCnR4VHJpZVJvb3QSHgoKcGFyZW50SGFzaBgDIAEoDFIKcGFyZW50SGFzaBIWCgZudW1i'
        'ZXIYByABKANSBm51bWJlchIdCgp3aXRuZXNzX2lkGAggASgDUgl3aXRuZXNzSWQSJwoPd2l0bm'
        'Vzc19hZGRyZXNzGAkgASgMUg53aXRuZXNzQWRkcmVzcxIYCgd2ZXJzaW9uGAogASgFUgd2ZXJz'
        'aW9uEioKEGFjY291bnRTdGF0ZVJvb3QYCyABKAxSEGFjY291bnRTdGF0ZVJvb3Q=');

@$core.Deprecated('Use blockDescriptor instead')
const Block$json = {
  '1': 'Block',
  '2': [
    {
      '1': 'transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.protocol.Transaction',
      '10': 'transactions'
    },
    {
      '1': 'block_header',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.BlockHeader',
      '10': 'blockHeader'
    },
  ],
};

/// Descriptor for `Block`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockDescriptor = $convert
    .base64Decode('CgVCbG9jaxI5Cgx0cmFuc2FjdGlvbnMYASADKAsyFS5wcm90b2NvbC5UcmFuc2FjdGlvblIMdH'
        'JhbnNhY3Rpb25zEjgKDGJsb2NrX2hlYWRlchgCIAEoCzIVLnByb3RvY29sLkJsb2NrSGVhZGVy'
        'UgtibG9ja0hlYWRlcg==');

@$core.Deprecated('Use chainInventoryDescriptor instead')
const ChainInventory$json = {
  '1': 'ChainInventory',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 11, '6': '.protocol.ChainInventory.BlockId', '10': 'ids'},
    {'1': 'remain_num', '3': 2, '4': 1, '5': 3, '10': 'remainNum'},
  ],
  '3': [ChainInventory_BlockId$json],
};

@$core.Deprecated('Use chainInventoryDescriptor instead')
const ChainInventory_BlockId$json = {
  '1': 'BlockId',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

/// Descriptor for `ChainInventory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainInventoryDescriptor = $convert
    .base64Decode('Cg5DaGFpbkludmVudG9yeRIyCgNpZHMYASADKAsyIC5wcm90b2NvbC5DaGFpbkludmVudG9yeS'
        '5CbG9ja0lkUgNpZHMSHQoKcmVtYWluX251bRgCIAEoA1IJcmVtYWluTnVtGjUKB0Jsb2NrSWQS'
        'EgoEaGFzaBgBIAEoDFIEaGFzaBIWCgZudW1iZXIYAiABKANSBm51bWJlcg==');

@$core.Deprecated('Use blockInventoryDescriptor instead')
const BlockInventory$json = {
  '1': 'BlockInventory',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 11, '6': '.protocol.BlockInventory.BlockId', '10': 'ids'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.protocol.BlockInventory.Type', '10': 'type'},
  ],
  '3': [BlockInventory_BlockId$json],
  '4': [BlockInventory_Type$json],
};

@$core.Deprecated('Use blockInventoryDescriptor instead')
const BlockInventory_BlockId$json = {
  '1': 'BlockId',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

@$core.Deprecated('Use blockInventoryDescriptor instead')
const BlockInventory_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'SYNC', '2': 0},
    {'1': 'ADVTISE', '2': 1},
    {'1': 'FETCH', '2': 2},
  ],
};

/// Descriptor for `BlockInventory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockInventoryDescriptor = $convert
    .base64Decode('Cg5CbG9ja0ludmVudG9yeRIyCgNpZHMYASADKAsyIC5wcm90b2NvbC5CbG9ja0ludmVudG9yeS'
        '5CbG9ja0lkUgNpZHMSMQoEdHlwZRgCIAEoDjIdLnByb3RvY29sLkJsb2NrSW52ZW50b3J5LlR5'
        'cGVSBHR5cGUaNQoHQmxvY2tJZBISCgRoYXNoGAEgASgMUgRoYXNoEhYKBm51bWJlchgCIAEoA1'
        'IGbnVtYmVyIigKBFR5cGUSCAoEU1lOQxAAEgsKB0FEVlRJU0UQARIJCgVGRVRDSBAC');

@$core.Deprecated('Use inventoryDescriptor instead')
const Inventory$json = {
  '1': 'Inventory',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Inventory.InventoryType', '10': 'type'},
    {'1': 'ids', '3': 2, '4': 3, '5': 12, '10': 'ids'},
  ],
  '4': [Inventory_InventoryType$json],
};

@$core.Deprecated('Use inventoryDescriptor instead')
const Inventory_InventoryType$json = {
  '1': 'InventoryType',
  '2': [
    {'1': 'TRX', '2': 0},
    {'1': 'BLOCK', '2': 1},
  ],
};

/// Descriptor for `Inventory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryDescriptor = $convert
    .base64Decode('CglJbnZlbnRvcnkSNQoEdHlwZRgBIAEoDjIhLnByb3RvY29sLkludmVudG9yeS5JbnZlbnRvcn'
        'lUeXBlUgR0eXBlEhAKA2lkcxgCIAMoDFIDaWRzIiMKDUludmVudG9yeVR5cGUSBwoDVFJYEAAS'
        'CQoFQkxPQ0sQAQ==');

@$core.Deprecated('Use itemsDescriptor instead')
const Items$json = {
  '1': 'Items',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Items.ItemType', '10': 'type'},
    {'1': 'blocks', '3': 2, '4': 3, '5': 11, '6': '.protocol.Block', '10': 'blocks'},
    {
      '1': 'block_headers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.protocol.BlockHeader',
      '10': 'blockHeaders'
    },
    {
      '1': 'transactions',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.protocol.Transaction',
      '10': 'transactions'
    },
  ],
  '4': [Items_ItemType$json],
};

@$core.Deprecated('Use itemsDescriptor instead')
const Items_ItemType$json = {
  '1': 'ItemType',
  '2': [
    {'1': 'ERR', '2': 0},
    {'1': 'TRX', '2': 1},
    {'1': 'BLOCK', '2': 2},
    {'1': 'BLOCKHEADER', '2': 3},
  ],
};

/// Descriptor for `Items`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemsDescriptor = $convert
    .base64Decode('CgVJdGVtcxIsCgR0eXBlGAEgASgOMhgucHJvdG9jb2wuSXRlbXMuSXRlbVR5cGVSBHR5cGUSJw'
        'oGYmxvY2tzGAIgAygLMg8ucHJvdG9jb2wuQmxvY2tSBmJsb2NrcxI6Cg1ibG9ja19oZWFkZXJz'
        'GAMgAygLMhUucHJvdG9jb2wuQmxvY2tIZWFkZXJSDGJsb2NrSGVhZGVycxI5Cgx0cmFuc2FjdG'
        'lvbnMYBCADKAsyFS5wcm90b2NvbC5UcmFuc2FjdGlvblIMdHJhbnNhY3Rpb25zIjgKCEl0ZW1U'
        'eXBlEgcKA0VSUhAAEgcKA1RSWBABEgkKBUJMT0NLEAISDwoLQkxPQ0tIRUFERVIQAw==');

@$core.Deprecated('Use dynamicPropertiesDescriptor instead')
const DynamicProperties$json = {
  '1': 'DynamicProperties',
  '2': [
    {'1': 'last_solidity_block_num', '3': 1, '4': 1, '5': 3, '10': 'lastSolidityBlockNum'},
  ],
};

/// Descriptor for `DynamicProperties`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dynamicPropertiesDescriptor = $convert
    .base64Decode('ChFEeW5hbWljUHJvcGVydGllcxI1ChdsYXN0X3NvbGlkaXR5X2Jsb2NrX251bRgBIAEoA1IUbG'
        'FzdFNvbGlkaXR5QmxvY2tOdW0=');

@$core.Deprecated('Use disconnectMessageDescriptor instead')
const DisconnectMessage$json = {
  '1': 'DisconnectMessage',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 14, '6': '.protocol.ReasonCode', '10': 'reason'},
  ],
};

/// Descriptor for `DisconnectMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectMessageDescriptor = $convert
    .base64Decode('ChFEaXNjb25uZWN0TWVzc2FnZRIsCgZyZWFzb24YASABKA4yFC5wcm90b2NvbC5SZWFzb25Db2'
        'RlUgZyZWFzb24=');

@$core.Deprecated('Use helloMessageDescriptor instead')
const HelloMessage$json = {
  '1': 'HelloMessage',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    {
      '1': 'genesisBlockId',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.protocol.HelloMessage.BlockId',
      '10': 'genesisBlockId'
    },
    {
      '1': 'solidBlockId',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.protocol.HelloMessage.BlockId',
      '10': 'solidBlockId'
    },
    {
      '1': 'headBlockId',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.protocol.HelloMessage.BlockId',
      '10': 'headBlockId'
    },
    {'1': 'address', '3': 7, '4': 1, '5': 12, '10': 'address'},
    {'1': 'signature', '3': 8, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'nodeType', '3': 9, '4': 1, '5': 5, '10': 'nodeType'},
    {'1': 'lowestBlockNum', '3': 10, '4': 1, '5': 3, '10': 'lowestBlockNum'},
    {'1': 'codeVersion', '3': 11, '4': 1, '5': 12, '10': 'codeVersion'},
  ],
  '3': [HelloMessage_BlockId$json],
};

@$core.Deprecated('Use helloMessageDescriptor instead')
const HelloMessage_BlockId$json = {
  '1': 'BlockId',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

/// Descriptor for `HelloMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloMessageDescriptor = $convert
    .base64Decode('CgxIZWxsb01lc3NhZ2USJgoEZnJvbRgBIAEoCzISLnByb3RvY29sLkVuZHBvaW50UgRmcm9tEh'
        'gKB3ZlcnNpb24YAiABKAVSB3ZlcnNpb24SHAoJdGltZXN0YW1wGAMgASgDUgl0aW1lc3RhbXAS'
        'RgoOZ2VuZXNpc0Jsb2NrSWQYBCABKAsyHi5wcm90b2NvbC5IZWxsb01lc3NhZ2UuQmxvY2tJZF'
        'IOZ2VuZXNpc0Jsb2NrSWQSQgoMc29saWRCbG9ja0lkGAUgASgLMh4ucHJvdG9jb2wuSGVsbG9N'
        'ZXNzYWdlLkJsb2NrSWRSDHNvbGlkQmxvY2tJZBJACgtoZWFkQmxvY2tJZBgGIAEoCzIeLnByb3'
        'RvY29sLkhlbGxvTWVzc2FnZS5CbG9ja0lkUgtoZWFkQmxvY2tJZBIYCgdhZGRyZXNzGAcgASgM'
        'UgdhZGRyZXNzEhwKCXNpZ25hdHVyZRgIIAEoDFIJc2lnbmF0dXJlEhoKCG5vZGVUeXBlGAkgAS'
        'gFUghub2RlVHlwZRImCg5sb3dlc3RCbG9ja051bRgKIAEoA1IObG93ZXN0QmxvY2tOdW0SIAoL'
        'Y29kZVZlcnNpb24YCyABKAxSC2NvZGVWZXJzaW9uGjUKB0Jsb2NrSWQSEgoEaGFzaBgBIAEoDF'
        'IEaGFzaBIWCgZudW1iZXIYAiABKANSBm51bWJlcg==');

@$core.Deprecated('Use internalTransactionDescriptor instead')
const InternalTransaction$json = {
  '1': 'InternalTransaction',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'caller_address', '3': 2, '4': 1, '5': 12, '10': 'callerAddress'},
    {'1': 'transferTo_address', '3': 3, '4': 1, '5': 12, '10': 'transferToAddress'},
    {
      '1': 'callValueInfo',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.protocol.InternalTransaction.CallValueInfo',
      '10': 'callValueInfo'
    },
    {'1': 'note', '3': 5, '4': 1, '5': 12, '10': 'note'},
    {'1': 'rejected', '3': 6, '4': 1, '5': 8, '10': 'rejected'},
    {'1': 'extra', '3': 7, '4': 1, '5': 9, '10': 'extra'},
  ],
  '3': [InternalTransaction_CallValueInfo$json],
};

@$core.Deprecated('Use internalTransactionDescriptor instead')
const InternalTransaction_CallValueInfo$json = {
  '1': 'CallValueInfo',
  '2': [
    {'1': 'callValue', '3': 1, '4': 1, '5': 3, '10': 'callValue'},
    {'1': 'tokenId', '3': 2, '4': 1, '5': 9, '10': 'tokenId'},
  ],
};

/// Descriptor for `InternalTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalTransactionDescriptor = $convert
    .base64Decode('ChNJbnRlcm5hbFRyYW5zYWN0aW9uEhIKBGhhc2gYASABKAxSBGhhc2gSJQoOY2FsbGVyX2FkZH'
        'Jlc3MYAiABKAxSDWNhbGxlckFkZHJlc3MSLQoSdHJhbnNmZXJUb19hZGRyZXNzGAMgASgMUhF0'
        'cmFuc2ZlclRvQWRkcmVzcxJRCg1jYWxsVmFsdWVJbmZvGAQgAygLMisucHJvdG9jb2wuSW50ZX'
        'JuYWxUcmFuc2FjdGlvbi5DYWxsVmFsdWVJbmZvUg1jYWxsVmFsdWVJbmZvEhIKBG5vdGUYBSAB'
        'KAxSBG5vdGUSGgoIcmVqZWN0ZWQYBiABKAhSCHJlamVjdGVkEhQKBWV4dHJhGAcgASgJUgVleH'
        'RyYRpHCg1DYWxsVmFsdWVJbmZvEhwKCWNhbGxWYWx1ZRgBIAEoA1IJY2FsbFZhbHVlEhgKB3Rv'
        'a2VuSWQYAiABKAlSB3Rva2VuSWQ=');

@$core.Deprecated('Use delegatedResourceAccountIndexDescriptor instead')
const DelegatedResourceAccountIndex$json = {
  '1': 'DelegatedResourceAccountIndex',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 12, '10': 'account'},
    {'1': 'fromAccounts', '3': 2, '4': 3, '5': 12, '10': 'fromAccounts'},
    {'1': 'toAccounts', '3': 3, '4': 3, '5': 12, '10': 'toAccounts'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `DelegatedResourceAccountIndex`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatedResourceAccountIndexDescriptor = $convert
    .base64Decode('Ch1EZWxlZ2F0ZWRSZXNvdXJjZUFjY291bnRJbmRleBIYCgdhY2NvdW50GAEgASgMUgdhY2NvdW'
        '50EiIKDGZyb21BY2NvdW50cxgCIAMoDFIMZnJvbUFjY291bnRzEh4KCnRvQWNjb3VudHMYAyAD'
        'KAxSCnRvQWNjb3VudHMSHAoJdGltZXN0YW1wGAQgASgDUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo$json = {
  '1': 'NodeInfo',
  '2': [
    {'1': 'beginSyncNum', '3': 1, '4': 1, '5': 3, '10': 'beginSyncNum'},
    {'1': 'block', '3': 2, '4': 1, '5': 9, '10': 'block'},
    {'1': 'solidityBlock', '3': 3, '4': 1, '5': 9, '10': 'solidityBlock'},
    {'1': 'currentConnectCount', '3': 4, '4': 1, '5': 5, '10': 'currentConnectCount'},
    {'1': 'activeConnectCount', '3': 5, '4': 1, '5': 5, '10': 'activeConnectCount'},
    {'1': 'passiveConnectCount', '3': 6, '4': 1, '5': 5, '10': 'passiveConnectCount'},
    {'1': 'totalFlow', '3': 7, '4': 1, '5': 3, '10': 'totalFlow'},
    {
      '1': 'peerInfoList',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.protocol.NodeInfo.PeerInfo',
      '10': 'peerInfoList'
    },
    {
      '1': 'configNodeInfo',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.protocol.NodeInfo.ConfigNodeInfo',
      '10': 'configNodeInfo'
    },
    {
      '1': 'machineInfo',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.protocol.NodeInfo.MachineInfo',
      '10': 'machineInfo'
    },
    {
      '1': 'cheatWitnessInfoMap',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.protocol.NodeInfo.CheatWitnessInfoMapEntry',
      '10': 'cheatWitnessInfoMap'
    },
  ],
  '3': [
    NodeInfo_CheatWitnessInfoMapEntry$json,
    NodeInfo_PeerInfo$json,
    NodeInfo_ConfigNodeInfo$json,
    NodeInfo_MachineInfo$json
  ],
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_CheatWitnessInfoMapEntry$json = {
  '1': 'CheatWitnessInfoMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_PeerInfo$json = {
  '1': 'PeerInfo',
  '2': [
    {'1': 'lastSyncBlock', '3': 1, '4': 1, '5': 9, '10': 'lastSyncBlock'},
    {'1': 'remainNum', '3': 2, '4': 1, '5': 3, '10': 'remainNum'},
    {'1': 'lastBlockUpdateTime', '3': 3, '4': 1, '5': 3, '10': 'lastBlockUpdateTime'},
    {'1': 'syncFlag', '3': 4, '4': 1, '5': 8, '10': 'syncFlag'},
    {'1': 'headBlockTimeWeBothHave', '3': 5, '4': 1, '5': 3, '10': 'headBlockTimeWeBothHave'},
    {'1': 'needSyncFromPeer', '3': 6, '4': 1, '5': 8, '10': 'needSyncFromPeer'},
    {'1': 'needSyncFromUs', '3': 7, '4': 1, '5': 8, '10': 'needSyncFromUs'},
    {'1': 'host', '3': 8, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 9, '4': 1, '5': 5, '10': 'port'},
    {'1': 'nodeId', '3': 10, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'connectTime', '3': 11, '4': 1, '5': 3, '10': 'connectTime'},
    {'1': 'avgLatency', '3': 12, '4': 1, '5': 1, '10': 'avgLatency'},
    {'1': 'syncToFetchSize', '3': 13, '4': 1, '5': 5, '10': 'syncToFetchSize'},
    {'1': 'syncToFetchSizePeekNum', '3': 14, '4': 1, '5': 3, '10': 'syncToFetchSizePeekNum'},
    {'1': 'syncBlockRequestedSize', '3': 15, '4': 1, '5': 5, '10': 'syncBlockRequestedSize'},
    {'1': 'unFetchSynNum', '3': 16, '4': 1, '5': 3, '10': 'unFetchSynNum'},
    {'1': 'blockInPorcSize', '3': 17, '4': 1, '5': 5, '10': 'blockInPorcSize'},
    {'1': 'headBlockWeBothHave', '3': 18, '4': 1, '5': 9, '10': 'headBlockWeBothHave'},
    {'1': 'isActive', '3': 19, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'score', '3': 20, '4': 1, '5': 5, '10': 'score'},
    {'1': 'nodeCount', '3': 21, '4': 1, '5': 5, '10': 'nodeCount'},
    {'1': 'inFlow', '3': 22, '4': 1, '5': 3, '10': 'inFlow'},
    {'1': 'disconnectTimes', '3': 23, '4': 1, '5': 5, '10': 'disconnectTimes'},
    {'1': 'localDisconnectReason', '3': 24, '4': 1, '5': 9, '10': 'localDisconnectReason'},
    {'1': 'remoteDisconnectReason', '3': 25, '4': 1, '5': 9, '10': 'remoteDisconnectReason'},
  ],
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_ConfigNodeInfo$json = {
  '1': 'ConfigNodeInfo',
  '2': [
    {'1': 'codeVersion', '3': 1, '4': 1, '5': 9, '10': 'codeVersion'},
    {'1': 'p2pVersion', '3': 2, '4': 1, '5': 9, '10': 'p2pVersion'},
    {'1': 'listenPort', '3': 3, '4': 1, '5': 5, '10': 'listenPort'},
    {'1': 'discoverEnable', '3': 4, '4': 1, '5': 8, '10': 'discoverEnable'},
    {'1': 'activeNodeSize', '3': 5, '4': 1, '5': 5, '10': 'activeNodeSize'},
    {'1': 'passiveNodeSize', '3': 6, '4': 1, '5': 5, '10': 'passiveNodeSize'},
    {'1': 'sendNodeSize', '3': 7, '4': 1, '5': 5, '10': 'sendNodeSize'},
    {'1': 'maxConnectCount', '3': 8, '4': 1, '5': 5, '10': 'maxConnectCount'},
    {'1': 'sameIpMaxConnectCount', '3': 9, '4': 1, '5': 5, '10': 'sameIpMaxConnectCount'},
    {'1': 'backupListenPort', '3': 10, '4': 1, '5': 5, '10': 'backupListenPort'},
    {'1': 'backupMemberSize', '3': 11, '4': 1, '5': 5, '10': 'backupMemberSize'},
    {'1': 'backupPriority', '3': 12, '4': 1, '5': 5, '10': 'backupPriority'},
    {'1': 'dbVersion', '3': 13, '4': 1, '5': 5, '10': 'dbVersion'},
    {'1': 'minParticipationRate', '3': 14, '4': 1, '5': 5, '10': 'minParticipationRate'},
    {'1': 'supportConstant', '3': 15, '4': 1, '5': 8, '10': 'supportConstant'},
    {'1': 'minTimeRatio', '3': 16, '4': 1, '5': 1, '10': 'minTimeRatio'},
    {'1': 'maxTimeRatio', '3': 17, '4': 1, '5': 1, '10': 'maxTimeRatio'},
    {'1': 'allowCreationOfContracts', '3': 18, '4': 1, '5': 3, '10': 'allowCreationOfContracts'},
    {'1': 'allowAdaptiveEnergy', '3': 19, '4': 1, '5': 3, '10': 'allowAdaptiveEnergy'},
  ],
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_MachineInfo$json = {
  '1': 'MachineInfo',
  '2': [
    {'1': 'threadCount', '3': 1, '4': 1, '5': 5, '10': 'threadCount'},
    {'1': 'deadLockThreadCount', '3': 2, '4': 1, '5': 5, '10': 'deadLockThreadCount'},
    {'1': 'cpuCount', '3': 3, '4': 1, '5': 5, '10': 'cpuCount'},
    {'1': 'totalMemory', '3': 4, '4': 1, '5': 3, '10': 'totalMemory'},
    {'1': 'freeMemory', '3': 5, '4': 1, '5': 3, '10': 'freeMemory'},
    {'1': 'cpuRate', '3': 6, '4': 1, '5': 1, '10': 'cpuRate'},
    {'1': 'javaVersion', '3': 7, '4': 1, '5': 9, '10': 'javaVersion'},
    {'1': 'osName', '3': 8, '4': 1, '5': 9, '10': 'osName'},
    {'1': 'jvmTotalMemory', '3': 9, '4': 1, '5': 3, '10': 'jvmTotalMemory'},
    {'1': 'jvmFreeMemory', '3': 10, '4': 1, '5': 3, '10': 'jvmFreeMemory'},
    {'1': 'processCpuRate', '3': 11, '4': 1, '5': 1, '10': 'processCpuRate'},
    {
      '1': 'memoryDescInfoList',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.protocol.NodeInfo.MachineInfo.MemoryDescInfo',
      '10': 'memoryDescInfoList'
    },
    {
      '1': 'deadLockThreadInfoList',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.protocol.NodeInfo.MachineInfo.DeadLockThreadInfo',
      '10': 'deadLockThreadInfoList'
    },
  ],
  '3': [NodeInfo_MachineInfo_MemoryDescInfo$json, NodeInfo_MachineInfo_DeadLockThreadInfo$json],
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_MachineInfo_MemoryDescInfo$json = {
  '1': 'MemoryDescInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'initSize', '3': 2, '4': 1, '5': 3, '10': 'initSize'},
    {'1': 'useSize', '3': 3, '4': 1, '5': 3, '10': 'useSize'},
    {'1': 'maxSize', '3': 4, '4': 1, '5': 3, '10': 'maxSize'},
    {'1': 'useRate', '3': 5, '4': 1, '5': 1, '10': 'useRate'},
  ],
};

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo_MachineInfo_DeadLockThreadInfo$json = {
  '1': 'DeadLockThreadInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'lockName', '3': 2, '4': 1, '5': 9, '10': 'lockName'},
    {'1': 'lockOwner', '3': 3, '4': 1, '5': 9, '10': 'lockOwner'},
    {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    {'1': 'blockTime', '3': 5, '4': 1, '5': 3, '10': 'blockTime'},
    {'1': 'waitTime', '3': 6, '4': 1, '5': 3, '10': 'waitTime'},
    {'1': 'stackTrace', '3': 7, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `NodeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeInfoDescriptor = $convert
    .base64Decode('CghOb2RlSW5mbxIiCgxiZWdpblN5bmNOdW0YASABKANSDGJlZ2luU3luY051bRIUCgVibG9jax'
        'gCIAEoCVIFYmxvY2sSJAoNc29saWRpdHlCbG9jaxgDIAEoCVINc29saWRpdHlCbG9jaxIwChNj'
        'dXJyZW50Q29ubmVjdENvdW50GAQgASgFUhNjdXJyZW50Q29ubmVjdENvdW50Ei4KEmFjdGl2ZU'
        'Nvbm5lY3RDb3VudBgFIAEoBVISYWN0aXZlQ29ubmVjdENvdW50EjAKE3Bhc3NpdmVDb25uZWN0'
        'Q291bnQYBiABKAVSE3Bhc3NpdmVDb25uZWN0Q291bnQSHAoJdG90YWxGbG93GAcgASgDUgl0b3'
        'RhbEZsb3cSPwoMcGVlckluZm9MaXN0GAggAygLMhsucHJvdG9jb2wuTm9kZUluZm8uUGVlcklu'
        'Zm9SDHBlZXJJbmZvTGlzdBJJCg5jb25maWdOb2RlSW5mbxgJIAEoCzIhLnByb3RvY29sLk5vZG'
        'VJbmZvLkNvbmZpZ05vZGVJbmZvUg5jb25maWdOb2RlSW5mbxJACgttYWNoaW5lSW5mbxgKIAEo'
        'CzIeLnByb3RvY29sLk5vZGVJbmZvLk1hY2hpbmVJbmZvUgttYWNoaW5lSW5mbxJdChNjaGVhdF'
        'dpdG5lc3NJbmZvTWFwGAsgAygLMisucHJvdG9jb2wuTm9kZUluZm8uQ2hlYXRXaXRuZXNzSW5m'
        'b01hcEVudHJ5UhNjaGVhdFdpdG5lc3NJbmZvTWFwGkYKGENoZWF0V2l0bmVzc0luZm9NYXBFbn'
        'RyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGsgHCghQZWVy'
        'SW5mbxIkCg1sYXN0U3luY0Jsb2NrGAEgASgJUg1sYXN0U3luY0Jsb2NrEhwKCXJlbWFpbk51bR'
        'gCIAEoA1IJcmVtYWluTnVtEjAKE2xhc3RCbG9ja1VwZGF0ZVRpbWUYAyABKANSE2xhc3RCbG9j'
        'a1VwZGF0ZVRpbWUSGgoIc3luY0ZsYWcYBCABKAhSCHN5bmNGbGFnEjgKF2hlYWRCbG9ja1RpbW'
        'VXZUJvdGhIYXZlGAUgASgDUhdoZWFkQmxvY2tUaW1lV2VCb3RoSGF2ZRIqChBuZWVkU3luY0Zy'
        'b21QZWVyGAYgASgIUhBuZWVkU3luY0Zyb21QZWVyEiYKDm5lZWRTeW5jRnJvbVVzGAcgASgIUg'
        '5uZWVkU3luY0Zyb21VcxISCgRob3N0GAggASgJUgRob3N0EhIKBHBvcnQYCSABKAVSBHBvcnQS'
        'FgoGbm9kZUlkGAogASgJUgZub2RlSWQSIAoLY29ubmVjdFRpbWUYCyABKANSC2Nvbm5lY3RUaW'
        '1lEh4KCmF2Z0xhdGVuY3kYDCABKAFSCmF2Z0xhdGVuY3kSKAoPc3luY1RvRmV0Y2hTaXplGA0g'
        'ASgFUg9zeW5jVG9GZXRjaFNpemUSNgoWc3luY1RvRmV0Y2hTaXplUGVla051bRgOIAEoA1IWc3'
        'luY1RvRmV0Y2hTaXplUGVla051bRI2ChZzeW5jQmxvY2tSZXF1ZXN0ZWRTaXplGA8gASgFUhZz'
        'eW5jQmxvY2tSZXF1ZXN0ZWRTaXplEiQKDXVuRmV0Y2hTeW5OdW0YECABKANSDXVuRmV0Y2hTeW'
        '5OdW0SKAoPYmxvY2tJblBvcmNTaXplGBEgASgFUg9ibG9ja0luUG9yY1NpemUSMAoTaGVhZEJs'
        'b2NrV2VCb3RoSGF2ZRgSIAEoCVITaGVhZEJsb2NrV2VCb3RoSGF2ZRIaCghpc0FjdGl2ZRgTIA'
        'EoCFIIaXNBY3RpdmUSFAoFc2NvcmUYFCABKAVSBXNjb3JlEhwKCW5vZGVDb3VudBgVIAEoBVIJ'
        'bm9kZUNvdW50EhYKBmluRmxvdxgWIAEoA1IGaW5GbG93EigKD2Rpc2Nvbm5lY3RUaW1lcxgXIA'
        'EoBVIPZGlzY29ubmVjdFRpbWVzEjQKFWxvY2FsRGlzY29ubmVjdFJlYXNvbhgYIAEoCVIVbG9j'
        'YWxEaXNjb25uZWN0UmVhc29uEjYKFnJlbW90ZURpc2Nvbm5lY3RSZWFzb24YGSABKAlSFnJlbW'
        '90ZURpc2Nvbm5lY3RSZWFzb24aogYKDkNvbmZpZ05vZGVJbmZvEiAKC2NvZGVWZXJzaW9uGAEg'
        'ASgJUgtjb2RlVmVyc2lvbhIeCgpwMnBWZXJzaW9uGAIgASgJUgpwMnBWZXJzaW9uEh4KCmxpc3'
        'RlblBvcnQYAyABKAVSCmxpc3RlblBvcnQSJgoOZGlzY292ZXJFbmFibGUYBCABKAhSDmRpc2Nv'
        'dmVyRW5hYmxlEiYKDmFjdGl2ZU5vZGVTaXplGAUgASgFUg5hY3RpdmVOb2RlU2l6ZRIoCg9wYX'
        'NzaXZlTm9kZVNpemUYBiABKAVSD3Bhc3NpdmVOb2RlU2l6ZRIiCgxzZW5kTm9kZVNpemUYByAB'
        'KAVSDHNlbmROb2RlU2l6ZRIoCg9tYXhDb25uZWN0Q291bnQYCCABKAVSD21heENvbm5lY3RDb3'
        'VudBI0ChVzYW1lSXBNYXhDb25uZWN0Q291bnQYCSABKAVSFXNhbWVJcE1heENvbm5lY3RDb3Vu'
        'dBIqChBiYWNrdXBMaXN0ZW5Qb3J0GAogASgFUhBiYWNrdXBMaXN0ZW5Qb3J0EioKEGJhY2t1cE'
        '1lbWJlclNpemUYCyABKAVSEGJhY2t1cE1lbWJlclNpemUSJgoOYmFja3VwUHJpb3JpdHkYDCAB'
        'KAVSDmJhY2t1cFByaW9yaXR5EhwKCWRiVmVyc2lvbhgNIAEoBVIJZGJWZXJzaW9uEjIKFG1pbl'
        'BhcnRpY2lwYXRpb25SYXRlGA4gASgFUhRtaW5QYXJ0aWNpcGF0aW9uUmF0ZRIoCg9zdXBwb3J0'
        'Q29uc3RhbnQYDyABKAhSD3N1cHBvcnRDb25zdGFudBIiCgxtaW5UaW1lUmF0aW8YECABKAFSDG'
        '1pblRpbWVSYXRpbxIiCgxtYXhUaW1lUmF0aW8YESABKAFSDG1heFRpbWVSYXRpbxI6ChhhbGxv'
        'd0NyZWF0aW9uT2ZDb250cmFjdHMYEiABKANSGGFsbG93Q3JlYXRpb25PZkNvbnRyYWN0cxIwCh'
        'NhbGxvd0FkYXB0aXZlRW5lcmd5GBMgASgDUhNhbGxvd0FkYXB0aXZlRW5lcmd5GrkHCgtNYWNo'
        'aW5lSW5mbxIgCgt0aHJlYWRDb3VudBgBIAEoBVILdGhyZWFkQ291bnQSMAoTZGVhZExvY2tUaH'
        'JlYWRDb3VudBgCIAEoBVITZGVhZExvY2tUaHJlYWRDb3VudBIaCghjcHVDb3VudBgDIAEoBVII'
        'Y3B1Q291bnQSIAoLdG90YWxNZW1vcnkYBCABKANSC3RvdGFsTWVtb3J5Eh4KCmZyZWVNZW1vcn'
        'kYBSABKANSCmZyZWVNZW1vcnkSGAoHY3B1UmF0ZRgGIAEoAVIHY3B1UmF0ZRIgCgtqYXZhVmVy'
        'c2lvbhgHIAEoCVILamF2YVZlcnNpb24SFgoGb3NOYW1lGAggASgJUgZvc05hbWUSJgoOanZtVG'
        '90YWxNZW1vcnkYCSABKANSDmp2bVRvdGFsTWVtb3J5EiQKDWp2bUZyZWVNZW1vcnkYCiABKANS'
        'DWp2bUZyZWVNZW1vcnkSJgoOcHJvY2Vzc0NwdVJhdGUYCyABKAFSDnByb2Nlc3NDcHVSYXRlEl'
        '0KEm1lbW9yeURlc2NJbmZvTGlzdBgMIAMoCzItLnByb3RvY29sLk5vZGVJbmZvLk1hY2hpbmVJ'
        'bmZvLk1lbW9yeURlc2NJbmZvUhJtZW1vcnlEZXNjSW5mb0xpc3QSaQoWZGVhZExvY2tUaHJlYW'
        'RJbmZvTGlzdBgNIAMoCzIxLnByb3RvY29sLk5vZGVJbmZvLk1hY2hpbmVJbmZvLkRlYWRMb2Nr'
        'VGhyZWFkSW5mb1IWZGVhZExvY2tUaHJlYWRJbmZvTGlzdBqOAQoOTWVtb3J5RGVzY0luZm8SEg'
        'oEbmFtZRgBIAEoCVIEbmFtZRIaCghpbml0U2l6ZRgCIAEoA1IIaW5pdFNpemUSGAoHdXNlU2l6'
        'ZRgDIAEoA1IHdXNlU2l6ZRIYCgdtYXhTaXplGAQgASgDUgdtYXhTaXplEhgKB3VzZVJhdGUYBS'
        'ABKAFSB3VzZVJhdGUa0gEKEkRlYWRMb2NrVGhyZWFkSW5mbxISCgRuYW1lGAEgASgJUgRuYW1l'
        'EhoKCGxvY2tOYW1lGAIgASgJUghsb2NrTmFtZRIcCglsb2NrT3duZXIYAyABKAlSCWxvY2tPd2'
        '5lchIUCgVzdGF0ZRgEIAEoCVIFc3RhdGUSHAoJYmxvY2tUaW1lGAUgASgDUglibG9ja1RpbWUS'
        'GgoId2FpdFRpbWUYBiABKANSCHdhaXRUaW1lEh4KCnN0YWNrVHJhY2UYByABKAlSCnN0YWNrVH'
        'JhY2U=');

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo$json = {
  '1': 'MetricsInfo',
  '2': [
    {'1': 'interval', '3': 1, '4': 1, '5': 3, '10': 'interval'},
    {'1': 'node', '3': 2, '4': 1, '5': 11, '6': '.protocol.MetricsInfo.NodeInfo', '10': 'node'},
    {
      '1': 'blockchain',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.BlockChainInfo',
      '10': 'blockchain'
    },
    {'1': 'net', '3': 4, '4': 1, '5': 11, '6': '.protocol.MetricsInfo.NetInfo', '10': 'net'},
  ],
  '3': [
    MetricsInfo_NodeInfo$json,
    MetricsInfo_BlockChainInfo$json,
    MetricsInfo_RateInfo$json,
    MetricsInfo_NetInfo$json
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NodeInfo$json = {
  '1': 'NodeInfo',
  '2': [
    {'1': 'ip', '3': 1, '4': 1, '5': 9, '10': 'ip'},
    {'1': 'nodeType', '3': 2, '4': 1, '5': 5, '10': 'nodeType'},
    {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    {'1': 'backupStatus', '3': 4, '4': 1, '5': 5, '10': 'backupStatus'},
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_BlockChainInfo$json = {
  '1': 'BlockChainInfo',
  '2': [
    {'1': 'headBlockNum', '3': 1, '4': 1, '5': 3, '10': 'headBlockNum'},
    {'1': 'headBlockTimestamp', '3': 2, '4': 1, '5': 3, '10': 'headBlockTimestamp'},
    {'1': 'headBlockHash', '3': 3, '4': 1, '5': 9, '10': 'headBlockHash'},
    {'1': 'forkCount', '3': 4, '4': 1, '5': 5, '10': 'forkCount'},
    {'1': 'failForkCount', '3': 5, '4': 1, '5': 5, '10': 'failForkCount'},
    {
      '1': 'blockProcessTime',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'blockProcessTime'
    },
    {'1': 'tps', '3': 7, '4': 1, '5': 11, '6': '.protocol.MetricsInfo.RateInfo', '10': 'tps'},
    {'1': 'transactionCacheSize', '3': 8, '4': 1, '5': 5, '10': 'transactionCacheSize'},
    {
      '1': 'missedTransaction',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'missedTransaction'
    },
    {
      '1': 'witnesses',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.protocol.MetricsInfo.BlockChainInfo.Witness',
      '10': 'witnesses'
    },
    {'1': 'failProcessBlockNum', '3': 11, '4': 1, '5': 3, '10': 'failProcessBlockNum'},
    {'1': 'failProcessBlockReason', '3': 12, '4': 1, '5': 9, '10': 'failProcessBlockReason'},
    {
      '1': 'dupWitness',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.protocol.MetricsInfo.BlockChainInfo.DupWitness',
      '10': 'dupWitness'
    },
  ],
  '3': [MetricsInfo_BlockChainInfo_Witness$json, MetricsInfo_BlockChainInfo_DupWitness$json],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_BlockChainInfo_Witness$json = {
  '1': 'Witness',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_BlockChainInfo_DupWitness$json = {
  '1': 'DupWitness',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'blockNum', '3': 2, '4': 1, '5': 3, '10': 'blockNum'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_RateInfo$json = {
  '1': 'RateInfo',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 3, '10': 'count'},
    {'1': 'meanRate', '3': 2, '4': 1, '5': 1, '10': 'meanRate'},
    {'1': 'oneMinuteRate', '3': 3, '4': 1, '5': 1, '10': 'oneMinuteRate'},
    {'1': 'fiveMinuteRate', '3': 4, '4': 1, '5': 1, '10': 'fiveMinuteRate'},
    {'1': 'fifteenMinuteRate', '3': 5, '4': 1, '5': 1, '10': 'fifteenMinuteRate'},
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo$json = {
  '1': 'NetInfo',
  '2': [
    {'1': 'errorProtoCount', '3': 1, '4': 1, '5': 5, '10': 'errorProtoCount'},
    {
      '1': 'api',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.NetInfo.ApiInfo',
      '10': 'api'
    },
    {'1': 'connectionCount', '3': 3, '4': 1, '5': 5, '10': 'connectionCount'},
    {'1': 'validConnectionCount', '3': 4, '4': 1, '5': 5, '10': 'validConnectionCount'},
    {
      '1': 'tcpInTraffic',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'tcpInTraffic'
    },
    {
      '1': 'tcpOutTraffic',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'tcpOutTraffic'
    },
    {'1': 'disconnectionCount', '3': 7, '4': 1, '5': 5, '10': 'disconnectionCount'},
    {
      '1': 'disconnectionDetail',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.protocol.MetricsInfo.NetInfo.DisconnectionDetailInfo',
      '10': 'disconnectionDetail'
    },
    {
      '1': 'udpInTraffic',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'udpInTraffic'
    },
    {
      '1': 'udpOutTraffic',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'udpOutTraffic'
    },
    {
      '1': 'latency',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.NetInfo.LatencyInfo',
      '10': 'latency'
    },
  ],
  '3': [
    MetricsInfo_NetInfo_ApiInfo$json,
    MetricsInfo_NetInfo_DisconnectionDetailInfo$json,
    MetricsInfo_NetInfo_LatencyInfo$json
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo_ApiInfo$json = {
  '1': 'ApiInfo',
  '2': [
    {'1': 'qps', '3': 1, '4': 1, '5': 11, '6': '.protocol.MetricsInfo.RateInfo', '10': 'qps'},
    {
      '1': 'failQps',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'failQps'
    },
    {
      '1': 'outTraffic',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'outTraffic'
    },
    {
      '1': 'detail',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.protocol.MetricsInfo.NetInfo.ApiInfo.ApiDetailInfo',
      '10': 'detail'
    },
  ],
  '3': [MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo$json],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo$json = {
  '1': 'ApiDetailInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'qps', '3': 2, '4': 1, '5': 11, '6': '.protocol.MetricsInfo.RateInfo', '10': 'qps'},
    {
      '1': 'failQps',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'failQps'
    },
    {
      '1': 'outTraffic',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.protocol.MetricsInfo.RateInfo',
      '10': 'outTraffic'
    },
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo_DisconnectionDetailInfo$json = {
  '1': 'DisconnectionDetailInfo',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo_LatencyInfo$json = {
  '1': 'LatencyInfo',
  '2': [
    {'1': 'top99', '3': 1, '4': 1, '5': 5, '10': 'top99'},
    {'1': 'top95', '3': 2, '4': 1, '5': 5, '10': 'top95'},
    {'1': 'top75', '3': 3, '4': 1, '5': 5, '10': 'top75'},
    {'1': 'totalCount', '3': 4, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'delay1S', '3': 5, '4': 1, '5': 5, '10': 'delay1S'},
    {'1': 'delay2S', '3': 6, '4': 1, '5': 5, '10': 'delay2S'},
    {'1': 'delay3S', '3': 7, '4': 1, '5': 5, '10': 'delay3S'},
    {
      '1': 'detail',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.protocol.MetricsInfo.NetInfo.LatencyInfo.LatencyDetailInfo',
      '10': 'detail'
    },
  ],
  '3': [MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo$json],
};

@$core.Deprecated('Use metricsInfoDescriptor instead')
const MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo$json = {
  '1': 'LatencyDetailInfo',
  '2': [
    {'1': 'witness', '3': 1, '4': 1, '5': 9, '10': 'witness'},
    {'1': 'top99', '3': 2, '4': 1, '5': 5, '10': 'top99'},
    {'1': 'top95', '3': 3, '4': 1, '5': 5, '10': 'top95'},
    {'1': 'top75', '3': 4, '4': 1, '5': 5, '10': 'top75'},
    {'1': 'count', '3': 5, '4': 1, '5': 5, '10': 'count'},
    {'1': 'delay1S', '3': 6, '4': 1, '5': 5, '10': 'delay1S'},
    {'1': 'delay2S', '3': 7, '4': 1, '5': 5, '10': 'delay2S'},
    {'1': 'delay3S', '3': 8, '4': 1, '5': 5, '10': 'delay3S'},
  ],
};

/// Descriptor for `MetricsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metricsInfoDescriptor = $convert
    .base64Decode('CgtNZXRyaWNzSW5mbxIaCghpbnRlcnZhbBgBIAEoA1IIaW50ZXJ2YWwSMgoEbm9kZRgCIAEoCz'
        'IeLnByb3RvY29sLk1ldHJpY3NJbmZvLk5vZGVJbmZvUgRub2RlEkQKCmJsb2NrY2hhaW4YAyAB'
        'KAsyJC5wcm90b2NvbC5NZXRyaWNzSW5mby5CbG9ja0NoYWluSW5mb1IKYmxvY2tjaGFpbhIvCg'
        'NuZXQYBCABKAsyHS5wcm90b2NvbC5NZXRyaWNzSW5mby5OZXRJbmZvUgNuZXQadAoITm9kZUlu'
        'Zm8SDgoCaXAYASABKAlSAmlwEhoKCG5vZGVUeXBlGAIgASgFUghub2RlVHlwZRIYCgd2ZXJzaW'
        '9uGAMgASgJUgd2ZXJzaW9uEiIKDGJhY2t1cFN0YXR1cxgEIAEoBVIMYmFja3VwU3RhdHVzGu4G'
        'Cg5CbG9ja0NoYWluSW5mbxIiCgxoZWFkQmxvY2tOdW0YASABKANSDGhlYWRCbG9ja051bRIuCh'
        'JoZWFkQmxvY2tUaW1lc3RhbXAYAiABKANSEmhlYWRCbG9ja1RpbWVzdGFtcBIkCg1oZWFkQmxv'
        'Y2tIYXNoGAMgASgJUg1oZWFkQmxvY2tIYXNoEhwKCWZvcmtDb3VudBgEIAEoBVIJZm9ya0NvdW'
        '50EiQKDWZhaWxGb3JrQ291bnQYBSABKAVSDWZhaWxGb3JrQ291bnQSSgoQYmxvY2tQcm9jZXNz'
        'VGltZRgGIAEoCzIeLnByb3RvY29sLk1ldHJpY3NJbmZvLlJhdGVJbmZvUhBibG9ja1Byb2Nlc3'
        'NUaW1lEjAKA3RwcxgHIAEoCzIeLnByb3RvY29sLk1ldHJpY3NJbmZvLlJhdGVJbmZvUgN0cHMS'
        'MgoUdHJhbnNhY3Rpb25DYWNoZVNpemUYCCABKAVSFHRyYW5zYWN0aW9uQ2FjaGVTaXplEkwKEW'
        '1pc3NlZFRyYW5zYWN0aW9uGAkgASgLMh4ucHJvdG9jb2wuTWV0cmljc0luZm8uUmF0ZUluZm9S'
        'EW1pc3NlZFRyYW5zYWN0aW9uEkoKCXdpdG5lc3NlcxgKIAMoCzIsLnByb3RvY29sLk1ldHJpY3'
        'NJbmZvLkJsb2NrQ2hhaW5JbmZvLldpdG5lc3NSCXdpdG5lc3NlcxIwChNmYWlsUHJvY2Vzc0Js'
        'b2NrTnVtGAsgASgDUhNmYWlsUHJvY2Vzc0Jsb2NrTnVtEjYKFmZhaWxQcm9jZXNzQmxvY2tSZW'
        'Fzb24YDCABKAlSFmZhaWxQcm9jZXNzQmxvY2tSZWFzb24STwoKZHVwV2l0bmVzcxgNIAMoCzIv'
        'LnByb3RvY29sLk1ldHJpY3NJbmZvLkJsb2NrQ2hhaW5JbmZvLkR1cFdpdG5lc3NSCmR1cFdpdG'
        '5lc3MaPQoHV2l0bmVzcxIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhgKB3ZlcnNpb24YAiAB'
        'KAVSB3ZlcnNpb24aWAoKRHVwV2l0bmVzcxIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhoKCG'
        'Jsb2NrTnVtGAIgASgDUghibG9ja051bRIUCgVjb3VudBgDIAEoBVIFY291bnQauAEKCFJhdGVJ'
        'bmZvEhQKBWNvdW50GAEgASgDUgVjb3VudBIaCghtZWFuUmF0ZRgCIAEoAVIIbWVhblJhdGUSJA'
        'oNb25lTWludXRlUmF0ZRgDIAEoAVINb25lTWludXRlUmF0ZRImCg5maXZlTWludXRlUmF0ZRgE'
        'IAEoAVIOZml2ZU1pbnV0ZVJhdGUSLAoRZmlmdGVlbk1pbnV0ZVJhdGUYBSABKAFSEWZpZnRlZW'
        '5NaW51dGVSYXRlGscNCgdOZXRJbmZvEigKD2Vycm9yUHJvdG9Db3VudBgBIAEoBVIPZXJyb3JQ'
        'cm90b0NvdW50EjcKA2FwaRgCIAEoCzIlLnByb3RvY29sLk1ldHJpY3NJbmZvLk5ldEluZm8uQX'
        'BpSW5mb1IDYXBpEigKD2Nvbm5lY3Rpb25Db3VudBgDIAEoBVIPY29ubmVjdGlvbkNvdW50EjIK'
        'FHZhbGlkQ29ubmVjdGlvbkNvdW50GAQgASgFUhR2YWxpZENvbm5lY3Rpb25Db3VudBJCCgx0Y3'
        'BJblRyYWZmaWMYBSABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5SYXRlSW5mb1IMdGNwSW5U'
        'cmFmZmljEkQKDXRjcE91dFRyYWZmaWMYBiABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5SYX'
        'RlSW5mb1INdGNwT3V0VHJhZmZpYxIuChJkaXNjb25uZWN0aW9uQ291bnQYByABKAVSEmRpc2Nv'
        'bm5lY3Rpb25Db3VudBJnChNkaXNjb25uZWN0aW9uRGV0YWlsGAggAygLMjUucHJvdG9jb2wuTW'
        'V0cmljc0luZm8uTmV0SW5mby5EaXNjb25uZWN0aW9uRGV0YWlsSW5mb1ITZGlzY29ubmVjdGlv'
        'bkRldGFpbBJCCgx1ZHBJblRyYWZmaWMYCSABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5SYX'
        'RlSW5mb1IMdWRwSW5UcmFmZmljEkQKDXVkcE91dFRyYWZmaWMYCiABKAsyHi5wcm90b2NvbC5N'
        'ZXRyaWNzSW5mby5SYXRlSW5mb1INdWRwT3V0VHJhZmZpYxJDCgdsYXRlbmN5GAsgASgLMikucH'
        'JvdG9jb2wuTWV0cmljc0luZm8uTmV0SW5mby5MYXRlbmN5SW5mb1IHbGF0ZW5jeRrUAwoHQXBp'
        'SW5mbxIwCgNxcHMYASABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5SYXRlSW5mb1IDcXBzEj'
        'gKB2ZhaWxRcHMYAiABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5SYXRlSW5mb1IHZmFpbFFw'
        'cxI+CgpvdXRUcmFmZmljGAMgASgLMh4ucHJvdG9jb2wuTWV0cmljc0luZm8uUmF0ZUluZm9SCm'
        '91dFRyYWZmaWMSSwoGZGV0YWlsGAQgAygLMjMucHJvdG9jb2wuTWV0cmljc0luZm8uTmV0SW5m'
        'by5BcGlJbmZvLkFwaURldGFpbEluZm9SBmRldGFpbBrPAQoNQXBpRGV0YWlsSW5mbxISCgRuYW'
        '1lGAEgASgJUgRuYW1lEjAKA3FwcxgCIAEoCzIeLnByb3RvY29sLk1ldHJpY3NJbmZvLlJhdGVJ'
        'bmZvUgNxcHMSOAoHZmFpbFFwcxgDIAEoCzIeLnByb3RvY29sLk1ldHJpY3NJbmZvLlJhdGVJbm'
        'ZvUgdmYWlsUXBzEj4KCm91dFRyYWZmaWMYBCABKAsyHi5wcm90b2NvbC5NZXRyaWNzSW5mby5S'
        'YXRlSW5mb1IKb3V0VHJhZmZpYxpHChdEaXNjb25uZWN0aW9uRGV0YWlsSW5mbxIWCgZyZWFzb2'
        '4YASABKAlSBnJlYXNvbhIUCgVjb3VudBgCIAEoBVIFY291bnQa6AMKC0xhdGVuY3lJbmZvEhQK'
        'BXRvcDk5GAEgASgFUgV0b3A5ORIUCgV0b3A5NRgCIAEoBVIFdG9wOTUSFAoFdG9wNzUYAyABKA'
        'VSBXRvcDc1Eh4KCnRvdGFsQ291bnQYBCABKAVSCnRvdGFsQ291bnQSGAoHZGVsYXkxUxgFIAEo'
        'BVIHZGVsYXkxUxIYCgdkZWxheTJTGAYgASgFUgdkZWxheTJTEhgKB2RlbGF5M1MYByABKAVSB2'
        'RlbGF5M1MSUwoGZGV0YWlsGAggAygLMjsucHJvdG9jb2wuTWV0cmljc0luZm8uTmV0SW5mby5M'
        'YXRlbmN5SW5mby5MYXRlbmN5RGV0YWlsSW5mb1IGZGV0YWlsGtMBChFMYXRlbmN5RGV0YWlsSW'
        '5mbxIYCgd3aXRuZXNzGAEgASgJUgd3aXRuZXNzEhQKBXRvcDk5GAIgASgFUgV0b3A5ORIUCgV0'
        'b3A5NRgDIAEoBVIFdG9wOTUSFAoFdG9wNzUYBCABKAVSBXRvcDc1EhQKBWNvdW50GAUgASgFUg'
        'Vjb3VudBIYCgdkZWxheTFTGAYgASgFUgdkZWxheTFTEhgKB2RlbGF5MlMYByABKAVSB2RlbGF5'
        'MlMSGAoHZGVsYXkzUxgIIAEoBVIHZGVsYXkzUw==');

@$core.Deprecated('Use pBFTMessageDescriptor instead')
const PBFTMessage$json = {
  '1': 'PBFTMessage',
  '2': [
    {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.PBFTMessage.Raw', '10': 'rawData'},
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
  ],
  '3': [PBFTMessage_Raw$json],
  '4': [PBFTMessage_MsgType$json, PBFTMessage_DataType$json],
};

@$core.Deprecated('Use pBFTMessageDescriptor instead')
const PBFTMessage_Raw$json = {
  '1': 'Raw',
  '2': [
    {
      '1': 'msg_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protocol.PBFTMessage.MsgType',
      '10': 'msgType'
    },
    {
      '1': 'data_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.protocol.PBFTMessage.DataType',
      '10': 'dataType'
    },
    {'1': 'view_n', '3': 3, '4': 1, '5': 3, '10': 'viewN'},
    {'1': 'epoch', '3': 4, '4': 1, '5': 3, '10': 'epoch'},
    {'1': 'data', '3': 5, '4': 1, '5': 12, '10': 'data'},
  ],
};

@$core.Deprecated('Use pBFTMessageDescriptor instead')
const PBFTMessage_MsgType$json = {
  '1': 'MsgType',
  '2': [
    {'1': 'VIEW_CHANGE', '2': 0},
    {'1': 'REQUEST', '2': 1},
    {'1': 'PREPREPARE', '2': 2},
    {'1': 'PREPARE', '2': 3},
    {'1': 'COMMIT', '2': 4},
  ],
};

@$core.Deprecated('Use pBFTMessageDescriptor instead')
const PBFTMessage_DataType$json = {
  '1': 'DataType',
  '2': [
    {'1': 'BLOCK', '2': 0},
    {'1': 'SRL', '2': 1},
  ],
};

/// Descriptor for `PBFTMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pBFTMessageDescriptor = $convert
    .base64Decode('CgtQQkZUTWVzc2FnZRI0CghyYXdfZGF0YRgBIAEoCzIZLnByb3RvY29sLlBCRlRNZXNzYWdlLl'
        'Jhd1IHcmF3RGF0YRIcCglzaWduYXR1cmUYAiABKAxSCXNpZ25hdHVyZRq9AQoDUmF3EjgKCG1z'
        'Z190eXBlGAEgASgOMh0ucHJvdG9jb2wuUEJGVE1lc3NhZ2UuTXNnVHlwZVIHbXNnVHlwZRI7Cg'
        'lkYXRhX3R5cGUYAiABKA4yHi5wcm90b2NvbC5QQkZUTWVzc2FnZS5EYXRhVHlwZVIIZGF0YVR5'
        'cGUSFQoGdmlld19uGAMgASgDUgV2aWV3ThIUCgVlcG9jaBgEIAEoA1IFZXBvY2gSEgoEZGF0YR'
        'gFIAEoDFIEZGF0YSJQCgdNc2dUeXBlEg8KC1ZJRVdfQ0hBTkdFEAASCwoHUkVRVUVTVBABEg4K'
        'ClBSRVBSRVBBUkUQAhILCgdQUkVQQVJFEAMSCgoGQ09NTUlUEAQiHgoIRGF0YVR5cGUSCQoFQk'
        'xPQ0sQABIHCgNTUkwQAQ==');

@$core.Deprecated('Use pBFTCommitResultDescriptor instead')
const PBFTCommitResult$json = {
  '1': 'PBFTCommitResult',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'signature', '3': 2, '4': 3, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `PBFTCommitResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pBFTCommitResultDescriptor = $convert
    .base64Decode('ChBQQkZUQ29tbWl0UmVzdWx0EhIKBGRhdGEYASABKAxSBGRhdGESHAoJc2lnbmF0dXJlGAIgAy'
        'gMUglzaWduYXR1cmU=');

@$core.Deprecated('Use sRLDescriptor instead')
const SRL$json = {
  '1': 'SRL',
  '2': [
    {'1': 'srAddress', '3': 1, '4': 3, '5': 12, '10': 'srAddress'},
  ],
};

/// Descriptor for `SRL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sRLDescriptor =
    $convert.base64Decode('CgNTUkwSHAoJc3JBZGRyZXNzGAEgAygMUglzckFkZHJlc3M=');
