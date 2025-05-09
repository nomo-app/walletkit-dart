//
//  Generated code. Do not modify.
//  source: core/contract/smart_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract$json = {
  '1': 'SmartContract',
  '2': [
    {'1': 'origin_address', '3': 1, '4': 1, '5': 12, '10': 'originAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    {'1': 'abi', '3': 3, '4': 1, '5': 11, '6': '.protocol.SmartContract.ABI', '10': 'abi'},
    {'1': 'bytecode', '3': 4, '4': 1, '5': 12, '10': 'bytecode'},
    {'1': 'call_value', '3': 5, '4': 1, '5': 3, '10': 'callValue'},
    {
      '1': 'consume_user_resource_percent',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'consumeUserResourcePercent'
    },
    {'1': 'name', '3': 7, '4': 1, '5': 9, '10': 'name'},
    {'1': 'origin_energy_limit', '3': 8, '4': 1, '5': 3, '10': 'originEnergyLimit'},
    {'1': 'code_hash', '3': 9, '4': 1, '5': 12, '10': 'codeHash'},
    {'1': 'trx_hash', '3': 10, '4': 1, '5': 12, '10': 'trxHash'},
    {'1': 'version', '3': 11, '4': 1, '5': 5, '10': 'version'},
  ],
  '3': [SmartContract_ABI$json],
};

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract_ABI$json = {
  '1': 'ABI',
  '2': [
    {
      '1': 'entrys',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.protocol.SmartContract.ABI.Entry',
      '10': 'entrys'
    },
  ],
  '3': [SmartContract_ABI_Entry$json],
};

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract_ABI_Entry$json = {
  '1': 'Entry',
  '2': [
    {'1': 'anonymous', '3': 1, '4': 1, '5': 8, '10': 'anonymous'},
    {'1': 'constant', '3': 2, '4': 1, '5': 8, '10': 'constant'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'inputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.protocol.SmartContract.ABI.Entry.Param',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.protocol.SmartContract.ABI.Entry.Param',
      '10': 'outputs'
    },
    {
      '1': 'type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.protocol.SmartContract.ABI.Entry.EntryType',
      '10': 'type'
    },
    {'1': 'payable', '3': 7, '4': 1, '5': 8, '10': 'payable'},
    {
      '1': 'stateMutability',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.protocol.SmartContract.ABI.Entry.StateMutabilityType',
      '10': 'stateMutability'
    },
  ],
  '3': [SmartContract_ABI_Entry_Param$json],
  '4': [SmartContract_ABI_Entry_EntryType$json, SmartContract_ABI_Entry_StateMutabilityType$json],
};

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract_ABI_Entry_Param$json = {
  '1': 'Param',
  '2': [
    {'1': 'indexed', '3': 1, '4': 1, '5': 8, '10': 'indexed'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
  ],
};

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract_ABI_Entry_EntryType$json = {
  '1': 'EntryType',
  '2': [
    {'1': 'UnknownEntryType', '2': 0},
    {'1': 'Constructor', '2': 1},
    {'1': 'Function', '2': 2},
    {'1': 'Event', '2': 3},
    {'1': 'Fallback', '2': 4},
    {'1': 'Receive', '2': 5},
    {'1': 'Error', '2': 6},
  ],
};

@$core.Deprecated('Use smartContractDescriptor instead')
const SmartContract_ABI_Entry_StateMutabilityType$json = {
  '1': 'StateMutabilityType',
  '2': [
    {'1': 'UnknownMutabilityType', '2': 0},
    {'1': 'Pure', '2': 1},
    {'1': 'View', '2': 2},
    {'1': 'Nonpayable', '2': 3},
    {'1': 'Payable', '2': 4},
  ],
};

/// Descriptor for `SmartContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartContractDescriptor = $convert
    .base64Decode('Cg1TbWFydENvbnRyYWN0EiUKDm9yaWdpbl9hZGRyZXNzGAEgASgMUg1vcmlnaW5BZGRyZXNzEi'
        'kKEGNvbnRyYWN0X2FkZHJlc3MYAiABKAxSD2NvbnRyYWN0QWRkcmVzcxItCgNhYmkYAyABKAsy'
        'Gy5wcm90b2NvbC5TbWFydENvbnRyYWN0LkFCSVIDYWJpEhoKCGJ5dGVjb2RlGAQgASgMUghieX'
        'RlY29kZRIdCgpjYWxsX3ZhbHVlGAUgASgDUgljYWxsVmFsdWUSQQodY29uc3VtZV91c2VyX3Jl'
        'c291cmNlX3BlcmNlbnQYBiABKANSGmNvbnN1bWVVc2VyUmVzb3VyY2VQZXJjZW50EhIKBG5hbW'
        'UYByABKAlSBG5hbWUSLgoTb3JpZ2luX2VuZXJneV9saW1pdBgIIAEoA1IRb3JpZ2luRW5lcmd5'
        'TGltaXQSGwoJY29kZV9oYXNoGAkgASgMUghjb2RlSGFzaBIZCgh0cnhfaGFzaBgKIAEoDFIHdH'
        'J4SGFzaBIYCgd2ZXJzaW9uGAsgASgFUgd2ZXJzaW9uGvkFCgNBQkkSOQoGZW50cnlzGAEgAygL'
        'MiEucHJvdG9jb2wuU21hcnRDb250cmFjdC5BQkkuRW50cnlSBmVudHJ5cxq2BQoFRW50cnkSHA'
        'oJYW5vbnltb3VzGAEgASgIUglhbm9ueW1vdXMSGgoIY29uc3RhbnQYAiABKAhSCGNvbnN0YW50'
        'EhIKBG5hbWUYAyABKAlSBG5hbWUSPwoGaW5wdXRzGAQgAygLMicucHJvdG9jb2wuU21hcnRDb2'
        '50cmFjdC5BQkkuRW50cnkuUGFyYW1SBmlucHV0cxJBCgdvdXRwdXRzGAUgAygLMicucHJvdG9j'
        'b2wuU21hcnRDb250cmFjdC5BQkkuRW50cnkuUGFyYW1SB291dHB1dHMSPwoEdHlwZRgGIAEoDj'
        'IrLnByb3RvY29sLlNtYXJ0Q29udHJhY3QuQUJJLkVudHJ5LkVudHJ5VHlwZVIEdHlwZRIYCgdw'
        'YXlhYmxlGAcgASgIUgdwYXlhYmxlEl8KD3N0YXRlTXV0YWJpbGl0eRgIIAEoDjI1LnByb3RvY2'
        '9sLlNtYXJ0Q29udHJhY3QuQUJJLkVudHJ5LlN0YXRlTXV0YWJpbGl0eVR5cGVSD3N0YXRlTXV0'
        'YWJpbGl0eRpJCgVQYXJhbRIYCgdpbmRleGVkGAEgASgIUgdpbmRleGVkEhIKBG5hbWUYAiABKA'
        'lSBG5hbWUSEgoEdHlwZRgDIAEoCVIEdHlwZSJxCglFbnRyeVR5cGUSFAoQVW5rbm93bkVudHJ5'
        'VHlwZRAAEg8KC0NvbnN0cnVjdG9yEAESDAoIRnVuY3Rpb24QAhIJCgVFdmVudBADEgwKCEZhbG'
        'xiYWNrEAQSCwoHUmVjZWl2ZRAFEgkKBUVycm9yEAYiYQoTU3RhdGVNdXRhYmlsaXR5VHlwZRIZ'
        'ChVVbmtub3duTXV0YWJpbGl0eVR5cGUQABIICgRQdXJlEAESCAoEVmlldxACEg4KCk5vbnBheW'
        'FibGUQAxILCgdQYXlhYmxlEAQ=');

@$core.Deprecated('Use contractStateDescriptor instead')
const ContractState$json = {
  '1': 'ContractState',
  '2': [
    {'1': 'energy_usage', '3': 1, '4': 1, '5': 3, '10': 'energyUsage'},
    {'1': 'energy_factor', '3': 2, '4': 1, '5': 3, '10': 'energyFactor'},
    {'1': 'update_cycle', '3': 3, '4': 1, '5': 3, '10': 'updateCycle'},
  ],
};

/// Descriptor for `ContractState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contractStateDescriptor = $convert
    .base64Decode('Cg1Db250cmFjdFN0YXRlEiEKDGVuZXJneV91c2FnZRgBIAEoA1ILZW5lcmd5VXNhZ2USIwoNZW'
        '5lcmd5X2ZhY3RvchgCIAEoA1IMZW5lcmd5RmFjdG9yEiEKDHVwZGF0ZV9jeWNsZRgDIAEoA1IL'
        'dXBkYXRlQ3ljbGU=');

@$core.Deprecated('Use createSmartContractDescriptor instead')
const CreateSmartContract$json = {
  '1': 'CreateSmartContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {
      '1': 'new_contract',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.protocol.SmartContract',
      '10': 'newContract'
    },
    {'1': 'call_token_value', '3': 3, '4': 1, '5': 3, '10': 'callTokenValue'},
    {'1': 'token_id', '3': 4, '4': 1, '5': 3, '10': 'tokenId'},
  ],
};

/// Descriptor for `CreateSmartContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSmartContractDescriptor = $convert
    .base64Decode('ChNDcmVhdGVTbWFydENvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQWRkcm'
        'VzcxI6CgxuZXdfY29udHJhY3QYAiABKAsyFy5wcm90b2NvbC5TbWFydENvbnRyYWN0UgtuZXdD'
        'b250cmFjdBIoChBjYWxsX3Rva2VuX3ZhbHVlGAMgASgDUg5jYWxsVG9rZW5WYWx1ZRIZCgh0b2'
        'tlbl9pZBgEIAEoA1IHdG9rZW5JZA==');

@$core.Deprecated('Use triggerSmartContractDescriptor instead')
const TriggerSmartContract$json = {
  '1': 'TriggerSmartContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    {'1': 'call_value', '3': 3, '4': 1, '5': 3, '10': 'callValue'},
    {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
    {'1': 'call_token_value', '3': 5, '4': 1, '5': 3, '10': 'callTokenValue'},
    {'1': 'token_id', '3': 6, '4': 1, '5': 3, '10': 'tokenId'},
  ],
};

/// Descriptor for `TriggerSmartContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List triggerSmartContractDescriptor = $convert
    .base64Decode('ChRUcmlnZ2VyU21hcnRDb250cmFjdBIjCg1vd25lcl9hZGRyZXNzGAEgASgMUgxvd25lckFkZH'
        'Jlc3MSKQoQY29udHJhY3RfYWRkcmVzcxgCIAEoDFIPY29udHJhY3RBZGRyZXNzEh0KCmNhbGxf'
        'dmFsdWUYAyABKANSCWNhbGxWYWx1ZRISCgRkYXRhGAQgASgMUgRkYXRhEigKEGNhbGxfdG9rZW'
        '5fdmFsdWUYBSABKANSDmNhbGxUb2tlblZhbHVlEhkKCHRva2VuX2lkGAYgASgDUgd0b2tlbklk');

@$core.Deprecated('Use clearABIContractDescriptor instead')
const ClearABIContract$json = {
  '1': 'ClearABIContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
  ],
};

/// Descriptor for `ClearABIContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clearABIContractDescriptor = $convert
    .base64Decode('ChBDbGVhckFCSUNvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bmVyQWRkcmVzcx'
        'IpChBjb250cmFjdF9hZGRyZXNzGAIgASgMUg9jb250cmFjdEFkZHJlc3M=');

@$core.Deprecated('Use updateSettingContractDescriptor instead')
const UpdateSettingContract$json = {
  '1': 'UpdateSettingContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    {
      '1': 'consume_user_resource_percent',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'consumeUserResourcePercent'
    },
  ],
};

/// Descriptor for `UpdateSettingContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSettingContractDescriptor = $convert
    .base64Decode('ChVVcGRhdGVTZXR0aW5nQ29udHJhY3QSIwoNb3duZXJfYWRkcmVzcxgBIAEoDFIMb3duZXJBZG'
        'RyZXNzEikKEGNvbnRyYWN0X2FkZHJlc3MYAiABKAxSD2NvbnRyYWN0QWRkcmVzcxJBCh1jb25z'
        'dW1lX3VzZXJfcmVzb3VyY2VfcGVyY2VudBgDIAEoA1IaY29uc3VtZVVzZXJSZXNvdXJjZVBlcm'
        'NlbnQ=');

@$core.Deprecated('Use updateEnergyLimitContractDescriptor instead')
const UpdateEnergyLimitContract$json = {
  '1': 'UpdateEnergyLimitContract',
  '2': [
    {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    {'1': 'origin_energy_limit', '3': 3, '4': 1, '5': 3, '10': 'originEnergyLimit'},
  ],
};

/// Descriptor for `UpdateEnergyLimitContract`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEnergyLimitContractDescriptor = $convert
    .base64Decode('ChlVcGRhdGVFbmVyZ3lMaW1pdENvbnRyYWN0EiMKDW93bmVyX2FkZHJlc3MYASABKAxSDG93bm'
        'VyQWRkcmVzcxIpChBjb250cmFjdF9hZGRyZXNzGAIgASgMUg9jb250cmFjdEFkZHJlc3MSLgoT'
        'b3JpZ2luX2VuZXJneV9saW1pdBgDIAEoA1IRb3JpZ2luRW5lcmd5TGltaXQ=');

@$core.Deprecated('Use smartContractDataWrapperDescriptor instead')
const SmartContractDataWrapper$json = {
  '1': 'SmartContractDataWrapper',
  '2': [
    {
      '1': 'smart_contract',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.protocol.SmartContract',
      '10': 'smartContract'
    },
    {'1': 'runtimecode', '3': 2, '4': 1, '5': 12, '10': 'runtimecode'},
    {
      '1': 'contract_state',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.protocol.ContractState',
      '10': 'contractState'
    },
  ],
};

/// Descriptor for `SmartContractDataWrapper`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartContractDataWrapperDescriptor = $convert
    .base64Decode('ChhTbWFydENvbnRyYWN0RGF0YVdyYXBwZXISPgoOc21hcnRfY29udHJhY3QYASABKAsyFy5wcm'
        '90b2NvbC5TbWFydENvbnRyYWN0Ug1zbWFydENvbnRyYWN0EiAKC3J1bnRpbWVjb2RlGAIgASgM'
        'UgtydW50aW1lY29kZRI+Cg5jb250cmFjdF9zdGF0ZRgDIAEoCzIXLnByb3RvY29sLkNvbnRyYW'
        'N0U3RhdGVSDWNvbnRyYWN0U3RhdGU=');
