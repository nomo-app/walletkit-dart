//
//  Generated code. Do not modify.
//  source: core/contract/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResourceCode extends $pb.ProtobufEnum {
  static const ResourceCode BANDWIDTH = ResourceCode._(0, _omitEnumNames ? '' : 'BANDWIDTH');
  static const ResourceCode ENERGY = ResourceCode._(1, _omitEnumNames ? '' : 'ENERGY');
  static const ResourceCode TRON_POWER = ResourceCode._(2, _omitEnumNames ? '' : 'TRON_POWER');

  static const $core.List<ResourceCode> values = <ResourceCode> [
    BANDWIDTH,
    ENERGY,
    TRON_POWER,
  ];

  static final $core.Map<$core.int, ResourceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResourceCode? valueOf($core.int value) => _byValue[value];

  const ResourceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
