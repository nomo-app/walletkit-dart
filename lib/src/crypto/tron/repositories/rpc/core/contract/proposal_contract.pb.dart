//
//  Generated code. Do not modify.
//  source: core/contract/proposal_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ProposalApproveContract extends $pb.GeneratedMessage {
  factory ProposalApproveContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? proposalId,
    $core.bool? isAddApproval,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (proposalId != null) {
      $result.proposalId = proposalId;
    }
    if (isAddApproval != null) {
      $result.isAddApproval = isAddApproval;
    }
    return $result;
  }
  ProposalApproveContract._() : super();
  factory ProposalApproveContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalApproveContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProposalApproveContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'proposalId')
    ..aOB(3, _omitFieldNames ? '' : 'isAddApproval')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProposalApproveContract clone() => ProposalApproveContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProposalApproveContract copyWith(void Function(ProposalApproveContract) updates) => super.copyWith((message) => updates(message as ProposalApproveContract)) as ProposalApproveContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProposalApproveContract create() => ProposalApproveContract._();
  ProposalApproveContract createEmptyInstance() => create();
  static $pb.PbList<ProposalApproveContract> createRepeated() => $pb.PbList<ProposalApproveContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalApproveContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalApproveContract>(create);
  static ProposalApproveContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get proposalId => $_getI64(1);
  @$pb.TagNumber(2)
  set proposalId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposalId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAddApproval => $_getBF(2);
  @$pb.TagNumber(3)
  set isAddApproval($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAddApproval() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAddApproval() => clearField(3);
}

class ProposalCreateContract extends $pb.GeneratedMessage {
  factory ProposalCreateContract({
    $core.List<$core.int>? ownerAddress,
    $core.Map<$fixnum.Int64, $fixnum.Int64>? parameters,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (parameters != null) {
      $result.parameters.addAll(parameters);
    }
    return $result;
  }
  ProposalCreateContract._() : super();
  factory ProposalCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProposalCreateContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..m<$fixnum.Int64, $fixnum.Int64>(2, _omitFieldNames ? '' : 'parameters', entryClassName: 'ProposalCreateContract.ParametersEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProposalCreateContract clone() => ProposalCreateContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProposalCreateContract copyWith(void Function(ProposalCreateContract) updates) => super.copyWith((message) => updates(message as ProposalCreateContract)) as ProposalCreateContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProposalCreateContract create() => ProposalCreateContract._();
  ProposalCreateContract createEmptyInstance() => create();
  static $pb.PbList<ProposalCreateContract> createRepeated() => $pb.PbList<ProposalCreateContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalCreateContract>(create);
  static ProposalCreateContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$fixnum.Int64, $fixnum.Int64> get parameters => $_getMap(1);
}

class ProposalDeleteContract extends $pb.GeneratedMessage {
  factory ProposalDeleteContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? proposalId,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (proposalId != null) {
      $result.proposalId = proposalId;
    }
    return $result;
  }
  ProposalDeleteContract._() : super();
  factory ProposalDeleteContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalDeleteContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProposalDeleteContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'proposalId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProposalDeleteContract clone() => ProposalDeleteContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProposalDeleteContract copyWith(void Function(ProposalDeleteContract) updates) => super.copyWith((message) => updates(message as ProposalDeleteContract)) as ProposalDeleteContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProposalDeleteContract create() => ProposalDeleteContract._();
  ProposalDeleteContract createEmptyInstance() => create();
  static $pb.PbList<ProposalDeleteContract> createRepeated() => $pb.PbList<ProposalDeleteContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalDeleteContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalDeleteContract>(create);
  static ProposalDeleteContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get proposalId => $_getI64(1);
  @$pb.TagNumber(2)
  set proposalId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposalId() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
