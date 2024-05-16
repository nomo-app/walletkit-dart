//
//  Generated code. Do not modify.
//  source: core/contract/witness_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class WitnessCreateContract extends $pb.GeneratedMessage {
  factory WitnessCreateContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? url,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  WitnessCreateContract._() : super();
  factory WitnessCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WitnessCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WitnessCreateContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'url', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WitnessCreateContract clone() => WitnessCreateContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WitnessCreateContract copyWith(void Function(WitnessCreateContract) updates) => super.copyWith((message) => updates(message as WitnessCreateContract)) as WitnessCreateContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WitnessCreateContract create() => WitnessCreateContract._();
  WitnessCreateContract createEmptyInstance() => create();
  static $pb.PbList<WitnessCreateContract> createRepeated() => $pb.PbList<WitnessCreateContract>();
  @$core.pragma('dart2js:noInline')
  static WitnessCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessCreateContract>(create);
  static WitnessCreateContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get url => $_getN(1);
  @$pb.TagNumber(2)
  set url($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class WitnessUpdateContract extends $pb.GeneratedMessage {
  factory WitnessUpdateContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? updateUrl,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (updateUrl != null) {
      $result.updateUrl = updateUrl;
    }
    return $result;
  }
  WitnessUpdateContract._() : super();
  factory WitnessUpdateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WitnessUpdateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WitnessUpdateContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'updateUrl', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WitnessUpdateContract clone() => WitnessUpdateContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WitnessUpdateContract copyWith(void Function(WitnessUpdateContract) updates) => super.copyWith((message) => updates(message as WitnessUpdateContract)) as WitnessUpdateContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WitnessUpdateContract create() => WitnessUpdateContract._();
  WitnessUpdateContract createEmptyInstance() => create();
  static $pb.PbList<WitnessUpdateContract> createRepeated() => $pb.PbList<WitnessUpdateContract>();
  @$core.pragma('dart2js:noInline')
  static WitnessUpdateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessUpdateContract>(create);
  static WitnessUpdateContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(12)
  $core.List<$core.int> get updateUrl => $_getN(1);
  @$pb.TagNumber(12)
  set updateUrl($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateUrl() => $_has(1);
  @$pb.TagNumber(12)
  void clearUpdateUrl() => clearField(12);
}

class VoteWitnessContract_Vote extends $pb.GeneratedMessage {
  factory VoteWitnessContract_Vote({
    $core.List<$core.int>? voteAddress,
    $fixnum.Int64? voteCount,
  }) {
    final $result = create();
    if (voteAddress != null) {
      $result.voteAddress = voteAddress;
    }
    if (voteCount != null) {
      $result.voteCount = voteCount;
    }
    return $result;
  }
  VoteWitnessContract_Vote._() : super();
  factory VoteWitnessContract_Vote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteWitnessContract_Vote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoteWitnessContract.Vote', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'voteAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'voteCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoteWitnessContract_Vote clone() => VoteWitnessContract_Vote()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoteWitnessContract_Vote copyWith(void Function(VoteWitnessContract_Vote) updates) => super.copyWith((message) => updates(message as VoteWitnessContract_Vote)) as VoteWitnessContract_Vote;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote create() => VoteWitnessContract_Vote._();
  VoteWitnessContract_Vote createEmptyInstance() => create();
  static $pb.PbList<VoteWitnessContract_Vote> createRepeated() => $pb.PbList<VoteWitnessContract_Vote>();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract_Vote>(create);
  static VoteWitnessContract_Vote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get voteAddress => $_getN(0);
  @$pb.TagNumber(1)
  set voteAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoteAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoteAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => clearField(2);
}

class VoteWitnessContract extends $pb.GeneratedMessage {
  factory VoteWitnessContract({
    $core.List<$core.int>? ownerAddress,
    $core.Iterable<VoteWitnessContract_Vote>? votes,
    $core.bool? support,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (votes != null) {
      $result.votes.addAll(votes);
    }
    if (support != null) {
      $result.support = support;
    }
    return $result;
  }
  VoteWitnessContract._() : super();
  factory VoteWitnessContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteWitnessContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoteWitnessContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..pc<VoteWitnessContract_Vote>(2, _omitFieldNames ? '' : 'votes', $pb.PbFieldType.PM, subBuilder: VoteWitnessContract_Vote.create)
    ..aOB(3, _omitFieldNames ? '' : 'support')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoteWitnessContract clone() => VoteWitnessContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoteWitnessContract copyWith(void Function(VoteWitnessContract) updates) => super.copyWith((message) => updates(message as VoteWitnessContract)) as VoteWitnessContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract create() => VoteWitnessContract._();
  VoteWitnessContract createEmptyInstance() => create();
  static $pb.PbList<VoteWitnessContract> createRepeated() => $pb.PbList<VoteWitnessContract>();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract>(create);
  static VoteWitnessContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<VoteWitnessContract_Vote> get votes => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get support => $_getBF(2);
  @$pb.TagNumber(3)
  set support($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupport() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupport() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
