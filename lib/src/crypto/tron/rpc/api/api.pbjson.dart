//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use returnDescriptor instead')
const Return$json = {
  '1': 'Return',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.protocol.Return.response_code', '10': 'code'},
    {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
  ],
  '4': [Return_response_code$json],
};

@$core.Deprecated('Use returnDescriptor instead')
const Return_response_code$json = {
  '1': 'response_code',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'SIGERROR', '2': 1},
    {'1': 'CONTRACT_VALIDATE_ERROR', '2': 2},
    {'1': 'CONTRACT_EXE_ERROR', '2': 3},
    {'1': 'BANDWITH_ERROR', '2': 4},
    {'1': 'DUP_TRANSACTION_ERROR', '2': 5},
    {'1': 'TAPOS_ERROR', '2': 6},
    {'1': 'TOO_BIG_TRANSACTION_ERROR', '2': 7},
    {'1': 'TRANSACTION_EXPIRATION_ERROR', '2': 8},
    {'1': 'SERVER_BUSY', '2': 9},
    {'1': 'NO_CONNECTION', '2': 10},
    {'1': 'NOT_ENOUGH_EFFECTIVE_CONNECTION', '2': 11},
    {'1': 'BLOCK_UNSOLIDIFIED', '2': 12},
    {'1': 'OTHER_ERROR', '2': 20},
  ],
};

/// Descriptor for `Return`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnDescriptor = $convert.base64Decode(
    'CgZSZXR1cm4SFgoGcmVzdWx0GAEgASgIUgZyZXN1bHQSMgoEY29kZRgCIAEoDjIeLnByb3RvY2'
    '9sLlJldHVybi5yZXNwb25zZV9jb2RlUgRjb2RlEhgKB21lc3NhZ2UYAyABKAxSB21lc3NhZ2Ui'
    '0gIKDXJlc3BvbnNlX2NvZGUSCwoHU1VDQ0VTUxAAEgwKCFNJR0VSUk9SEAESGwoXQ09OVFJBQ1'
    'RfVkFMSURBVEVfRVJST1IQAhIWChJDT05UUkFDVF9FWEVfRVJST1IQAxISCg5CQU5EV0lUSF9F'
    'UlJPUhAEEhkKFURVUF9UUkFOU0FDVElPTl9FUlJPUhAFEg8KC1RBUE9TX0VSUk9SEAYSHQoZVE'
    '9PX0JJR19UUkFOU0FDVElPTl9FUlJPUhAHEiAKHFRSQU5TQUNUSU9OX0VYUElSQVRJT05fRVJS'
    'T1IQCBIPCgtTRVJWRVJfQlVTWRAJEhEKDU5PX0NPTk5FQ1RJT04QChIjCh9OT1RfRU5PVUdIX0'
    'VGRkVDVElWRV9DT05ORUNUSU9OEAsSFgoSQkxPQ0tfVU5TT0xJRElGSUVEEAwSDwoLT1RIRVJf'
    'RVJST1IQFA==');

@$core.Deprecated('Use blockReferenceDescriptor instead')
const BlockReference$json = {
  '1': 'BlockReference',
  '2': [
    {'1': 'block_num', '3': 1, '4': 1, '5': 3, '10': 'blockNum'},
    {'1': 'block_hash', '3': 2, '4': 1, '5': 12, '10': 'blockHash'},
  ],
};

/// Descriptor for `BlockReference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockReferenceDescriptor = $convert.base64Decode(
    'Cg5CbG9ja1JlZmVyZW5jZRIbCglibG9ja19udW0YASABKANSCGJsb2NrTnVtEh0KCmJsb2NrX2'
    'hhc2gYAiABKAxSCWJsb2NrSGFzaA==');

@$core.Deprecated('Use witnessListDescriptor instead')
const WitnessList$json = {
  '1': 'WitnessList',
  '2': [
    {'1': 'witnesses', '3': 1, '4': 3, '5': 11, '6': '.protocol.Witness', '10': 'witnesses'},
  ],
};

/// Descriptor for `WitnessList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List witnessListDescriptor = $convert.base64Decode(
    'CgtXaXRuZXNzTGlzdBIvCgl3aXRuZXNzZXMYASADKAsyES5wcm90b2NvbC5XaXRuZXNzUgl3aX'
    'RuZXNzZXM=');

@$core.Deprecated('Use proposalListDescriptor instead')
const ProposalList$json = {
  '1': 'ProposalList',
  '2': [
    {'1': 'proposals', '3': 1, '4': 3, '5': 11, '6': '.protocol.Proposal', '10': 'proposals'},
  ],
};

/// Descriptor for `ProposalList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalListDescriptor = $convert.base64Decode(
    'CgxQcm9wb3NhbExpc3QSMAoJcHJvcG9zYWxzGAEgAygLMhIucHJvdG9jb2wuUHJvcG9zYWxSCX'
    'Byb3Bvc2Fscw==');

@$core.Deprecated('Use exchangeListDescriptor instead')
const ExchangeList$json = {
  '1': 'ExchangeList',
  '2': [
    {'1': 'exchanges', '3': 1, '4': 3, '5': 11, '6': '.protocol.Exchange', '10': 'exchanges'},
  ],
};

/// Descriptor for `ExchangeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeListDescriptor = $convert.base64Decode(
    'CgxFeGNoYW5nZUxpc3QSMAoJZXhjaGFuZ2VzGAEgAygLMhIucHJvdG9jb2wuRXhjaGFuZ2VSCW'
    'V4Y2hhbmdlcw==');

@$core.Deprecated('Use assetIssueListDescriptor instead')
const AssetIssueList$json = {
  '1': 'AssetIssueList',
  '2': [
    {'1': 'assetIssue', '3': 1, '4': 3, '5': 11, '6': '.protocol.AssetIssueContract', '10': 'assetIssue'},
  ],
};

/// Descriptor for `AssetIssueList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetIssueListDescriptor = $convert.base64Decode(
    'Cg5Bc3NldElzc3VlTGlzdBI8Cgphc3NldElzc3VlGAEgAygLMhwucHJvdG9jb2wuQXNzZXRJc3'
    'N1ZUNvbnRyYWN0Ugphc3NldElzc3Vl');

@$core.Deprecated('Use blockListDescriptor instead')
const BlockList$json = {
  '1': 'BlockList',
  '2': [
    {'1': 'block', '3': 1, '4': 3, '5': 11, '6': '.protocol.Block', '10': 'block'},
  ],
};

/// Descriptor for `BlockList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockListDescriptor = $convert.base64Decode(
    'CglCbG9ja0xpc3QSJQoFYmxvY2sYASADKAsyDy5wcm90b2NvbC5CbG9ja1IFYmxvY2s=');

@$core.Deprecated('Use transactionListDescriptor instead')
const TransactionList$json = {
  '1': 'TransactionList',
  '2': [
    {'1': 'transaction', '3': 1, '4': 3, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
  ],
};

/// Descriptor for `TransactionList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionListDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvbkxpc3QSNwoLdHJhbnNhY3Rpb24YASADKAsyFS5wcm90b2NvbC5UcmFuc2'
    'FjdGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use transactionIdListDescriptor instead')
const TransactionIdList$json = {
  '1': 'TransactionIdList',
  '2': [
    {'1': 'txId', '3': 1, '4': 3, '5': 9, '10': 'txId'},
  ],
};

/// Descriptor for `TransactionIdList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionIdListDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvbklkTGlzdBISCgR0eElkGAEgAygJUgR0eElk');

@$core.Deprecated('Use delegatedResourceMessageDescriptor instead')
const DelegatedResourceMessage$json = {
  '1': 'DelegatedResourceMessage',
  '2': [
    {'1': 'fromAddress', '3': 1, '4': 1, '5': 12, '10': 'fromAddress'},
    {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
  ],
};

/// Descriptor for `DelegatedResourceMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatedResourceMessageDescriptor = $convert.base64Decode(
    'ChhEZWxlZ2F0ZWRSZXNvdXJjZU1lc3NhZ2USIAoLZnJvbUFkZHJlc3MYASABKAxSC2Zyb21BZG'
    'RyZXNzEhwKCXRvQWRkcmVzcxgCIAEoDFIJdG9BZGRyZXNz');

@$core.Deprecated('Use delegatedResourceListDescriptor instead')
const DelegatedResourceList$json = {
  '1': 'DelegatedResourceList',
  '2': [
    {'1': 'delegatedResource', '3': 1, '4': 3, '5': 11, '6': '.protocol.DelegatedResource', '10': 'delegatedResource'},
  ],
};

/// Descriptor for `DelegatedResourceList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatedResourceListDescriptor = $convert.base64Decode(
    'ChVEZWxlZ2F0ZWRSZXNvdXJjZUxpc3QSSQoRZGVsZWdhdGVkUmVzb3VyY2UYASADKAsyGy5wcm'
    '90b2NvbC5EZWxlZ2F0ZWRSZXNvdXJjZVIRZGVsZWdhdGVkUmVzb3VyY2U=');

@$core.Deprecated('Use getAvailableUnfreezeCountRequestMessageDescriptor instead')
const GetAvailableUnfreezeCountRequestMessage$json = {
  '1': 'GetAvailableUnfreezeCountRequestMessage',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `GetAvailableUnfreezeCountRequestMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableUnfreezeCountRequestMessageDescriptor = $convert.base64Decode(
    'CidHZXRBdmFpbGFibGVVbmZyZWV6ZUNvdW50UmVxdWVzdE1lc3NhZ2USIwoNb3duZXJfYWRkcm'
    'VzcxgBIAEoDFIMb3duZXJBZGRyZXNz');

@$core.Deprecated('Use getAvailableUnfreezeCountResponseMessageDescriptor instead')
const GetAvailableUnfreezeCountResponseMessage$json = {
  '1': 'GetAvailableUnfreezeCountResponseMessage',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 3, '10': 'count'},
  ],
};

/// Descriptor for `GetAvailableUnfreezeCountResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableUnfreezeCountResponseMessageDescriptor = $convert.base64Decode(
    'CihHZXRBdmFpbGFibGVVbmZyZWV6ZUNvdW50UmVzcG9uc2VNZXNzYWdlEhQKBWNvdW50GAEgAS'
    'gDUgVjb3VudA==');

@$core.Deprecated('Use canDelegatedMaxSizeRequestMessageDescriptor instead')
const CanDelegatedMaxSizeRequestMessage$json = {
  '1': 'CanDelegatedMaxSizeRequestMessage',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 5, '10': 'type'},
    {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

/// Descriptor for `CanDelegatedMaxSizeRequestMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canDelegatedMaxSizeRequestMessageDescriptor = $convert.base64Decode(
    'CiFDYW5EZWxlZ2F0ZWRNYXhTaXplUmVxdWVzdE1lc3NhZ2USEgoEdHlwZRgBIAEoBVIEdHlwZR'
    'IjCg1vd25lcl9hZGRyZXNzGAIgASgMUgxvd25lckFkZHJlc3M=');

@$core.Deprecated('Use canDelegatedMaxSizeResponseMessageDescriptor instead')
const CanDelegatedMaxSizeResponseMessage$json = {
  '1': 'CanDelegatedMaxSizeResponseMessage',
  '2': [
    {'1': 'max_size', '3': 1, '4': 1, '5': 3, '10': 'maxSize'},
  ],
};

/// Descriptor for `CanDelegatedMaxSizeResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canDelegatedMaxSizeResponseMessageDescriptor = $convert.base64Decode(
    'CiJDYW5EZWxlZ2F0ZWRNYXhTaXplUmVzcG9uc2VNZXNzYWdlEhkKCG1heF9zaXplGAEgASgDUg'
    'dtYXhTaXpl');

@$core.Deprecated('Use canWithdrawUnfreezeAmountRequestMessageDescriptor instead')
const CanWithdrawUnfreezeAmountRequestMessage$json = {
  '1': 'CanWithdrawUnfreezeAmountRequestMessage',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `CanWithdrawUnfreezeAmountRequestMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canWithdrawUnfreezeAmountRequestMessageDescriptor = $convert.base64Decode(
    'CidDYW5XaXRoZHJhd1VuZnJlZXplQW1vdW50UmVxdWVzdE1lc3NhZ2USIwoNb3duZXJfYWRkcm'
    'VzcxgBIAEoDFIMb3duZXJBZGRyZXNzEhwKCXRpbWVzdGFtcBgCIAEoA1IJdGltZXN0YW1w');

@$core.Deprecated('Use canWithdrawUnfreezeAmountResponseMessageDescriptor instead')
const CanWithdrawUnfreezeAmountResponseMessage$json = {
  '1': 'CanWithdrawUnfreezeAmountResponseMessage',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `CanWithdrawUnfreezeAmountResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canWithdrawUnfreezeAmountResponseMessageDescriptor = $convert.base64Decode(
    'CihDYW5XaXRoZHJhd1VuZnJlZXplQW1vdW50UmVzcG9uc2VNZXNzYWdlEhYKBmFtb3VudBgBIA'
    'EoA1IGYW1vdW50');

@$core.Deprecated('Use pricesResponseMessageDescriptor instead')
const PricesResponseMessage$json = {
  '1': 'PricesResponseMessage',
  '2': [
    {'1': 'prices', '3': 1, '4': 1, '5': 9, '10': 'prices'},
  ],
};

/// Descriptor for `PricesResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pricesResponseMessageDescriptor = $convert.base64Decode(
    'ChVQcmljZXNSZXNwb25zZU1lc3NhZ2USFgoGcHJpY2VzGAEgASgJUgZwcmljZXM=');

@$core.Deprecated('Use nodeListDescriptor instead')
const NodeList$json = {
  '1': 'NodeList',
  '2': [
    {'1': 'nodes', '3': 1, '4': 3, '5': 11, '6': '.protocol.Node', '10': 'nodes'},
  ],
};

/// Descriptor for `NodeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeListDescriptor = $convert.base64Decode(
    'CghOb2RlTGlzdBIkCgVub2RlcxgBIAMoCzIOLnByb3RvY29sLk5vZGVSBW5vZGVz');

@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.protocol.Address', '10': 'address'},
  ],
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEisKB2FkZHJlc3MYASABKAsyES5wcm90b2NvbC5BZGRyZXNzUgdhZGRyZXNz');

@$core.Deprecated('Use addressDescriptor instead')
const Address$json = {
  '1': 'Address',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 12, '10': 'host'},
    {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode(
    'CgdBZGRyZXNzEhIKBGhvc3QYASABKAxSBGhvc3QSEgoEcG9ydBgCIAEoBVIEcG9ydA==');

@$core.Deprecated('Use emptyMessageDescriptor instead')
const EmptyMessage$json = {
  '1': 'EmptyMessage',
};

/// Descriptor for `EmptyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyMessageDescriptor = $convert.base64Decode(
    'CgxFbXB0eU1lc3NhZ2U=');

@$core.Deprecated('Use numberMessageDescriptor instead')
const NumberMessage$json = {
  '1': 'NumberMessage',
  '2': [
    {'1': 'num', '3': 1, '4': 1, '5': 3, '10': 'num'},
  ],
};

/// Descriptor for `NumberMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberMessageDescriptor = $convert.base64Decode(
    'Cg1OdW1iZXJNZXNzYWdlEhAKA251bRgBIAEoA1IDbnVt');

@$core.Deprecated('Use bytesMessageDescriptor instead')
const BytesMessage$json = {
  '1': 'BytesMessage',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `BytesMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bytesMessageDescriptor = $convert.base64Decode(
    'CgxCeXRlc01lc3NhZ2USFAoFdmFsdWUYASABKAxSBXZhbHVl');

@$core.Deprecated('Use timeMessageDescriptor instead')
const TimeMessage$json = {
  '1': 'TimeMessage',
  '2': [
    {'1': 'beginInMilliseconds', '3': 1, '4': 1, '5': 3, '10': 'beginInMilliseconds'},
    {'1': 'endInMilliseconds', '3': 2, '4': 1, '5': 3, '10': 'endInMilliseconds'},
  ],
};

/// Descriptor for `TimeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeMessageDescriptor = $convert.base64Decode(
    'CgtUaW1lTWVzc2FnZRIwChNiZWdpbkluTWlsbGlzZWNvbmRzGAEgASgDUhNiZWdpbkluTWlsbG'
    'lzZWNvbmRzEiwKEWVuZEluTWlsbGlzZWNvbmRzGAIgASgDUhFlbmRJbk1pbGxpc2Vjb25kcw==');

@$core.Deprecated('Use blockReqDescriptor instead')
const BlockReq$json = {
  '1': 'BlockReq',
  '2': [
    {'1': 'id_or_num', '3': 1, '4': 1, '5': 9, '10': 'idOrNum'},
    {'1': 'detail', '3': 2, '4': 1, '5': 8, '10': 'detail'},
  ],
};

/// Descriptor for `BlockReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockReqDescriptor = $convert.base64Decode(
    'CghCbG9ja1JlcRIaCglpZF9vcl9udW0YASABKAlSB2lkT3JOdW0SFgoGZGV0YWlsGAIgASgIUg'
    'ZkZXRhaWw=');

@$core.Deprecated('Use blockLimitDescriptor instead')
const BlockLimit$json = {
  '1': 'BlockLimit',
  '2': [
    {'1': 'startNum', '3': 1, '4': 1, '5': 3, '10': 'startNum'},
    {'1': 'endNum', '3': 2, '4': 1, '5': 3, '10': 'endNum'},
  ],
};

/// Descriptor for `BlockLimit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockLimitDescriptor = $convert.base64Decode(
    'CgpCbG9ja0xpbWl0EhoKCHN0YXJ0TnVtGAEgASgDUghzdGFydE51bRIWCgZlbmROdW0YAiABKA'
    'NSBmVuZE51bQ==');

@$core.Deprecated('Use transactionLimitDescriptor instead')
const TransactionLimit$json = {
  '1': 'TransactionLimit',
  '2': [
    {'1': 'transactionId', '3': 1, '4': 1, '5': 12, '10': 'transactionId'},
    {'1': 'limitNum', '3': 2, '4': 1, '5': 3, '10': 'limitNum'},
  ],
};

/// Descriptor for `TransactionLimit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionLimitDescriptor = $convert.base64Decode(
    'ChBUcmFuc2FjdGlvbkxpbWl0EiQKDXRyYW5zYWN0aW9uSWQYASABKAxSDXRyYW5zYWN0aW9uSW'
    'QSGgoIbGltaXROdW0YAiABKANSCGxpbWl0TnVt');

@$core.Deprecated('Use accountPaginatedDescriptor instead')
const AccountPaginated$json = {
  '1': 'AccountPaginated',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.protocol.Account', '10': 'account'},
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `AccountPaginated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountPaginatedDescriptor = $convert.base64Decode(
    'ChBBY2NvdW50UGFnaW5hdGVkEisKB2FjY291bnQYASABKAsyES5wcm90b2NvbC5BY2NvdW50Ug'
    'dhY2NvdW50EhYKBm9mZnNldBgCIAEoA1IGb2Zmc2V0EhQKBWxpbWl0GAMgASgDUgVsaW1pdA==');

@$core.Deprecated('Use timePaginatedMessageDescriptor instead')
const TimePaginatedMessage$json = {
  '1': 'TimePaginatedMessage',
  '2': [
    {'1': 'timeMessage', '3': 1, '4': 1, '5': 11, '6': '.protocol.TimeMessage', '10': 'timeMessage'},
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `TimePaginatedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timePaginatedMessageDescriptor = $convert.base64Decode(
    'ChRUaW1lUGFnaW5hdGVkTWVzc2FnZRI3Cgt0aW1lTWVzc2FnZRgBIAEoCzIVLnByb3RvY29sLl'
    'RpbWVNZXNzYWdlUgt0aW1lTWVzc2FnZRIWCgZvZmZzZXQYAiABKANSBm9mZnNldBIUCgVsaW1p'
    'dBgDIAEoA1IFbGltaXQ=');

@$core.Deprecated('Use accountNetMessageDescriptor instead')
const AccountNetMessage$json = {
  '1': 'AccountNetMessage',
  '2': [
    {'1': 'freeNetUsed', '3': 1, '4': 1, '5': 3, '10': 'freeNetUsed'},
    {'1': 'freeNetLimit', '3': 2, '4': 1, '5': 3, '10': 'freeNetLimit'},
    {'1': 'NetUsed', '3': 3, '4': 1, '5': 3, '10': 'NetUsed'},
    {'1': 'NetLimit', '3': 4, '4': 1, '5': 3, '10': 'NetLimit'},
    {'1': 'assetNetUsed', '3': 5, '4': 3, '5': 11, '6': '.protocol.AccountNetMessage.AssetNetUsedEntry', '10': 'assetNetUsed'},
    {'1': 'assetNetLimit', '3': 6, '4': 3, '5': 11, '6': '.protocol.AccountNetMessage.AssetNetLimitEntry', '10': 'assetNetLimit'},
    {'1': 'TotalNetLimit', '3': 7, '4': 1, '5': 3, '10': 'TotalNetLimit'},
    {'1': 'TotalNetWeight', '3': 8, '4': 1, '5': 3, '10': 'TotalNetWeight'},
  ],
  '3': [AccountNetMessage_AssetNetUsedEntry$json, AccountNetMessage_AssetNetLimitEntry$json],
};

@$core.Deprecated('Use accountNetMessageDescriptor instead')
const AccountNetMessage_AssetNetUsedEntry$json = {
  '1': 'AssetNetUsedEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountNetMessageDescriptor instead')
const AccountNetMessage_AssetNetLimitEntry$json = {
  '1': 'AssetNetLimitEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AccountNetMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountNetMessageDescriptor = $convert.base64Decode(
    'ChFBY2NvdW50TmV0TWVzc2FnZRIgCgtmcmVlTmV0VXNlZBgBIAEoA1ILZnJlZU5ldFVzZWQSIg'
    'oMZnJlZU5ldExpbWl0GAIgASgDUgxmcmVlTmV0TGltaXQSGAoHTmV0VXNlZBgDIAEoA1IHTmV0'
    'VXNlZBIaCghOZXRMaW1pdBgEIAEoA1IITmV0TGltaXQSUQoMYXNzZXROZXRVc2VkGAUgAygLMi'
    '0ucHJvdG9jb2wuQWNjb3VudE5ldE1lc3NhZ2UuQXNzZXROZXRVc2VkRW50cnlSDGFzc2V0TmV0'
    'VXNlZBJUCg1hc3NldE5ldExpbWl0GAYgAygLMi4ucHJvdG9jb2wuQWNjb3VudE5ldE1lc3NhZ2'
    'UuQXNzZXROZXRMaW1pdEVudHJ5Ug1hc3NldE5ldExpbWl0EiQKDVRvdGFsTmV0TGltaXQYByAB'
    'KANSDVRvdGFsTmV0TGltaXQSJgoOVG90YWxOZXRXZWlnaHQYCCABKANSDlRvdGFsTmV0V2VpZ2'
    'h0Gj8KEUFzc2V0TmV0VXNlZEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgD'
    'UgV2YWx1ZToCOAEaQAoSQXNzZXROZXRMaW1pdEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgDUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use accountResourceMessageDescriptor instead')
const AccountResourceMessage$json = {
  '1': 'AccountResourceMessage',
  '2': [
    {'1': 'freeNetUsed', '3': 1, '4': 1, '5': 3, '10': 'freeNetUsed'},
    {'1': 'freeNetLimit', '3': 2, '4': 1, '5': 3, '10': 'freeNetLimit'},
    {'1': 'NetUsed', '3': 3, '4': 1, '5': 3, '10': 'NetUsed'},
    {'1': 'NetLimit', '3': 4, '4': 1, '5': 3, '10': 'NetLimit'},
    {'1': 'assetNetUsed', '3': 5, '4': 3, '5': 11, '6': '.protocol.AccountResourceMessage.AssetNetUsedEntry', '10': 'assetNetUsed'},
    {'1': 'assetNetLimit', '3': 6, '4': 3, '5': 11, '6': '.protocol.AccountResourceMessage.AssetNetLimitEntry', '10': 'assetNetLimit'},
    {'1': 'TotalNetLimit', '3': 7, '4': 1, '5': 3, '10': 'TotalNetLimit'},
    {'1': 'TotalNetWeight', '3': 8, '4': 1, '5': 3, '10': 'TotalNetWeight'},
    {'1': 'TotalTronPowerWeight', '3': 9, '4': 1, '5': 3, '10': 'TotalTronPowerWeight'},
    {'1': 'tronPowerUsed', '3': 10, '4': 1, '5': 3, '10': 'tronPowerUsed'},
    {'1': 'tronPowerLimit', '3': 11, '4': 1, '5': 3, '10': 'tronPowerLimit'},
    {'1': 'EnergyUsed', '3': 13, '4': 1, '5': 3, '10': 'EnergyUsed'},
    {'1': 'EnergyLimit', '3': 14, '4': 1, '5': 3, '10': 'EnergyLimit'},
    {'1': 'TotalEnergyLimit', '3': 15, '4': 1, '5': 3, '10': 'TotalEnergyLimit'},
    {'1': 'TotalEnergyWeight', '3': 16, '4': 1, '5': 3, '10': 'TotalEnergyWeight'},
    {'1': 'storageUsed', '3': 21, '4': 1, '5': 3, '10': 'storageUsed'},
    {'1': 'storageLimit', '3': 22, '4': 1, '5': 3, '10': 'storageLimit'},
  ],
  '3': [AccountResourceMessage_AssetNetUsedEntry$json, AccountResourceMessage_AssetNetLimitEntry$json],
};

@$core.Deprecated('Use accountResourceMessageDescriptor instead')
const AccountResourceMessage_AssetNetUsedEntry$json = {
  '1': 'AssetNetUsedEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use accountResourceMessageDescriptor instead')
const AccountResourceMessage_AssetNetLimitEntry$json = {
  '1': 'AssetNetLimitEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AccountResourceMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountResourceMessageDescriptor = $convert.base64Decode(
    'ChZBY2NvdW50UmVzb3VyY2VNZXNzYWdlEiAKC2ZyZWVOZXRVc2VkGAEgASgDUgtmcmVlTmV0VX'
    'NlZBIiCgxmcmVlTmV0TGltaXQYAiABKANSDGZyZWVOZXRMaW1pdBIYCgdOZXRVc2VkGAMgASgD'
    'UgdOZXRVc2VkEhoKCE5ldExpbWl0GAQgASgDUghOZXRMaW1pdBJWCgxhc3NldE5ldFVzZWQYBS'
    'ADKAsyMi5wcm90b2NvbC5BY2NvdW50UmVzb3VyY2VNZXNzYWdlLkFzc2V0TmV0VXNlZEVudHJ5'
    'Ugxhc3NldE5ldFVzZWQSWQoNYXNzZXROZXRMaW1pdBgGIAMoCzIzLnByb3RvY29sLkFjY291bn'
    'RSZXNvdXJjZU1lc3NhZ2UuQXNzZXROZXRMaW1pdEVudHJ5Ug1hc3NldE5ldExpbWl0EiQKDVRv'
    'dGFsTmV0TGltaXQYByABKANSDVRvdGFsTmV0TGltaXQSJgoOVG90YWxOZXRXZWlnaHQYCCABKA'
    'NSDlRvdGFsTmV0V2VpZ2h0EjIKFFRvdGFsVHJvblBvd2VyV2VpZ2h0GAkgASgDUhRUb3RhbFRy'
    'b25Qb3dlcldlaWdodBIkCg10cm9uUG93ZXJVc2VkGAogASgDUg10cm9uUG93ZXJVc2VkEiYKDn'
    'Ryb25Qb3dlckxpbWl0GAsgASgDUg50cm9uUG93ZXJMaW1pdBIeCgpFbmVyZ3lVc2VkGA0gASgD'
    'UgpFbmVyZ3lVc2VkEiAKC0VuZXJneUxpbWl0GA4gASgDUgtFbmVyZ3lMaW1pdBIqChBUb3RhbE'
    'VuZXJneUxpbWl0GA8gASgDUhBUb3RhbEVuZXJneUxpbWl0EiwKEVRvdGFsRW5lcmd5V2VpZ2h0'
    'GBAgASgDUhFUb3RhbEVuZXJneVdlaWdodBIgCgtzdG9yYWdlVXNlZBgVIAEoA1ILc3RvcmFnZV'
    'VzZWQSIgoMc3RvcmFnZUxpbWl0GBYgASgDUgxzdG9yYWdlTGltaXQaPwoRQXNzZXROZXRVc2Vk'
    'RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4ARpAChJBc3'
    'NldE5ldExpbWl0RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVl'
    'OgI4AQ==');

@$core.Deprecated('Use paginatedMessageDescriptor instead')
const PaginatedMessage$json = {
  '1': 'PaginatedMessage',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `PaginatedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginatedMessageDescriptor = $convert.base64Decode(
    'ChBQYWdpbmF0ZWRNZXNzYWdlEhYKBm9mZnNldBgBIAEoA1IGb2Zmc2V0EhQKBWxpbWl0GAIgAS'
    'gDUgVsaW1pdA==');

@$core.Deprecated('Use transactionExtentionDescriptor instead')
const TransactionExtention$json = {
  '1': 'TransactionExtention',
  '2': [
    {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
    {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'constant_result', '3': 3, '4': 3, '5': 12, '10': 'constantResult'},
    {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.Return', '10': 'result'},
    {'1': 'energy_used', '3': 5, '4': 1, '5': 3, '10': 'energyUsed'},
    {'1': 'logs', '3': 6, '4': 3, '5': 11, '6': '.protocol.TransactionInfo.Log', '10': 'logs'},
    {'1': 'internal_transactions', '3': 7, '4': 3, '5': 11, '6': '.protocol.InternalTransaction', '10': 'internalTransactions'},
    {'1': 'energy_penalty', '3': 8, '4': 1, '5': 3, '10': 'energyPenalty'},
  ],
};

/// Descriptor for `TransactionExtention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionExtentionDescriptor = $convert.base64Decode(
    'ChRUcmFuc2FjdGlvbkV4dGVudGlvbhI3Cgt0cmFuc2FjdGlvbhgBIAEoCzIVLnByb3RvY29sLl'
    'RyYW5zYWN0aW9uUgt0cmFuc2FjdGlvbhISCgR0eGlkGAIgASgMUgR0eGlkEicKD2NvbnN0YW50'
    'X3Jlc3VsdBgDIAMoDFIOY29uc3RhbnRSZXN1bHQSKAoGcmVzdWx0GAQgASgLMhAucHJvdG9jb2'
    'wuUmV0dXJuUgZyZXN1bHQSHwoLZW5lcmd5X3VzZWQYBSABKANSCmVuZXJneVVzZWQSMQoEbG9n'
    'cxgGIAMoCzIdLnByb3RvY29sLlRyYW5zYWN0aW9uSW5mby5Mb2dSBGxvZ3MSUgoVaW50ZXJuYW'
    'xfdHJhbnNhY3Rpb25zGAcgAygLMh0ucHJvdG9jb2wuSW50ZXJuYWxUcmFuc2FjdGlvblIUaW50'
    'ZXJuYWxUcmFuc2FjdGlvbnMSJQoOZW5lcmd5X3BlbmFsdHkYCCABKANSDWVuZXJneVBlbmFsdH'
    'k=');

@$core.Deprecated('Use estimateEnergyMessageDescriptor instead')
const EstimateEnergyMessage$json = {
  '1': 'EstimateEnergyMessage',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.protocol.Return', '10': 'result'},
    {'1': 'energy_required', '3': 2, '4': 1, '5': 3, '10': 'energyRequired'},
  ],
};

/// Descriptor for `EstimateEnergyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List estimateEnergyMessageDescriptor = $convert.base64Decode(
    'ChVFc3RpbWF0ZUVuZXJneU1lc3NhZ2USKAoGcmVzdWx0GAEgASgLMhAucHJvdG9jb2wuUmV0dX'
    'JuUgZyZXN1bHQSJwoPZW5lcmd5X3JlcXVpcmVkGAIgASgDUg5lbmVyZ3lSZXF1aXJlZA==');

@$core.Deprecated('Use blockExtentionDescriptor instead')
const BlockExtention$json = {
  '1': 'BlockExtention',
  '2': [
    {'1': 'transactions', '3': 1, '4': 3, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transactions'},
    {'1': 'block_header', '3': 2, '4': 1, '5': 11, '6': '.protocol.BlockHeader', '10': 'blockHeader'},
    {'1': 'blockid', '3': 3, '4': 1, '5': 12, '10': 'blockid'},
  ],
};

/// Descriptor for `BlockExtention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockExtentionDescriptor = $convert.base64Decode(
    'Cg5CbG9ja0V4dGVudGlvbhJCCgx0cmFuc2FjdGlvbnMYASADKAsyHi5wcm90b2NvbC5UcmFuc2'
    'FjdGlvbkV4dGVudGlvblIMdHJhbnNhY3Rpb25zEjgKDGJsb2NrX2hlYWRlchgCIAEoCzIVLnBy'
    'b3RvY29sLkJsb2NrSGVhZGVyUgtibG9ja0hlYWRlchIYCgdibG9ja2lkGAMgASgMUgdibG9ja2'
    'lk');

@$core.Deprecated('Use blockListExtentionDescriptor instead')
const BlockListExtention$json = {
  '1': 'BlockListExtention',
  '2': [
    {'1': 'block', '3': 1, '4': 3, '5': 11, '6': '.protocol.BlockExtention', '10': 'block'},
  ],
};

/// Descriptor for `BlockListExtention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockListExtentionDescriptor = $convert.base64Decode(
    'ChJCbG9ja0xpc3RFeHRlbnRpb24SLgoFYmxvY2sYASADKAsyGC5wcm90b2NvbC5CbG9ja0V4dG'
    'VudGlvblIFYmxvY2s=');

@$core.Deprecated('Use transactionListExtentionDescriptor instead')
const TransactionListExtention$json = {
  '1': 'TransactionListExtention',
  '2': [
    {'1': 'transaction', '3': 1, '4': 3, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
};

/// Descriptor for `TransactionListExtention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionListExtentionDescriptor = $convert.base64Decode(
    'ChhUcmFuc2FjdGlvbkxpc3RFeHRlbnRpb24SQAoLdHJhbnNhY3Rpb24YASADKAsyHi5wcm90b2'
    'NvbC5UcmFuc2FjdGlvbkV4dGVudGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use blockIncrementalMerkleTreeDescriptor instead')
const BlockIncrementalMerkleTree$json = {
  '1': 'BlockIncrementalMerkleTree',
  '2': [
    {'1': 'number', '3': 1, '4': 1, '5': 3, '10': 'number'},
    {'1': 'merkleTree', '3': 2, '4': 1, '5': 11, '6': '.protocol.IncrementalMerkleTree', '10': 'merkleTree'},
  ],
};

/// Descriptor for `BlockIncrementalMerkleTree`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockIncrementalMerkleTreeDescriptor = $convert.base64Decode(
    'ChpCbG9ja0luY3JlbWVudGFsTWVya2xlVHJlZRIWCgZudW1iZXIYASABKANSBm51bWJlchI/Cg'
    'ptZXJrbGVUcmVlGAIgASgLMh8ucHJvdG9jb2wuSW5jcmVtZW50YWxNZXJrbGVUcmVlUgptZXJr'
    'bGVUcmVl');

@$core.Deprecated('Use transactionSignWeightDescriptor instead')
const TransactionSignWeight$json = {
  '1': 'TransactionSignWeight',
  '2': [
    {'1': 'permission', '3': 1, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'permission'},
    {'1': 'approved_list', '3': 2, '4': 3, '5': 12, '10': 'approvedList'},
    {'1': 'current_weight', '3': 3, '4': 1, '5': 3, '10': 'currentWeight'},
    {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.TransactionSignWeight.Result', '10': 'result'},
    {'1': 'transaction', '3': 5, '4': 1, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
  '3': [TransactionSignWeight_Result$json],
};

@$core.Deprecated('Use transactionSignWeightDescriptor instead')
const TransactionSignWeight_Result$json = {
  '1': 'Result',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.protocol.TransactionSignWeight.Result.response_code', '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': [TransactionSignWeight_Result_response_code$json],
};

@$core.Deprecated('Use transactionSignWeightDescriptor instead')
const TransactionSignWeight_Result_response_code$json = {
  '1': 'response_code',
  '2': [
    {'1': 'ENOUGH_PERMISSION', '2': 0},
    {'1': 'NOT_ENOUGH_PERMISSION', '2': 1},
    {'1': 'SIGNATURE_FORMAT_ERROR', '2': 2},
    {'1': 'COMPUTE_ADDRESS_ERROR', '2': 3},
    {'1': 'PERMISSION_ERROR', '2': 4},
    {'1': 'OTHER_ERROR', '2': 20},
  ],
};

/// Descriptor for `TransactionSignWeight`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionSignWeightDescriptor = $convert.base64Decode(
    'ChVUcmFuc2FjdGlvblNpZ25XZWlnaHQSNAoKcGVybWlzc2lvbhgBIAEoCzIULnByb3RvY29sLl'
    'Blcm1pc3Npb25SCnBlcm1pc3Npb24SIwoNYXBwcm92ZWRfbGlzdBgCIAMoDFIMYXBwcm92ZWRM'
    'aXN0EiUKDmN1cnJlbnRfd2VpZ2h0GAMgASgDUg1jdXJyZW50V2VpZ2h0Ej4KBnJlc3VsdBgEIA'
    'EoCzImLnByb3RvY29sLlRyYW5zYWN0aW9uU2lnbldlaWdodC5SZXN1bHRSBnJlc3VsdBJACgt0'
    'cmFuc2FjdGlvbhgFIAEoCzIeLnByb3RvY29sLlRyYW5zYWN0aW9uRXh0ZW50aW9uUgt0cmFuc2'
    'FjdGlvbhqOAgoGUmVzdWx0EkgKBGNvZGUYASABKA4yNC5wcm90b2NvbC5UcmFuc2FjdGlvblNp'
    'Z25XZWlnaHQuUmVzdWx0LnJlc3BvbnNlX2NvZGVSBGNvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbW'
    'Vzc2FnZSKfAQoNcmVzcG9uc2VfY29kZRIVChFFTk9VR0hfUEVSTUlTU0lPThAAEhkKFU5PVF9F'
    'Tk9VR0hfUEVSTUlTU0lPThABEhoKFlNJR05BVFVSRV9GT1JNQVRfRVJST1IQAhIZChVDT01QVV'
    'RFX0FERFJFU1NfRVJST1IQAxIUChBQRVJNSVNTSU9OX0VSUk9SEAQSDwoLT1RIRVJfRVJST1IQ'
    'FA==');

@$core.Deprecated('Use transactionApprovedListDescriptor instead')
const TransactionApprovedList$json = {
  '1': 'TransactionApprovedList',
  '2': [
    {'1': 'approved_list', '3': 2, '4': 3, '5': 12, '10': 'approvedList'},
    {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.TransactionApprovedList.Result', '10': 'result'},
    {'1': 'transaction', '3': 5, '4': 1, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
  '3': [TransactionApprovedList_Result$json],
};

@$core.Deprecated('Use transactionApprovedListDescriptor instead')
const TransactionApprovedList_Result$json = {
  '1': 'Result',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.protocol.TransactionApprovedList.Result.response_code', '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': [TransactionApprovedList_Result_response_code$json],
};

@$core.Deprecated('Use transactionApprovedListDescriptor instead')
const TransactionApprovedList_Result_response_code$json = {
  '1': 'response_code',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'SIGNATURE_FORMAT_ERROR', '2': 1},
    {'1': 'COMPUTE_ADDRESS_ERROR', '2': 2},
    {'1': 'OTHER_ERROR', '2': 20},
  ],
};

/// Descriptor for `TransactionApprovedList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionApprovedListDescriptor = $convert.base64Decode(
    'ChdUcmFuc2FjdGlvbkFwcHJvdmVkTGlzdBIjCg1hcHByb3ZlZF9saXN0GAIgAygMUgxhcHByb3'
    'ZlZExpc3QSQAoGcmVzdWx0GAQgASgLMigucHJvdG9jb2wuVHJhbnNhY3Rpb25BcHByb3ZlZExp'
    'c3QuUmVzdWx0UgZyZXN1bHQSQAoLdHJhbnNhY3Rpb24YBSABKAsyHi5wcm90b2NvbC5UcmFuc2'
    'FjdGlvbkV4dGVudGlvblILdHJhbnNhY3Rpb24a1AEKBlJlc3VsdBJKCgRjb2RlGAEgASgOMjYu'
    'cHJvdG9jb2wuVHJhbnNhY3Rpb25BcHByb3ZlZExpc3QuUmVzdWx0LnJlc3BvbnNlX2NvZGVSBG'
    'NvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZSJkCg1yZXNwb25zZV9jb2RlEgsKB1NVQ0NF'
    'U1MQABIaChZTSUdOQVRVUkVfRk9STUFUX0VSUk9SEAESGQoVQ09NUFVURV9BRERSRVNTX0VSUk'
    '9SEAISDwoLT1RIRVJfRVJST1IQFA==');

@$core.Deprecated('Use ivkDecryptParametersDescriptor instead')
const IvkDecryptParameters$json = {
  '1': 'IvkDecryptParameters',
  '2': [
    {'1': 'start_block_index', '3': 1, '4': 1, '5': 3, '10': 'startBlockIndex'},
    {'1': 'end_block_index', '3': 2, '4': 1, '5': 3, '10': 'endBlockIndex'},
    {'1': 'ivk', '3': 3, '4': 1, '5': 12, '10': 'ivk'},
  ],
};

/// Descriptor for `IvkDecryptParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivkDecryptParametersDescriptor = $convert.base64Decode(
    'ChRJdmtEZWNyeXB0UGFyYW1ldGVycxIqChFzdGFydF9ibG9ja19pbmRleBgBIAEoA1IPc3Rhcn'
    'RCbG9ja0luZGV4EiYKD2VuZF9ibG9ja19pbmRleBgCIAEoA1INZW5kQmxvY2tJbmRleBIQCgNp'
    'dmsYAyABKAxSA2l2aw==');

@$core.Deprecated('Use ivkDecryptAndMarkParametersDescriptor instead')
const IvkDecryptAndMarkParameters$json = {
  '1': 'IvkDecryptAndMarkParameters',
  '2': [
    {'1': 'start_block_index', '3': 1, '4': 1, '5': 3, '10': 'startBlockIndex'},
    {'1': 'end_block_index', '3': 2, '4': 1, '5': 3, '10': 'endBlockIndex'},
    {'1': 'ivk', '3': 5, '4': 1, '5': 12, '10': 'ivk'},
    {'1': 'ak', '3': 3, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 4, '4': 1, '5': 12, '10': 'nk'},
  ],
};

/// Descriptor for `IvkDecryptAndMarkParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivkDecryptAndMarkParametersDescriptor = $convert.base64Decode(
    'ChtJdmtEZWNyeXB0QW5kTWFya1BhcmFtZXRlcnMSKgoRc3RhcnRfYmxvY2tfaW5kZXgYASABKA'
    'NSD3N0YXJ0QmxvY2tJbmRleBImCg9lbmRfYmxvY2tfaW5kZXgYAiABKANSDWVuZEJsb2NrSW5k'
    'ZXgSEAoDaXZrGAUgASgMUgNpdmsSDgoCYWsYAyABKAxSAmFrEg4KAm5rGAQgASgMUgJuaw==');

@$core.Deprecated('Use ovkDecryptParametersDescriptor instead')
const OvkDecryptParameters$json = {
  '1': 'OvkDecryptParameters',
  '2': [
    {'1': 'start_block_index', '3': 1, '4': 1, '5': 3, '10': 'startBlockIndex'},
    {'1': 'end_block_index', '3': 2, '4': 1, '5': 3, '10': 'endBlockIndex'},
    {'1': 'ovk', '3': 3, '4': 1, '5': 12, '10': 'ovk'},
  ],
};

/// Descriptor for `OvkDecryptParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ovkDecryptParametersDescriptor = $convert.base64Decode(
    'ChRPdmtEZWNyeXB0UGFyYW1ldGVycxIqChFzdGFydF9ibG9ja19pbmRleBgBIAEoA1IPc3Rhcn'
    'RCbG9ja0luZGV4EiYKD2VuZF9ibG9ja19pbmRleBgCIAEoA1INZW5kQmxvY2tJbmRleBIQCgNv'
    'dmsYAyABKAxSA292aw==');

@$core.Deprecated('Use decryptNotesDescriptor instead')
const DecryptNotes$json = {
  '1': 'DecryptNotes',
  '2': [
    {'1': 'noteTxs', '3': 1, '4': 3, '5': 11, '6': '.protocol.DecryptNotes.NoteTx', '10': 'noteTxs'},
  ],
  '3': [DecryptNotes_NoteTx$json],
};

@$core.Deprecated('Use decryptNotesDescriptor instead')
const DecryptNotes_NoteTx$json = {
  '1': 'NoteTx',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'index', '3': 3, '4': 1, '5': 5, '10': 'index'},
  ],
};

/// Descriptor for `DecryptNotes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decryptNotesDescriptor = $convert.base64Decode(
    'CgxEZWNyeXB0Tm90ZXMSNwoHbm90ZVR4cxgBIAMoCzIdLnByb3RvY29sLkRlY3J5cHROb3Rlcy'
    '5Ob3RlVHhSB25vdGVUeHMaVgoGTm90ZVR4EiIKBG5vdGUYASABKAsyDi5wcm90b2NvbC5Ob3Rl'
    'UgRub3RlEhIKBHR4aWQYAiABKAxSBHR4aWQSFAoFaW5kZXgYAyABKAVSBWluZGV4');

@$core.Deprecated('Use decryptNotesMarkedDescriptor instead')
const DecryptNotesMarked$json = {
  '1': 'DecryptNotesMarked',
  '2': [
    {'1': 'noteTxs', '3': 1, '4': 3, '5': 11, '6': '.protocol.DecryptNotesMarked.NoteTx', '10': 'noteTxs'},
  ],
  '3': [DecryptNotesMarked_NoteTx$json],
};

@$core.Deprecated('Use decryptNotesMarkedDescriptor instead')
const DecryptNotesMarked_NoteTx$json = {
  '1': 'NoteTx',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'index', '3': 3, '4': 1, '5': 5, '10': 'index'},
    {'1': 'is_spend', '3': 4, '4': 1, '5': 8, '10': 'isSpend'},
  ],
};

/// Descriptor for `DecryptNotesMarked`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decryptNotesMarkedDescriptor = $convert.base64Decode(
    'ChJEZWNyeXB0Tm90ZXNNYXJrZWQSPQoHbm90ZVR4cxgBIAMoCzIjLnByb3RvY29sLkRlY3J5cH'
    'ROb3Rlc01hcmtlZC5Ob3RlVHhSB25vdGVUeHMacQoGTm90ZVR4EiIKBG5vdGUYASABKAsyDi5w'
    'cm90b2NvbC5Ob3RlUgRub3RlEhIKBHR4aWQYAiABKAxSBHR4aWQSFAoFaW5kZXgYAyABKAVSBW'
    'luZGV4EhkKCGlzX3NwZW5kGAQgASgIUgdpc1NwZW5k');

@$core.Deprecated('Use noteDescriptor instead')
const Note$json = {
  '1': 'Note',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
    {'1': 'payment_address', '3': 2, '4': 1, '5': 9, '10': 'paymentAddress'},
    {'1': 'rcm', '3': 3, '4': 1, '5': 12, '10': 'rcm'},
    {'1': 'memo', '3': 4, '4': 1, '5': 12, '10': 'memo'},
  ],
};

/// Descriptor for `Note`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteDescriptor = $convert.base64Decode(
    'CgROb3RlEhQKBXZhbHVlGAEgASgDUgV2YWx1ZRInCg9wYXltZW50X2FkZHJlc3MYAiABKAlSDn'
    'BheW1lbnRBZGRyZXNzEhAKA3JjbRgDIAEoDFIDcmNtEhIKBG1lbW8YBCABKAxSBG1lbW8=');

@$core.Deprecated('Use spendNoteDescriptor instead')
const SpendNote$json = {
  '1': 'SpendNote',
  '2': [
    {'1': 'note', '3': 3, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'alpha', '3': 4, '4': 1, '5': 12, '10': 'alpha'},
    {'1': 'voucher', '3': 5, '4': 1, '5': 11, '6': '.protocol.IncrementalMerkleVoucher', '10': 'voucher'},
    {'1': 'path', '3': 6, '4': 1, '5': 12, '10': 'path'},
  ],
};

/// Descriptor for `SpendNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spendNoteDescriptor = $convert.base64Decode(
    'CglTcGVuZE5vdGUSIgoEbm90ZRgDIAEoCzIOLnByb3RvY29sLk5vdGVSBG5vdGUSFAoFYWxwaG'
    'EYBCABKAxSBWFscGhhEjwKB3ZvdWNoZXIYBSABKAsyIi5wcm90b2NvbC5JbmNyZW1lbnRhbE1l'
    'cmtsZVZvdWNoZXJSB3ZvdWNoZXISEgoEcGF0aBgGIAEoDFIEcGF0aA==');

@$core.Deprecated('Use receiveNoteDescriptor instead')
const ReceiveNote$json = {
  '1': 'ReceiveNote',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
  ],
};

/// Descriptor for `ReceiveNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveNoteDescriptor = $convert.base64Decode(
    'CgtSZWNlaXZlTm90ZRIiCgRub3RlGAEgASgLMg4ucHJvdG9jb2wuTm90ZVIEbm90ZQ==');

@$core.Deprecated('Use privateParametersDescriptor instead')
const PrivateParameters$json = {
  '1': 'PrivateParameters',
  '2': [
    {'1': 'transparent_from_address', '3': 1, '4': 1, '5': 12, '10': 'transparentFromAddress'},
    {'1': 'ask', '3': 2, '4': 1, '5': 12, '10': 'ask'},
    {'1': 'nsk', '3': 3, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 4, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'from_amount', '3': 5, '4': 1, '5': 3, '10': 'fromAmount'},
    {'1': 'shielded_spends', '3': 6, '4': 3, '5': 11, '6': '.protocol.SpendNote', '10': 'shieldedSpends'},
    {'1': 'shielded_receives', '3': 7, '4': 3, '5': 11, '6': '.protocol.ReceiveNote', '10': 'shieldedReceives'},
    {'1': 'transparent_to_address', '3': 8, '4': 1, '5': 12, '10': 'transparentToAddress'},
    {'1': 'to_amount', '3': 9, '4': 1, '5': 3, '10': 'toAmount'},
    {'1': 'timeout', '3': 10, '4': 1, '5': 3, '10': 'timeout'},
  ],
};

/// Descriptor for `PrivateParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privateParametersDescriptor = $convert.base64Decode(
    'ChFQcml2YXRlUGFyYW1ldGVycxI4Chh0cmFuc3BhcmVudF9mcm9tX2FkZHJlc3MYASABKAxSFn'
    'RyYW5zcGFyZW50RnJvbUFkZHJlc3MSEAoDYXNrGAIgASgMUgNhc2sSEAoDbnNrGAMgASgMUgNu'
    'c2sSEAoDb3ZrGAQgASgMUgNvdmsSHwoLZnJvbV9hbW91bnQYBSABKANSCmZyb21BbW91bnQSPA'
    'oPc2hpZWxkZWRfc3BlbmRzGAYgAygLMhMucHJvdG9jb2wuU3BlbmROb3RlUg5zaGllbGRlZFNw'
    'ZW5kcxJCChFzaGllbGRlZF9yZWNlaXZlcxgHIAMoCzIVLnByb3RvY29sLlJlY2VpdmVOb3RlUh'
    'BzaGllbGRlZFJlY2VpdmVzEjQKFnRyYW5zcGFyZW50X3RvX2FkZHJlc3MYCCABKAxSFHRyYW5z'
    'cGFyZW50VG9BZGRyZXNzEhsKCXRvX2Ftb3VudBgJIAEoA1IIdG9BbW91bnQSGAoHdGltZW91dB'
    'gKIAEoA1IHdGltZW91dA==');

@$core.Deprecated('Use privateParametersWithoutAskDescriptor instead')
const PrivateParametersWithoutAsk$json = {
  '1': 'PrivateParametersWithoutAsk',
  '2': [
    {'1': 'transparent_from_address', '3': 1, '4': 1, '5': 12, '10': 'transparentFromAddress'},
    {'1': 'ak', '3': 2, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nsk', '3': 3, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 4, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'from_amount', '3': 5, '4': 1, '5': 3, '10': 'fromAmount'},
    {'1': 'shielded_spends', '3': 6, '4': 3, '5': 11, '6': '.protocol.SpendNote', '10': 'shieldedSpends'},
    {'1': 'shielded_receives', '3': 7, '4': 3, '5': 11, '6': '.protocol.ReceiveNote', '10': 'shieldedReceives'},
    {'1': 'transparent_to_address', '3': 8, '4': 1, '5': 12, '10': 'transparentToAddress'},
    {'1': 'to_amount', '3': 9, '4': 1, '5': 3, '10': 'toAmount'},
    {'1': 'timeout', '3': 10, '4': 1, '5': 3, '10': 'timeout'},
  ],
};

/// Descriptor for `PrivateParametersWithoutAsk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privateParametersWithoutAskDescriptor = $convert.base64Decode(
    'ChtQcml2YXRlUGFyYW1ldGVyc1dpdGhvdXRBc2sSOAoYdHJhbnNwYXJlbnRfZnJvbV9hZGRyZX'
    'NzGAEgASgMUhZ0cmFuc3BhcmVudEZyb21BZGRyZXNzEg4KAmFrGAIgASgMUgJhaxIQCgNuc2sY'
    'AyABKAxSA25zaxIQCgNvdmsYBCABKAxSA292axIfCgtmcm9tX2Ftb3VudBgFIAEoA1IKZnJvbU'
    'Ftb3VudBI8Cg9zaGllbGRlZF9zcGVuZHMYBiADKAsyEy5wcm90b2NvbC5TcGVuZE5vdGVSDnNo'
    'aWVsZGVkU3BlbmRzEkIKEXNoaWVsZGVkX3JlY2VpdmVzGAcgAygLMhUucHJvdG9jb2wuUmVjZW'
    'l2ZU5vdGVSEHNoaWVsZGVkUmVjZWl2ZXMSNAoWdHJhbnNwYXJlbnRfdG9fYWRkcmVzcxgIIAEo'
    'DFIUdHJhbnNwYXJlbnRUb0FkZHJlc3MSGwoJdG9fYW1vdW50GAkgASgDUgh0b0Ftb3VudBIYCg'
    'd0aW1lb3V0GAogASgDUgd0aW1lb3V0');

@$core.Deprecated('Use spendAuthSigParametersDescriptor instead')
const SpendAuthSigParameters$json = {
  '1': 'SpendAuthSigParameters',
  '2': [
    {'1': 'ask', '3': 1, '4': 1, '5': 12, '10': 'ask'},
    {'1': 'tx_hash', '3': 2, '4': 1, '5': 12, '10': 'txHash'},
    {'1': 'alpha', '3': 3, '4': 1, '5': 12, '10': 'alpha'},
  ],
};

/// Descriptor for `SpendAuthSigParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spendAuthSigParametersDescriptor = $convert.base64Decode(
    'ChZTcGVuZEF1dGhTaWdQYXJhbWV0ZXJzEhAKA2FzaxgBIAEoDFIDYXNrEhcKB3R4X2hhc2gYAi'
    'ABKAxSBnR4SGFzaBIUCgVhbHBoYRgDIAEoDFIFYWxwaGE=');

@$core.Deprecated('Use nfParametersDescriptor instead')
const NfParameters$json = {
  '1': 'NfParameters',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'voucher', '3': 2, '4': 1, '5': 11, '6': '.protocol.IncrementalMerkleVoucher', '10': 'voucher'},
    {'1': 'ak', '3': 3, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 4, '4': 1, '5': 12, '10': 'nk'},
  ],
};

/// Descriptor for `NfParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nfParametersDescriptor = $convert.base64Decode(
    'CgxOZlBhcmFtZXRlcnMSIgoEbm90ZRgBIAEoCzIOLnByb3RvY29sLk5vdGVSBG5vdGUSPAoHdm'
    '91Y2hlchgCIAEoCzIiLnByb3RvY29sLkluY3JlbWVudGFsTWVya2xlVm91Y2hlclIHdm91Y2hl'
    'chIOCgJhaxgDIAEoDFICYWsSDgoCbmsYBCABKAxSAm5r');

@$core.Deprecated('Use expandedSpendingKeyMessageDescriptor instead')
const ExpandedSpendingKeyMessage$json = {
  '1': 'ExpandedSpendingKeyMessage',
  '2': [
    {'1': 'ask', '3': 1, '4': 1, '5': 12, '10': 'ask'},
    {'1': 'nsk', '3': 2, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 3, '4': 1, '5': 12, '10': 'ovk'},
  ],
};

/// Descriptor for `ExpandedSpendingKeyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expandedSpendingKeyMessageDescriptor = $convert.base64Decode(
    'ChpFeHBhbmRlZFNwZW5kaW5nS2V5TWVzc2FnZRIQCgNhc2sYASABKAxSA2FzaxIQCgNuc2sYAi'
    'ABKAxSA25zaxIQCgNvdmsYAyABKAxSA292aw==');

@$core.Deprecated('Use viewingKeyMessageDescriptor instead')
const ViewingKeyMessage$json = {
  '1': 'ViewingKeyMessage',
  '2': [
    {'1': 'ak', '3': 1, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 2, '4': 1, '5': 12, '10': 'nk'},
  ],
};

/// Descriptor for `ViewingKeyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewingKeyMessageDescriptor = $convert.base64Decode(
    'ChFWaWV3aW5nS2V5TWVzc2FnZRIOCgJhaxgBIAEoDFICYWsSDgoCbmsYAiABKAxSAm5r');

@$core.Deprecated('Use incomingViewingKeyMessageDescriptor instead')
const IncomingViewingKeyMessage$json = {
  '1': 'IncomingViewingKeyMessage',
  '2': [
    {'1': 'ivk', '3': 1, '4': 1, '5': 12, '10': 'ivk'},
  ],
};

/// Descriptor for `IncomingViewingKeyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingViewingKeyMessageDescriptor = $convert.base64Decode(
    'ChlJbmNvbWluZ1ZpZXdpbmdLZXlNZXNzYWdlEhAKA2l2axgBIAEoDFIDaXZr');

@$core.Deprecated('Use diversifierMessageDescriptor instead')
const DiversifierMessage$json = {
  '1': 'DiversifierMessage',
  '2': [
    {'1': 'd', '3': 1, '4': 1, '5': 12, '10': 'd'},
  ],
};

/// Descriptor for `DiversifierMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List diversifierMessageDescriptor = $convert.base64Decode(
    'ChJEaXZlcnNpZmllck1lc3NhZ2USDAoBZBgBIAEoDFIBZA==');

@$core.Deprecated('Use incomingViewingKeyDiversifierMessageDescriptor instead')
const IncomingViewingKeyDiversifierMessage$json = {
  '1': 'IncomingViewingKeyDiversifierMessage',
  '2': [
    {'1': 'ivk', '3': 1, '4': 1, '5': 11, '6': '.protocol.IncomingViewingKeyMessage', '10': 'ivk'},
    {'1': 'd', '3': 2, '4': 1, '5': 11, '6': '.protocol.DiversifierMessage', '10': 'd'},
  ],
};

/// Descriptor for `IncomingViewingKeyDiversifierMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingViewingKeyDiversifierMessageDescriptor = $convert.base64Decode(
    'CiRJbmNvbWluZ1ZpZXdpbmdLZXlEaXZlcnNpZmllck1lc3NhZ2USNQoDaXZrGAEgASgLMiMucH'
    'JvdG9jb2wuSW5jb21pbmdWaWV3aW5nS2V5TWVzc2FnZVIDaXZrEioKAWQYAiABKAsyHC5wcm90'
    'b2NvbC5EaXZlcnNpZmllck1lc3NhZ2VSAWQ=');

@$core.Deprecated('Use paymentAddressMessageDescriptor instead')
const PaymentAddressMessage$json = {
  '1': 'PaymentAddressMessage',
  '2': [
    {'1': 'd', '3': 1, '4': 1, '5': 11, '6': '.protocol.DiversifierMessage', '10': 'd'},
    {'1': 'pkD', '3': 2, '4': 1, '5': 12, '10': 'pkD'},
    {'1': 'payment_address', '3': 3, '4': 1, '5': 9, '10': 'paymentAddress'},
  ],
};

/// Descriptor for `PaymentAddressMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentAddressMessageDescriptor = $convert.base64Decode(
    'ChVQYXltZW50QWRkcmVzc01lc3NhZ2USKgoBZBgBIAEoCzIcLnByb3RvY29sLkRpdmVyc2lmaW'
    'VyTWVzc2FnZVIBZBIQCgNwa0QYAiABKAxSA3BrRBInCg9wYXltZW50X2FkZHJlc3MYAyABKAlS'
    'DnBheW1lbnRBZGRyZXNz');

@$core.Deprecated('Use shieldedAddressInfoDescriptor instead')
const ShieldedAddressInfo$json = {
  '1': 'ShieldedAddressInfo',
  '2': [
    {'1': 'sk', '3': 1, '4': 1, '5': 12, '10': 'sk'},
    {'1': 'ask', '3': 2, '4': 1, '5': 12, '10': 'ask'},
    {'1': 'nsk', '3': 3, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 4, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'ak', '3': 5, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 6, '4': 1, '5': 12, '10': 'nk'},
    {'1': 'ivk', '3': 7, '4': 1, '5': 12, '10': 'ivk'},
    {'1': 'd', '3': 8, '4': 1, '5': 12, '10': 'd'},
    {'1': 'pkD', '3': 9, '4': 1, '5': 12, '10': 'pkD'},
    {'1': 'payment_address', '3': 10, '4': 1, '5': 9, '10': 'paymentAddress'},
  ],
};

/// Descriptor for `ShieldedAddressInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shieldedAddressInfoDescriptor = $convert.base64Decode(
    'ChNTaGllbGRlZEFkZHJlc3NJbmZvEg4KAnNrGAEgASgMUgJzaxIQCgNhc2sYAiABKAxSA2Fzax'
    'IQCgNuc2sYAyABKAxSA25zaxIQCgNvdmsYBCABKAxSA292axIOCgJhaxgFIAEoDFICYWsSDgoC'
    'bmsYBiABKAxSAm5rEhAKA2l2axgHIAEoDFIDaXZrEgwKAWQYCCABKAxSAWQSEAoDcGtEGAkgAS'
    'gMUgNwa0QSJwoPcGF5bWVudF9hZGRyZXNzGAogASgJUg5wYXltZW50QWRkcmVzcw==');

@$core.Deprecated('Use noteParametersDescriptor instead')
const NoteParameters$json = {
  '1': 'NoteParameters',
  '2': [
    {'1': 'ak', '3': 1, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 2, '4': 1, '5': 12, '10': 'nk'},
    {'1': 'note', '3': 3, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'txid', '3': 4, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'index', '3': 5, '4': 1, '5': 5, '10': 'index'},
  ],
};

/// Descriptor for `NoteParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteParametersDescriptor = $convert.base64Decode(
    'Cg5Ob3RlUGFyYW1ldGVycxIOCgJhaxgBIAEoDFICYWsSDgoCbmsYAiABKAxSAm5rEiIKBG5vdG'
    'UYAyABKAsyDi5wcm90b2NvbC5Ob3RlUgRub3RlEhIKBHR4aWQYBCABKAxSBHR4aWQSFAoFaW5k'
    'ZXgYBSABKAVSBWluZGV4');

@$core.Deprecated('Use spendResultDescriptor instead')
const SpendResult$json = {
  '1': 'SpendResult',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SpendResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spendResultDescriptor = $convert.base64Decode(
    'CgtTcGVuZFJlc3VsdBIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIYCgdtZXNzYWdlGAIgASgJUg'
    'dtZXNzYWdl');

@$core.Deprecated('Use transactionInfoListDescriptor instead')
const TransactionInfoList$json = {
  '1': 'TransactionInfoList',
  '2': [
    {'1': 'transactionInfo', '3': 1, '4': 3, '5': 11, '6': '.protocol.TransactionInfo', '10': 'transactionInfo'},
  ],
};

/// Descriptor for `TransactionInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInfoListDescriptor = $convert.base64Decode(
    'ChNUcmFuc2FjdGlvbkluZm9MaXN0EkMKD3RyYW5zYWN0aW9uSW5mbxgBIAMoCzIZLnByb3RvY2'
    '9sLlRyYW5zYWN0aW9uSW5mb1IPdHJhbnNhY3Rpb25JbmZv');

@$core.Deprecated('Use spendNoteTRC20Descriptor instead')
const SpendNoteTRC20$json = {
  '1': 'SpendNoteTRC20',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'alpha', '3': 2, '4': 1, '5': 12, '10': 'alpha'},
    {'1': 'root', '3': 3, '4': 1, '5': 12, '10': 'root'},
    {'1': 'path', '3': 4, '4': 1, '5': 12, '10': 'path'},
    {'1': 'pos', '3': 5, '4': 1, '5': 3, '10': 'pos'},
  ],
};

/// Descriptor for `SpendNoteTRC20`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spendNoteTRC20Descriptor = $convert.base64Decode(
    'Cg5TcGVuZE5vdGVUUkMyMBIiCgRub3RlGAEgASgLMg4ucHJvdG9jb2wuTm90ZVIEbm90ZRIUCg'
    'VhbHBoYRgCIAEoDFIFYWxwaGESEgoEcm9vdBgDIAEoDFIEcm9vdBISCgRwYXRoGAQgASgMUgRw'
    'YXRoEhAKA3BvcxgFIAEoA1IDcG9z');

@$core.Deprecated('Use privateShieldedTRC20ParametersDescriptor instead')
const PrivateShieldedTRC20Parameters$json = {
  '1': 'PrivateShieldedTRC20Parameters',
  '2': [
    {'1': 'ask', '3': 1, '4': 1, '5': 12, '10': 'ask'},
    {'1': 'nsk', '3': 2, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 3, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'from_amount', '3': 4, '4': 1, '5': 9, '10': 'fromAmount'},
    {'1': 'shielded_spends', '3': 5, '4': 3, '5': 11, '6': '.protocol.SpendNoteTRC20', '10': 'shieldedSpends'},
    {'1': 'shielded_receives', '3': 6, '4': 3, '5': 11, '6': '.protocol.ReceiveNote', '10': 'shieldedReceives'},
    {'1': 'transparent_to_address', '3': 7, '4': 1, '5': 12, '10': 'transparentToAddress'},
    {'1': 'to_amount', '3': 8, '4': 1, '5': 9, '10': 'toAmount'},
    {'1': 'shielded_TRC20_contract_address', '3': 9, '4': 1, '5': 12, '10': 'shieldedTRC20ContractAddress'},
  ],
};

/// Descriptor for `PrivateShieldedTRC20Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privateShieldedTRC20ParametersDescriptor = $convert.base64Decode(
    'Ch5Qcml2YXRlU2hpZWxkZWRUUkMyMFBhcmFtZXRlcnMSEAoDYXNrGAEgASgMUgNhc2sSEAoDbn'
    'NrGAIgASgMUgNuc2sSEAoDb3ZrGAMgASgMUgNvdmsSHwoLZnJvbV9hbW91bnQYBCABKAlSCmZy'
    'b21BbW91bnQSQQoPc2hpZWxkZWRfc3BlbmRzGAUgAygLMhgucHJvdG9jb2wuU3BlbmROb3RlVF'
    'JDMjBSDnNoaWVsZGVkU3BlbmRzEkIKEXNoaWVsZGVkX3JlY2VpdmVzGAYgAygLMhUucHJvdG9j'
    'b2wuUmVjZWl2ZU5vdGVSEHNoaWVsZGVkUmVjZWl2ZXMSNAoWdHJhbnNwYXJlbnRfdG9fYWRkcm'
    'VzcxgHIAEoDFIUdHJhbnNwYXJlbnRUb0FkZHJlc3MSGwoJdG9fYW1vdW50GAggASgJUgh0b0Ft'
    'b3VudBJFCh9zaGllbGRlZF9UUkMyMF9jb250cmFjdF9hZGRyZXNzGAkgASgMUhxzaGllbGRlZF'
    'RSQzIwQ29udHJhY3RBZGRyZXNz');

@$core.Deprecated('Use privateShieldedTRC20ParametersWithoutAskDescriptor instead')
const PrivateShieldedTRC20ParametersWithoutAsk$json = {
  '1': 'PrivateShieldedTRC20ParametersWithoutAsk',
  '2': [
    {'1': 'ak', '3': 1, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nsk', '3': 2, '4': 1, '5': 12, '10': 'nsk'},
    {'1': 'ovk', '3': 3, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'from_amount', '3': 4, '4': 1, '5': 9, '10': 'fromAmount'},
    {'1': 'shielded_spends', '3': 5, '4': 3, '5': 11, '6': '.protocol.SpendNoteTRC20', '10': 'shieldedSpends'},
    {'1': 'shielded_receives', '3': 6, '4': 3, '5': 11, '6': '.protocol.ReceiveNote', '10': 'shieldedReceives'},
    {'1': 'transparent_to_address', '3': 7, '4': 1, '5': 12, '10': 'transparentToAddress'},
    {'1': 'to_amount', '3': 8, '4': 1, '5': 9, '10': 'toAmount'},
    {'1': 'shielded_TRC20_contract_address', '3': 9, '4': 1, '5': 12, '10': 'shieldedTRC20ContractAddress'},
  ],
};

/// Descriptor for `PrivateShieldedTRC20ParametersWithoutAsk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privateShieldedTRC20ParametersWithoutAskDescriptor = $convert.base64Decode(
    'CihQcml2YXRlU2hpZWxkZWRUUkMyMFBhcmFtZXRlcnNXaXRob3V0QXNrEg4KAmFrGAEgASgMUg'
    'JhaxIQCgNuc2sYAiABKAxSA25zaxIQCgNvdmsYAyABKAxSA292axIfCgtmcm9tX2Ftb3VudBgE'
    'IAEoCVIKZnJvbUFtb3VudBJBCg9zaGllbGRlZF9zcGVuZHMYBSADKAsyGC5wcm90b2NvbC5TcG'
    'VuZE5vdGVUUkMyMFIOc2hpZWxkZWRTcGVuZHMSQgoRc2hpZWxkZWRfcmVjZWl2ZXMYBiADKAsy'
    'FS5wcm90b2NvbC5SZWNlaXZlTm90ZVIQc2hpZWxkZWRSZWNlaXZlcxI0ChZ0cmFuc3BhcmVudF'
    '90b19hZGRyZXNzGAcgASgMUhR0cmFuc3BhcmVudFRvQWRkcmVzcxIbCgl0b19hbW91bnQYCCAB'
    'KAlSCHRvQW1vdW50EkUKH3NoaWVsZGVkX1RSQzIwX2NvbnRyYWN0X2FkZHJlc3MYCSABKAxSHH'
    'NoaWVsZGVkVFJDMjBDb250cmFjdEFkZHJlc3M=');

@$core.Deprecated('Use shieldedTRC20ParametersDescriptor instead')
const ShieldedTRC20Parameters$json = {
  '1': 'ShieldedTRC20Parameters',
  '2': [
    {'1': 'spend_description', '3': 1, '4': 3, '5': 11, '6': '.protocol.SpendDescription', '10': 'spendDescription'},
    {'1': 'receive_description', '3': 2, '4': 3, '5': 11, '6': '.protocol.ReceiveDescription', '10': 'receiveDescription'},
    {'1': 'binding_signature', '3': 3, '4': 1, '5': 12, '10': 'bindingSignature'},
    {'1': 'message_hash', '3': 4, '4': 1, '5': 12, '10': 'messageHash'},
    {'1': 'trigger_contract_input', '3': 5, '4': 1, '5': 9, '10': 'triggerContractInput'},
    {'1': 'parameter_type', '3': 6, '4': 1, '5': 9, '10': 'parameterType'},
  ],
};

/// Descriptor for `ShieldedTRC20Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shieldedTRC20ParametersDescriptor = $convert.base64Decode(
    'ChdTaGllbGRlZFRSQzIwUGFyYW1ldGVycxJHChFzcGVuZF9kZXNjcmlwdGlvbhgBIAMoCzIaLn'
    'Byb3RvY29sLlNwZW5kRGVzY3JpcHRpb25SEHNwZW5kRGVzY3JpcHRpb24STQoTcmVjZWl2ZV9k'
    'ZXNjcmlwdGlvbhgCIAMoCzIcLnByb3RvY29sLlJlY2VpdmVEZXNjcmlwdGlvblIScmVjZWl2ZU'
    'Rlc2NyaXB0aW9uEisKEWJpbmRpbmdfc2lnbmF0dXJlGAMgASgMUhBiaW5kaW5nU2lnbmF0dXJl'
    'EiEKDG1lc3NhZ2VfaGFzaBgEIAEoDFILbWVzc2FnZUhhc2gSNAoWdHJpZ2dlcl9jb250cmFjdF'
    '9pbnB1dBgFIAEoCVIUdHJpZ2dlckNvbnRyYWN0SW5wdXQSJQoOcGFyYW1ldGVyX3R5cGUYBiAB'
    'KAlSDXBhcmFtZXRlclR5cGU=');

@$core.Deprecated('Use ivkDecryptTRC20ParametersDescriptor instead')
const IvkDecryptTRC20Parameters$json = {
  '1': 'IvkDecryptTRC20Parameters',
  '2': [
    {'1': 'start_block_index', '3': 1, '4': 1, '5': 3, '10': 'startBlockIndex'},
    {'1': 'end_block_index', '3': 2, '4': 1, '5': 3, '10': 'endBlockIndex'},
    {'1': 'shielded_TRC20_contract_address', '3': 3, '4': 1, '5': 12, '10': 'shieldedTRC20ContractAddress'},
    {'1': 'ivk', '3': 4, '4': 1, '5': 12, '10': 'ivk'},
    {'1': 'ak', '3': 5, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 6, '4': 1, '5': 12, '10': 'nk'},
    {'1': 'events', '3': 7, '4': 3, '5': 9, '10': 'events'},
  ],
};

/// Descriptor for `IvkDecryptTRC20Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ivkDecryptTRC20ParametersDescriptor = $convert.base64Decode(
    'ChlJdmtEZWNyeXB0VFJDMjBQYXJhbWV0ZXJzEioKEXN0YXJ0X2Jsb2NrX2luZGV4GAEgASgDUg'
    '9zdGFydEJsb2NrSW5kZXgSJgoPZW5kX2Jsb2NrX2luZGV4GAIgASgDUg1lbmRCbG9ja0luZGV4'
    'EkUKH3NoaWVsZGVkX1RSQzIwX2NvbnRyYWN0X2FkZHJlc3MYAyABKAxSHHNoaWVsZGVkVFJDMj'
    'BDb250cmFjdEFkZHJlc3MSEAoDaXZrGAQgASgMUgNpdmsSDgoCYWsYBSABKAxSAmFrEg4KAm5r'
    'GAYgASgMUgJuaxIWCgZldmVudHMYByADKAlSBmV2ZW50cw==');

@$core.Deprecated('Use ovkDecryptTRC20ParametersDescriptor instead')
const OvkDecryptTRC20Parameters$json = {
  '1': 'OvkDecryptTRC20Parameters',
  '2': [
    {'1': 'start_block_index', '3': 1, '4': 1, '5': 3, '10': 'startBlockIndex'},
    {'1': 'end_block_index', '3': 2, '4': 1, '5': 3, '10': 'endBlockIndex'},
    {'1': 'ovk', '3': 3, '4': 1, '5': 12, '10': 'ovk'},
    {'1': 'shielded_TRC20_contract_address', '3': 4, '4': 1, '5': 12, '10': 'shieldedTRC20ContractAddress'},
    {'1': 'events', '3': 5, '4': 3, '5': 9, '10': 'events'},
  ],
};

/// Descriptor for `OvkDecryptTRC20Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ovkDecryptTRC20ParametersDescriptor = $convert.base64Decode(
    'ChlPdmtEZWNyeXB0VFJDMjBQYXJhbWV0ZXJzEioKEXN0YXJ0X2Jsb2NrX2luZGV4GAEgASgDUg'
    '9zdGFydEJsb2NrSW5kZXgSJgoPZW5kX2Jsb2NrX2luZGV4GAIgASgDUg1lbmRCbG9ja0luZGV4'
    'EhAKA292axgDIAEoDFIDb3ZrEkUKH3NoaWVsZGVkX1RSQzIwX2NvbnRyYWN0X2FkZHJlc3MYBC'
    'ABKAxSHHNoaWVsZGVkVFJDMjBDb250cmFjdEFkZHJlc3MSFgoGZXZlbnRzGAUgAygJUgZldmVu'
    'dHM=');

@$core.Deprecated('Use decryptNotesTRC20Descriptor instead')
const DecryptNotesTRC20$json = {
  '1': 'DecryptNotesTRC20',
  '2': [
    {'1': 'noteTxs', '3': 1, '4': 3, '5': 11, '6': '.protocol.DecryptNotesTRC20.NoteTx', '10': 'noteTxs'},
  ],
  '3': [DecryptNotesTRC20_NoteTx$json],
};

@$core.Deprecated('Use decryptNotesTRC20Descriptor instead')
const DecryptNotesTRC20_NoteTx$json = {
  '1': 'NoteTx',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'position', '3': 2, '4': 1, '5': 3, '10': 'position'},
    {'1': 'is_spent', '3': 3, '4': 1, '5': 8, '10': 'isSpent'},
    {'1': 'txid', '3': 4, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'index', '3': 5, '4': 1, '5': 5, '10': 'index'},
    {'1': 'to_amount', '3': 6, '4': 1, '5': 9, '10': 'toAmount'},
    {'1': 'transparent_to_address', '3': 7, '4': 1, '5': 12, '10': 'transparentToAddress'},
  ],
};

/// Descriptor for `DecryptNotesTRC20`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decryptNotesTRC20Descriptor = $convert.base64Decode(
    'ChFEZWNyeXB0Tm90ZXNUUkMyMBI8Cgdub3RlVHhzGAEgAygLMiIucHJvdG9jb2wuRGVjcnlwdE'
    '5vdGVzVFJDMjAuTm90ZVR4Ugdub3RlVHhzGuABCgZOb3RlVHgSIgoEbm90ZRgBIAEoCzIOLnBy'
    'b3RvY29sLk5vdGVSBG5vdGUSGgoIcG9zaXRpb24YAiABKANSCHBvc2l0aW9uEhkKCGlzX3NwZW'
    '50GAMgASgIUgdpc1NwZW50EhIKBHR4aWQYBCABKAxSBHR4aWQSFAoFaW5kZXgYBSABKAVSBWlu'
    'ZGV4EhsKCXRvX2Ftb3VudBgGIAEoCVIIdG9BbW91bnQSNAoWdHJhbnNwYXJlbnRfdG9fYWRkcm'
    'VzcxgHIAEoDFIUdHJhbnNwYXJlbnRUb0FkZHJlc3M=');

@$core.Deprecated('Use nfTRC20ParametersDescriptor instead')
const NfTRC20Parameters$json = {
  '1': 'NfTRC20Parameters',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.protocol.Note', '10': 'note'},
    {'1': 'ak', '3': 2, '4': 1, '5': 12, '10': 'ak'},
    {'1': 'nk', '3': 3, '4': 1, '5': 12, '10': 'nk'},
    {'1': 'position', '3': 4, '4': 1, '5': 3, '10': 'position'},
    {'1': 'shielded_TRC20_contract_address', '3': 5, '4': 1, '5': 12, '10': 'shieldedTRC20ContractAddress'},
  ],
};

/// Descriptor for `NfTRC20Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nfTRC20ParametersDescriptor = $convert.base64Decode(
    'ChFOZlRSQzIwUGFyYW1ldGVycxIiCgRub3RlGAEgASgLMg4ucHJvdG9jb2wuTm90ZVIEbm90ZR'
    'IOCgJhaxgCIAEoDFICYWsSDgoCbmsYAyABKAxSAm5rEhoKCHBvc2l0aW9uGAQgASgDUghwb3Np'
    'dGlvbhJFCh9zaGllbGRlZF9UUkMyMF9jb250cmFjdF9hZGRyZXNzGAUgASgMUhxzaGllbGRlZF'
    'RSQzIwQ29udHJhY3RBZGRyZXNz');

@$core.Deprecated('Use nullifierResultDescriptor instead')
const NullifierResult$json = {
  '1': 'NullifierResult',
  '2': [
    {'1': 'is_spent', '3': 1, '4': 1, '5': 8, '10': 'isSpent'},
  ],
};

/// Descriptor for `NullifierResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nullifierResultDescriptor = $convert.base64Decode(
    'Cg9OdWxsaWZpZXJSZXN1bHQSGQoIaXNfc3BlbnQYASABKAhSB2lzU3BlbnQ=');

@$core.Deprecated('Use shieldedTRC20TriggerContractParametersDescriptor instead')
const ShieldedTRC20TriggerContractParameters$json = {
  '1': 'ShieldedTRC20TriggerContractParameters',
  '2': [
    {'1': 'shielded_TRC20_Parameters', '3': 1, '4': 1, '5': 11, '6': '.protocol.ShieldedTRC20Parameters', '10': 'shieldedTRC20Parameters'},
    {'1': 'spend_authority_signature', '3': 2, '4': 3, '5': 11, '6': '.protocol.BytesMessage', '10': 'spendAuthoritySignature'},
    {'1': 'amount', '3': 3, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'transparent_to_address', '3': 4, '4': 1, '5': 12, '10': 'transparentToAddress'},
  ],
};

/// Descriptor for `ShieldedTRC20TriggerContractParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shieldedTRC20TriggerContractParametersDescriptor = $convert.base64Decode(
    'CiZTaGllbGRlZFRSQzIwVHJpZ2dlckNvbnRyYWN0UGFyYW1ldGVycxJdChlzaGllbGRlZF9UUk'
    'MyMF9QYXJhbWV0ZXJzGAEgASgLMiEucHJvdG9jb2wuU2hpZWxkZWRUUkMyMFBhcmFtZXRlcnNS'
    'F3NoaWVsZGVkVFJDMjBQYXJhbWV0ZXJzElIKGXNwZW5kX2F1dGhvcml0eV9zaWduYXR1cmUYAi'
    'ADKAsyFi5wcm90b2NvbC5CeXRlc01lc3NhZ2VSF3NwZW5kQXV0aG9yaXR5U2lnbmF0dXJlEhYK'
    'BmFtb3VudBgDIAEoCVIGYW1vdW50EjQKFnRyYW5zcGFyZW50X3RvX2FkZHJlc3MYBCABKAxSFH'
    'RyYW5zcGFyZW50VG9BZGRyZXNz');

