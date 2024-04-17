//
//  Generated code. Do not modify.
//  source: core/contract/asset_issue_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class AssetIssueContract_FrozenSupply extends $pb.GeneratedMessage {
  factory AssetIssueContract_FrozenSupply({
    $fixnum.Int64? frozenAmount,
    $fixnum.Int64? frozenDays,
  }) {
    final $result = create();
    if (frozenAmount != null) {
      $result.frozenAmount = frozenAmount;
    }
    if (frozenDays != null) {
      $result.frozenDays = frozenDays;
    }
    return $result;
  }
  AssetIssueContract_FrozenSupply._() : super();
  factory AssetIssueContract_FrozenSupply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetIssueContract_FrozenSupply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetIssueContract.FrozenSupply', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'frozenAmount')
    ..aInt64(2, _omitFieldNames ? '' : 'frozenDays')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetIssueContract_FrozenSupply clone() => AssetIssueContract_FrozenSupply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetIssueContract_FrozenSupply copyWith(void Function(AssetIssueContract_FrozenSupply) updates) => super.copyWith((message) => updates(message as AssetIssueContract_FrozenSupply)) as AssetIssueContract_FrozenSupply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetIssueContract_FrozenSupply create() => AssetIssueContract_FrozenSupply._();
  AssetIssueContract_FrozenSupply createEmptyInstance() => create();
  static $pb.PbList<AssetIssueContract_FrozenSupply> createRepeated() => $pb.PbList<AssetIssueContract_FrozenSupply>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract_FrozenSupply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueContract_FrozenSupply>(create);
  static AssetIssueContract_FrozenSupply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get frozenAmount => $_getI64(0);
  @$pb.TagNumber(1)
  set frozenAmount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrozenAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrozenAmount() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenDays => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenDays($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenDays() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenDays() => clearField(2);
}

class AssetIssueContract extends $pb.GeneratedMessage {
  factory AssetIssueContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? name,
    $core.List<$core.int>? abbr,
    $fixnum.Int64? totalSupply,
    $core.Iterable<AssetIssueContract_FrozenSupply>? frozenSupply,
    $core.int? trxNum,
    $core.int? precision,
    $core.int? num,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $fixnum.Int64? order,
    $core.int? voteScore,
    $core.List<$core.int>? description,
    $core.List<$core.int>? url,
    $fixnum.Int64? freeAssetNetLimit,
    $fixnum.Int64? publicFreeAssetNetLimit,
    $fixnum.Int64? publicFreeAssetNetUsage,
    $fixnum.Int64? publicLatestFreeNetTime,
    $core.String? id,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (name != null) {
      $result.name = name;
    }
    if (abbr != null) {
      $result.abbr = abbr;
    }
    if (totalSupply != null) {
      $result.totalSupply = totalSupply;
    }
    if (frozenSupply != null) {
      $result.frozenSupply.addAll(frozenSupply);
    }
    if (trxNum != null) {
      $result.trxNum = trxNum;
    }
    if (precision != null) {
      $result.precision = precision;
    }
    if (num != null) {
      $result.num = num;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (order != null) {
      $result.order = order;
    }
    if (voteScore != null) {
      $result.voteScore = voteScore;
    }
    if (description != null) {
      $result.description = description;
    }
    if (url != null) {
      $result.url = url;
    }
    if (freeAssetNetLimit != null) {
      $result.freeAssetNetLimit = freeAssetNetLimit;
    }
    if (publicFreeAssetNetLimit != null) {
      $result.publicFreeAssetNetLimit = publicFreeAssetNetLimit;
    }
    if (publicFreeAssetNetUsage != null) {
      $result.publicFreeAssetNetUsage = publicFreeAssetNetUsage;
    }
    if (publicLatestFreeNetTime != null) {
      $result.publicLatestFreeNetTime = publicLatestFreeNetTime;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  AssetIssueContract._() : super();
  factory AssetIssueContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetIssueContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetIssueContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'name', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'abbr', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'totalSupply')
    ..pc<AssetIssueContract_FrozenSupply>(5, _omitFieldNames ? '' : 'frozenSupply', $pb.PbFieldType.PM, subBuilder: AssetIssueContract_FrozenSupply.create)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'trxNum', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'precision', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'num', $pb.PbFieldType.O3)
    ..aInt64(9, _omitFieldNames ? '' : 'startTime')
    ..aInt64(10, _omitFieldNames ? '' : 'endTime')
    ..aInt64(11, _omitFieldNames ? '' : 'order')
    ..a<$core.int>(16, _omitFieldNames ? '' : 'voteScore', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(20, _omitFieldNames ? '' : 'description', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(21, _omitFieldNames ? '' : 'url', $pb.PbFieldType.OY)
    ..aInt64(22, _omitFieldNames ? '' : 'freeAssetNetLimit')
    ..aInt64(23, _omitFieldNames ? '' : 'publicFreeAssetNetLimit')
    ..aInt64(24, _omitFieldNames ? '' : 'publicFreeAssetNetUsage')
    ..aInt64(25, _omitFieldNames ? '' : 'publicLatestFreeNetTime')
    ..aOS(41, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetIssueContract clone() => AssetIssueContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetIssueContract copyWith(void Function(AssetIssueContract) updates) => super.copyWith((message) => updates(message as AssetIssueContract)) as AssetIssueContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetIssueContract create() => AssetIssueContract._();
  AssetIssueContract createEmptyInstance() => create();
  static $pb.PbList<AssetIssueContract> createRepeated() => $pb.PbList<AssetIssueContract>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueContract>(create);
  static AssetIssueContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get name => $_getN(1);
  @$pb.TagNumber(2)
  set name($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get abbr => $_getN(2);
  @$pb.TagNumber(3)
  set abbr($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbbr() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbbr() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalSupply => $_getI64(3);
  @$pb.TagNumber(4)
  set totalSupply($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalSupply() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalSupply() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<AssetIssueContract_FrozenSupply> get frozenSupply => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get trxNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set trxNum($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrxNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrxNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get precision => $_getIZ(6);
  @$pb.TagNumber(7)
  set precision($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPrecision() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrecision() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get num => $_getIZ(7);
  @$pb.TagNumber(8)
  set num($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearNum() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get endTime => $_getI64(9);
  @$pb.TagNumber(10)
  set endTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndTime() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get order => $_getI64(10);
  @$pb.TagNumber(11)
  set order($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOrder() => $_has(10);
  @$pb.TagNumber(11)
  void clearOrder() => clearField(11);

  @$pb.TagNumber(16)
  $core.int get voteScore => $_getIZ(11);
  @$pb.TagNumber(16)
  set voteScore($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(16)
  $core.bool hasVoteScore() => $_has(11);
  @$pb.TagNumber(16)
  void clearVoteScore() => clearField(16);

  @$pb.TagNumber(20)
  $core.List<$core.int> get description => $_getN(12);
  @$pb.TagNumber(20)
  set description($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(20)
  $core.bool hasDescription() => $_has(12);
  @$pb.TagNumber(20)
  void clearDescription() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<$core.int> get url => $_getN(13);
  @$pb.TagNumber(21)
  set url($core.List<$core.int> v) { $_setBytes(13, v); }
  @$pb.TagNumber(21)
  $core.bool hasUrl() => $_has(13);
  @$pb.TagNumber(21)
  void clearUrl() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get freeAssetNetLimit => $_getI64(14);
  @$pb.TagNumber(22)
  set freeAssetNetLimit($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(22)
  $core.bool hasFreeAssetNetLimit() => $_has(14);
  @$pb.TagNumber(22)
  void clearFreeAssetNetLimit() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get publicFreeAssetNetLimit => $_getI64(15);
  @$pb.TagNumber(23)
  set publicFreeAssetNetLimit($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(23)
  $core.bool hasPublicFreeAssetNetLimit() => $_has(15);
  @$pb.TagNumber(23)
  void clearPublicFreeAssetNetLimit() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get publicFreeAssetNetUsage => $_getI64(16);
  @$pb.TagNumber(24)
  set publicFreeAssetNetUsage($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(24)
  $core.bool hasPublicFreeAssetNetUsage() => $_has(16);
  @$pb.TagNumber(24)
  void clearPublicFreeAssetNetUsage() => clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get publicLatestFreeNetTime => $_getI64(17);
  @$pb.TagNumber(25)
  set publicLatestFreeNetTime($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(25)
  $core.bool hasPublicLatestFreeNetTime() => $_has(17);
  @$pb.TagNumber(25)
  void clearPublicLatestFreeNetTime() => clearField(25);

  @$pb.TagNumber(41)
  $core.String get id => $_getSZ(18);
  @$pb.TagNumber(41)
  set id($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(41)
  $core.bool hasId() => $_has(18);
  @$pb.TagNumber(41)
  void clearId() => clearField(41);
}

class TransferAssetContract extends $pb.GeneratedMessage {
  factory TransferAssetContract({
    $core.List<$core.int>? assetName,
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? toAddress,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (toAddress != null) {
      $result.toAddress = toAddress;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  TransferAssetContract._() : super();
  factory TransferAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferAssetContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'assetName', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'toAddress', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferAssetContract clone() => TransferAssetContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferAssetContract copyWith(void Function(TransferAssetContract) updates) => super.copyWith((message) => updates(message as TransferAssetContract)) as TransferAssetContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferAssetContract create() => TransferAssetContract._();
  TransferAssetContract createEmptyInstance() => create();
  static $pb.PbList<TransferAssetContract> createRepeated() => $pb.PbList<TransferAssetContract>();
  @$core.pragma('dart2js:noInline')
  static TransferAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferAssetContract>(create);
  static TransferAssetContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get assetName => $_getN(0);
  @$pb.TagNumber(1)
  set assetName($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get toAddress => $_getN(2);
  @$pb.TagNumber(3)
  set toAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class UnfreezeAssetContract extends $pb.GeneratedMessage {
  factory UnfreezeAssetContract({
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  UnfreezeAssetContract._() : super();
  factory UnfreezeAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfreezeAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnfreezeAssetContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnfreezeAssetContract clone() => UnfreezeAssetContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnfreezeAssetContract copyWith(void Function(UnfreezeAssetContract) updates) => super.copyWith((message) => updates(message as UnfreezeAssetContract)) as UnfreezeAssetContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract create() => UnfreezeAssetContract._();
  UnfreezeAssetContract createEmptyInstance() => create();
  static $pb.PbList<UnfreezeAssetContract> createRepeated() => $pb.PbList<UnfreezeAssetContract>();
  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfreezeAssetContract>(create);
  static UnfreezeAssetContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class UpdateAssetContract extends $pb.GeneratedMessage {
  factory UpdateAssetContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? description,
    $core.List<$core.int>? url,
    $fixnum.Int64? newLimit,
    $fixnum.Int64? newPublicLimit,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (description != null) {
      $result.description = description;
    }
    if (url != null) {
      $result.url = url;
    }
    if (newLimit != null) {
      $result.newLimit = newLimit;
    }
    if (newPublicLimit != null) {
      $result.newPublicLimit = newPublicLimit;
    }
    return $result;
  }
  UpdateAssetContract._() : super();
  factory UpdateAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'description', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'url', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'newLimit')
    ..aInt64(5, _omitFieldNames ? '' : 'newPublicLimit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssetContract clone() => UpdateAssetContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssetContract copyWith(void Function(UpdateAssetContract) updates) => super.copyWith((message) => updates(message as UpdateAssetContract)) as UpdateAssetContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetContract create() => UpdateAssetContract._();
  UpdateAssetContract createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetContract> createRepeated() => $pb.PbList<UpdateAssetContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetContract>(create);
  static UpdateAssetContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get description => $_getN(1);
  @$pb.TagNumber(2)
  set description($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get url => $_getN(2);
  @$pb.TagNumber(3)
  set url($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get newLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set newLimit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewLimit() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get newPublicLimit => $_getI64(4);
  @$pb.TagNumber(5)
  set newPublicLimit($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNewPublicLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearNewPublicLimit() => clearField(5);
}

class ParticipateAssetIssueContract extends $pb.GeneratedMessage {
  factory ParticipateAssetIssueContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? toAddress,
    $core.List<$core.int>? assetName,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (toAddress != null) {
      $result.toAddress = toAddress;
    }
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  ParticipateAssetIssueContract._() : super();
  factory ParticipateAssetIssueContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParticipateAssetIssueContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ParticipateAssetIssueContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'toAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'assetName', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParticipateAssetIssueContract clone() => ParticipateAssetIssueContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParticipateAssetIssueContract copyWith(void Function(ParticipateAssetIssueContract) updates) => super.copyWith((message) => updates(message as ParticipateAssetIssueContract)) as ParticipateAssetIssueContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParticipateAssetIssueContract create() => ParticipateAssetIssueContract._();
  ParticipateAssetIssueContract createEmptyInstance() => create();
  static $pb.PbList<ParticipateAssetIssueContract> createRepeated() => $pb.PbList<ParticipateAssetIssueContract>();
  @$core.pragma('dart2js:noInline')
  static ParticipateAssetIssueContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParticipateAssetIssueContract>(create);
  static ParticipateAssetIssueContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get assetName => $_getN(2);
  @$pb.TagNumber(3)
  set assetName($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
