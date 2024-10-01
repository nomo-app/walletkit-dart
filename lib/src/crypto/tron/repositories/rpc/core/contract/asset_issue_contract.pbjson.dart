//
//  Generated code. Do not modify.
//  source: core/contract/asset_issue_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetIssueContractDescriptor instead')
const AssetIssueContract$json = {
  '1': 'AssetIssueContract',
  '2': [
    {'1': 'id', '3': 41, '4': 1, '5': 9, '10': 'id'},
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'name', '3': 2, '4': 1, '5': 12, '10': 'name'},
    {'1': 'abbr', '3': 3, '4': 1, '5': 12, '10': 'abbr'},
    {'1': 'total_supply', '3': 4, '4': 1, '5': 3, '10': 'totalSupply'},
    {'1': 'frozen_supply', '3': 5, '4': 3, '5': 11, '6': '.protocol.AssetIssueContract.FrozenSupply', '10': 'frozenSupply'},
    {'1': 'trx_num', '3': 6, '4': 1, '5': 5, '10': 'trxNum'},
    {'1': 'precision', '3': 7, '4': 1, '5': 5, '10': 'precision'},
    {'1': 'num', '3': 8, '4': 1, '5': 5, '10': 'num'},
    {'1': 'start_time', '3': 9, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'end_time', '3': 10, '4': 1, '5': 3, '10': 'endTime'},
    {'1': 'order', '3': 11, '4': 1, '5': 3, '10': 'order'},
    {'1': 'vote_score', '3': 16, '4': 1, '5': 5, '10': 'voteScore'},
    {'1': 'description', '3': 20, '4': 1, '5': 12, '10': 'description'},
    {'1': 'url', '3': 21, '4': 1, '5': 12, '10': 'url'},
    {'1': 'free_asset_net_limit', '3': 22, '4': 1, '5': 3, '10': 'freeAssetNetLimit'},
    {'1': 'public_free_asset_net_limit', '3': 23, '4': 1, '5': 3, '10': 'publicFreeAssetNetLimit'},
    {'1': 'public_free_asset_net_usage', '3': 24, '4': 1, '5': 3, '10': 'publicFreeAssetNetUsage'},
    {'1': 'public_latest_free_net_time', '3': 25, '4': 1, '5': 3, '10': 'publicLatestFreeNetTime'},
  ],
  '3': [AssetIssueContract_FrozenSupply$json],
};

@$core.Deprecated('Use assetIssueContractDescriptor instead')
const AssetIssueContract_FrozenSupply$json = {
  '1': 'FrozenSupply',
  '2': [
    {'1': 'frozen_amount', '3': 1, '4': 1, '5': 3, '10': 'frozenAmount'},
    {'1': 'frozen_days', '3': 2, '4': 1, '5': 3, '10': 'frozenDays'},
  ],
};

/// Descriptor for `AssetIssueContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetIssueContractDescriptor = $convert.base64Decode(
    'ChJBc3NldElzc3VlQ29udHJhY3QSDgoCaWQYKSABKAlSAmlkEiMKDW93bmVyX2FkZHJlc3MYAS'
    'ABKAxSDG93bmVyQWRkcmVzcxISCgRuYW1lGAIgASgMUgRuYW1lEhIKBGFiYnIYAyABKAxSBGFi'
    'YnISIQoMdG90YWxfc3VwcGx5GAQgASgDUgt0b3RhbFN1cHBseRJOCg1mcm96ZW5fc3VwcGx5GA'
    'UgAygLMikucHJvdG9jb2wuQXNzZXRJc3N1ZUNvbnRyYWN0LkZyb3plblN1cHBseVIMZnJvemVu'
    'U3VwcGx5EhcKB3RyeF9udW0YBiABKAVSBnRyeE51bRIcCglwcmVjaXNpb24YByABKAVSCXByZW'
    'Npc2lvbhIQCgNudW0YCCABKAVSA251bRIdCgpzdGFydF90aW1lGAkgASgDUglzdGFydFRpbWUS'
    'GQoIZW5kX3RpbWUYCiABKANSB2VuZFRpbWUSFAoFb3JkZXIYCyABKANSBW9yZGVyEh0KCnZvdG'
    'Vfc2NvcmUYECABKAVSCXZvdGVTY29yZRIgCgtkZXNjcmlwdGlvbhgUIAEoDFILZGVzY3JpcHRp'
    'b24SEAoDdXJsGBUgASgMUgN1cmwSLwoUZnJlZV9hc3NldF9uZXRfbGltaXQYFiABKANSEWZyZW'
    'VBc3NldE5ldExpbWl0EjwKG3B1YmxpY19mcmVlX2Fzc2V0X25ldF9saW1pdBgXIAEoA1IXcHVi'
    'bGljRnJlZUFzc2V0TmV0TGltaXQSPAobcHVibGljX2ZyZWVfYXNzZXRfbmV0X3VzYWdlGBggAS'
    'gDUhdwdWJsaWNGcmVlQXNzZXROZXRVc2FnZRI8ChtwdWJsaWNfbGF0ZXN0X2ZyZWVfbmV0X3Rp'
    'bWUYGSABKANSF3B1YmxpY0xhdGVzdEZyZWVOZXRUaW1lGlQKDEZyb3plblN1cHBseRIjCg1mcm'
    '96ZW5fYW1vdW50GAEgASgDUgxmcm96ZW5BbW91bnQSHwoLZnJvemVuX2RheXMYAiABKANSCmZy'
    'b3plbkRheXM=');

@$core.Deprecated('Use transferAssetContractDescriptor instead')
const TransferAssetContract$json = {
  '1': 'TransferAssetContract',
  '2': [
    {'1': 'asset_name', '3': 1, '4': 1, '5': 12, '10': 'assetName'},
    {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'to_address', '3': 3, '4': 1, '5': 12, '10': 'toAddress'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `TransferAssetContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferAssetContractDescriptor = $convert.base64Decode(
    'ChVUcmFuc2ZlckFzc2V0Q29udHJhY3QSHQoKYXNzZXRfbmFtZRgBIAEoDFIJYXNzZXROYW1lEi'
    'MKDW93bmVyX2FkZHJlc3MYAiABKAxSDG93bmVyQWRkcmVzcxIdCgp0b19hZGRyZXNzGAMgASgM'
    'Ugl0b0FkZHJlc3MSFgoGYW1vdW50GAQgASgDUgZhbW91bnQ=');

@$core.Deprecated('Use unfreezeAssetContractDescriptor instead')
const UnfreezeAssetContract$json = {
  '1': 'UnfreezeAssetContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `UnfreezeAssetContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfreezeAssetContractDescriptor = $convert.base64Decode(
    'ChVVbmZyZWV6ZUFzc2V0Q29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZG'
    'RyZXNz');

@$core.Deprecated('Use updateAssetContractDescriptor instead')
const UpdateAssetContract$json = {
  '1': 'UpdateAssetContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'description', '3': 2, '4': 1, '5': 12, '10': 'description'},
    {'1': 'url', '3': 3, '4': 1, '5': 12, '10': 'url'},
    {'1': 'new_limit', '3': 4, '4': 1, '5': 3, '10': 'newLimit'},
    {'1': 'new_public_limit', '3': 5, '4': 1, '5': 3, '10': 'newPublicLimit'},
  ],
};

/// Descriptor for `UpdateAssetContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetContractDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVBc3NldENvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQWRkcm'
    'VzcxIgCgtkZXNjcmlwdGlvbhgCIAEoDFILZGVzY3JpcHRpb24SEAoDdXJsGAMgASgMUgN1cmwS'
    'GwoJbmV3X2xpbWl0GAQgASgDUghuZXdMaW1pdBIoChBuZXdfcHVibGljX2xpbWl0GAUgASgDUg'
    '5uZXdQdWJsaWNMaW1pdA==');

@$core.Deprecated('Use participateAssetIssueContractDescriptor instead')
const ParticipateAssetIssueContract$json = {
  '1': 'ParticipateAssetIssueContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'to_address', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    {'1': 'asset_name', '3': 3, '4': 1, '5': 12, '10': 'assetName'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `ParticipateAssetIssueContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participateAssetIssueContractDescriptor = $convert.base64Decode(
    'Ch1QYXJ0aWNpcGF0ZUFzc2V0SXNzdWVDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUg'
    'xvd25lckFkZHJlc3MSHQoKdG9fYWRkcmVzcxgCIAEoDFIJdG9BZGRyZXNzEh0KCmFzc2V0X25h'
    'bWUYAyABKAxSCWFzc2V0TmFtZRIWCgZhbW91bnQYBCABKANSBmFtb3VudA==');

