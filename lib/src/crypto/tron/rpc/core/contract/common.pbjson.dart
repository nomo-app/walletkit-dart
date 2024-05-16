//
//  Generated code. Do not modify.
//  source: core/contract/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resourceCodeDescriptor instead')
const ResourceCode$json = {
  '1': 'ResourceCode',
  '2': [
    {'1': 'BANDWIDTH', '2': 0},
    {'1': 'ENERGY', '2': 1},
    {'1': 'TRON_POWER', '2': 2},
  ],
};

/// Descriptor for `ResourceCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resourceCodeDescriptor = $convert.base64Decode(
    'CgxSZXNvdXJjZUNvZGUSDQoJQkFORFdJRFRIEAASCgoGRU5FUkdZEAESDgoKVFJPTl9QT1dFUh'
    'AC');

