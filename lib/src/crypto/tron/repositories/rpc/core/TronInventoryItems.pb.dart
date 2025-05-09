//
//  Generated code. Do not modify.
//  source: core/TronInventoryItems.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InventoryItems extends $pb.GeneratedMessage {
  factory InventoryItems({
    $core.int? type,
    $core.Iterable<$core.List<$core.int>>? items,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  InventoryItems._() : super();
  factory InventoryItems.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InventoryItems.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InventoryItems',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InventoryItems clone() => InventoryItems()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InventoryItems copyWith(void Function(InventoryItems) updates) =>
      super.copyWith((message) => updates(message as InventoryItems)) as InventoryItems;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryItems create() => InventoryItems._();
  InventoryItems createEmptyInstance() => create();
  static $pb.PbList<InventoryItems> createRepeated() => $pb.PbList<InventoryItems>();
  @$core.pragma('dart2js:noInline')
  static InventoryItems getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InventoryItems>(create);
  static InventoryItems? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get items => $_getList(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
