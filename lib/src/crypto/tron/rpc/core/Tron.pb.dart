//
//  Generated code. Do not modify.
//  source: core/Tron.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/any.pb.dart' as $12;
import 'Discover.pb.dart' as $13;
import 'Tron.pbenum.dart';
import 'contract/common.pbenum.dart' as $14;

export 'Tron.pbenum.dart';

/// AccountId, (name, address) use name, (null, address) use address, (name, null) use name,
class AccountId extends $pb.GeneratedMessage {
  factory AccountId({
    $core.List<$core.int>? name,
    $core.List<$core.int>? address,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  AccountId._() : super();
  factory AccountId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountId', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'name', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountId clone() => AccountId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountId copyWith(void Function(AccountId) updates) => super.copyWith((message) => updates(message as AccountId)) as AccountId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountId create() => AccountId._();
  AccountId createEmptyInstance() => create();
  static $pb.PbList<AccountId> createRepeated() => $pb.PbList<AccountId>();
  @$core.pragma('dart2js:noInline')
  static AccountId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountId>(create);
  static AccountId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get name => $_getN(0);
  @$pb.TagNumber(1)
  set name($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get address => $_getN(1);
  @$pb.TagNumber(2)
  set address($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

/// vote message
class Vote extends $pb.GeneratedMessage {
  factory Vote({
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
  Vote._() : super();
  factory Vote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Vote', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'voteAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'voteCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vote clone() => Vote()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vote copyWith(void Function(Vote) updates) => super.copyWith((message) => updates(message as Vote)) as Vote;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vote create() => Vote._();
  Vote createEmptyInstance() => create();
  static $pb.PbList<Vote> createRepeated() => $pb.PbList<Vote>();
  @$core.pragma('dart2js:noInline')
  static Vote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vote>(create);
  static Vote? _defaultInstance;

  /// the super rep address
  @$pb.TagNumber(1)
  $core.List<$core.int> get voteAddress => $_getN(0);
  @$pb.TagNumber(1)
  set voteAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoteAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoteAddress() => clearField(1);

  /// the vote num to this super rep.
  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => clearField(2);
}

/// Proposal
class Proposal extends $pb.GeneratedMessage {
  factory Proposal({
    $fixnum.Int64? proposalId,
    $core.List<$core.int>? proposerAddress,
    $core.Map<$fixnum.Int64, $fixnum.Int64>? parameters,
    $fixnum.Int64? expirationTime,
    $fixnum.Int64? createTime,
    $core.Iterable<$core.List<$core.int>>? approvals,
    Proposal_State? state,
  }) {
    final $result = create();
    if (proposalId != null) {
      $result.proposalId = proposalId;
    }
    if (proposerAddress != null) {
      $result.proposerAddress = proposerAddress;
    }
    if (parameters != null) {
      $result.parameters.addAll(parameters);
    }
    if (expirationTime != null) {
      $result.expirationTime = expirationTime;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (approvals != null) {
      $result.approvals.addAll(approvals);
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  Proposal._() : super();
  factory Proposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Proposal', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'proposalId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'proposerAddress', $pb.PbFieldType.OY)
    ..m<$fixnum.Int64, $fixnum.Int64>(3, _omitFieldNames ? '' : 'parameters', entryClassName: 'Proposal.ParametersEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(4, _omitFieldNames ? '' : 'expirationTime')
    ..aInt64(5, _omitFieldNames ? '' : 'createTime')
    ..p<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'approvals', $pb.PbFieldType.PY)
    ..e<Proposal_State>(7, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: Proposal_State.PENDING, valueOf: Proposal_State.valueOf, enumValues: Proposal_State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Proposal clone() => Proposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Proposal copyWith(void Function(Proposal) updates) => super.copyWith((message) => updates(message as Proposal)) as Proposal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Proposal create() => Proposal._();
  Proposal createEmptyInstance() => create();
  static $pb.PbList<Proposal> createRepeated() => $pb.PbList<Proposal>();
  @$core.pragma('dart2js:noInline')
  static Proposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proposal>(create);
  static Proposal? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proposerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set proposerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$fixnum.Int64, $fixnum.Int64> get parameters => $_getMap(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expirationTime => $_getI64(3);
  @$pb.TagNumber(4)
  set expirationTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationTime() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.List<$core.int>> get approvals => $_getList(5);

  @$pb.TagNumber(7)
  Proposal_State get state => $_getN(6);
  @$pb.TagNumber(7)
  set state(Proposal_State v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => clearField(7);
}

/// Exchange
class Exchange extends $pb.GeneratedMessage {
  factory Exchange({
    $fixnum.Int64? exchangeId,
    $core.List<$core.int>? creatorAddress,
    $fixnum.Int64? createTime,
    $core.List<$core.int>? firstTokenId,
    $fixnum.Int64? firstTokenBalance,
    $core.List<$core.int>? secondTokenId,
    $fixnum.Int64? secondTokenBalance,
  }) {
    final $result = create();
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (creatorAddress != null) {
      $result.creatorAddress = creatorAddress;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (firstTokenId != null) {
      $result.firstTokenId = firstTokenId;
    }
    if (firstTokenBalance != null) {
      $result.firstTokenBalance = firstTokenBalance;
    }
    if (secondTokenId != null) {
      $result.secondTokenId = secondTokenId;
    }
    if (secondTokenBalance != null) {
      $result.secondTokenBalance = secondTokenBalance;
    }
    return $result;
  }
  Exchange._() : super();
  factory Exchange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Exchange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Exchange', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'exchangeId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'creatorAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'createTime')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'firstTokenId', $pb.PbFieldType.OY)
    ..aInt64(7, _omitFieldNames ? '' : 'firstTokenBalance')
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'secondTokenId', $pb.PbFieldType.OY)
    ..aInt64(9, _omitFieldNames ? '' : 'secondTokenBalance')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Exchange clone() => Exchange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Exchange copyWith(void Function(Exchange) updates) => super.copyWith((message) => updates(message as Exchange)) as Exchange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exchange create() => Exchange._();
  Exchange createEmptyInstance() => create();
  static $pb.PbList<Exchange> createRepeated() => $pb.PbList<Exchange>();
  @$core.pragma('dart2js:noInline')
  static Exchange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exchange>(create);
  static Exchange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get exchangeId => $_getI64(0);
  @$pb.TagNumber(1)
  set exchangeId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExchangeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExchangeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get creatorAddress => $_getN(1);
  @$pb.TagNumber(2)
  set creatorAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createTime => $_getI64(2);
  @$pb.TagNumber(3)
  set createTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => clearField(3);

  @$pb.TagNumber(6)
  $core.List<$core.int> get firstTokenId => $_getN(3);
  @$pb.TagNumber(6)
  set firstTokenId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasFirstTokenId() => $_has(3);
  @$pb.TagNumber(6)
  void clearFirstTokenId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get firstTokenBalance => $_getI64(4);
  @$pb.TagNumber(7)
  set firstTokenBalance($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasFirstTokenBalance() => $_has(4);
  @$pb.TagNumber(7)
  void clearFirstTokenBalance() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get secondTokenId => $_getN(5);
  @$pb.TagNumber(8)
  set secondTokenId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasSecondTokenId() => $_has(5);
  @$pb.TagNumber(8)
  void clearSecondTokenId() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get secondTokenBalance => $_getI64(6);
  @$pb.TagNumber(9)
  set secondTokenBalance($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasSecondTokenBalance() => $_has(6);
  @$pb.TagNumber(9)
  void clearSecondTokenBalance() => clearField(9);
}

/// market
class MarketOrder extends $pb.GeneratedMessage {
  factory MarketOrder({
    $core.List<$core.int>? orderId,
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? createTime,
    $core.List<$core.int>? sellTokenId,
    $fixnum.Int64? sellTokenQuantity,
    $core.List<$core.int>? buyTokenId,
    $fixnum.Int64? buyTokenQuantity,
    $fixnum.Int64? sellTokenQuantityRemain,
    $fixnum.Int64? sellTokenQuantityReturn,
    MarketOrder_State? state,
    $core.List<$core.int>? prev,
    $core.List<$core.int>? next,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (sellTokenId != null) {
      $result.sellTokenId = sellTokenId;
    }
    if (sellTokenQuantity != null) {
      $result.sellTokenQuantity = sellTokenQuantity;
    }
    if (buyTokenId != null) {
      $result.buyTokenId = buyTokenId;
    }
    if (buyTokenQuantity != null) {
      $result.buyTokenQuantity = buyTokenQuantity;
    }
    if (sellTokenQuantityRemain != null) {
      $result.sellTokenQuantityRemain = sellTokenQuantityRemain;
    }
    if (sellTokenQuantityReturn != null) {
      $result.sellTokenQuantityReturn = sellTokenQuantityReturn;
    }
    if (state != null) {
      $result.state = state;
    }
    if (prev != null) {
      $result.prev = prev;
    }
    if (next != null) {
      $result.next = next;
    }
    return $result;
  }
  MarketOrder._() : super();
  factory MarketOrder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrder', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'orderId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'createTime')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'sellTokenId', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'sellTokenQuantity')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'buyTokenId', $pb.PbFieldType.OY)
    ..aInt64(7, _omitFieldNames ? '' : 'buyTokenQuantity')
    ..aInt64(9, _omitFieldNames ? '' : 'sellTokenQuantityRemain')
    ..aInt64(10, _omitFieldNames ? '' : 'sellTokenQuantityReturn')
    ..e<MarketOrder_State>(11, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: MarketOrder_State.ACTIVE, valueOf: MarketOrder_State.valueOf, enumValues: MarketOrder_State.values)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'prev', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(13, _omitFieldNames ? '' : 'next', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrder clone() => MarketOrder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrder copyWith(void Function(MarketOrder) updates) => super.copyWith((message) => updates(message as MarketOrder)) as MarketOrder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrder create() => MarketOrder._();
  MarketOrder createEmptyInstance() => create();
  static $pb.PbList<MarketOrder> createRepeated() => $pb.PbList<MarketOrder>();
  @$core.pragma('dart2js:noInline')
  static MarketOrder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrder>(create);
  static MarketOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get orderId => $_getN(0);
  @$pb.TagNumber(1)
  set orderId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createTime => $_getI64(2);
  @$pb.TagNumber(3)
  set createTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sellTokenId => $_getN(3);
  @$pb.TagNumber(4)
  set sellTokenId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSellTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSellTokenId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sellTokenQuantity => $_getI64(4);
  @$pb.TagNumber(5)
  set sellTokenQuantity($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSellTokenQuantity() => $_has(4);
  @$pb.TagNumber(5)
  void clearSellTokenQuantity() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get buyTokenId => $_getN(5);
  @$pb.TagNumber(6)
  set buyTokenId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyTokenId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyTokenId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get buyTokenQuantity => $_getI64(6);
  @$pb.TagNumber(7)
  set buyTokenQuantity($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuyTokenQuantity() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuyTokenQuantity() => clearField(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get sellTokenQuantityRemain => $_getI64(7);
  @$pb.TagNumber(9)
  set sellTokenQuantityRemain($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasSellTokenQuantityRemain() => $_has(7);
  @$pb.TagNumber(9)
  void clearSellTokenQuantityRemain() => clearField(9);

  ///  When state != ACTIVE and sell_token_quantity_return !=0,
  /// it means that some sell tokens are returned to the account due to insufficient remaining amount
  @$pb.TagNumber(10)
  $fixnum.Int64 get sellTokenQuantityReturn => $_getI64(8);
  @$pb.TagNumber(10)
  set sellTokenQuantityReturn($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasSellTokenQuantityReturn() => $_has(8);
  @$pb.TagNumber(10)
  void clearSellTokenQuantityReturn() => clearField(10);

  @$pb.TagNumber(11)
  MarketOrder_State get state => $_getN(9);
  @$pb.TagNumber(11)
  set state(MarketOrder_State v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasState() => $_has(9);
  @$pb.TagNumber(11)
  void clearState() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get prev => $_getN(10);
  @$pb.TagNumber(12)
  set prev($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasPrev() => $_has(10);
  @$pb.TagNumber(12)
  void clearPrev() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get next => $_getN(11);
  @$pb.TagNumber(13)
  set next($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasNext() => $_has(11);
  @$pb.TagNumber(13)
  void clearNext() => clearField(13);
}

class MarketOrderList extends $pb.GeneratedMessage {
  factory MarketOrderList({
    $core.Iterable<MarketOrder>? orders,
  }) {
    final $result = create();
    if (orders != null) {
      $result.orders.addAll(orders);
    }
    return $result;
  }
  MarketOrderList._() : super();
  factory MarketOrderList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrderList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrderList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<MarketOrder>(1, _omitFieldNames ? '' : 'orders', $pb.PbFieldType.PM, subBuilder: MarketOrder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrderList clone() => MarketOrderList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrderList copyWith(void Function(MarketOrderList) updates) => super.copyWith((message) => updates(message as MarketOrderList)) as MarketOrderList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrderList create() => MarketOrderList._();
  MarketOrderList createEmptyInstance() => create();
  static $pb.PbList<MarketOrderList> createRepeated() => $pb.PbList<MarketOrderList>();
  @$core.pragma('dart2js:noInline')
  static MarketOrderList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrderList>(create);
  static MarketOrderList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MarketOrder> get orders => $_getList(0);
}

class MarketOrderPairList extends $pb.GeneratedMessage {
  factory MarketOrderPairList({
    $core.Iterable<MarketOrderPair>? orderPair,
  }) {
    final $result = create();
    if (orderPair != null) {
      $result.orderPair.addAll(orderPair);
    }
    return $result;
  }
  MarketOrderPairList._() : super();
  factory MarketOrderPairList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrderPairList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrderPairList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<MarketOrderPair>(1, _omitFieldNames ? '' : 'orderPair', $pb.PbFieldType.PM, protoName: 'orderPair', subBuilder: MarketOrderPair.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrderPairList clone() => MarketOrderPairList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrderPairList copyWith(void Function(MarketOrderPairList) updates) => super.copyWith((message) => updates(message as MarketOrderPairList)) as MarketOrderPairList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrderPairList create() => MarketOrderPairList._();
  MarketOrderPairList createEmptyInstance() => create();
  static $pb.PbList<MarketOrderPairList> createRepeated() => $pb.PbList<MarketOrderPairList>();
  @$core.pragma('dart2js:noInline')
  static MarketOrderPairList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrderPairList>(create);
  static MarketOrderPairList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MarketOrderPair> get orderPair => $_getList(0);
}

class MarketOrderPair extends $pb.GeneratedMessage {
  factory MarketOrderPair({
    $core.List<$core.int>? sellTokenId,
    $core.List<$core.int>? buyTokenId,
  }) {
    final $result = create();
    if (sellTokenId != null) {
      $result.sellTokenId = sellTokenId;
    }
    if (buyTokenId != null) {
      $result.buyTokenId = buyTokenId;
    }
    return $result;
  }
  MarketOrderPair._() : super();
  factory MarketOrderPair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrderPair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrderPair', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'sellTokenId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'buyTokenId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrderPair clone() => MarketOrderPair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrderPair copyWith(void Function(MarketOrderPair) updates) => super.copyWith((message) => updates(message as MarketOrderPair)) as MarketOrderPair;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrderPair create() => MarketOrderPair._();
  MarketOrderPair createEmptyInstance() => create();
  static $pb.PbList<MarketOrderPair> createRepeated() => $pb.PbList<MarketOrderPair>();
  @$core.pragma('dart2js:noInline')
  static MarketOrderPair getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrderPair>(create);
  static MarketOrderPair? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sellTokenId => $_getN(0);
  @$pb.TagNumber(1)
  set sellTokenId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSellTokenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSellTokenId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get buyTokenId => $_getN(1);
  @$pb.TagNumber(2)
  set buyTokenId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBuyTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyTokenId() => clearField(2);
}

class MarketAccountOrder extends $pb.GeneratedMessage {
  factory MarketAccountOrder({
    $core.List<$core.int>? ownerAddress,
    $core.Iterable<$core.List<$core.int>>? orders,
    $fixnum.Int64? count,
    $fixnum.Int64? totalCount,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (orders != null) {
      $result.orders.addAll(orders);
    }
    if (count != null) {
      $result.count = count;
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  MarketAccountOrder._() : super();
  factory MarketAccountOrder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketAccountOrder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketAccountOrder', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'orders', $pb.PbFieldType.PY)
    ..aInt64(3, _omitFieldNames ? '' : 'count')
    ..aInt64(4, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketAccountOrder clone() => MarketAccountOrder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketAccountOrder copyWith(void Function(MarketAccountOrder) updates) => super.copyWith((message) => updates(message as MarketAccountOrder)) as MarketAccountOrder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketAccountOrder create() => MarketAccountOrder._();
  MarketAccountOrder createEmptyInstance() => create();
  static $pb.PbList<MarketAccountOrder> createRepeated() => $pb.PbList<MarketAccountOrder>();
  @$core.pragma('dart2js:noInline')
  static MarketAccountOrder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketAccountOrder>(create);
  static MarketAccountOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get orders => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get count => $_getI64(2);
  @$pb.TagNumber(3)
  set count($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalCount => $_getI64(3);
  @$pb.TagNumber(4)
  set totalCount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalCount() => clearField(4);
}

class MarketPrice extends $pb.GeneratedMessage {
  factory MarketPrice({
    $fixnum.Int64? sellTokenQuantity,
    $fixnum.Int64? buyTokenQuantity,
  }) {
    final $result = create();
    if (sellTokenQuantity != null) {
      $result.sellTokenQuantity = sellTokenQuantity;
    }
    if (buyTokenQuantity != null) {
      $result.buyTokenQuantity = buyTokenQuantity;
    }
    return $result;
  }
  MarketPrice._() : super();
  factory MarketPrice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketPrice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketPrice', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sellTokenQuantity')
    ..aInt64(2, _omitFieldNames ? '' : 'buyTokenQuantity')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketPrice clone() => MarketPrice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketPrice copyWith(void Function(MarketPrice) updates) => super.copyWith((message) => updates(message as MarketPrice)) as MarketPrice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketPrice create() => MarketPrice._();
  MarketPrice createEmptyInstance() => create();
  static $pb.PbList<MarketPrice> createRepeated() => $pb.PbList<MarketPrice>();
  @$core.pragma('dart2js:noInline')
  static MarketPrice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketPrice>(create);
  static MarketPrice? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sellTokenQuantity => $_getI64(0);
  @$pb.TagNumber(1)
  set sellTokenQuantity($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSellTokenQuantity() => $_has(0);
  @$pb.TagNumber(1)
  void clearSellTokenQuantity() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get buyTokenQuantity => $_getI64(1);
  @$pb.TagNumber(2)
  set buyTokenQuantity($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBuyTokenQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyTokenQuantity() => clearField(2);
}

class MarketPriceList extends $pb.GeneratedMessage {
  factory MarketPriceList({
    $core.List<$core.int>? sellTokenId,
    $core.List<$core.int>? buyTokenId,
    $core.Iterable<MarketPrice>? prices,
  }) {
    final $result = create();
    if (sellTokenId != null) {
      $result.sellTokenId = sellTokenId;
    }
    if (buyTokenId != null) {
      $result.buyTokenId = buyTokenId;
    }
    if (prices != null) {
      $result.prices.addAll(prices);
    }
    return $result;
  }
  MarketPriceList._() : super();
  factory MarketPriceList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketPriceList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketPriceList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'sellTokenId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'buyTokenId', $pb.PbFieldType.OY)
    ..pc<MarketPrice>(3, _omitFieldNames ? '' : 'prices', $pb.PbFieldType.PM, subBuilder: MarketPrice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketPriceList clone() => MarketPriceList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketPriceList copyWith(void Function(MarketPriceList) updates) => super.copyWith((message) => updates(message as MarketPriceList)) as MarketPriceList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketPriceList create() => MarketPriceList._();
  MarketPriceList createEmptyInstance() => create();
  static $pb.PbList<MarketPriceList> createRepeated() => $pb.PbList<MarketPriceList>();
  @$core.pragma('dart2js:noInline')
  static MarketPriceList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketPriceList>(create);
  static MarketPriceList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sellTokenId => $_getN(0);
  @$pb.TagNumber(1)
  set sellTokenId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSellTokenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSellTokenId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get buyTokenId => $_getN(1);
  @$pb.TagNumber(2)
  set buyTokenId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBuyTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyTokenId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<MarketPrice> get prices => $_getList(2);
}

class MarketOrderIdList extends $pb.GeneratedMessage {
  factory MarketOrderIdList({
    $core.List<$core.int>? head,
    $core.List<$core.int>? tail,
  }) {
    final $result = create();
    if (head != null) {
      $result.head = head;
    }
    if (tail != null) {
      $result.tail = tail;
    }
    return $result;
  }
  MarketOrderIdList._() : super();
  factory MarketOrderIdList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrderIdList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrderIdList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'head', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'tail', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrderIdList clone() => MarketOrderIdList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrderIdList copyWith(void Function(MarketOrderIdList) updates) => super.copyWith((message) => updates(message as MarketOrderIdList)) as MarketOrderIdList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrderIdList create() => MarketOrderIdList._();
  MarketOrderIdList createEmptyInstance() => create();
  static $pb.PbList<MarketOrderIdList> createRepeated() => $pb.PbList<MarketOrderIdList>();
  @$core.pragma('dart2js:noInline')
  static MarketOrderIdList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrderIdList>(create);
  static MarketOrderIdList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get head => $_getN(0);
  @$pb.TagNumber(1)
  set head($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHead() => $_has(0);
  @$pb.TagNumber(1)
  void clearHead() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get tail => $_getN(1);
  @$pb.TagNumber(2)
  set tail($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTail() => $_has(1);
  @$pb.TagNumber(2)
  void clearTail() => clearField(2);
}

class ChainParameters_ChainParameter extends $pb.GeneratedMessage {
  factory ChainParameters_ChainParameter({
    $core.String? key,
    $fixnum.Int64? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ChainParameters_ChainParameter._() : super();
  factory ChainParameters_ChainParameter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainParameters_ChainParameter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainParameters.ChainParameter', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainParameters_ChainParameter clone() => ChainParameters_ChainParameter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainParameters_ChainParameter copyWith(void Function(ChainParameters_ChainParameter) updates) => super.copyWith((message) => updates(message as ChainParameters_ChainParameter)) as ChainParameters_ChainParameter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainParameters_ChainParameter create() => ChainParameters_ChainParameter._();
  ChainParameters_ChainParameter createEmptyInstance() => create();
  static $pb.PbList<ChainParameters_ChainParameter> createRepeated() => $pb.PbList<ChainParameters_ChainParameter>();
  @$core.pragma('dart2js:noInline')
  static ChainParameters_ChainParameter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainParameters_ChainParameter>(create);
  static ChainParameters_ChainParameter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ChainParameters extends $pb.GeneratedMessage {
  factory ChainParameters({
    $core.Iterable<ChainParameters_ChainParameter>? chainParameter,
  }) {
    final $result = create();
    if (chainParameter != null) {
      $result.chainParameter.addAll(chainParameter);
    }
    return $result;
  }
  ChainParameters._() : super();
  factory ChainParameters.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainParameters.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainParameters', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<ChainParameters_ChainParameter>(1, _omitFieldNames ? '' : 'chainParameter', $pb.PbFieldType.PM, protoName: 'chainParameter', subBuilder: ChainParameters_ChainParameter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainParameters clone() => ChainParameters()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainParameters copyWith(void Function(ChainParameters) updates) => super.copyWith((message) => updates(message as ChainParameters)) as ChainParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainParameters create() => ChainParameters._();
  ChainParameters createEmptyInstance() => create();
  static $pb.PbList<ChainParameters> createRepeated() => $pb.PbList<ChainParameters>();
  @$core.pragma('dart2js:noInline')
  static ChainParameters getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainParameters>(create);
  static ChainParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChainParameters_ChainParameter> get chainParameter => $_getList(0);
}

/// frozen balance
class Account_Frozen extends $pb.GeneratedMessage {
  factory Account_Frozen({
    $fixnum.Int64? frozenBalance,
    $fixnum.Int64? expireTime,
  }) {
    final $result = create();
    if (frozenBalance != null) {
      $result.frozenBalance = frozenBalance;
    }
    if (expireTime != null) {
      $result.expireTime = expireTime;
    }
    return $result;
  }
  Account_Frozen._() : super();
  factory Account_Frozen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_Frozen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account.Frozen', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'frozenBalance')
    ..aInt64(2, _omitFieldNames ? '' : 'expireTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account_Frozen clone() => Account_Frozen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account_Frozen copyWith(void Function(Account_Frozen) updates) => super.copyWith((message) => updates(message as Account_Frozen)) as Account_Frozen;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account_Frozen create() => Account_Frozen._();
  Account_Frozen createEmptyInstance() => create();
  static $pb.PbList<Account_Frozen> createRepeated() => $pb.PbList<Account_Frozen>();
  @$core.pragma('dart2js:noInline')
  static Account_Frozen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_Frozen>(create);
  static Account_Frozen? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get frozenBalance => $_getI64(0);
  @$pb.TagNumber(1)
  set frozenBalance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrozenBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrozenBalance() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expireTime => $_getI64(1);
  @$pb.TagNumber(2)
  set expireTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpireTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpireTime() => clearField(2);
}

class Account_AccountResource extends $pb.GeneratedMessage {
  factory Account_AccountResource({
    $fixnum.Int64? energyUsage,
    Account_Frozen? frozenBalanceForEnergy,
    $fixnum.Int64? latestConsumeTimeForEnergy,
    $fixnum.Int64? acquiredDelegatedFrozenBalanceForEnergy,
    $fixnum.Int64? delegatedFrozenBalanceForEnergy,
    $fixnum.Int64? storageLimit,
    $fixnum.Int64? storageUsage,
    $fixnum.Int64? latestExchangeStorageTime,
    $fixnum.Int64? energyWindowSize,
    $fixnum.Int64? delegatedFrozenV2BalanceForEnergy,
    $fixnum.Int64? acquiredDelegatedFrozenV2BalanceForEnergy,
    $core.bool? energyWindowOptimized,
  }) {
    final $result = create();
    if (energyUsage != null) {
      $result.energyUsage = energyUsage;
    }
    if (frozenBalanceForEnergy != null) {
      $result.frozenBalanceForEnergy = frozenBalanceForEnergy;
    }
    if (latestConsumeTimeForEnergy != null) {
      $result.latestConsumeTimeForEnergy = latestConsumeTimeForEnergy;
    }
    if (acquiredDelegatedFrozenBalanceForEnergy != null) {
      $result.acquiredDelegatedFrozenBalanceForEnergy = acquiredDelegatedFrozenBalanceForEnergy;
    }
    if (delegatedFrozenBalanceForEnergy != null) {
      $result.delegatedFrozenBalanceForEnergy = delegatedFrozenBalanceForEnergy;
    }
    if (storageLimit != null) {
      $result.storageLimit = storageLimit;
    }
    if (storageUsage != null) {
      $result.storageUsage = storageUsage;
    }
    if (latestExchangeStorageTime != null) {
      $result.latestExchangeStorageTime = latestExchangeStorageTime;
    }
    if (energyWindowSize != null) {
      $result.energyWindowSize = energyWindowSize;
    }
    if (delegatedFrozenV2BalanceForEnergy != null) {
      $result.delegatedFrozenV2BalanceForEnergy = delegatedFrozenV2BalanceForEnergy;
    }
    if (acquiredDelegatedFrozenV2BalanceForEnergy != null) {
      $result.acquiredDelegatedFrozenV2BalanceForEnergy = acquiredDelegatedFrozenV2BalanceForEnergy;
    }
    if (energyWindowOptimized != null) {
      $result.energyWindowOptimized = energyWindowOptimized;
    }
    return $result;
  }
  Account_AccountResource._() : super();
  factory Account_AccountResource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_AccountResource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account.AccountResource', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'energyUsage')
    ..aOM<Account_Frozen>(2, _omitFieldNames ? '' : 'frozenBalanceForEnergy', subBuilder: Account_Frozen.create)
    ..aInt64(3, _omitFieldNames ? '' : 'latestConsumeTimeForEnergy')
    ..aInt64(4, _omitFieldNames ? '' : 'acquiredDelegatedFrozenBalanceForEnergy')
    ..aInt64(5, _omitFieldNames ? '' : 'delegatedFrozenBalanceForEnergy')
    ..aInt64(6, _omitFieldNames ? '' : 'storageLimit')
    ..aInt64(7, _omitFieldNames ? '' : 'storageUsage')
    ..aInt64(8, _omitFieldNames ? '' : 'latestExchangeStorageTime')
    ..aInt64(9, _omitFieldNames ? '' : 'energyWindowSize')
    ..aInt64(10, _omitFieldNames ? '' : 'delegatedFrozenV2BalanceForEnergy', protoName: 'delegated_frozenV2_balance_for_energy')
    ..aInt64(11, _omitFieldNames ? '' : 'acquiredDelegatedFrozenV2BalanceForEnergy', protoName: 'acquired_delegated_frozenV2_balance_for_energy')
    ..aOB(12, _omitFieldNames ? '' : 'energyWindowOptimized')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account_AccountResource clone() => Account_AccountResource()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account_AccountResource copyWith(void Function(Account_AccountResource) updates) => super.copyWith((message) => updates(message as Account_AccountResource)) as Account_AccountResource;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account_AccountResource create() => Account_AccountResource._();
  Account_AccountResource createEmptyInstance() => create();
  static $pb.PbList<Account_AccountResource> createRepeated() => $pb.PbList<Account_AccountResource>();
  @$core.pragma('dart2js:noInline')
  static Account_AccountResource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_AccountResource>(create);
  static Account_AccountResource? _defaultInstance;

  /// energy resource, get from frozen
  @$pb.TagNumber(1)
  $fixnum.Int64 get energyUsage => $_getI64(0);
  @$pb.TagNumber(1)
  set energyUsage($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnergyUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnergyUsage() => clearField(1);

  /// the frozen balance for energy
  @$pb.TagNumber(2)
  Account_Frozen get frozenBalanceForEnergy => $_getN(1);
  @$pb.TagNumber(2)
  set frozenBalanceForEnergy(Account_Frozen v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalanceForEnergy() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalanceForEnergy() => clearField(2);
  @$pb.TagNumber(2)
  Account_Frozen ensureFrozenBalanceForEnergy() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get latestConsumeTimeForEnergy => $_getI64(2);
  @$pb.TagNumber(3)
  set latestConsumeTimeForEnergy($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatestConsumeTimeForEnergy() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestConsumeTimeForEnergy() => clearField(3);

  /// Frozen balance provided by other accounts to this account
  @$pb.TagNumber(4)
  $fixnum.Int64 get acquiredDelegatedFrozenBalanceForEnergy => $_getI64(3);
  @$pb.TagNumber(4)
  set acquiredDelegatedFrozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAcquiredDelegatedFrozenBalanceForEnergy() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcquiredDelegatedFrozenBalanceForEnergy() => clearField(4);

  /// Frozen balances provided to other accounts
  @$pb.TagNumber(5)
  $fixnum.Int64 get delegatedFrozenBalanceForEnergy => $_getI64(4);
  @$pb.TagNumber(5)
  set delegatedFrozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDelegatedFrozenBalanceForEnergy() => $_has(4);
  @$pb.TagNumber(5)
  void clearDelegatedFrozenBalanceForEnergy() => clearField(5);

  /// storage resource, get from market
  @$pb.TagNumber(6)
  $fixnum.Int64 get storageLimit => $_getI64(5);
  @$pb.TagNumber(6)
  set storageLimit($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStorageLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearStorageLimit() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get storageUsage => $_getI64(6);
  @$pb.TagNumber(7)
  set storageUsage($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStorageUsage() => $_has(6);
  @$pb.TagNumber(7)
  void clearStorageUsage() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get latestExchangeStorageTime => $_getI64(7);
  @$pb.TagNumber(8)
  set latestExchangeStorageTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLatestExchangeStorageTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearLatestExchangeStorageTime() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get energyWindowSize => $_getI64(8);
  @$pb.TagNumber(9)
  set energyWindowSize($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEnergyWindowSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnergyWindowSize() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get delegatedFrozenV2BalanceForEnergy => $_getI64(9);
  @$pb.TagNumber(10)
  set delegatedFrozenV2BalanceForEnergy($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDelegatedFrozenV2BalanceForEnergy() => $_has(9);
  @$pb.TagNumber(10)
  void clearDelegatedFrozenV2BalanceForEnergy() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get acquiredDelegatedFrozenV2BalanceForEnergy => $_getI64(10);
  @$pb.TagNumber(11)
  set acquiredDelegatedFrozenV2BalanceForEnergy($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAcquiredDelegatedFrozenV2BalanceForEnergy() => $_has(10);
  @$pb.TagNumber(11)
  void clearAcquiredDelegatedFrozenV2BalanceForEnergy() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get energyWindowOptimized => $_getBF(11);
  @$pb.TagNumber(12)
  set energyWindowOptimized($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasEnergyWindowOptimized() => $_has(11);
  @$pb.TagNumber(12)
  void clearEnergyWindowOptimized() => clearField(12);
}

class Account_FreezeV2 extends $pb.GeneratedMessage {
  factory Account_FreezeV2({
    $14.ResourceCode? type,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  Account_FreezeV2._() : super();
  factory Account_FreezeV2.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_FreezeV2.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account.FreezeV2', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<$14.ResourceCode>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account_FreezeV2 clone() => Account_FreezeV2()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account_FreezeV2 copyWith(void Function(Account_FreezeV2) updates) => super.copyWith((message) => updates(message as Account_FreezeV2)) as Account_FreezeV2;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account_FreezeV2 create() => Account_FreezeV2._();
  Account_FreezeV2 createEmptyInstance() => create();
  static $pb.PbList<Account_FreezeV2> createRepeated() => $pb.PbList<Account_FreezeV2>();
  @$core.pragma('dart2js:noInline')
  static Account_FreezeV2 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_FreezeV2>(create);
  static Account_FreezeV2? _defaultInstance;

  @$pb.TagNumber(1)
  $14.ResourceCode get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($14.ResourceCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}

class Account_UnFreezeV2 extends $pb.GeneratedMessage {
  factory Account_UnFreezeV2({
    $14.ResourceCode? type,
    $fixnum.Int64? unfreezeAmount,
    $fixnum.Int64? unfreezeExpireTime,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (unfreezeAmount != null) {
      $result.unfreezeAmount = unfreezeAmount;
    }
    if (unfreezeExpireTime != null) {
      $result.unfreezeExpireTime = unfreezeExpireTime;
    }
    return $result;
  }
  Account_UnFreezeV2._() : super();
  factory Account_UnFreezeV2.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_UnFreezeV2.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account.UnFreezeV2', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<$14.ResourceCode>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..aInt64(3, _omitFieldNames ? '' : 'unfreezeAmount')
    ..aInt64(4, _omitFieldNames ? '' : 'unfreezeExpireTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account_UnFreezeV2 clone() => Account_UnFreezeV2()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account_UnFreezeV2 copyWith(void Function(Account_UnFreezeV2) updates) => super.copyWith((message) => updates(message as Account_UnFreezeV2)) as Account_UnFreezeV2;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account_UnFreezeV2 create() => Account_UnFreezeV2._();
  Account_UnFreezeV2 createEmptyInstance() => create();
  static $pb.PbList<Account_UnFreezeV2> createRepeated() => $pb.PbList<Account_UnFreezeV2>();
  @$core.pragma('dart2js:noInline')
  static Account_UnFreezeV2 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_UnFreezeV2>(create);
  static Account_UnFreezeV2? _defaultInstance;

  @$pb.TagNumber(1)
  $14.ResourceCode get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($14.ResourceCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get unfreezeAmount => $_getI64(1);
  @$pb.TagNumber(3)
  set unfreezeAmount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnfreezeAmount() => $_has(1);
  @$pb.TagNumber(3)
  void clearUnfreezeAmount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get unfreezeExpireTime => $_getI64(2);
  @$pb.TagNumber(4)
  set unfreezeExpireTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasUnfreezeExpireTime() => $_has(2);
  @$pb.TagNumber(4)
  void clearUnfreezeExpireTime() => clearField(4);
}

/// Account
class Account extends $pb.GeneratedMessage {
  factory Account({
    $core.List<$core.int>? accountName,
    AccountType? type,
    $core.List<$core.int>? address,
    $fixnum.Int64? balance,
    $core.Iterable<Vote>? votes,
    $core.Map<$core.String, $fixnum.Int64>? asset,
    $core.Iterable<Account_Frozen>? frozen,
    $fixnum.Int64? netUsage,
    $fixnum.Int64? createTime,
    $fixnum.Int64? latestOprationTime,
    $fixnum.Int64? allowance,
    $fixnum.Int64? latestWithdrawTime,
    $core.List<$core.int>? code,
    $core.bool? isWitness,
    $core.bool? isCommittee,
    $core.Iterable<Account_Frozen>? frozenSupply,
    $core.List<$core.int>? assetIssuedName,
    $core.Map<$core.String, $fixnum.Int64>? latestAssetOperationTime,
    $fixnum.Int64? freeNetUsage,
    $core.Map<$core.String, $fixnum.Int64>? freeAssetNetUsage,
    $fixnum.Int64? latestConsumeTime,
    $fixnum.Int64? latestConsumeFreeTime,
    $core.List<$core.int>? accountId,
    $fixnum.Int64? netWindowSize,
    $core.bool? netWindowOptimized,
    Account_AccountResource? accountResource,
    $core.List<$core.int>? codeHash,
    Permission? ownerPermission,
    Permission? witnessPermission,
    $core.Iterable<Permission>? activePermission,
    $core.Iterable<Account_FreezeV2>? frozenV2,
    $core.Iterable<Account_UnFreezeV2>? unfrozenV2,
    $fixnum.Int64? delegatedFrozenV2BalanceForBandwidth,
    $fixnum.Int64? acquiredDelegatedFrozenV2BalanceForBandwidth,
    $fixnum.Int64? acquiredDelegatedFrozenBalanceForBandwidth,
    $fixnum.Int64? delegatedFrozenBalanceForBandwidth,
    $fixnum.Int64? oldTronPower,
    Account_Frozen? tronPower,
    $core.Map<$core.String, $fixnum.Int64>? assetV2,
    $core.List<$core.int>? assetIssuedID,
    $core.Map<$core.String, $fixnum.Int64>? latestAssetOperationTimeV2,
    $core.Map<$core.String, $fixnum.Int64>? freeAssetNetUsageV2,
    $core.bool? assetOptimized,
  }) {
    final $result = create();
    if (accountName != null) {
      $result.accountName = accountName;
    }
    if (type != null) {
      $result.type = type;
    }
    if (address != null) {
      $result.address = address;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (votes != null) {
      $result.votes.addAll(votes);
    }
    if (asset != null) {
      $result.asset.addAll(asset);
    }
    if (frozen != null) {
      $result.frozen.addAll(frozen);
    }
    if (netUsage != null) {
      $result.netUsage = netUsage;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (latestOprationTime != null) {
      $result.latestOprationTime = latestOprationTime;
    }
    if (allowance != null) {
      $result.allowance = allowance;
    }
    if (latestWithdrawTime != null) {
      $result.latestWithdrawTime = latestWithdrawTime;
    }
    if (code != null) {
      $result.code = code;
    }
    if (isWitness != null) {
      $result.isWitness = isWitness;
    }
    if (isCommittee != null) {
      $result.isCommittee = isCommittee;
    }
    if (frozenSupply != null) {
      $result.frozenSupply.addAll(frozenSupply);
    }
    if (assetIssuedName != null) {
      $result.assetIssuedName = assetIssuedName;
    }
    if (latestAssetOperationTime != null) {
      $result.latestAssetOperationTime.addAll(latestAssetOperationTime);
    }
    if (freeNetUsage != null) {
      $result.freeNetUsage = freeNetUsage;
    }
    if (freeAssetNetUsage != null) {
      $result.freeAssetNetUsage.addAll(freeAssetNetUsage);
    }
    if (latestConsumeTime != null) {
      $result.latestConsumeTime = latestConsumeTime;
    }
    if (latestConsumeFreeTime != null) {
      $result.latestConsumeFreeTime = latestConsumeFreeTime;
    }
    if (accountId != null) {
      $result.accountId = accountId;
    }
    if (netWindowSize != null) {
      $result.netWindowSize = netWindowSize;
    }
    if (netWindowOptimized != null) {
      $result.netWindowOptimized = netWindowOptimized;
    }
    if (accountResource != null) {
      $result.accountResource = accountResource;
    }
    if (codeHash != null) {
      $result.codeHash = codeHash;
    }
    if (ownerPermission != null) {
      $result.ownerPermission = ownerPermission;
    }
    if (witnessPermission != null) {
      $result.witnessPermission = witnessPermission;
    }
    if (activePermission != null) {
      $result.activePermission.addAll(activePermission);
    }
    if (frozenV2 != null) {
      $result.frozenV2.addAll(frozenV2);
    }
    if (unfrozenV2 != null) {
      $result.unfrozenV2.addAll(unfrozenV2);
    }
    if (delegatedFrozenV2BalanceForBandwidth != null) {
      $result.delegatedFrozenV2BalanceForBandwidth = delegatedFrozenV2BalanceForBandwidth;
    }
    if (acquiredDelegatedFrozenV2BalanceForBandwidth != null) {
      $result.acquiredDelegatedFrozenV2BalanceForBandwidth = acquiredDelegatedFrozenV2BalanceForBandwidth;
    }
    if (acquiredDelegatedFrozenBalanceForBandwidth != null) {
      $result.acquiredDelegatedFrozenBalanceForBandwidth = acquiredDelegatedFrozenBalanceForBandwidth;
    }
    if (delegatedFrozenBalanceForBandwidth != null) {
      $result.delegatedFrozenBalanceForBandwidth = delegatedFrozenBalanceForBandwidth;
    }
    if (oldTronPower != null) {
      $result.oldTronPower = oldTronPower;
    }
    if (tronPower != null) {
      $result.tronPower = tronPower;
    }
    if (assetV2 != null) {
      $result.assetV2.addAll(assetV2);
    }
    if (assetIssuedID != null) {
      $result.assetIssuedID = assetIssuedID;
    }
    if (latestAssetOperationTimeV2 != null) {
      $result.latestAssetOperationTimeV2.addAll(latestAssetOperationTimeV2);
    }
    if (freeAssetNetUsageV2 != null) {
      $result.freeAssetNetUsageV2.addAll(freeAssetNetUsageV2);
    }
    if (assetOptimized != null) {
      $result.assetOptimized = assetOptimized;
    }
    return $result;
  }
  Account._() : super();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'accountName', $pb.PbFieldType.OY)
    ..e<AccountType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: AccountType.Normal, valueOf: AccountType.valueOf, enumValues: AccountType.values)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'balance')
    ..pc<Vote>(5, _omitFieldNames ? '' : 'votes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..m<$core.String, $fixnum.Int64>(6, _omitFieldNames ? '' : 'asset', entryClassName: 'Account.AssetEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..pc<Account_Frozen>(7, _omitFieldNames ? '' : 'frozen', $pb.PbFieldType.PM, subBuilder: Account_Frozen.create)
    ..aInt64(8, _omitFieldNames ? '' : 'netUsage')
    ..aInt64(9, _omitFieldNames ? '' : 'createTime')
    ..aInt64(10, _omitFieldNames ? '' : 'latestOprationTime')
    ..aInt64(11, _omitFieldNames ? '' : 'allowance')
    ..aInt64(12, _omitFieldNames ? '' : 'latestWithdrawTime')
    ..a<$core.List<$core.int>>(13, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OY)
    ..aOB(14, _omitFieldNames ? '' : 'isWitness')
    ..aOB(15, _omitFieldNames ? '' : 'isCommittee')
    ..pc<Account_Frozen>(16, _omitFieldNames ? '' : 'frozenSupply', $pb.PbFieldType.PM, subBuilder: Account_Frozen.create)
    ..a<$core.List<$core.int>>(17, _omitFieldNames ? '' : 'assetIssuedName', $pb.PbFieldType.OY)
    ..m<$core.String, $fixnum.Int64>(18, _omitFieldNames ? '' : 'latestAssetOperationTime', entryClassName: 'Account.LatestAssetOperationTimeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(19, _omitFieldNames ? '' : 'freeNetUsage')
    ..m<$core.String, $fixnum.Int64>(20, _omitFieldNames ? '' : 'freeAssetNetUsage', entryClassName: 'Account.FreeAssetNetUsageEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(21, _omitFieldNames ? '' : 'latestConsumeTime')
    ..aInt64(22, _omitFieldNames ? '' : 'latestConsumeFreeTime')
    ..a<$core.List<$core.int>>(23, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OY)
    ..aInt64(24, _omitFieldNames ? '' : 'netWindowSize')
    ..aOB(25, _omitFieldNames ? '' : 'netWindowOptimized')
    ..aOM<Account_AccountResource>(26, _omitFieldNames ? '' : 'accountResource', subBuilder: Account_AccountResource.create)
    ..a<$core.List<$core.int>>(30, _omitFieldNames ? '' : 'codeHash', $pb.PbFieldType.OY, protoName: 'codeHash')
    ..aOM<Permission>(31, _omitFieldNames ? '' : 'ownerPermission', subBuilder: Permission.create)
    ..aOM<Permission>(32, _omitFieldNames ? '' : 'witnessPermission', subBuilder: Permission.create)
    ..pc<Permission>(33, _omitFieldNames ? '' : 'activePermission', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..pc<Account_FreezeV2>(34, _omitFieldNames ? '' : 'frozenV2', $pb.PbFieldType.PM, protoName: 'frozenV2', subBuilder: Account_FreezeV2.create)
    ..pc<Account_UnFreezeV2>(35, _omitFieldNames ? '' : 'unfrozenV2', $pb.PbFieldType.PM, protoName: 'unfrozenV2', subBuilder: Account_UnFreezeV2.create)
    ..aInt64(36, _omitFieldNames ? '' : 'delegatedFrozenV2BalanceForBandwidth', protoName: 'delegated_frozenV2_balance_for_bandwidth')
    ..aInt64(37, _omitFieldNames ? '' : 'acquiredDelegatedFrozenV2BalanceForBandwidth', protoName: 'acquired_delegated_frozenV2_balance_for_bandwidth')
    ..aInt64(41, _omitFieldNames ? '' : 'acquiredDelegatedFrozenBalanceForBandwidth')
    ..aInt64(42, _omitFieldNames ? '' : 'delegatedFrozenBalanceForBandwidth')
    ..aInt64(46, _omitFieldNames ? '' : 'oldTronPower')
    ..aOM<Account_Frozen>(47, _omitFieldNames ? '' : 'tronPower', subBuilder: Account_Frozen.create)
    ..m<$core.String, $fixnum.Int64>(56, _omitFieldNames ? '' : 'assetV2', protoName: 'assetV2', entryClassName: 'Account.AssetV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..a<$core.List<$core.int>>(57, _omitFieldNames ? '' : 'assetIssuedID', $pb.PbFieldType.OY, protoName: 'asset_issued_ID')
    ..m<$core.String, $fixnum.Int64>(58, _omitFieldNames ? '' : 'latestAssetOperationTimeV2', protoName: 'latest_asset_operation_timeV2', entryClassName: 'Account.LatestAssetOperationTimeV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(59, _omitFieldNames ? '' : 'freeAssetNetUsageV2', protoName: 'free_asset_net_usageV2', entryClassName: 'Account.FreeAssetNetUsageV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aOB(60, _omitFieldNames ? '' : 'assetOptimized')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account clone() => Account()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account)) as Account;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account? _defaultInstance;

  /// account nick name
  @$pb.TagNumber(1)
  $core.List<$core.int> get accountName => $_getN(0);
  @$pb.TagNumber(1)
  set accountName($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountName() => clearField(1);

  @$pb.TagNumber(2)
  AccountType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(AccountType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// the create address
  @$pb.TagNumber(3)
  $core.List<$core.int> get address => $_getN(2);
  @$pb.TagNumber(3)
  set address($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  /// the trx balance
  @$pb.TagNumber(4)
  $fixnum.Int64 get balance => $_getI64(3);
  @$pb.TagNumber(4)
  set balance($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBalance() => $_has(3);
  @$pb.TagNumber(4)
  void clearBalance() => clearField(4);

  /// the votes
  @$pb.TagNumber(5)
  $core.List<Vote> get votes => $_getList(4);

  /// the other asset owned by this account
  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get asset => $_getMap(5);

  /// the frozen balance for bandwidth
  @$pb.TagNumber(7)
  $core.List<Account_Frozen> get frozen => $_getList(6);

  /// bandwidth, get from frozen
  @$pb.TagNumber(8)
  $fixnum.Int64 get netUsage => $_getI64(7);
  @$pb.TagNumber(8)
  set netUsage($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNetUsage() => $_has(7);
  @$pb.TagNumber(8)
  void clearNetUsage() => clearField(8);

  /// this account create time
  @$pb.TagNumber(9)
  $fixnum.Int64 get createTime => $_getI64(8);
  @$pb.TagNumber(9)
  set createTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreateTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreateTime() => clearField(9);

  /// this last operation time, including transfer, voting and so on. //FIXME fix grammar
  @$pb.TagNumber(10)
  $fixnum.Int64 get latestOprationTime => $_getI64(9);
  @$pb.TagNumber(10)
  set latestOprationTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLatestOprationTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearLatestOprationTime() => clearField(10);

  /// witness block producing allowance
  @$pb.TagNumber(11)
  $fixnum.Int64 get allowance => $_getI64(10);
  @$pb.TagNumber(11)
  set allowance($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAllowance() => $_has(10);
  @$pb.TagNumber(11)
  void clearAllowance() => clearField(11);

  /// last withdraw time
  @$pb.TagNumber(12)
  $fixnum.Int64 get latestWithdrawTime => $_getI64(11);
  @$pb.TagNumber(12)
  set latestWithdrawTime($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLatestWithdrawTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearLatestWithdrawTime() => clearField(12);

  /// not used so far
  @$pb.TagNumber(13)
  $core.List<$core.int> get code => $_getN(12);
  @$pb.TagNumber(13)
  set code($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCode() => $_has(12);
  @$pb.TagNumber(13)
  void clearCode() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isWitness => $_getBF(13);
  @$pb.TagNumber(14)
  set isWitness($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsWitness() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsWitness() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isCommittee => $_getBF(14);
  @$pb.TagNumber(15)
  set isCommittee($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsCommittee() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsCommittee() => clearField(15);

  /// frozen asset(for asset issuer)
  @$pb.TagNumber(16)
  $core.List<Account_Frozen> get frozenSupply => $_getList(15);

  /// asset_issued_name
  @$pb.TagNumber(17)
  $core.List<$core.int> get assetIssuedName => $_getN(16);
  @$pb.TagNumber(17)
  set assetIssuedName($core.List<$core.int> v) { $_setBytes(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasAssetIssuedName() => $_has(16);
  @$pb.TagNumber(17)
  void clearAssetIssuedName() => clearField(17);

  @$pb.TagNumber(18)
  $core.Map<$core.String, $fixnum.Int64> get latestAssetOperationTime => $_getMap(17);

  @$pb.TagNumber(19)
  $fixnum.Int64 get freeNetUsage => $_getI64(18);
  @$pb.TagNumber(19)
  set freeNetUsage($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasFreeNetUsage() => $_has(18);
  @$pb.TagNumber(19)
  void clearFreeNetUsage() => clearField(19);

  @$pb.TagNumber(20)
  $core.Map<$core.String, $fixnum.Int64> get freeAssetNetUsage => $_getMap(19);

  @$pb.TagNumber(21)
  $fixnum.Int64 get latestConsumeTime => $_getI64(20);
  @$pb.TagNumber(21)
  set latestConsumeTime($fixnum.Int64 v) { $_setInt64(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasLatestConsumeTime() => $_has(20);
  @$pb.TagNumber(21)
  void clearLatestConsumeTime() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get latestConsumeFreeTime => $_getI64(21);
  @$pb.TagNumber(22)
  set latestConsumeFreeTime($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasLatestConsumeFreeTime() => $_has(21);
  @$pb.TagNumber(22)
  void clearLatestConsumeFreeTime() => clearField(22);

  /// the identity of this account, case insensitive
  @$pb.TagNumber(23)
  $core.List<$core.int> get accountId => $_getN(22);
  @$pb.TagNumber(23)
  set accountId($core.List<$core.int> v) { $_setBytes(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAccountId() => $_has(22);
  @$pb.TagNumber(23)
  void clearAccountId() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get netWindowSize => $_getI64(23);
  @$pb.TagNumber(24)
  set netWindowSize($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasNetWindowSize() => $_has(23);
  @$pb.TagNumber(24)
  void clearNetWindowSize() => clearField(24);

  @$pb.TagNumber(25)
  $core.bool get netWindowOptimized => $_getBF(24);
  @$pb.TagNumber(25)
  set netWindowOptimized($core.bool v) { $_setBool(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasNetWindowOptimized() => $_has(24);
  @$pb.TagNumber(25)
  void clearNetWindowOptimized() => clearField(25);

  @$pb.TagNumber(26)
  Account_AccountResource get accountResource => $_getN(25);
  @$pb.TagNumber(26)
  set accountResource(Account_AccountResource v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasAccountResource() => $_has(25);
  @$pb.TagNumber(26)
  void clearAccountResource() => clearField(26);
  @$pb.TagNumber(26)
  Account_AccountResource ensureAccountResource() => $_ensure(25);

  @$pb.TagNumber(30)
  $core.List<$core.int> get codeHash => $_getN(26);
  @$pb.TagNumber(30)
  set codeHash($core.List<$core.int> v) { $_setBytes(26, v); }
  @$pb.TagNumber(30)
  $core.bool hasCodeHash() => $_has(26);
  @$pb.TagNumber(30)
  void clearCodeHash() => clearField(30);

  @$pb.TagNumber(31)
  Permission get ownerPermission => $_getN(27);
  @$pb.TagNumber(31)
  set ownerPermission(Permission v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasOwnerPermission() => $_has(27);
  @$pb.TagNumber(31)
  void clearOwnerPermission() => clearField(31);
  @$pb.TagNumber(31)
  Permission ensureOwnerPermission() => $_ensure(27);

  @$pb.TagNumber(32)
  Permission get witnessPermission => $_getN(28);
  @$pb.TagNumber(32)
  set witnessPermission(Permission v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasWitnessPermission() => $_has(28);
  @$pb.TagNumber(32)
  void clearWitnessPermission() => clearField(32);
  @$pb.TagNumber(32)
  Permission ensureWitnessPermission() => $_ensure(28);

  @$pb.TagNumber(33)
  $core.List<Permission> get activePermission => $_getList(29);

  @$pb.TagNumber(34)
  $core.List<Account_FreezeV2> get frozenV2 => $_getList(30);

  @$pb.TagNumber(35)
  $core.List<Account_UnFreezeV2> get unfrozenV2 => $_getList(31);

  @$pb.TagNumber(36)
  $fixnum.Int64 get delegatedFrozenV2BalanceForBandwidth => $_getI64(32);
  @$pb.TagNumber(36)
  set delegatedFrozenV2BalanceForBandwidth($fixnum.Int64 v) { $_setInt64(32, v); }
  @$pb.TagNumber(36)
  $core.bool hasDelegatedFrozenV2BalanceForBandwidth() => $_has(32);
  @$pb.TagNumber(36)
  void clearDelegatedFrozenV2BalanceForBandwidth() => clearField(36);

  @$pb.TagNumber(37)
  $fixnum.Int64 get acquiredDelegatedFrozenV2BalanceForBandwidth => $_getI64(33);
  @$pb.TagNumber(37)
  set acquiredDelegatedFrozenV2BalanceForBandwidth($fixnum.Int64 v) { $_setInt64(33, v); }
  @$pb.TagNumber(37)
  $core.bool hasAcquiredDelegatedFrozenV2BalanceForBandwidth() => $_has(33);
  @$pb.TagNumber(37)
  void clearAcquiredDelegatedFrozenV2BalanceForBandwidth() => clearField(37);

  /// Frozen balance provided by other accounts to this account
  @$pb.TagNumber(41)
  $fixnum.Int64 get acquiredDelegatedFrozenBalanceForBandwidth => $_getI64(34);
  @$pb.TagNumber(41)
  set acquiredDelegatedFrozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(34, v); }
  @$pb.TagNumber(41)
  $core.bool hasAcquiredDelegatedFrozenBalanceForBandwidth() => $_has(34);
  @$pb.TagNumber(41)
  void clearAcquiredDelegatedFrozenBalanceForBandwidth() => clearField(41);

  /// Freeze and provide balances to other accounts
  @$pb.TagNumber(42)
  $fixnum.Int64 get delegatedFrozenBalanceForBandwidth => $_getI64(35);
  @$pb.TagNumber(42)
  set delegatedFrozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(35, v); }
  @$pb.TagNumber(42)
  $core.bool hasDelegatedFrozenBalanceForBandwidth() => $_has(35);
  @$pb.TagNumber(42)
  void clearDelegatedFrozenBalanceForBandwidth() => clearField(42);

  @$pb.TagNumber(46)
  $fixnum.Int64 get oldTronPower => $_getI64(36);
  @$pb.TagNumber(46)
  set oldTronPower($fixnum.Int64 v) { $_setInt64(36, v); }
  @$pb.TagNumber(46)
  $core.bool hasOldTronPower() => $_has(36);
  @$pb.TagNumber(46)
  void clearOldTronPower() => clearField(46);

  @$pb.TagNumber(47)
  Account_Frozen get tronPower => $_getN(37);
  @$pb.TagNumber(47)
  set tronPower(Account_Frozen v) { setField(47, v); }
  @$pb.TagNumber(47)
  $core.bool hasTronPower() => $_has(37);
  @$pb.TagNumber(47)
  void clearTronPower() => clearField(47);
  @$pb.TagNumber(47)
  Account_Frozen ensureTronPower() => $_ensure(37);

  /// the other asset owned by this account，key is assetId
  @$pb.TagNumber(56)
  $core.Map<$core.String, $fixnum.Int64> get assetV2 => $_getMap(38);

  @$pb.TagNumber(57)
  $core.List<$core.int> get assetIssuedID => $_getN(39);
  @$pb.TagNumber(57)
  set assetIssuedID($core.List<$core.int> v) { $_setBytes(39, v); }
  @$pb.TagNumber(57)
  $core.bool hasAssetIssuedID() => $_has(39);
  @$pb.TagNumber(57)
  void clearAssetIssuedID() => clearField(57);

  @$pb.TagNumber(58)
  $core.Map<$core.String, $fixnum.Int64> get latestAssetOperationTimeV2 => $_getMap(40);

  @$pb.TagNumber(59)
  $core.Map<$core.String, $fixnum.Int64> get freeAssetNetUsageV2 => $_getMap(41);

  @$pb.TagNumber(60)
  $core.bool get assetOptimized => $_getBF(42);
  @$pb.TagNumber(60)
  set assetOptimized($core.bool v) { $_setBool(42, v); }
  @$pb.TagNumber(60)
  $core.bool hasAssetOptimized() => $_has(42);
  @$pb.TagNumber(60)
  void clearAssetOptimized() => clearField(60);
}

class Key extends $pb.GeneratedMessage {
  factory Key({
    $core.List<$core.int>? address,
    $fixnum.Int64? weight,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    return $result;
  }
  Key._() : super();
  factory Key.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Key.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Key', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'weight')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Key clone() => Key()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Key copyWith(void Function(Key) updates) => super.copyWith((message) => updates(message as Key)) as Key;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Key create() => Key._();
  Key createEmptyInstance() => create();
  static $pb.PbList<Key> createRepeated() => $pb.PbList<Key>();
  @$core.pragma('dart2js:noInline')
  static Key getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Key>(create);
  static Key? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get weight => $_getI64(1);
  @$pb.TagNumber(2)
  set weight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeight() => clearField(2);
}

class DelegatedResource extends $pb.GeneratedMessage {
  factory DelegatedResource({
    $core.List<$core.int>? from,
    $core.List<$core.int>? to,
    $fixnum.Int64? frozenBalanceForBandwidth,
    $fixnum.Int64? frozenBalanceForEnergy,
    $fixnum.Int64? expireTimeForBandwidth,
    $fixnum.Int64? expireTimeForEnergy,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (frozenBalanceForBandwidth != null) {
      $result.frozenBalanceForBandwidth = frozenBalanceForBandwidth;
    }
    if (frozenBalanceForEnergy != null) {
      $result.frozenBalanceForEnergy = frozenBalanceForEnergy;
    }
    if (expireTimeForBandwidth != null) {
      $result.expireTimeForBandwidth = expireTimeForBandwidth;
    }
    if (expireTimeForEnergy != null) {
      $result.expireTimeForEnergy = expireTimeForEnergy;
    }
    return $result;
  }
  DelegatedResource._() : super();
  factory DelegatedResource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelegatedResource', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'to', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'frozenBalanceForBandwidth')
    ..aInt64(4, _omitFieldNames ? '' : 'frozenBalanceForEnergy')
    ..aInt64(5, _omitFieldNames ? '' : 'expireTimeForBandwidth')
    ..aInt64(6, _omitFieldNames ? '' : 'expireTimeForEnergy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelegatedResource clone() => DelegatedResource()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelegatedResource copyWith(void Function(DelegatedResource) updates) => super.copyWith((message) => updates(message as DelegatedResource)) as DelegatedResource;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegatedResource create() => DelegatedResource._();
  DelegatedResource createEmptyInstance() => create();
  static $pb.PbList<DelegatedResource> createRepeated() => $pb.PbList<DelegatedResource>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResource>(create);
  static DelegatedResource? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get to => $_getN(1);
  @$pb.TagNumber(2)
  set to($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get frozenBalanceForBandwidth => $_getI64(2);
  @$pb.TagNumber(3)
  set frozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrozenBalanceForBandwidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrozenBalanceForBandwidth() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get frozenBalanceForEnergy => $_getI64(3);
  @$pb.TagNumber(4)
  set frozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrozenBalanceForEnergy() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrozenBalanceForEnergy() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expireTimeForBandwidth => $_getI64(4);
  @$pb.TagNumber(5)
  set expireTimeForBandwidth($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpireTimeForBandwidth() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireTimeForBandwidth() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expireTimeForEnergy => $_getI64(5);
  @$pb.TagNumber(6)
  set expireTimeForEnergy($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpireTimeForEnergy() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpireTimeForEnergy() => clearField(6);
}

class authority extends $pb.GeneratedMessage {
  factory authority({
    AccountId? account,
    $core.List<$core.int>? permissionName,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (permissionName != null) {
      $result.permissionName = permissionName;
    }
    return $result;
  }
  authority._() : super();
  factory authority.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory authority.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'authority', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<AccountId>(1, _omitFieldNames ? '' : 'account', subBuilder: AccountId.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'permissionName', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  authority clone() => authority()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  authority copyWith(void Function(authority) updates) => super.copyWith((message) => updates(message as authority)) as authority;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static authority create() => authority._();
  authority createEmptyInstance() => create();
  static $pb.PbList<authority> createRepeated() => $pb.PbList<authority>();
  @$core.pragma('dart2js:noInline')
  static authority getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<authority>(create);
  static authority? _defaultInstance;

  @$pb.TagNumber(1)
  AccountId get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(AccountId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  AccountId ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get permissionName => $_getN(1);
  @$pb.TagNumber(2)
  set permissionName($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionName() => clearField(2);
}

class Permission extends $pb.GeneratedMessage {
  factory Permission({
    Permission_PermissionType? type,
    $core.int? id,
    $core.String? permissionName,
    $fixnum.Int64? threshold,
    $core.int? parentId,
    $core.List<$core.int>? operations,
    $core.Iterable<Key>? keys,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (id != null) {
      $result.id = id;
    }
    if (permissionName != null) {
      $result.permissionName = permissionName;
    }
    if (threshold != null) {
      $result.threshold = threshold;
    }
    if (parentId != null) {
      $result.parentId = parentId;
    }
    if (operations != null) {
      $result.operations = operations;
    }
    if (keys != null) {
      $result.keys.addAll(keys);
    }
    return $result;
  }
  Permission._() : super();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Permission', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<Permission_PermissionType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Permission_PermissionType.Owner, valueOf: Permission_PermissionType.valueOf, enumValues: Permission_PermissionType.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'permissionName')
    ..aInt64(4, _omitFieldNames ? '' : 'threshold')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'parentId', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'operations', $pb.PbFieldType.OY)
    ..pc<Key>(7, _omitFieldNames ? '' : 'keys', $pb.PbFieldType.PM, subBuilder: Key.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission)) as Permission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  Permission_PermissionType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Permission_PermissionType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get permissionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set permissionName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissionName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get threshold => $_getI64(3);
  @$pb.TagNumber(4)
  set threshold($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasThreshold() => $_has(3);
  @$pb.TagNumber(4)
  void clearThreshold() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get parentId => $_getIZ(4);
  @$pb.TagNumber(5)
  set parentId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get operations => $_getN(5);
  @$pb.TagNumber(6)
  set operations($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOperations() => $_has(5);
  @$pb.TagNumber(6)
  void clearOperations() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Key> get keys => $_getList(6);
}

/// Witness
class Witness extends $pb.GeneratedMessage {
  factory Witness({
    $core.List<$core.int>? address,
    $fixnum.Int64? voteCount,
    $core.List<$core.int>? pubKey,
    $core.String? url,
    $fixnum.Int64? totalProduced,
    $fixnum.Int64? totalMissed,
    $fixnum.Int64? latestBlockNum,
    $fixnum.Int64? latestSlotNum,
    $core.bool? isJobs,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (voteCount != null) {
      $result.voteCount = voteCount;
    }
    if (pubKey != null) {
      $result.pubKey = pubKey;
    }
    if (url != null) {
      $result.url = url;
    }
    if (totalProduced != null) {
      $result.totalProduced = totalProduced;
    }
    if (totalMissed != null) {
      $result.totalMissed = totalMissed;
    }
    if (latestBlockNum != null) {
      $result.latestBlockNum = latestBlockNum;
    }
    if (latestSlotNum != null) {
      $result.latestSlotNum = latestSlotNum;
    }
    if (isJobs != null) {
      $result.isJobs = isJobs;
    }
    return $result;
  }
  Witness._() : super();
  factory Witness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Witness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Witness', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'voteCount', protoName: 'voteCount')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'pubKey', $pb.PbFieldType.OY, protoName: 'pubKey')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aInt64(5, _omitFieldNames ? '' : 'totalProduced', protoName: 'totalProduced')
    ..aInt64(6, _omitFieldNames ? '' : 'totalMissed', protoName: 'totalMissed')
    ..aInt64(7, _omitFieldNames ? '' : 'latestBlockNum', protoName: 'latestBlockNum')
    ..aInt64(8, _omitFieldNames ? '' : 'latestSlotNum', protoName: 'latestSlotNum')
    ..aOB(9, _omitFieldNames ? '' : 'isJobs', protoName: 'isJobs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Witness clone() => Witness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Witness copyWith(void Function(Witness) updates) => super.copyWith((message) => updates(message as Witness)) as Witness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Witness create() => Witness._();
  Witness createEmptyInstance() => create();
  static $pb.PbList<Witness> createRepeated() => $pb.PbList<Witness>();
  @$core.pragma('dart2js:noInline')
  static Witness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Witness>(create);
  static Witness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pubKey => $_getN(2);
  @$pb.TagNumber(3)
  set pubKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalProduced => $_getI64(4);
  @$pb.TagNumber(5)
  set totalProduced($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalProduced() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalProduced() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalMissed => $_getI64(5);
  @$pb.TagNumber(6)
  set totalMissed($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalMissed() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalMissed() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get latestBlockNum => $_getI64(6);
  @$pb.TagNumber(7)
  set latestBlockNum($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLatestBlockNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearLatestBlockNum() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get latestSlotNum => $_getI64(7);
  @$pb.TagNumber(8)
  set latestSlotNum($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLatestSlotNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearLatestSlotNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isJobs => $_getBF(8);
  @$pb.TagNumber(9)
  set isJobs($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsJobs() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsJobs() => clearField(9);
}

/// Vote Change
class Votes extends $pb.GeneratedMessage {
  factory Votes({
    $core.List<$core.int>? address,
    $core.Iterable<Vote>? oldVotes,
    $core.Iterable<Vote>? newVotes,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (oldVotes != null) {
      $result.oldVotes.addAll(oldVotes);
    }
    if (newVotes != null) {
      $result.newVotes.addAll(newVotes);
    }
    return $result;
  }
  Votes._() : super();
  factory Votes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Votes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Votes', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..pc<Vote>(2, _omitFieldNames ? '' : 'oldVotes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..pc<Vote>(3, _omitFieldNames ? '' : 'newVotes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Votes clone() => Votes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Votes copyWith(void Function(Votes) updates) => super.copyWith((message) => updates(message as Votes)) as Votes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Votes create() => Votes._();
  Votes createEmptyInstance() => create();
  static $pb.PbList<Votes> createRepeated() => $pb.PbList<Votes>();
  @$core.pragma('dart2js:noInline')
  static Votes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Votes>(create);
  static Votes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Vote> get oldVotes => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Vote> get newVotes => $_getList(2);
}

class TXOutput extends $pb.GeneratedMessage {
  factory TXOutput({
    $fixnum.Int64? value,
    $core.List<$core.int>? pubKeyHash,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (pubKeyHash != null) {
      $result.pubKeyHash = pubKeyHash;
    }
    return $result;
  }
  TXOutput._() : super();
  factory TXOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TXOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'pubKeyHash', $pb.PbFieldType.OY, protoName: 'pubKeyHash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TXOutput clone() => TXOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TXOutput copyWith(void Function(TXOutput) updates) => super.copyWith((message) => updates(message as TXOutput)) as TXOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TXOutput create() => TXOutput._();
  TXOutput createEmptyInstance() => create();
  static $pb.PbList<TXOutput> createRepeated() => $pb.PbList<TXOutput>();
  @$core.pragma('dart2js:noInline')
  static TXOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXOutput>(create);
  static TXOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pubKeyHash => $_getN(1);
  @$pb.TagNumber(2)
  set pubKeyHash($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPubKeyHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPubKeyHash() => clearField(2);
}

class TXInput_raw extends $pb.GeneratedMessage {
  factory TXInput_raw({
    $core.List<$core.int>? txID,
    $fixnum.Int64? vout,
    $core.List<$core.int>? pubKey,
  }) {
    final $result = create();
    if (txID != null) {
      $result.txID = txID;
    }
    if (vout != null) {
      $result.vout = vout;
    }
    if (pubKey != null) {
      $result.pubKey = pubKey;
    }
    return $result;
  }
  TXInput_raw._() : super();
  factory TXInput_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXInput_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TXInput.raw', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'txID', $pb.PbFieldType.OY, protoName: 'txID')
    ..aInt64(2, _omitFieldNames ? '' : 'vout')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'pubKey', $pb.PbFieldType.OY, protoName: 'pubKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TXInput_raw clone() => TXInput_raw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TXInput_raw copyWith(void Function(TXInput_raw) updates) => super.copyWith((message) => updates(message as TXInput_raw)) as TXInput_raw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TXInput_raw create() => TXInput_raw._();
  TXInput_raw createEmptyInstance() => create();
  static $pb.PbList<TXInput_raw> createRepeated() => $pb.PbList<TXInput_raw>();
  @$core.pragma('dart2js:noInline')
  static TXInput_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXInput_raw>(create);
  static TXInput_raw? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get txID => $_getN(0);
  @$pb.TagNumber(1)
  set txID($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get vout => $_getI64(1);
  @$pb.TagNumber(2)
  set vout($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pubKey => $_getN(2);
  @$pb.TagNumber(3)
  set pubKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);
}

class TXInput extends $pb.GeneratedMessage {
  factory TXInput({
    TXInput_raw? rawData,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (rawData != null) {
      $result.rawData = rawData;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  TXInput._() : super();
  factory TXInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TXInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<TXInput_raw>(1, _omitFieldNames ? '' : 'rawData', subBuilder: TXInput_raw.create)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TXInput clone() => TXInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TXInput copyWith(void Function(TXInput) updates) => super.copyWith((message) => updates(message as TXInput)) as TXInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TXInput create() => TXInput._();
  TXInput createEmptyInstance() => create();
  static $pb.PbList<TXInput> createRepeated() => $pb.PbList<TXInput>();
  @$core.pragma('dart2js:noInline')
  static TXInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXInput>(create);
  static TXInput? _defaultInstance;

  @$pb.TagNumber(1)
  TXInput_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(TXInput_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  TXInput_raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(4)
  void clearSignature() => clearField(4);
}

class TXOutputs extends $pb.GeneratedMessage {
  factory TXOutputs({
    $core.Iterable<TXOutput>? outputs,
  }) {
    final $result = create();
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    return $result;
  }
  TXOutputs._() : super();
  factory TXOutputs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXOutputs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TXOutputs', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<TXOutput>(1, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM, subBuilder: TXOutput.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TXOutputs clone() => TXOutputs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TXOutputs copyWith(void Function(TXOutputs) updates) => super.copyWith((message) => updates(message as TXOutputs)) as TXOutputs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TXOutputs create() => TXOutputs._();
  TXOutputs createEmptyInstance() => create();
  static $pb.PbList<TXOutputs> createRepeated() => $pb.PbList<TXOutputs>();
  @$core.pragma('dart2js:noInline')
  static TXOutputs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXOutputs>(create);
  static TXOutputs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TXOutput> get outputs => $_getList(0);
}

class ResourceReceipt extends $pb.GeneratedMessage {
  factory ResourceReceipt({
    $fixnum.Int64? energyUsage,
    $fixnum.Int64? energyFee,
    $fixnum.Int64? originEnergyUsage,
    $fixnum.Int64? energyUsageTotal,
    $fixnum.Int64? netUsage,
    $fixnum.Int64? netFee,
    Transaction_Result_contractResult? result,
    $fixnum.Int64? energyPenaltyTotal,
  }) {
    final $result = create();
    if (energyUsage != null) {
      $result.energyUsage = energyUsage;
    }
    if (energyFee != null) {
      $result.energyFee = energyFee;
    }
    if (originEnergyUsage != null) {
      $result.originEnergyUsage = originEnergyUsage;
    }
    if (energyUsageTotal != null) {
      $result.energyUsageTotal = energyUsageTotal;
    }
    if (netUsage != null) {
      $result.netUsage = netUsage;
    }
    if (netFee != null) {
      $result.netFee = netFee;
    }
    if (result != null) {
      $result.result = result;
    }
    if (energyPenaltyTotal != null) {
      $result.energyPenaltyTotal = energyPenaltyTotal;
    }
    return $result;
  }
  ResourceReceipt._() : super();
  factory ResourceReceipt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceReceipt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResourceReceipt', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'energyUsage')
    ..aInt64(2, _omitFieldNames ? '' : 'energyFee')
    ..aInt64(3, _omitFieldNames ? '' : 'originEnergyUsage')
    ..aInt64(4, _omitFieldNames ? '' : 'energyUsageTotal')
    ..aInt64(5, _omitFieldNames ? '' : 'netUsage')
    ..aInt64(6, _omitFieldNames ? '' : 'netFee')
    ..e<Transaction_Result_contractResult>(7, _omitFieldNames ? '' : 'result', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Result_contractResult.DEFAULT, valueOf: Transaction_Result_contractResult.valueOf, enumValues: Transaction_Result_contractResult.values)
    ..aInt64(8, _omitFieldNames ? '' : 'energyPenaltyTotal')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceReceipt clone() => ResourceReceipt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceReceipt copyWith(void Function(ResourceReceipt) updates) => super.copyWith((message) => updates(message as ResourceReceipt)) as ResourceReceipt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceReceipt create() => ResourceReceipt._();
  ResourceReceipt createEmptyInstance() => create();
  static $pb.PbList<ResourceReceipt> createRepeated() => $pb.PbList<ResourceReceipt>();
  @$core.pragma('dart2js:noInline')
  static ResourceReceipt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceReceipt>(create);
  static ResourceReceipt? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get energyUsage => $_getI64(0);
  @$pb.TagNumber(1)
  set energyUsage($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnergyUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnergyUsage() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energyFee => $_getI64(1);
  @$pb.TagNumber(2)
  set energyFee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnergyFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergyFee() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get originEnergyUsage => $_getI64(2);
  @$pb.TagNumber(3)
  set originEnergyUsage($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginEnergyUsage() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginEnergyUsage() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get energyUsageTotal => $_getI64(3);
  @$pb.TagNumber(4)
  set energyUsageTotal($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnergyUsageTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnergyUsageTotal() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get netUsage => $_getI64(4);
  @$pb.TagNumber(5)
  set netUsage($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNetUsage() => $_has(4);
  @$pb.TagNumber(5)
  void clearNetUsage() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get netFee => $_getI64(5);
  @$pb.TagNumber(6)
  set netFee($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNetFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetFee() => clearField(6);

  @$pb.TagNumber(7)
  Transaction_Result_contractResult get result => $_getN(6);
  @$pb.TagNumber(7)
  set result(Transaction_Result_contractResult v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasResult() => $_has(6);
  @$pb.TagNumber(7)
  void clearResult() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get energyPenaltyTotal => $_getI64(7);
  @$pb.TagNumber(8)
  set energyPenaltyTotal($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEnergyPenaltyTotal() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnergyPenaltyTotal() => clearField(8);
}

class MarketOrderDetail extends $pb.GeneratedMessage {
  factory MarketOrderDetail({
    $core.List<$core.int>? makerOrderId,
    $core.List<$core.int>? takerOrderId,
    $fixnum.Int64? fillSellQuantity,
    $fixnum.Int64? fillBuyQuantity,
  }) {
    final $result = create();
    if (makerOrderId != null) {
      $result.makerOrderId = makerOrderId;
    }
    if (takerOrderId != null) {
      $result.takerOrderId = takerOrderId;
    }
    if (fillSellQuantity != null) {
      $result.fillSellQuantity = fillSellQuantity;
    }
    if (fillBuyQuantity != null) {
      $result.fillBuyQuantity = fillBuyQuantity;
    }
    return $result;
  }
  MarketOrderDetail._() : super();
  factory MarketOrderDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketOrderDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarketOrderDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'makerOrderId', $pb.PbFieldType.OY, protoName: 'makerOrderId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'takerOrderId', $pb.PbFieldType.OY, protoName: 'takerOrderId')
    ..aInt64(3, _omitFieldNames ? '' : 'fillSellQuantity', protoName: 'fillSellQuantity')
    ..aInt64(4, _omitFieldNames ? '' : 'fillBuyQuantity', protoName: 'fillBuyQuantity')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketOrderDetail clone() => MarketOrderDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketOrderDetail copyWith(void Function(MarketOrderDetail) updates) => super.copyWith((message) => updates(message as MarketOrderDetail)) as MarketOrderDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOrderDetail create() => MarketOrderDetail._();
  MarketOrderDetail createEmptyInstance() => create();
  static $pb.PbList<MarketOrderDetail> createRepeated() => $pb.PbList<MarketOrderDetail>();
  @$core.pragma('dart2js:noInline')
  static MarketOrderDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketOrderDetail>(create);
  static MarketOrderDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get makerOrderId => $_getN(0);
  @$pb.TagNumber(1)
  set makerOrderId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMakerOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMakerOrderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get takerOrderId => $_getN(1);
  @$pb.TagNumber(2)
  set takerOrderId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTakerOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTakerOrderId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fillSellQuantity => $_getI64(2);
  @$pb.TagNumber(3)
  set fillSellQuantity($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFillSellQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearFillSellQuantity() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get fillBuyQuantity => $_getI64(3);
  @$pb.TagNumber(4)
  set fillBuyQuantity($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFillBuyQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearFillBuyQuantity() => clearField(4);
}

class Transaction_Contract extends $pb.GeneratedMessage {
  factory Transaction_Contract({
    Transaction_Contract_ContractType? type,
    $12.Any? parameter,
    $core.List<$core.int>? provider,
    $core.List<$core.int>? contractName,
    $core.int? permissionId,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (parameter != null) {
      $result.parameter = parameter;
    }
    if (provider != null) {
      $result.provider = provider;
    }
    if (contractName != null) {
      $result.contractName = contractName;
    }
    if (permissionId != null) {
      $result.permissionId = permissionId;
    }
    return $result;
  }
  Transaction_Contract._() : super();
  factory Transaction_Contract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_Contract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction.Contract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<Transaction_Contract_ContractType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Contract_ContractType.AccountCreateContract, valueOf: Transaction_Contract_ContractType.valueOf, enumValues: Transaction_Contract_ContractType.values)
    ..aOM<$12.Any>(2, _omitFieldNames ? '' : 'parameter', subBuilder: $12.Any.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'provider', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ContractName', $pb.PbFieldType.OY, protoName: 'ContractName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'PermissionId', $pb.PbFieldType.O3, protoName: 'Permission_id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction_Contract clone() => Transaction_Contract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction_Contract copyWith(void Function(Transaction_Contract) updates) => super.copyWith((message) => updates(message as Transaction_Contract)) as Transaction_Contract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_Contract create() => Transaction_Contract._();
  Transaction_Contract createEmptyInstance() => create();
  static $pb.PbList<Transaction_Contract> createRepeated() => $pb.PbList<Transaction_Contract>();
  @$core.pragma('dart2js:noInline')
  static Transaction_Contract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_Contract>(create);
  static Transaction_Contract? _defaultInstance;

  @$pb.TagNumber(1)
  Transaction_Contract_ContractType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Transaction_Contract_ContractType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $12.Any get parameter => $_getN(1);
  @$pb.TagNumber(2)
  set parameter($12.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParameter() => $_has(1);
  @$pb.TagNumber(2)
  void clearParameter() => clearField(2);
  @$pb.TagNumber(2)
  $12.Any ensureParameter() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get provider => $_getN(2);
  @$pb.TagNumber(3)
  set provider($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProvider() => $_has(2);
  @$pb.TagNumber(3)
  void clearProvider() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get contractName => $_getN(3);
  @$pb.TagNumber(4)
  set contractName($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContractName() => $_has(3);
  @$pb.TagNumber(4)
  void clearContractName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get permissionId => $_getIZ(4);
  @$pb.TagNumber(5)
  set permissionId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPermissionId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermissionId() => clearField(5);
}

class Transaction_Result extends $pb.GeneratedMessage {
  factory Transaction_Result({
    $fixnum.Int64? fee,
    Transaction_Result_code? ret,
    Transaction_Result_contractResult? contractRet,
    $core.String? assetIssueID,
    $fixnum.Int64? withdrawAmount,
    $fixnum.Int64? unfreezeAmount,
    $fixnum.Int64? exchangeReceivedAmount,
    $fixnum.Int64? exchangeInjectAnotherAmount,
    $fixnum.Int64? exchangeWithdrawAnotherAmount,
    $fixnum.Int64? exchangeId,
    $fixnum.Int64? shieldedTransactionFee,
    $core.List<$core.int>? orderId,
    $core.Iterable<MarketOrderDetail>? orderDetails,
    $fixnum.Int64? withdrawExpireAmount,
    $core.Map<$core.String, $fixnum.Int64>? cancelUnfreezeV2Amount,
  }) {
    final $result = create();
    if (fee != null) {
      $result.fee = fee;
    }
    if (ret != null) {
      $result.ret = ret;
    }
    if (contractRet != null) {
      $result.contractRet = contractRet;
    }
    if (assetIssueID != null) {
      $result.assetIssueID = assetIssueID;
    }
    if (withdrawAmount != null) {
      $result.withdrawAmount = withdrawAmount;
    }
    if (unfreezeAmount != null) {
      $result.unfreezeAmount = unfreezeAmount;
    }
    if (exchangeReceivedAmount != null) {
      $result.exchangeReceivedAmount = exchangeReceivedAmount;
    }
    if (exchangeInjectAnotherAmount != null) {
      $result.exchangeInjectAnotherAmount = exchangeInjectAnotherAmount;
    }
    if (exchangeWithdrawAnotherAmount != null) {
      $result.exchangeWithdrawAnotherAmount = exchangeWithdrawAnotherAmount;
    }
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (shieldedTransactionFee != null) {
      $result.shieldedTransactionFee = shieldedTransactionFee;
    }
    if (orderId != null) {
      $result.orderId = orderId;
    }
    if (orderDetails != null) {
      $result.orderDetails.addAll(orderDetails);
    }
    if (withdrawExpireAmount != null) {
      $result.withdrawExpireAmount = withdrawExpireAmount;
    }
    if (cancelUnfreezeV2Amount != null) {
      $result.cancelUnfreezeV2Amount.addAll(cancelUnfreezeV2Amount);
    }
    return $result;
  }
  Transaction_Result._() : super();
  factory Transaction_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction.Result', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fee')
    ..e<Transaction_Result_code>(2, _omitFieldNames ? '' : 'ret', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Result_code.SUCESS, valueOf: Transaction_Result_code.valueOf, enumValues: Transaction_Result_code.values)
    ..e<Transaction_Result_contractResult>(3, _omitFieldNames ? '' : 'contractRet', $pb.PbFieldType.OE, protoName: 'contractRet', defaultOrMaker: Transaction_Result_contractResult.DEFAULT, valueOf: Transaction_Result_contractResult.valueOf, enumValues: Transaction_Result_contractResult.values)
    ..aOS(14, _omitFieldNames ? '' : 'assetIssueID', protoName: 'assetIssueID')
    ..aInt64(15, _omitFieldNames ? '' : 'withdrawAmount')
    ..aInt64(16, _omitFieldNames ? '' : 'unfreezeAmount')
    ..aInt64(18, _omitFieldNames ? '' : 'exchangeReceivedAmount')
    ..aInt64(19, _omitFieldNames ? '' : 'exchangeInjectAnotherAmount')
    ..aInt64(20, _omitFieldNames ? '' : 'exchangeWithdrawAnotherAmount')
    ..aInt64(21, _omitFieldNames ? '' : 'exchangeId')
    ..aInt64(22, _omitFieldNames ? '' : 'shieldedTransactionFee')
    ..a<$core.List<$core.int>>(25, _omitFieldNames ? '' : 'orderId', $pb.PbFieldType.OY, protoName: 'orderId')
    ..pc<MarketOrderDetail>(26, _omitFieldNames ? '' : 'orderDetails', $pb.PbFieldType.PM, protoName: 'orderDetails', subBuilder: MarketOrderDetail.create)
    ..aInt64(27, _omitFieldNames ? '' : 'withdrawExpireAmount')
    ..m<$core.String, $fixnum.Int64>(28, _omitFieldNames ? '' : 'cancelUnfreezeV2Amount', protoName: 'cancel_unfreezeV2_amount', entryClassName: 'Transaction.Result.CancelUnfreezeV2AmountEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction_Result clone() => Transaction_Result()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction_Result copyWith(void Function(Transaction_Result) updates) => super.copyWith((message) => updates(message as Transaction_Result)) as Transaction_Result;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_Result create() => Transaction_Result._();
  Transaction_Result createEmptyInstance() => create();
  static $pb.PbList<Transaction_Result> createRepeated() => $pb.PbList<Transaction_Result>();
  @$core.pragma('dart2js:noInline')
  static Transaction_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_Result>(create);
  static Transaction_Result? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => clearField(1);

  @$pb.TagNumber(2)
  Transaction_Result_code get ret => $_getN(1);
  @$pb.TagNumber(2)
  set ret(Transaction_Result_code v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRet() => $_has(1);
  @$pb.TagNumber(2)
  void clearRet() => clearField(2);

  @$pb.TagNumber(3)
  Transaction_Result_contractResult get contractRet => $_getN(2);
  @$pb.TagNumber(3)
  set contractRet(Transaction_Result_contractResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContractRet() => $_has(2);
  @$pb.TagNumber(3)
  void clearContractRet() => clearField(3);

  @$pb.TagNumber(14)
  $core.String get assetIssueID => $_getSZ(3);
  @$pb.TagNumber(14)
  set assetIssueID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(14)
  $core.bool hasAssetIssueID() => $_has(3);
  @$pb.TagNumber(14)
  void clearAssetIssueID() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get withdrawAmount => $_getI64(4);
  @$pb.TagNumber(15)
  set withdrawAmount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(15)
  $core.bool hasWithdrawAmount() => $_has(4);
  @$pb.TagNumber(15)
  void clearWithdrawAmount() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unfreezeAmount => $_getI64(5);
  @$pb.TagNumber(16)
  set unfreezeAmount($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnfreezeAmount() => $_has(5);
  @$pb.TagNumber(16)
  void clearUnfreezeAmount() => clearField(16);

  @$pb.TagNumber(18)
  $fixnum.Int64 get exchangeReceivedAmount => $_getI64(6);
  @$pb.TagNumber(18)
  set exchangeReceivedAmount($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(18)
  $core.bool hasExchangeReceivedAmount() => $_has(6);
  @$pb.TagNumber(18)
  void clearExchangeReceivedAmount() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get exchangeInjectAnotherAmount => $_getI64(7);
  @$pb.TagNumber(19)
  set exchangeInjectAnotherAmount($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(19)
  $core.bool hasExchangeInjectAnotherAmount() => $_has(7);
  @$pb.TagNumber(19)
  void clearExchangeInjectAnotherAmount() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get exchangeWithdrawAnotherAmount => $_getI64(8);
  @$pb.TagNumber(20)
  set exchangeWithdrawAnotherAmount($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(20)
  $core.bool hasExchangeWithdrawAnotherAmount() => $_has(8);
  @$pb.TagNumber(20)
  void clearExchangeWithdrawAnotherAmount() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get exchangeId => $_getI64(9);
  @$pb.TagNumber(21)
  set exchangeId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(21)
  $core.bool hasExchangeId() => $_has(9);
  @$pb.TagNumber(21)
  void clearExchangeId() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get shieldedTransactionFee => $_getI64(10);
  @$pb.TagNumber(22)
  set shieldedTransactionFee($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(22)
  $core.bool hasShieldedTransactionFee() => $_has(10);
  @$pb.TagNumber(22)
  void clearShieldedTransactionFee() => clearField(22);

  @$pb.TagNumber(25)
  $core.List<$core.int> get orderId => $_getN(11);
  @$pb.TagNumber(25)
  set orderId($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(25)
  $core.bool hasOrderId() => $_has(11);
  @$pb.TagNumber(25)
  void clearOrderId() => clearField(25);

  @$pb.TagNumber(26)
  $core.List<MarketOrderDetail> get orderDetails => $_getList(12);

  @$pb.TagNumber(27)
  $fixnum.Int64 get withdrawExpireAmount => $_getI64(13);
  @$pb.TagNumber(27)
  set withdrawExpireAmount($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(27)
  $core.bool hasWithdrawExpireAmount() => $_has(13);
  @$pb.TagNumber(27)
  void clearWithdrawExpireAmount() => clearField(27);

  @$pb.TagNumber(28)
  $core.Map<$core.String, $fixnum.Int64> get cancelUnfreezeV2Amount => $_getMap(14);
}

class Transaction_raw extends $pb.GeneratedMessage {
  factory Transaction_raw({
    $core.List<$core.int>? refBlockBytes,
    $fixnum.Int64? refBlockNum,
    $core.List<$core.int>? refBlockHash,
    $fixnum.Int64? expiration,
    $core.Iterable<authority>? auths,
    $core.List<$core.int>? data,
    $core.Iterable<Transaction_Contract>? contract,
    $core.List<$core.int>? scripts,
    $fixnum.Int64? timestamp,
    $fixnum.Int64? feeLimit,
  }) {
    final $result = create();
    if (refBlockBytes != null) {
      $result.refBlockBytes = refBlockBytes;
    }
    if (refBlockNum != null) {
      $result.refBlockNum = refBlockNum;
    }
    if (refBlockHash != null) {
      $result.refBlockHash = refBlockHash;
    }
    if (expiration != null) {
      $result.expiration = expiration;
    }
    if (auths != null) {
      $result.auths.addAll(auths);
    }
    if (data != null) {
      $result.data = data;
    }
    if (contract != null) {
      $result.contract.addAll(contract);
    }
    if (scripts != null) {
      $result.scripts = scripts;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (feeLimit != null) {
      $result.feeLimit = feeLimit;
    }
    return $result;
  }
  Transaction_raw._() : super();
  factory Transaction_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction.raw', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'refBlockBytes', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'refBlockNum')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'refBlockHash', $pb.PbFieldType.OY)
    ..aInt64(8, _omitFieldNames ? '' : 'expiration')
    ..pc<authority>(9, _omitFieldNames ? '' : 'auths', $pb.PbFieldType.PM, subBuilder: authority.create)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..pc<Transaction_Contract>(11, _omitFieldNames ? '' : 'contract', $pb.PbFieldType.PM, subBuilder: Transaction_Contract.create)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'scripts', $pb.PbFieldType.OY)
    ..aInt64(14, _omitFieldNames ? '' : 'timestamp')
    ..aInt64(18, _omitFieldNames ? '' : 'feeLimit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction_raw clone() => Transaction_raw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction_raw copyWith(void Function(Transaction_raw) updates) => super.copyWith((message) => updates(message as Transaction_raw)) as Transaction_raw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_raw create() => Transaction_raw._();
  Transaction_raw createEmptyInstance() => create();
  static $pb.PbList<Transaction_raw> createRepeated() => $pb.PbList<Transaction_raw>();
  @$core.pragma('dart2js:noInline')
  static Transaction_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_raw>(create);
  static Transaction_raw? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get refBlockBytes => $_getN(0);
  @$pb.TagNumber(1)
  set refBlockBytes($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefBlockBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefBlockBytes() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refBlockNum => $_getI64(1);
  @$pb.TagNumber(3)
  set refBlockNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefBlockNum() => $_has(1);
  @$pb.TagNumber(3)
  void clearRefBlockNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get refBlockHash => $_getN(2);
  @$pb.TagNumber(4)
  set refBlockHash($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefBlockHash() => $_has(2);
  @$pb.TagNumber(4)
  void clearRefBlockHash() => clearField(4);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expiration => $_getI64(3);
  @$pb.TagNumber(8)
  set expiration($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(8)
  $core.bool hasExpiration() => $_has(3);
  @$pb.TagNumber(8)
  void clearExpiration() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<authority> get auths => $_getList(4);

  /// data not used
  @$pb.TagNumber(10)
  $core.List<$core.int> get data => $_getN(5);
  @$pb.TagNumber(10)
  set data($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(10)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(10)
  void clearData() => clearField(10);

  /// only support size = 1,  repeated list here for extension
  @$pb.TagNumber(11)
  $core.List<Transaction_Contract> get contract => $_getList(6);

  /// scripts not used
  @$pb.TagNumber(12)
  $core.List<$core.int> get scripts => $_getN(7);
  @$pb.TagNumber(12)
  set scripts($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(12)
  $core.bool hasScripts() => $_has(7);
  @$pb.TagNumber(12)
  void clearScripts() => clearField(12);

  @$pb.TagNumber(14)
  $fixnum.Int64 get timestamp => $_getI64(8);
  @$pb.TagNumber(14)
  set timestamp($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(14)
  $core.bool hasTimestamp() => $_has(8);
  @$pb.TagNumber(14)
  void clearTimestamp() => clearField(14);

  @$pb.TagNumber(18)
  $fixnum.Int64 get feeLimit => $_getI64(9);
  @$pb.TagNumber(18)
  set feeLimit($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(18)
  $core.bool hasFeeLimit() => $_has(9);
  @$pb.TagNumber(18)
  void clearFeeLimit() => clearField(18);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    Transaction_raw? rawData,
    $core.Iterable<$core.List<$core.int>>? signature,
    $core.Iterable<Transaction_Result>? ret,
  }) {
    final $result = create();
    if (rawData != null) {
      $result.rawData = rawData;
    }
    if (signature != null) {
      $result.signature.addAll(signature);
    }
    if (ret != null) {
      $result.ret.addAll(ret);
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<Transaction_raw>(1, _omitFieldNames ? '' : 'rawData', subBuilder: Transaction_raw.create)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.PY)
    ..pc<Transaction_Result>(5, _omitFieldNames ? '' : 'ret', $pb.PbFieldType.PM, subBuilder: Transaction_Result.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction)) as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(1)
  Transaction_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(Transaction_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  Transaction_raw ensureRawData() => $_ensure(0);

  /// only support size = 1,  repeated list here for muti-sig extension
  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get signature => $_getList(1);

  @$pb.TagNumber(5)
  $core.List<Transaction_Result> get ret => $_getList(2);
}

class TransactionInfo_Log extends $pb.GeneratedMessage {
  factory TransactionInfo_Log({
    $core.List<$core.int>? address,
    $core.Iterable<$core.List<$core.int>>? topics,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (topics != null) {
      $result.topics.addAll(topics);
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  TransactionInfo_Log._() : super();
  factory TransactionInfo_Log.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo_Log.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInfo.Log', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'topics', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInfo_Log clone() => TransactionInfo_Log()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInfo_Log copyWith(void Function(TransactionInfo_Log) updates) => super.copyWith((message) => updates(message as TransactionInfo_Log)) as TransactionInfo_Log;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfo_Log create() => TransactionInfo_Log._();
  TransactionInfo_Log createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo_Log> createRepeated() => $pb.PbList<TransactionInfo_Log>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo_Log getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo_Log>(create);
  static TransactionInfo_Log? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get topics => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class TransactionInfo extends $pb.GeneratedMessage {
  factory TransactionInfo({
    $core.List<$core.int>? id,
    $fixnum.Int64? fee,
    $fixnum.Int64? blockNumber,
    $fixnum.Int64? blockTimeStamp,
    $core.Iterable<$core.List<$core.int>>? contractResult,
    $core.List<$core.int>? contractAddress,
    ResourceReceipt? receipt,
    $core.Iterable<TransactionInfo_Log>? log,
    TransactionInfo_code? result,
    $core.List<$core.int>? resMessage,
    $core.String? assetIssueID,
    $fixnum.Int64? withdrawAmount,
    $fixnum.Int64? unfreezeAmount,
    $core.Iterable<InternalTransaction>? internalTransactions,
    $fixnum.Int64? exchangeReceivedAmount,
    $fixnum.Int64? exchangeInjectAnotherAmount,
    $fixnum.Int64? exchangeWithdrawAnotherAmount,
    $fixnum.Int64? exchangeId,
    $fixnum.Int64? shieldedTransactionFee,
    $core.List<$core.int>? orderId,
    $core.Iterable<MarketOrderDetail>? orderDetails,
    $fixnum.Int64? packingFee,
    $fixnum.Int64? withdrawExpireAmount,
    $core.Map<$core.String, $fixnum.Int64>? cancelUnfreezeV2Amount,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (blockNumber != null) {
      $result.blockNumber = blockNumber;
    }
    if (blockTimeStamp != null) {
      $result.blockTimeStamp = blockTimeStamp;
    }
    if (contractResult != null) {
      $result.contractResult.addAll(contractResult);
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    if (receipt != null) {
      $result.receipt = receipt;
    }
    if (log != null) {
      $result.log.addAll(log);
    }
    if (result != null) {
      $result.result = result;
    }
    if (resMessage != null) {
      $result.resMessage = resMessage;
    }
    if (assetIssueID != null) {
      $result.assetIssueID = assetIssueID;
    }
    if (withdrawAmount != null) {
      $result.withdrawAmount = withdrawAmount;
    }
    if (unfreezeAmount != null) {
      $result.unfreezeAmount = unfreezeAmount;
    }
    if (internalTransactions != null) {
      $result.internalTransactions.addAll(internalTransactions);
    }
    if (exchangeReceivedAmount != null) {
      $result.exchangeReceivedAmount = exchangeReceivedAmount;
    }
    if (exchangeInjectAnotherAmount != null) {
      $result.exchangeInjectAnotherAmount = exchangeInjectAnotherAmount;
    }
    if (exchangeWithdrawAnotherAmount != null) {
      $result.exchangeWithdrawAnotherAmount = exchangeWithdrawAnotherAmount;
    }
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (shieldedTransactionFee != null) {
      $result.shieldedTransactionFee = shieldedTransactionFee;
    }
    if (orderId != null) {
      $result.orderId = orderId;
    }
    if (orderDetails != null) {
      $result.orderDetails.addAll(orderDetails);
    }
    if (packingFee != null) {
      $result.packingFee = packingFee;
    }
    if (withdrawExpireAmount != null) {
      $result.withdrawExpireAmount = withdrawExpireAmount;
    }
    if (cancelUnfreezeV2Amount != null) {
      $result.cancelUnfreezeV2Amount.addAll(cancelUnfreezeV2Amount);
    }
    return $result;
  }
  TransactionInfo._() : super();
  factory TransactionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'fee')
    ..aInt64(3, _omitFieldNames ? '' : 'blockNumber', protoName: 'blockNumber')
    ..aInt64(4, _omitFieldNames ? '' : 'blockTimeStamp', protoName: 'blockTimeStamp')
    ..p<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'contractResult', $pb.PbFieldType.PY, protoName: 'contractResult')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..aOM<ResourceReceipt>(7, _omitFieldNames ? '' : 'receipt', subBuilder: ResourceReceipt.create)
    ..pc<TransactionInfo_Log>(8, _omitFieldNames ? '' : 'log', $pb.PbFieldType.PM, subBuilder: TransactionInfo_Log.create)
    ..e<TransactionInfo_code>(9, _omitFieldNames ? '' : 'result', $pb.PbFieldType.OE, defaultOrMaker: TransactionInfo_code.SUCESS, valueOf: TransactionInfo_code.valueOf, enumValues: TransactionInfo_code.values)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'resMessage', $pb.PbFieldType.OY, protoName: 'resMessage')
    ..aOS(14, _omitFieldNames ? '' : 'assetIssueID', protoName: 'assetIssueID')
    ..aInt64(15, _omitFieldNames ? '' : 'withdrawAmount')
    ..aInt64(16, _omitFieldNames ? '' : 'unfreezeAmount')
    ..pc<InternalTransaction>(17, _omitFieldNames ? '' : 'internalTransactions', $pb.PbFieldType.PM, subBuilder: InternalTransaction.create)
    ..aInt64(18, _omitFieldNames ? '' : 'exchangeReceivedAmount')
    ..aInt64(19, _omitFieldNames ? '' : 'exchangeInjectAnotherAmount')
    ..aInt64(20, _omitFieldNames ? '' : 'exchangeWithdrawAnotherAmount')
    ..aInt64(21, _omitFieldNames ? '' : 'exchangeId')
    ..aInt64(22, _omitFieldNames ? '' : 'shieldedTransactionFee')
    ..a<$core.List<$core.int>>(25, _omitFieldNames ? '' : 'orderId', $pb.PbFieldType.OY, protoName: 'orderId')
    ..pc<MarketOrderDetail>(26, _omitFieldNames ? '' : 'orderDetails', $pb.PbFieldType.PM, protoName: 'orderDetails', subBuilder: MarketOrderDetail.create)
    ..aInt64(27, _omitFieldNames ? '' : 'packingFee', protoName: 'packingFee')
    ..aInt64(28, _omitFieldNames ? '' : 'withdrawExpireAmount')
    ..m<$core.String, $fixnum.Int64>(29, _omitFieldNames ? '' : 'cancelUnfreezeV2Amount', protoName: 'cancel_unfreezeV2_amount', entryClassName: 'TransactionInfo.CancelUnfreezeV2AmountEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInfo clone() => TransactionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInfo copyWith(void Function(TransactionInfo) updates) => super.copyWith((message) => updates(message as TransactionInfo)) as TransactionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfo create() => TransactionInfo._();
  TransactionInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo> createRepeated() => $pb.PbList<TransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo>(create);
  static TransactionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set blockNumber($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockNumber() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockTimeStamp => $_getI64(3);
  @$pb.TagNumber(4)
  set blockTimeStamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBlockTimeStamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockTimeStamp() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get contractResult => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get contractAddress => $_getN(5);
  @$pb.TagNumber(6)
  set contractAddress($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContractAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearContractAddress() => clearField(6);

  @$pb.TagNumber(7)
  ResourceReceipt get receipt => $_getN(6);
  @$pb.TagNumber(7)
  set receipt(ResourceReceipt v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasReceipt() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceipt() => clearField(7);
  @$pb.TagNumber(7)
  ResourceReceipt ensureReceipt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<TransactionInfo_Log> get log => $_getList(7);

  @$pb.TagNumber(9)
  TransactionInfo_code get result => $_getN(8);
  @$pb.TagNumber(9)
  set result(TransactionInfo_code v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasResult() => $_has(8);
  @$pb.TagNumber(9)
  void clearResult() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get resMessage => $_getN(9);
  @$pb.TagNumber(10)
  set resMessage($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasResMessage() => $_has(9);
  @$pb.TagNumber(10)
  void clearResMessage() => clearField(10);

  @$pb.TagNumber(14)
  $core.String get assetIssueID => $_getSZ(10);
  @$pb.TagNumber(14)
  set assetIssueID($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(14)
  $core.bool hasAssetIssueID() => $_has(10);
  @$pb.TagNumber(14)
  void clearAssetIssueID() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get withdrawAmount => $_getI64(11);
  @$pb.TagNumber(15)
  set withdrawAmount($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(15)
  $core.bool hasWithdrawAmount() => $_has(11);
  @$pb.TagNumber(15)
  void clearWithdrawAmount() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unfreezeAmount => $_getI64(12);
  @$pb.TagNumber(16)
  set unfreezeAmount($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnfreezeAmount() => $_has(12);
  @$pb.TagNumber(16)
  void clearUnfreezeAmount() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<InternalTransaction> get internalTransactions => $_getList(13);

  @$pb.TagNumber(18)
  $fixnum.Int64 get exchangeReceivedAmount => $_getI64(14);
  @$pb.TagNumber(18)
  set exchangeReceivedAmount($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(18)
  $core.bool hasExchangeReceivedAmount() => $_has(14);
  @$pb.TagNumber(18)
  void clearExchangeReceivedAmount() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get exchangeInjectAnotherAmount => $_getI64(15);
  @$pb.TagNumber(19)
  set exchangeInjectAnotherAmount($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(19)
  $core.bool hasExchangeInjectAnotherAmount() => $_has(15);
  @$pb.TagNumber(19)
  void clearExchangeInjectAnotherAmount() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get exchangeWithdrawAnotherAmount => $_getI64(16);
  @$pb.TagNumber(20)
  set exchangeWithdrawAnotherAmount($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(20)
  $core.bool hasExchangeWithdrawAnotherAmount() => $_has(16);
  @$pb.TagNumber(20)
  void clearExchangeWithdrawAnotherAmount() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get exchangeId => $_getI64(17);
  @$pb.TagNumber(21)
  set exchangeId($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(21)
  $core.bool hasExchangeId() => $_has(17);
  @$pb.TagNumber(21)
  void clearExchangeId() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get shieldedTransactionFee => $_getI64(18);
  @$pb.TagNumber(22)
  set shieldedTransactionFee($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(22)
  $core.bool hasShieldedTransactionFee() => $_has(18);
  @$pb.TagNumber(22)
  void clearShieldedTransactionFee() => clearField(22);

  @$pb.TagNumber(25)
  $core.List<$core.int> get orderId => $_getN(19);
  @$pb.TagNumber(25)
  set orderId($core.List<$core.int> v) { $_setBytes(19, v); }
  @$pb.TagNumber(25)
  $core.bool hasOrderId() => $_has(19);
  @$pb.TagNumber(25)
  void clearOrderId() => clearField(25);

  @$pb.TagNumber(26)
  $core.List<MarketOrderDetail> get orderDetails => $_getList(20);

  @$pb.TagNumber(27)
  $fixnum.Int64 get packingFee => $_getI64(21);
  @$pb.TagNumber(27)
  set packingFee($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(27)
  $core.bool hasPackingFee() => $_has(21);
  @$pb.TagNumber(27)
  void clearPackingFee() => clearField(27);

  @$pb.TagNumber(28)
  $fixnum.Int64 get withdrawExpireAmount => $_getI64(22);
  @$pb.TagNumber(28)
  set withdrawExpireAmount($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(28)
  $core.bool hasWithdrawExpireAmount() => $_has(22);
  @$pb.TagNumber(28)
  void clearWithdrawExpireAmount() => clearField(28);

  @$pb.TagNumber(29)
  $core.Map<$core.String, $fixnum.Int64> get cancelUnfreezeV2Amount => $_getMap(23);
}

class TransactionRet extends $pb.GeneratedMessage {
  factory TransactionRet({
    $fixnum.Int64? blockNumber,
    $fixnum.Int64? blockTimeStamp,
    $core.Iterable<TransactionInfo>? transactioninfo,
  }) {
    final $result = create();
    if (blockNumber != null) {
      $result.blockNumber = blockNumber;
    }
    if (blockTimeStamp != null) {
      $result.blockTimeStamp = blockTimeStamp;
    }
    if (transactioninfo != null) {
      $result.transactioninfo.addAll(transactioninfo);
    }
    return $result;
  }
  TransactionRet._() : super();
  factory TransactionRet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionRet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionRet', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'blockNumber', protoName: 'blockNumber')
    ..aInt64(2, _omitFieldNames ? '' : 'blockTimeStamp', protoName: 'blockTimeStamp')
    ..pc<TransactionInfo>(3, _omitFieldNames ? '' : 'transactioninfo', $pb.PbFieldType.PM, subBuilder: TransactionInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionRet clone() => TransactionRet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionRet copyWith(void Function(TransactionRet) updates) => super.copyWith((message) => updates(message as TransactionRet)) as TransactionRet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionRet create() => TransactionRet._();
  TransactionRet createEmptyInstance() => create();
  static $pb.PbList<TransactionRet> createRepeated() => $pb.PbList<TransactionRet>();
  @$core.pragma('dart2js:noInline')
  static TransactionRet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionRet>(create);
  static TransactionRet? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockNumber => $_getI64(0);
  @$pb.TagNumber(1)
  set blockNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockNumber() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockTimeStamp => $_getI64(1);
  @$pb.TagNumber(2)
  set blockTimeStamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockTimeStamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockTimeStamp() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<TransactionInfo> get transactioninfo => $_getList(2);
}

class Transactions extends $pb.GeneratedMessage {
  factory Transactions({
    $core.Iterable<Transaction>? transactions,
  }) {
    final $result = create();
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    return $result;
  }
  Transactions._() : super();
  factory Transactions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transactions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transactions', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<Transaction>(1, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transactions clone() => Transactions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transactions copyWith(void Function(Transactions) updates) => super.copyWith((message) => updates(message as Transactions)) as Transactions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transactions create() => Transactions._();
  Transactions createEmptyInstance() => create();
  static $pb.PbList<Transactions> createRepeated() => $pb.PbList<Transactions>();
  @$core.pragma('dart2js:noInline')
  static Transactions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transactions>(create);
  static Transactions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);
}

class BlockHeader_raw extends $pb.GeneratedMessage {
  factory BlockHeader_raw({
    $fixnum.Int64? timestamp,
    $core.List<$core.int>? txTrieRoot,
    $core.List<$core.int>? parentHash,
    $fixnum.Int64? number,
    $fixnum.Int64? witnessId,
    $core.List<$core.int>? witnessAddress,
    $core.int? version,
    $core.List<$core.int>? accountStateRoot,
  }) {
    final $result = create();
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (txTrieRoot != null) {
      $result.txTrieRoot = txTrieRoot;
    }
    if (parentHash != null) {
      $result.parentHash = parentHash;
    }
    if (number != null) {
      $result.number = number;
    }
    if (witnessId != null) {
      $result.witnessId = witnessId;
    }
    if (witnessAddress != null) {
      $result.witnessAddress = witnessAddress;
    }
    if (version != null) {
      $result.version = version;
    }
    if (accountStateRoot != null) {
      $result.accountStateRoot = accountStateRoot;
    }
    return $result;
  }
  BlockHeader_raw._() : super();
  factory BlockHeader_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockHeader.raw', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txTrieRoot', $pb.PbFieldType.OY, protoName: 'txTrieRoot')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'parentHash', $pb.PbFieldType.OY, protoName: 'parentHash')
    ..aInt64(7, _omitFieldNames ? '' : 'number')
    ..aInt64(8, _omitFieldNames ? '' : 'witnessId')
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'witnessAddress', $pb.PbFieldType.OY)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(11, _omitFieldNames ? '' : 'accountStateRoot', $pb.PbFieldType.OY, protoName: 'accountStateRoot')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockHeader_raw clone() => BlockHeader_raw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockHeader_raw copyWith(void Function(BlockHeader_raw) updates) => super.copyWith((message) => updates(message as BlockHeader_raw)) as BlockHeader_raw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHeader_raw create() => BlockHeader_raw._();
  BlockHeader_raw createEmptyInstance() => create();
  static $pb.PbList<BlockHeader_raw> createRepeated() => $pb.PbList<BlockHeader_raw>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader_raw>(create);
  static BlockHeader_raw? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txTrieRoot => $_getN(1);
  @$pb.TagNumber(2)
  set txTrieRoot($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxTrieRoot() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxTrieRoot() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get parentHash => $_getN(2);
  @$pb.TagNumber(3)
  set parentHash($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentHash() => clearField(3);

  /// bytes nonce = 5;
  /// bytes difficulty = 6;
  @$pb.TagNumber(7)
  $fixnum.Int64 get number => $_getI64(3);
  @$pb.TagNumber(7)
  set number($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(7)
  $core.bool hasNumber() => $_has(3);
  @$pb.TagNumber(7)
  void clearNumber() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get witnessId => $_getI64(4);
  @$pb.TagNumber(8)
  set witnessId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasWitnessId() => $_has(4);
  @$pb.TagNumber(8)
  void clearWitnessId() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get witnessAddress => $_getN(5);
  @$pb.TagNumber(9)
  set witnessAddress($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasWitnessAddress() => $_has(5);
  @$pb.TagNumber(9)
  void clearWitnessAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get version => $_getIZ(6);
  @$pb.TagNumber(10)
  set version($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasVersion() => $_has(6);
  @$pb.TagNumber(10)
  void clearVersion() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get accountStateRoot => $_getN(7);
  @$pb.TagNumber(11)
  set accountStateRoot($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(11)
  $core.bool hasAccountStateRoot() => $_has(7);
  @$pb.TagNumber(11)
  void clearAccountStateRoot() => clearField(11);
}

class BlockHeader extends $pb.GeneratedMessage {
  factory BlockHeader({
    BlockHeader_raw? rawData,
    $core.List<$core.int>? witnessSignature,
  }) {
    final $result = create();
    if (rawData != null) {
      $result.rawData = rawData;
    }
    if (witnessSignature != null) {
      $result.witnessSignature = witnessSignature;
    }
    return $result;
  }
  BlockHeader._() : super();
  factory BlockHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockHeader', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<BlockHeader_raw>(1, _omitFieldNames ? '' : 'rawData', subBuilder: BlockHeader_raw.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'witnessSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockHeader clone() => BlockHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockHeader copyWith(void Function(BlockHeader) updates) => super.copyWith((message) => updates(message as BlockHeader)) as BlockHeader;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  BlockHeader createEmptyInstance() => create();
  static $pb.PbList<BlockHeader> createRepeated() => $pb.PbList<BlockHeader>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader? _defaultInstance;

  @$pb.TagNumber(1)
  BlockHeader_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(BlockHeader_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  BlockHeader_raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get witnessSignature => $_getN(1);
  @$pb.TagNumber(2)
  set witnessSignature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWitnessSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearWitnessSignature() => clearField(2);
}

/// block
class Block extends $pb.GeneratedMessage {
  factory Block({
    $core.Iterable<Transaction>? transactions,
    BlockHeader? blockHeader,
  }) {
    final $result = create();
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    if (blockHeader != null) {
      $result.blockHeader = blockHeader;
    }
    return $result;
  }
  Block._() : super();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Block', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<Transaction>(1, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..aOM<BlockHeader>(2, _omitFieldNames ? '' : 'blockHeader', subBuilder: BlockHeader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  BlockHeader get blockHeader => $_getN(1);
  @$pb.TagNumber(2)
  set blockHeader(BlockHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeader() => clearField(2);
  @$pb.TagNumber(2)
  BlockHeader ensureBlockHeader() => $_ensure(1);
}

class ChainInventory_BlockId extends $pb.GeneratedMessage {
  factory ChainInventory_BlockId({
    $core.List<$core.int>? hash,
    $fixnum.Int64? number,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (number != null) {
      $result.number = number;
    }
    return $result;
  }
  ChainInventory_BlockId._() : super();
  factory ChainInventory_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainInventory_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainInventory.BlockId', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainInventory_BlockId clone() => ChainInventory_BlockId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainInventory_BlockId copyWith(void Function(ChainInventory_BlockId) updates) => super.copyWith((message) => updates(message as ChainInventory_BlockId)) as ChainInventory_BlockId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainInventory_BlockId create() => ChainInventory_BlockId._();
  ChainInventory_BlockId createEmptyInstance() => create();
  static $pb.PbList<ChainInventory_BlockId> createRepeated() => $pb.PbList<ChainInventory_BlockId>();
  @$core.pragma('dart2js:noInline')
  static ChainInventory_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainInventory_BlockId>(create);
  static ChainInventory_BlockId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class ChainInventory extends $pb.GeneratedMessage {
  factory ChainInventory({
    $core.Iterable<ChainInventory_BlockId>? ids,
    $fixnum.Int64? remainNum,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (remainNum != null) {
      $result.remainNum = remainNum;
    }
    return $result;
  }
  ChainInventory._() : super();
  factory ChainInventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainInventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainInventory', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<ChainInventory_BlockId>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PM, subBuilder: ChainInventory_BlockId.create)
    ..aInt64(2, _omitFieldNames ? '' : 'remainNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainInventory clone() => ChainInventory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainInventory copyWith(void Function(ChainInventory) updates) => super.copyWith((message) => updates(message as ChainInventory)) as ChainInventory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainInventory create() => ChainInventory._();
  ChainInventory createEmptyInstance() => create();
  static $pb.PbList<ChainInventory> createRepeated() => $pb.PbList<ChainInventory>();
  @$core.pragma('dart2js:noInline')
  static ChainInventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainInventory>(create);
  static ChainInventory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChainInventory_BlockId> get ids => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get remainNum => $_getI64(1);
  @$pb.TagNumber(2)
  set remainNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemainNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainNum() => clearField(2);
}

class BlockInventory_BlockId extends $pb.GeneratedMessage {
  factory BlockInventory_BlockId({
    $core.List<$core.int>? hash,
    $fixnum.Int64? number,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (number != null) {
      $result.number = number;
    }
    return $result;
  }
  BlockInventory_BlockId._() : super();
  factory BlockInventory_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockInventory_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockInventory.BlockId', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockInventory_BlockId clone() => BlockInventory_BlockId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockInventory_BlockId copyWith(void Function(BlockInventory_BlockId) updates) => super.copyWith((message) => updates(message as BlockInventory_BlockId)) as BlockInventory_BlockId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockInventory_BlockId create() => BlockInventory_BlockId._();
  BlockInventory_BlockId createEmptyInstance() => create();
  static $pb.PbList<BlockInventory_BlockId> createRepeated() => $pb.PbList<BlockInventory_BlockId>();
  @$core.pragma('dart2js:noInline')
  static BlockInventory_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockInventory_BlockId>(create);
  static BlockInventory_BlockId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

/// Inventory
class BlockInventory extends $pb.GeneratedMessage {
  factory BlockInventory({
    $core.Iterable<BlockInventory_BlockId>? ids,
    BlockInventory_Type? type,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  BlockInventory._() : super();
  factory BlockInventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockInventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockInventory', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<BlockInventory_BlockId>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PM, subBuilder: BlockInventory_BlockId.create)
    ..e<BlockInventory_Type>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: BlockInventory_Type.SYNC, valueOf: BlockInventory_Type.valueOf, enumValues: BlockInventory_Type.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockInventory clone() => BlockInventory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockInventory copyWith(void Function(BlockInventory) updates) => super.copyWith((message) => updates(message as BlockInventory)) as BlockInventory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockInventory create() => BlockInventory._();
  BlockInventory createEmptyInstance() => create();
  static $pb.PbList<BlockInventory> createRepeated() => $pb.PbList<BlockInventory>();
  @$core.pragma('dart2js:noInline')
  static BlockInventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockInventory>(create);
  static BlockInventory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BlockInventory_BlockId> get ids => $_getList(0);

  @$pb.TagNumber(2)
  BlockInventory_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(BlockInventory_Type v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class Inventory extends $pb.GeneratedMessage {
  factory Inventory({
    Inventory_InventoryType? type,
    $core.Iterable<$core.List<$core.int>>? ids,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  Inventory._() : super();
  factory Inventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Inventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Inventory', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<Inventory_InventoryType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Inventory_InventoryType.TRX, valueOf: Inventory_InventoryType.valueOf, enumValues: Inventory_InventoryType.values)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Inventory clone() => Inventory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Inventory copyWith(void Function(Inventory) updates) => super.copyWith((message) => updates(message as Inventory)) as Inventory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Inventory create() => Inventory._();
  Inventory createEmptyInstance() => create();
  static $pb.PbList<Inventory> createRepeated() => $pb.PbList<Inventory>();
  @$core.pragma('dart2js:noInline')
  static Inventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Inventory>(create);
  static Inventory? _defaultInstance;

  @$pb.TagNumber(1)
  Inventory_InventoryType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Inventory_InventoryType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get ids => $_getList(1);
}

class Items extends $pb.GeneratedMessage {
  factory Items({
    Items_ItemType? type,
    $core.Iterable<Block>? blocks,
    $core.Iterable<BlockHeader>? blockHeaders,
    $core.Iterable<Transaction>? transactions,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (blocks != null) {
      $result.blocks.addAll(blocks);
    }
    if (blockHeaders != null) {
      $result.blockHeaders.addAll(blockHeaders);
    }
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    return $result;
  }
  Items._() : super();
  factory Items.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Items.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Items', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<Items_ItemType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Items_ItemType.ERR, valueOf: Items_ItemType.valueOf, enumValues: Items_ItemType.values)
    ..pc<Block>(2, _omitFieldNames ? '' : 'blocks', $pb.PbFieldType.PM, subBuilder: Block.create)
    ..pc<BlockHeader>(3, _omitFieldNames ? '' : 'blockHeaders', $pb.PbFieldType.PM, subBuilder: BlockHeader.create)
    ..pc<Transaction>(4, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Items clone() => Items()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Items copyWith(void Function(Items) updates) => super.copyWith((message) => updates(message as Items)) as Items;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Items create() => Items._();
  Items createEmptyInstance() => create();
  static $pb.PbList<Items> createRepeated() => $pb.PbList<Items>();
  @$core.pragma('dart2js:noInline')
  static Items getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Items>(create);
  static Items? _defaultInstance;

  @$pb.TagNumber(1)
  Items_ItemType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Items_ItemType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Block> get blocks => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<BlockHeader> get blockHeaders => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Transaction> get transactions => $_getList(3);
}

/// DynamicProperties
class DynamicProperties extends $pb.GeneratedMessage {
  factory DynamicProperties({
    $fixnum.Int64? lastSolidityBlockNum,
  }) {
    final $result = create();
    if (lastSolidityBlockNum != null) {
      $result.lastSolidityBlockNum = lastSolidityBlockNum;
    }
    return $result;
  }
  DynamicProperties._() : super();
  factory DynamicProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DynamicProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DynamicProperties', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'lastSolidityBlockNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DynamicProperties clone() => DynamicProperties()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DynamicProperties copyWith(void Function(DynamicProperties) updates) => super.copyWith((message) => updates(message as DynamicProperties)) as DynamicProperties;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DynamicProperties create() => DynamicProperties._();
  DynamicProperties createEmptyInstance() => create();
  static $pb.PbList<DynamicProperties> createRepeated() => $pb.PbList<DynamicProperties>();
  @$core.pragma('dart2js:noInline')
  static DynamicProperties getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DynamicProperties>(create);
  static DynamicProperties? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastSolidityBlockNum => $_getI64(0);
  @$pb.TagNumber(1)
  set lastSolidityBlockNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastSolidityBlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastSolidityBlockNum() => clearField(1);
}

class DisconnectMessage extends $pb.GeneratedMessage {
  factory DisconnectMessage({
    ReasonCode? reason,
  }) {
    final $result = create();
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  DisconnectMessage._() : super();
  factory DisconnectMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<ReasonCode>(1, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE, defaultOrMaker: ReasonCode.REQUESTED, valueOf: ReasonCode.valueOf, enumValues: ReasonCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectMessage clone() => DisconnectMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectMessage copyWith(void Function(DisconnectMessage) updates) => super.copyWith((message) => updates(message as DisconnectMessage)) as DisconnectMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectMessage create() => DisconnectMessage._();
  DisconnectMessage createEmptyInstance() => create();
  static $pb.PbList<DisconnectMessage> createRepeated() => $pb.PbList<DisconnectMessage>();
  @$core.pragma('dart2js:noInline')
  static DisconnectMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectMessage>(create);
  static DisconnectMessage? _defaultInstance;

  @$pb.TagNumber(1)
  ReasonCode get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(ReasonCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);
}

class HelloMessage_BlockId extends $pb.GeneratedMessage {
  factory HelloMessage_BlockId({
    $core.List<$core.int>? hash,
    $fixnum.Int64? number,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (number != null) {
      $result.number = number;
    }
    return $result;
  }
  HelloMessage_BlockId._() : super();
  factory HelloMessage_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloMessage_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HelloMessage.BlockId', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloMessage_BlockId clone() => HelloMessage_BlockId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloMessage_BlockId copyWith(void Function(HelloMessage_BlockId) updates) => super.copyWith((message) => updates(message as HelloMessage_BlockId)) as HelloMessage_BlockId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HelloMessage_BlockId create() => HelloMessage_BlockId._();
  HelloMessage_BlockId createEmptyInstance() => create();
  static $pb.PbList<HelloMessage_BlockId> createRepeated() => $pb.PbList<HelloMessage_BlockId>();
  @$core.pragma('dart2js:noInline')
  static HelloMessage_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloMessage_BlockId>(create);
  static HelloMessage_BlockId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class HelloMessage extends $pb.GeneratedMessage {
  factory HelloMessage({
    $13.Endpoint? from,
    $core.int? version,
    $fixnum.Int64? timestamp,
    HelloMessage_BlockId? genesisBlockId,
    HelloMessage_BlockId? solidBlockId,
    HelloMessage_BlockId? headBlockId,
    $core.List<$core.int>? address,
    $core.List<$core.int>? signature,
    $core.int? nodeType,
    $fixnum.Int64? lowestBlockNum,
    $core.List<$core.int>? codeVersion,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (version != null) {
      $result.version = version;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (genesisBlockId != null) {
      $result.genesisBlockId = genesisBlockId;
    }
    if (solidBlockId != null) {
      $result.solidBlockId = solidBlockId;
    }
    if (headBlockId != null) {
      $result.headBlockId = headBlockId;
    }
    if (address != null) {
      $result.address = address;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (nodeType != null) {
      $result.nodeType = nodeType;
    }
    if (lowestBlockNum != null) {
      $result.lowestBlockNum = lowestBlockNum;
    }
    if (codeVersion != null) {
      $result.codeVersion = codeVersion;
    }
    return $result;
  }
  HelloMessage._() : super();
  factory HelloMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HelloMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<$13.Endpoint>(1, _omitFieldNames ? '' : 'from', subBuilder: $13.Endpoint.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..aOM<HelloMessage_BlockId>(4, _omitFieldNames ? '' : 'genesisBlockId', protoName: 'genesisBlockId', subBuilder: HelloMessage_BlockId.create)
    ..aOM<HelloMessage_BlockId>(5, _omitFieldNames ? '' : 'solidBlockId', protoName: 'solidBlockId', subBuilder: HelloMessage_BlockId.create)
    ..aOM<HelloMessage_BlockId>(6, _omitFieldNames ? '' : 'headBlockId', protoName: 'headBlockId', subBuilder: HelloMessage_BlockId.create)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'nodeType', $pb.PbFieldType.O3, protoName: 'nodeType')
    ..aInt64(10, _omitFieldNames ? '' : 'lowestBlockNum', protoName: 'lowestBlockNum')
    ..a<$core.List<$core.int>>(11, _omitFieldNames ? '' : 'codeVersion', $pb.PbFieldType.OY, protoName: 'codeVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloMessage clone() => HelloMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloMessage copyWith(void Function(HelloMessage) updates) => super.copyWith((message) => updates(message as HelloMessage)) as HelloMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HelloMessage create() => HelloMessage._();
  HelloMessage createEmptyInstance() => create();
  static $pb.PbList<HelloMessage> createRepeated() => $pb.PbList<HelloMessage>();
  @$core.pragma('dart2js:noInline')
  static HelloMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloMessage>(create);
  static HelloMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($13.Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  $13.Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  HelloMessage_BlockId get genesisBlockId => $_getN(3);
  @$pb.TagNumber(4)
  set genesisBlockId(HelloMessage_BlockId v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGenesisBlockId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGenesisBlockId() => clearField(4);
  @$pb.TagNumber(4)
  HelloMessage_BlockId ensureGenesisBlockId() => $_ensure(3);

  @$pb.TagNumber(5)
  HelloMessage_BlockId get solidBlockId => $_getN(4);
  @$pb.TagNumber(5)
  set solidBlockId(HelloMessage_BlockId v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSolidBlockId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSolidBlockId() => clearField(5);
  @$pb.TagNumber(5)
  HelloMessage_BlockId ensureSolidBlockId() => $_ensure(4);

  @$pb.TagNumber(6)
  HelloMessage_BlockId get headBlockId => $_getN(5);
  @$pb.TagNumber(6)
  set headBlockId(HelloMessage_BlockId v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeadBlockId() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeadBlockId() => clearField(6);
  @$pb.TagNumber(6)
  HelloMessage_BlockId ensureHeadBlockId() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get address => $_getN(6);
  @$pb.TagNumber(7)
  set address($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearAddress() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get signature => $_getN(7);
  @$pb.TagNumber(8)
  set signature($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSignature() => $_has(7);
  @$pb.TagNumber(8)
  void clearSignature() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get nodeType => $_getIZ(8);
  @$pb.TagNumber(9)
  set nodeType($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNodeType() => $_has(8);
  @$pb.TagNumber(9)
  void clearNodeType() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get lowestBlockNum => $_getI64(9);
  @$pb.TagNumber(10)
  set lowestBlockNum($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLowestBlockNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearLowestBlockNum() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get codeVersion => $_getN(10);
  @$pb.TagNumber(11)
  set codeVersion($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCodeVersion() => $_has(10);
  @$pb.TagNumber(11)
  void clearCodeVersion() => clearField(11);
}

class InternalTransaction_CallValueInfo extends $pb.GeneratedMessage {
  factory InternalTransaction_CallValueInfo({
    $fixnum.Int64? callValue,
    $core.String? tokenId,
  }) {
    final $result = create();
    if (callValue != null) {
      $result.callValue = callValue;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    return $result;
  }
  InternalTransaction_CallValueInfo._() : super();
  factory InternalTransaction_CallValueInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalTransaction_CallValueInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InternalTransaction.CallValueInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'callValue', protoName: 'callValue')
    ..aOS(2, _omitFieldNames ? '' : 'tokenId', protoName: 'tokenId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InternalTransaction_CallValueInfo clone() => InternalTransaction_CallValueInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InternalTransaction_CallValueInfo copyWith(void Function(InternalTransaction_CallValueInfo) updates) => super.copyWith((message) => updates(message as InternalTransaction_CallValueInfo)) as InternalTransaction_CallValueInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InternalTransaction_CallValueInfo create() => InternalTransaction_CallValueInfo._();
  InternalTransaction_CallValueInfo createEmptyInstance() => create();
  static $pb.PbList<InternalTransaction_CallValueInfo> createRepeated() => $pb.PbList<InternalTransaction_CallValueInfo>();
  @$core.pragma('dart2js:noInline')
  static InternalTransaction_CallValueInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalTransaction_CallValueInfo>(create);
  static InternalTransaction_CallValueInfo? _defaultInstance;

  /// trx (TBD: or token) value
  @$pb.TagNumber(1)
  $fixnum.Int64 get callValue => $_getI64(0);
  @$pb.TagNumber(1)
  set callValue($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallValue() => clearField(1);

  /// TBD: tokenName, trx should be empty
  @$pb.TagNumber(2)
  $core.String get tokenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenId() => clearField(2);
}

class InternalTransaction extends $pb.GeneratedMessage {
  factory InternalTransaction({
    $core.List<$core.int>? hash,
    $core.List<$core.int>? callerAddress,
    $core.List<$core.int>? transferToAddress,
    $core.Iterable<InternalTransaction_CallValueInfo>? callValueInfo,
    $core.List<$core.int>? note,
    $core.bool? rejected,
    $core.String? extra,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (callerAddress != null) {
      $result.callerAddress = callerAddress;
    }
    if (transferToAddress != null) {
      $result.transferToAddress = transferToAddress;
    }
    if (callValueInfo != null) {
      $result.callValueInfo.addAll(callValueInfo);
    }
    if (note != null) {
      $result.note = note;
    }
    if (rejected != null) {
      $result.rejected = rejected;
    }
    if (extra != null) {
      $result.extra = extra;
    }
    return $result;
  }
  InternalTransaction._() : super();
  factory InternalTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InternalTransaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'callerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'transferToAddress', $pb.PbFieldType.OY, protoName: 'transferTo_address')
    ..pc<InternalTransaction_CallValueInfo>(4, _omitFieldNames ? '' : 'callValueInfo', $pb.PbFieldType.PM, protoName: 'callValueInfo', subBuilder: InternalTransaction_CallValueInfo.create)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'rejected')
    ..aOS(7, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InternalTransaction clone() => InternalTransaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InternalTransaction copyWith(void Function(InternalTransaction) updates) => super.copyWith((message) => updates(message as InternalTransaction)) as InternalTransaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InternalTransaction create() => InternalTransaction._();
  InternalTransaction createEmptyInstance() => create();
  static $pb.PbList<InternalTransaction> createRepeated() => $pb.PbList<InternalTransaction>();
  @$core.pragma('dart2js:noInline')
  static InternalTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalTransaction>(create);
  static InternalTransaction? _defaultInstance;

  /// internalTransaction identity, the root InternalTransaction hash
  /// should equals to root transaction id.
  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  /// the one send trx (TBD: or token) via function
  @$pb.TagNumber(2)
  $core.List<$core.int> get callerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set callerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallerAddress() => clearField(2);

  /// the one recieve trx (TBD: or token) via function
  @$pb.TagNumber(3)
  $core.List<$core.int> get transferToAddress => $_getN(2);
  @$pb.TagNumber(3)
  set transferToAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransferToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferToAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<InternalTransaction_CallValueInfo> get callValueInfo => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get note => $_getN(4);
  @$pb.TagNumber(5)
  set note($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNote() => $_has(4);
  @$pb.TagNumber(5)
  void clearNote() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get rejected => $_getBF(5);
  @$pb.TagNumber(6)
  set rejected($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRejected() => $_has(5);
  @$pb.TagNumber(6)
  void clearRejected() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get extra => $_getSZ(6);
  @$pb.TagNumber(7)
  set extra($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExtra() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtra() => clearField(7);
}

class DelegatedResourceAccountIndex extends $pb.GeneratedMessage {
  factory DelegatedResourceAccountIndex({
    $core.List<$core.int>? account,
    $core.Iterable<$core.List<$core.int>>? fromAccounts,
    $core.Iterable<$core.List<$core.int>>? toAccounts,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (fromAccounts != null) {
      $result.fromAccounts.addAll(fromAccounts);
    }
    if (toAccounts != null) {
      $result.toAccounts.addAll(toAccounts);
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  DelegatedResourceAccountIndex._() : super();
  factory DelegatedResourceAccountIndex.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResourceAccountIndex.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelegatedResourceAccountIndex', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'account', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'fromAccounts', $pb.PbFieldType.PY, protoName: 'fromAccounts')
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'toAccounts', $pb.PbFieldType.PY, protoName: 'toAccounts')
    ..aInt64(4, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelegatedResourceAccountIndex clone() => DelegatedResourceAccountIndex()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelegatedResourceAccountIndex copyWith(void Function(DelegatedResourceAccountIndex) updates) => super.copyWith((message) => updates(message as DelegatedResourceAccountIndex)) as DelegatedResourceAccountIndex;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegatedResourceAccountIndex create() => DelegatedResourceAccountIndex._();
  DelegatedResourceAccountIndex createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceAccountIndex> createRepeated() => $pb.PbList<DelegatedResourceAccountIndex>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceAccountIndex getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceAccountIndex>(create);
  static DelegatedResourceAccountIndex? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get fromAccounts => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get toAccounts => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
}

class NodeInfo_PeerInfo extends $pb.GeneratedMessage {
  factory NodeInfo_PeerInfo({
    $core.String? lastSyncBlock,
    $fixnum.Int64? remainNum,
    $fixnum.Int64? lastBlockUpdateTime,
    $core.bool? syncFlag,
    $fixnum.Int64? headBlockTimeWeBothHave,
    $core.bool? needSyncFromPeer,
    $core.bool? needSyncFromUs,
    $core.String? host,
    $core.int? port,
    $core.String? nodeId,
    $fixnum.Int64? connectTime,
    $core.double? avgLatency,
    $core.int? syncToFetchSize,
    $fixnum.Int64? syncToFetchSizePeekNum,
    $core.int? syncBlockRequestedSize,
    $fixnum.Int64? unFetchSynNum,
    $core.int? blockInPorcSize,
    $core.String? headBlockWeBothHave,
    $core.bool? isActive,
    $core.int? score,
    $core.int? nodeCount,
    $fixnum.Int64? inFlow,
    $core.int? disconnectTimes,
    $core.String? localDisconnectReason,
    $core.String? remoteDisconnectReason,
  }) {
    final $result = create();
    if (lastSyncBlock != null) {
      $result.lastSyncBlock = lastSyncBlock;
    }
    if (remainNum != null) {
      $result.remainNum = remainNum;
    }
    if (lastBlockUpdateTime != null) {
      $result.lastBlockUpdateTime = lastBlockUpdateTime;
    }
    if (syncFlag != null) {
      $result.syncFlag = syncFlag;
    }
    if (headBlockTimeWeBothHave != null) {
      $result.headBlockTimeWeBothHave = headBlockTimeWeBothHave;
    }
    if (needSyncFromPeer != null) {
      $result.needSyncFromPeer = needSyncFromPeer;
    }
    if (needSyncFromUs != null) {
      $result.needSyncFromUs = needSyncFromUs;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (connectTime != null) {
      $result.connectTime = connectTime;
    }
    if (avgLatency != null) {
      $result.avgLatency = avgLatency;
    }
    if (syncToFetchSize != null) {
      $result.syncToFetchSize = syncToFetchSize;
    }
    if (syncToFetchSizePeekNum != null) {
      $result.syncToFetchSizePeekNum = syncToFetchSizePeekNum;
    }
    if (syncBlockRequestedSize != null) {
      $result.syncBlockRequestedSize = syncBlockRequestedSize;
    }
    if (unFetchSynNum != null) {
      $result.unFetchSynNum = unFetchSynNum;
    }
    if (blockInPorcSize != null) {
      $result.blockInPorcSize = blockInPorcSize;
    }
    if (headBlockWeBothHave != null) {
      $result.headBlockWeBothHave = headBlockWeBothHave;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (score != null) {
      $result.score = score;
    }
    if (nodeCount != null) {
      $result.nodeCount = nodeCount;
    }
    if (inFlow != null) {
      $result.inFlow = inFlow;
    }
    if (disconnectTimes != null) {
      $result.disconnectTimes = disconnectTimes;
    }
    if (localDisconnectReason != null) {
      $result.localDisconnectReason = localDisconnectReason;
    }
    if (remoteDisconnectReason != null) {
      $result.remoteDisconnectReason = remoteDisconnectReason;
    }
    return $result;
  }
  NodeInfo_PeerInfo._() : super();
  factory NodeInfo_PeerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_PeerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo.PeerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lastSyncBlock', protoName: 'lastSyncBlock')
    ..aInt64(2, _omitFieldNames ? '' : 'remainNum', protoName: 'remainNum')
    ..aInt64(3, _omitFieldNames ? '' : 'lastBlockUpdateTime', protoName: 'lastBlockUpdateTime')
    ..aOB(4, _omitFieldNames ? '' : 'syncFlag', protoName: 'syncFlag')
    ..aInt64(5, _omitFieldNames ? '' : 'headBlockTimeWeBothHave', protoName: 'headBlockTimeWeBothHave')
    ..aOB(6, _omitFieldNames ? '' : 'needSyncFromPeer', protoName: 'needSyncFromPeer')
    ..aOB(7, _omitFieldNames ? '' : 'needSyncFromUs', protoName: 'needSyncFromUs')
    ..aOS(8, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'nodeId', protoName: 'nodeId')
    ..aInt64(11, _omitFieldNames ? '' : 'connectTime', protoName: 'connectTime')
    ..a<$core.double>(12, _omitFieldNames ? '' : 'avgLatency', $pb.PbFieldType.OD, protoName: 'avgLatency')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'syncToFetchSize', $pb.PbFieldType.O3, protoName: 'syncToFetchSize')
    ..aInt64(14, _omitFieldNames ? '' : 'syncToFetchSizePeekNum', protoName: 'syncToFetchSizePeekNum')
    ..a<$core.int>(15, _omitFieldNames ? '' : 'syncBlockRequestedSize', $pb.PbFieldType.O3, protoName: 'syncBlockRequestedSize')
    ..aInt64(16, _omitFieldNames ? '' : 'unFetchSynNum', protoName: 'unFetchSynNum')
    ..a<$core.int>(17, _omitFieldNames ? '' : 'blockInPorcSize', $pb.PbFieldType.O3, protoName: 'blockInPorcSize')
    ..aOS(18, _omitFieldNames ? '' : 'headBlockWeBothHave', protoName: 'headBlockWeBothHave')
    ..aOB(19, _omitFieldNames ? '' : 'isActive', protoName: 'isActive')
    ..a<$core.int>(20, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..a<$core.int>(21, _omitFieldNames ? '' : 'nodeCount', $pb.PbFieldType.O3, protoName: 'nodeCount')
    ..aInt64(22, _omitFieldNames ? '' : 'inFlow', protoName: 'inFlow')
    ..a<$core.int>(23, _omitFieldNames ? '' : 'disconnectTimes', $pb.PbFieldType.O3, protoName: 'disconnectTimes')
    ..aOS(24, _omitFieldNames ? '' : 'localDisconnectReason', protoName: 'localDisconnectReason')
    ..aOS(25, _omitFieldNames ? '' : 'remoteDisconnectReason', protoName: 'remoteDisconnectReason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo_PeerInfo clone() => NodeInfo_PeerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo_PeerInfo copyWith(void Function(NodeInfo_PeerInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_PeerInfo)) as NodeInfo_PeerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo_PeerInfo create() => NodeInfo_PeerInfo._();
  NodeInfo_PeerInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_PeerInfo> createRepeated() => $pb.PbList<NodeInfo_PeerInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_PeerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_PeerInfo>(create);
  static NodeInfo_PeerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lastSyncBlock => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastSyncBlock($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastSyncBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastSyncBlock() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get remainNum => $_getI64(1);
  @$pb.TagNumber(2)
  set remainNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemainNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainNum() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBlockUpdateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBlockUpdateTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBlockUpdateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBlockUpdateTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get syncFlag => $_getBF(3);
  @$pb.TagNumber(4)
  set syncFlag($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSyncFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearSyncFlag() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get headBlockTimeWeBothHave => $_getI64(4);
  @$pb.TagNumber(5)
  set headBlockTimeWeBothHave($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeadBlockTimeWeBothHave() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeadBlockTimeWeBothHave() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get needSyncFromPeer => $_getBF(5);
  @$pb.TagNumber(6)
  set needSyncFromPeer($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNeedSyncFromPeer() => $_has(5);
  @$pb.TagNumber(6)
  void clearNeedSyncFromPeer() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get needSyncFromUs => $_getBF(6);
  @$pb.TagNumber(7)
  set needSyncFromUs($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNeedSyncFromUs() => $_has(6);
  @$pb.TagNumber(7)
  void clearNeedSyncFromUs() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get host => $_getSZ(7);
  @$pb.TagNumber(8)
  set host($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHost() => $_has(7);
  @$pb.TagNumber(8)
  void clearHost() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get port => $_getIZ(8);
  @$pb.TagNumber(9)
  set port($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPort() => $_has(8);
  @$pb.TagNumber(9)
  void clearPort() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nodeId => $_getSZ(9);
  @$pb.TagNumber(10)
  set nodeId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNodeId() => $_has(9);
  @$pb.TagNumber(10)
  void clearNodeId() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get connectTime => $_getI64(10);
  @$pb.TagNumber(11)
  set connectTime($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnectTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearConnectTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get avgLatency => $_getN(11);
  @$pb.TagNumber(12)
  set avgLatency($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAvgLatency() => $_has(11);
  @$pb.TagNumber(12)
  void clearAvgLatency() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get syncToFetchSize => $_getIZ(12);
  @$pb.TagNumber(13)
  set syncToFetchSize($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSyncToFetchSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearSyncToFetchSize() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get syncToFetchSizePeekNum => $_getI64(13);
  @$pb.TagNumber(14)
  set syncToFetchSizePeekNum($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSyncToFetchSizePeekNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearSyncToFetchSizePeekNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get syncBlockRequestedSize => $_getIZ(14);
  @$pb.TagNumber(15)
  set syncBlockRequestedSize($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSyncBlockRequestedSize() => $_has(14);
  @$pb.TagNumber(15)
  void clearSyncBlockRequestedSize() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unFetchSynNum => $_getI64(15);
  @$pb.TagNumber(16)
  set unFetchSynNum($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnFetchSynNum() => $_has(15);
  @$pb.TagNumber(16)
  void clearUnFetchSynNum() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get blockInPorcSize => $_getIZ(16);
  @$pb.TagNumber(17)
  set blockInPorcSize($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasBlockInPorcSize() => $_has(16);
  @$pb.TagNumber(17)
  void clearBlockInPorcSize() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get headBlockWeBothHave => $_getSZ(17);
  @$pb.TagNumber(18)
  set headBlockWeBothHave($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasHeadBlockWeBothHave() => $_has(17);
  @$pb.TagNumber(18)
  void clearHeadBlockWeBothHave() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get isActive => $_getBF(18);
  @$pb.TagNumber(19)
  set isActive($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsActive() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsActive() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get score => $_getIZ(19);
  @$pb.TagNumber(20)
  set score($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasScore() => $_has(19);
  @$pb.TagNumber(20)
  void clearScore() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get nodeCount => $_getIZ(20);
  @$pb.TagNumber(21)
  set nodeCount($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasNodeCount() => $_has(20);
  @$pb.TagNumber(21)
  void clearNodeCount() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get inFlow => $_getI64(21);
  @$pb.TagNumber(22)
  set inFlow($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasInFlow() => $_has(21);
  @$pb.TagNumber(22)
  void clearInFlow() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get disconnectTimes => $_getIZ(22);
  @$pb.TagNumber(23)
  set disconnectTimes($core.int v) { $_setSignedInt32(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasDisconnectTimes() => $_has(22);
  @$pb.TagNumber(23)
  void clearDisconnectTimes() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get localDisconnectReason => $_getSZ(23);
  @$pb.TagNumber(24)
  set localDisconnectReason($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasLocalDisconnectReason() => $_has(23);
  @$pb.TagNumber(24)
  void clearLocalDisconnectReason() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get remoteDisconnectReason => $_getSZ(24);
  @$pb.TagNumber(25)
  set remoteDisconnectReason($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasRemoteDisconnectReason() => $_has(24);
  @$pb.TagNumber(25)
  void clearRemoteDisconnectReason() => clearField(25);
}

class NodeInfo_ConfigNodeInfo extends $pb.GeneratedMessage {
  factory NodeInfo_ConfigNodeInfo({
    $core.String? codeVersion,
    $core.String? p2pVersion,
    $core.int? listenPort,
    $core.bool? discoverEnable,
    $core.int? activeNodeSize,
    $core.int? passiveNodeSize,
    $core.int? sendNodeSize,
    $core.int? maxConnectCount,
    $core.int? sameIpMaxConnectCount,
    $core.int? backupListenPort,
    $core.int? backupMemberSize,
    $core.int? backupPriority,
    $core.int? dbVersion,
    $core.int? minParticipationRate,
    $core.bool? supportConstant,
    $core.double? minTimeRatio,
    $core.double? maxTimeRatio,
    $fixnum.Int64? allowCreationOfContracts,
    $fixnum.Int64? allowAdaptiveEnergy,
  }) {
    final $result = create();
    if (codeVersion != null) {
      $result.codeVersion = codeVersion;
    }
    if (p2pVersion != null) {
      $result.p2pVersion = p2pVersion;
    }
    if (listenPort != null) {
      $result.listenPort = listenPort;
    }
    if (discoverEnable != null) {
      $result.discoverEnable = discoverEnable;
    }
    if (activeNodeSize != null) {
      $result.activeNodeSize = activeNodeSize;
    }
    if (passiveNodeSize != null) {
      $result.passiveNodeSize = passiveNodeSize;
    }
    if (sendNodeSize != null) {
      $result.sendNodeSize = sendNodeSize;
    }
    if (maxConnectCount != null) {
      $result.maxConnectCount = maxConnectCount;
    }
    if (sameIpMaxConnectCount != null) {
      $result.sameIpMaxConnectCount = sameIpMaxConnectCount;
    }
    if (backupListenPort != null) {
      $result.backupListenPort = backupListenPort;
    }
    if (backupMemberSize != null) {
      $result.backupMemberSize = backupMemberSize;
    }
    if (backupPriority != null) {
      $result.backupPriority = backupPriority;
    }
    if (dbVersion != null) {
      $result.dbVersion = dbVersion;
    }
    if (minParticipationRate != null) {
      $result.minParticipationRate = minParticipationRate;
    }
    if (supportConstant != null) {
      $result.supportConstant = supportConstant;
    }
    if (minTimeRatio != null) {
      $result.minTimeRatio = minTimeRatio;
    }
    if (maxTimeRatio != null) {
      $result.maxTimeRatio = maxTimeRatio;
    }
    if (allowCreationOfContracts != null) {
      $result.allowCreationOfContracts = allowCreationOfContracts;
    }
    if (allowAdaptiveEnergy != null) {
      $result.allowAdaptiveEnergy = allowAdaptiveEnergy;
    }
    return $result;
  }
  NodeInfo_ConfigNodeInfo._() : super();
  factory NodeInfo_ConfigNodeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_ConfigNodeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo.ConfigNodeInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'codeVersion', protoName: 'codeVersion')
    ..aOS(2, _omitFieldNames ? '' : 'p2pVersion', protoName: 'p2pVersion')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'listenPort', $pb.PbFieldType.O3, protoName: 'listenPort')
    ..aOB(4, _omitFieldNames ? '' : 'discoverEnable', protoName: 'discoverEnable')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'activeNodeSize', $pb.PbFieldType.O3, protoName: 'activeNodeSize')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'passiveNodeSize', $pb.PbFieldType.O3, protoName: 'passiveNodeSize')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'sendNodeSize', $pb.PbFieldType.O3, protoName: 'sendNodeSize')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'maxConnectCount', $pb.PbFieldType.O3, protoName: 'maxConnectCount')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'sameIpMaxConnectCount', $pb.PbFieldType.O3, protoName: 'sameIpMaxConnectCount')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'backupListenPort', $pb.PbFieldType.O3, protoName: 'backupListenPort')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'backupMemberSize', $pb.PbFieldType.O3, protoName: 'backupMemberSize')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'backupPriority', $pb.PbFieldType.O3, protoName: 'backupPriority')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'dbVersion', $pb.PbFieldType.O3, protoName: 'dbVersion')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'minParticipationRate', $pb.PbFieldType.O3, protoName: 'minParticipationRate')
    ..aOB(15, _omitFieldNames ? '' : 'supportConstant', protoName: 'supportConstant')
    ..a<$core.double>(16, _omitFieldNames ? '' : 'minTimeRatio', $pb.PbFieldType.OD, protoName: 'minTimeRatio')
    ..a<$core.double>(17, _omitFieldNames ? '' : 'maxTimeRatio', $pb.PbFieldType.OD, protoName: 'maxTimeRatio')
    ..aInt64(18, _omitFieldNames ? '' : 'allowCreationOfContracts', protoName: 'allowCreationOfContracts')
    ..aInt64(19, _omitFieldNames ? '' : 'allowAdaptiveEnergy', protoName: 'allowAdaptiveEnergy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo_ConfigNodeInfo clone() => NodeInfo_ConfigNodeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo_ConfigNodeInfo copyWith(void Function(NodeInfo_ConfigNodeInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_ConfigNodeInfo)) as NodeInfo_ConfigNodeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo_ConfigNodeInfo create() => NodeInfo_ConfigNodeInfo._();
  NodeInfo_ConfigNodeInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_ConfigNodeInfo> createRepeated() => $pb.PbList<NodeInfo_ConfigNodeInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_ConfigNodeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_ConfigNodeInfo>(create);
  static NodeInfo_ConfigNodeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get codeVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set codeVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCodeVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearCodeVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get p2pVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set p2pVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP2pVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2pVersion() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get listenPort => $_getIZ(2);
  @$pb.TagNumber(3)
  set listenPort($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasListenPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearListenPort() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get discoverEnable => $_getBF(3);
  @$pb.TagNumber(4)
  set discoverEnable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDiscoverEnable() => $_has(3);
  @$pb.TagNumber(4)
  void clearDiscoverEnable() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeNodeSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeNodeSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveNodeSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveNodeSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get passiveNodeSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set passiveNodeSize($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassiveNodeSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassiveNodeSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sendNodeSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set sendNodeSize($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSendNodeSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSendNodeSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxConnectCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxConnectCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxConnectCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxConnectCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sameIpMaxConnectCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set sameIpMaxConnectCount($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSameIpMaxConnectCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearSameIpMaxConnectCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get backupListenPort => $_getIZ(9);
  @$pb.TagNumber(10)
  set backupListenPort($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBackupListenPort() => $_has(9);
  @$pb.TagNumber(10)
  void clearBackupListenPort() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get backupMemberSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set backupMemberSize($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasBackupMemberSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearBackupMemberSize() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get backupPriority => $_getIZ(11);
  @$pb.TagNumber(12)
  set backupPriority($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasBackupPriority() => $_has(11);
  @$pb.TagNumber(12)
  void clearBackupPriority() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get dbVersion => $_getIZ(12);
  @$pb.TagNumber(13)
  set dbVersion($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDbVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearDbVersion() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get minParticipationRate => $_getIZ(13);
  @$pb.TagNumber(14)
  set minParticipationRate($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMinParticipationRate() => $_has(13);
  @$pb.TagNumber(14)
  void clearMinParticipationRate() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get supportConstant => $_getBF(14);
  @$pb.TagNumber(15)
  set supportConstant($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSupportConstant() => $_has(14);
  @$pb.TagNumber(15)
  void clearSupportConstant() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get minTimeRatio => $_getN(15);
  @$pb.TagNumber(16)
  set minTimeRatio($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasMinTimeRatio() => $_has(15);
  @$pb.TagNumber(16)
  void clearMinTimeRatio() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get maxTimeRatio => $_getN(16);
  @$pb.TagNumber(17)
  set maxTimeRatio($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasMaxTimeRatio() => $_has(16);
  @$pb.TagNumber(17)
  void clearMaxTimeRatio() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get allowCreationOfContracts => $_getI64(17);
  @$pb.TagNumber(18)
  set allowCreationOfContracts($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAllowCreationOfContracts() => $_has(17);
  @$pb.TagNumber(18)
  void clearAllowCreationOfContracts() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get allowAdaptiveEnergy => $_getI64(18);
  @$pb.TagNumber(19)
  set allowAdaptiveEnergy($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAllowAdaptiveEnergy() => $_has(18);
  @$pb.TagNumber(19)
  void clearAllowAdaptiveEnergy() => clearField(19);
}

class NodeInfo_MachineInfo_MemoryDescInfo extends $pb.GeneratedMessage {
  factory NodeInfo_MachineInfo_MemoryDescInfo({
    $core.String? name,
    $fixnum.Int64? initSize,
    $fixnum.Int64? useSize,
    $fixnum.Int64? maxSize,
    $core.double? useRate,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (initSize != null) {
      $result.initSize = initSize;
    }
    if (useSize != null) {
      $result.useSize = useSize;
    }
    if (maxSize != null) {
      $result.maxSize = maxSize;
    }
    if (useRate != null) {
      $result.useRate = useRate;
    }
    return $result;
  }
  NodeInfo_MachineInfo_MemoryDescInfo._() : super();
  factory NodeInfo_MachineInfo_MemoryDescInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo_MemoryDescInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo.MachineInfo.MemoryDescInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aInt64(2, _omitFieldNames ? '' : 'initSize', protoName: 'initSize')
    ..aInt64(3, _omitFieldNames ? '' : 'useSize', protoName: 'useSize')
    ..aInt64(4, _omitFieldNames ? '' : 'maxSize', protoName: 'maxSize')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'useRate', $pb.PbFieldType.OD, protoName: 'useRate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo_MemoryDescInfo clone() => NodeInfo_MachineInfo_MemoryDescInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo_MemoryDescInfo copyWith(void Function(NodeInfo_MachineInfo_MemoryDescInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo_MemoryDescInfo)) as NodeInfo_MachineInfo_MemoryDescInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_MemoryDescInfo create() => NodeInfo_MachineInfo_MemoryDescInfo._();
  NodeInfo_MachineInfo_MemoryDescInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo_MemoryDescInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo_MemoryDescInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_MemoryDescInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo_MemoryDescInfo>(create);
  static NodeInfo_MachineInfo_MemoryDescInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get initSize => $_getI64(1);
  @$pb.TagNumber(2)
  set initSize($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get useSize => $_getI64(2);
  @$pb.TagNumber(3)
  set useSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUseSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearUseSize() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get maxSize => $_getI64(3);
  @$pb.TagNumber(4)
  set maxSize($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get useRate => $_getN(4);
  @$pb.TagNumber(5)
  set useRate($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUseRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUseRate() => clearField(5);
}

class NodeInfo_MachineInfo_DeadLockThreadInfo extends $pb.GeneratedMessage {
  factory NodeInfo_MachineInfo_DeadLockThreadInfo({
    $core.String? name,
    $core.String? lockName,
    $core.String? lockOwner,
    $core.String? state,
    $fixnum.Int64? blockTime,
    $fixnum.Int64? waitTime,
    $core.String? stackTrace,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (lockName != null) {
      $result.lockName = lockName;
    }
    if (lockOwner != null) {
      $result.lockOwner = lockOwner;
    }
    if (state != null) {
      $result.state = state;
    }
    if (blockTime != null) {
      $result.blockTime = blockTime;
    }
    if (waitTime != null) {
      $result.waitTime = waitTime;
    }
    if (stackTrace != null) {
      $result.stackTrace = stackTrace;
    }
    return $result;
  }
  NodeInfo_MachineInfo_DeadLockThreadInfo._() : super();
  factory NodeInfo_MachineInfo_DeadLockThreadInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo_DeadLockThreadInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo.MachineInfo.DeadLockThreadInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'lockName', protoName: 'lockName')
    ..aOS(3, _omitFieldNames ? '' : 'lockOwner', protoName: 'lockOwner')
    ..aOS(4, _omitFieldNames ? '' : 'state')
    ..aInt64(5, _omitFieldNames ? '' : 'blockTime', protoName: 'blockTime')
    ..aInt64(6, _omitFieldNames ? '' : 'waitTime', protoName: 'waitTime')
    ..aOS(7, _omitFieldNames ? '' : 'stackTrace', protoName: 'stackTrace')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo_DeadLockThreadInfo clone() => NodeInfo_MachineInfo_DeadLockThreadInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo_DeadLockThreadInfo copyWith(void Function(NodeInfo_MachineInfo_DeadLockThreadInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo_DeadLockThreadInfo)) as NodeInfo_MachineInfo_DeadLockThreadInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_DeadLockThreadInfo create() => NodeInfo_MachineInfo_DeadLockThreadInfo._();
  NodeInfo_MachineInfo_DeadLockThreadInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo_DeadLockThreadInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo_DeadLockThreadInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_DeadLockThreadInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo_DeadLockThreadInfo>(create);
  static NodeInfo_MachineInfo_DeadLockThreadInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lockName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lockName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLockName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lockOwner => $_getSZ(2);
  @$pb.TagNumber(3)
  set lockOwner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLockOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockOwner() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get blockTime => $_getI64(4);
  @$pb.TagNumber(5)
  set blockTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBlockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlockTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get waitTime => $_getI64(5);
  @$pb.TagNumber(6)
  set waitTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWaitTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearWaitTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get stackTrace => $_getSZ(6);
  @$pb.TagNumber(7)
  set stackTrace($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStackTrace() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackTrace() => clearField(7);
}

class NodeInfo_MachineInfo extends $pb.GeneratedMessage {
  factory NodeInfo_MachineInfo({
    $core.int? threadCount,
    $core.int? deadLockThreadCount,
    $core.int? cpuCount,
    $fixnum.Int64? totalMemory,
    $fixnum.Int64? freeMemory,
    $core.double? cpuRate,
    $core.String? javaVersion,
    $core.String? osName,
    $fixnum.Int64? jvmTotalMemory,
    $fixnum.Int64? jvmFreeMemory,
    $core.double? processCpuRate,
    $core.Iterable<NodeInfo_MachineInfo_MemoryDescInfo>? memoryDescInfoList,
    $core.Iterable<NodeInfo_MachineInfo_DeadLockThreadInfo>? deadLockThreadInfoList,
  }) {
    final $result = create();
    if (threadCount != null) {
      $result.threadCount = threadCount;
    }
    if (deadLockThreadCount != null) {
      $result.deadLockThreadCount = deadLockThreadCount;
    }
    if (cpuCount != null) {
      $result.cpuCount = cpuCount;
    }
    if (totalMemory != null) {
      $result.totalMemory = totalMemory;
    }
    if (freeMemory != null) {
      $result.freeMemory = freeMemory;
    }
    if (cpuRate != null) {
      $result.cpuRate = cpuRate;
    }
    if (javaVersion != null) {
      $result.javaVersion = javaVersion;
    }
    if (osName != null) {
      $result.osName = osName;
    }
    if (jvmTotalMemory != null) {
      $result.jvmTotalMemory = jvmTotalMemory;
    }
    if (jvmFreeMemory != null) {
      $result.jvmFreeMemory = jvmFreeMemory;
    }
    if (processCpuRate != null) {
      $result.processCpuRate = processCpuRate;
    }
    if (memoryDescInfoList != null) {
      $result.memoryDescInfoList.addAll(memoryDescInfoList);
    }
    if (deadLockThreadInfoList != null) {
      $result.deadLockThreadInfoList.addAll(deadLockThreadInfoList);
    }
    return $result;
  }
  NodeInfo_MachineInfo._() : super();
  factory NodeInfo_MachineInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo.MachineInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'threadCount', $pb.PbFieldType.O3, protoName: 'threadCount')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'deadLockThreadCount', $pb.PbFieldType.O3, protoName: 'deadLockThreadCount')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'cpuCount', $pb.PbFieldType.O3, protoName: 'cpuCount')
    ..aInt64(4, _omitFieldNames ? '' : 'totalMemory', protoName: 'totalMemory')
    ..aInt64(5, _omitFieldNames ? '' : 'freeMemory', protoName: 'freeMemory')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'cpuRate', $pb.PbFieldType.OD, protoName: 'cpuRate')
    ..aOS(7, _omitFieldNames ? '' : 'javaVersion', protoName: 'javaVersion')
    ..aOS(8, _omitFieldNames ? '' : 'osName', protoName: 'osName')
    ..aInt64(9, _omitFieldNames ? '' : 'jvmTotalMemory', protoName: 'jvmTotalMemory')
    ..aInt64(10, _omitFieldNames ? '' : 'jvmFreeMemory', protoName: 'jvmFreeMemory')
    ..a<$core.double>(11, _omitFieldNames ? '' : 'processCpuRate', $pb.PbFieldType.OD, protoName: 'processCpuRate')
    ..pc<NodeInfo_MachineInfo_MemoryDescInfo>(12, _omitFieldNames ? '' : 'memoryDescInfoList', $pb.PbFieldType.PM, protoName: 'memoryDescInfoList', subBuilder: NodeInfo_MachineInfo_MemoryDescInfo.create)
    ..pc<NodeInfo_MachineInfo_DeadLockThreadInfo>(13, _omitFieldNames ? '' : 'deadLockThreadInfoList', $pb.PbFieldType.PM, protoName: 'deadLockThreadInfoList', subBuilder: NodeInfo_MachineInfo_DeadLockThreadInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo clone() => NodeInfo_MachineInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo_MachineInfo copyWith(void Function(NodeInfo_MachineInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo)) as NodeInfo_MachineInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo create() => NodeInfo_MachineInfo._();
  NodeInfo_MachineInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo>(create);
  static NodeInfo_MachineInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get deadLockThreadCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set deadLockThreadCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeadLockThreadCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeadLockThreadCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cpuCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set cpuCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCpuCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCpuCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalMemory => $_getI64(3);
  @$pb.TagNumber(4)
  set totalMemory($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalMemory() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalMemory() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get freeMemory => $_getI64(4);
  @$pb.TagNumber(5)
  set freeMemory($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFreeMemory() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreeMemory() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get cpuRate => $_getN(5);
  @$pb.TagNumber(6)
  set cpuRate($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCpuRate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCpuRate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get javaVersion => $_getSZ(6);
  @$pb.TagNumber(7)
  set javaVersion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasJavaVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearJavaVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get osName => $_getSZ(7);
  @$pb.TagNumber(8)
  set osName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOsName() => $_has(7);
  @$pb.TagNumber(8)
  void clearOsName() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get jvmTotalMemory => $_getI64(8);
  @$pb.TagNumber(9)
  set jvmTotalMemory($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasJvmTotalMemory() => $_has(8);
  @$pb.TagNumber(9)
  void clearJvmTotalMemory() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get jvmFreeMemory => $_getI64(9);
  @$pb.TagNumber(10)
  set jvmFreeMemory($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasJvmFreeMemory() => $_has(9);
  @$pb.TagNumber(10)
  void clearJvmFreeMemory() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get processCpuRate => $_getN(10);
  @$pb.TagNumber(11)
  set processCpuRate($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasProcessCpuRate() => $_has(10);
  @$pb.TagNumber(11)
  void clearProcessCpuRate() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<NodeInfo_MachineInfo_MemoryDescInfo> get memoryDescInfoList => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<NodeInfo_MachineInfo_DeadLockThreadInfo> get deadLockThreadInfoList => $_getList(12);
}

class NodeInfo extends $pb.GeneratedMessage {
  factory NodeInfo({
    $fixnum.Int64? beginSyncNum,
    $core.String? block,
    $core.String? solidityBlock,
    $core.int? currentConnectCount,
    $core.int? activeConnectCount,
    $core.int? passiveConnectCount,
    $fixnum.Int64? totalFlow,
    $core.Iterable<NodeInfo_PeerInfo>? peerInfoList,
    NodeInfo_ConfigNodeInfo? configNodeInfo,
    NodeInfo_MachineInfo? machineInfo,
    $core.Map<$core.String, $core.String>? cheatWitnessInfoMap,
  }) {
    final $result = create();
    if (beginSyncNum != null) {
      $result.beginSyncNum = beginSyncNum;
    }
    if (block != null) {
      $result.block = block;
    }
    if (solidityBlock != null) {
      $result.solidityBlock = solidityBlock;
    }
    if (currentConnectCount != null) {
      $result.currentConnectCount = currentConnectCount;
    }
    if (activeConnectCount != null) {
      $result.activeConnectCount = activeConnectCount;
    }
    if (passiveConnectCount != null) {
      $result.passiveConnectCount = passiveConnectCount;
    }
    if (totalFlow != null) {
      $result.totalFlow = totalFlow;
    }
    if (peerInfoList != null) {
      $result.peerInfoList.addAll(peerInfoList);
    }
    if (configNodeInfo != null) {
      $result.configNodeInfo = configNodeInfo;
    }
    if (machineInfo != null) {
      $result.machineInfo = machineInfo;
    }
    if (cheatWitnessInfoMap != null) {
      $result.cheatWitnessInfoMap.addAll(cheatWitnessInfoMap);
    }
    return $result;
  }
  NodeInfo._() : super();
  factory NodeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'beginSyncNum', protoName: 'beginSyncNum')
    ..aOS(2, _omitFieldNames ? '' : 'block')
    ..aOS(3, _omitFieldNames ? '' : 'solidityBlock', protoName: 'solidityBlock')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'currentConnectCount', $pb.PbFieldType.O3, protoName: 'currentConnectCount')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'activeConnectCount', $pb.PbFieldType.O3, protoName: 'activeConnectCount')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'passiveConnectCount', $pb.PbFieldType.O3, protoName: 'passiveConnectCount')
    ..aInt64(7, _omitFieldNames ? '' : 'totalFlow', protoName: 'totalFlow')
    ..pc<NodeInfo_PeerInfo>(8, _omitFieldNames ? '' : 'peerInfoList', $pb.PbFieldType.PM, protoName: 'peerInfoList', subBuilder: NodeInfo_PeerInfo.create)
    ..aOM<NodeInfo_ConfigNodeInfo>(9, _omitFieldNames ? '' : 'configNodeInfo', protoName: 'configNodeInfo', subBuilder: NodeInfo_ConfigNodeInfo.create)
    ..aOM<NodeInfo_MachineInfo>(10, _omitFieldNames ? '' : 'machineInfo', protoName: 'machineInfo', subBuilder: NodeInfo_MachineInfo.create)
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'cheatWitnessInfoMap', protoName: 'cheatWitnessInfoMap', entryClassName: 'NodeInfo.CheatWitnessInfoMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeInfo clone() => NodeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeInfo copyWith(void Function(NodeInfo) updates) => super.copyWith((message) => updates(message as NodeInfo)) as NodeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo create() => NodeInfo._();
  NodeInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo> createRepeated() => $pb.PbList<NodeInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo>(create);
  static NodeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginSyncNum => $_getI64(0);
  @$pb.TagNumber(1)
  set beginSyncNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginSyncNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginSyncNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get block => $_getSZ(1);
  @$pb.TagNumber(2)
  set block($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlock() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get solidityBlock => $_getSZ(2);
  @$pb.TagNumber(3)
  set solidityBlock($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSolidityBlock() => $_has(2);
  @$pb.TagNumber(3)
  void clearSolidityBlock() => clearField(3);

  /// connect information
  @$pb.TagNumber(4)
  $core.int get currentConnectCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentConnectCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentConnectCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentConnectCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeConnectCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeConnectCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveConnectCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveConnectCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get passiveConnectCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set passiveConnectCount($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassiveConnectCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassiveConnectCount() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalFlow => $_getI64(6);
  @$pb.TagNumber(7)
  set totalFlow($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalFlow() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalFlow() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<NodeInfo_PeerInfo> get peerInfoList => $_getList(7);

  @$pb.TagNumber(9)
  NodeInfo_ConfigNodeInfo get configNodeInfo => $_getN(8);
  @$pb.TagNumber(9)
  set configNodeInfo(NodeInfo_ConfigNodeInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasConfigNodeInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearConfigNodeInfo() => clearField(9);
  @$pb.TagNumber(9)
  NodeInfo_ConfigNodeInfo ensureConfigNodeInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  NodeInfo_MachineInfo get machineInfo => $_getN(9);
  @$pb.TagNumber(10)
  set machineInfo(NodeInfo_MachineInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMachineInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearMachineInfo() => clearField(10);
  @$pb.TagNumber(10)
  NodeInfo_MachineInfo ensureMachineInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get cheatWitnessInfoMap => $_getMap(10);
}

class MetricsInfo_NodeInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NodeInfo({
    $core.String? ip,
    $core.int? nodeType,
    $core.String? version,
    $core.int? backupStatus,
  }) {
    final $result = create();
    if (ip != null) {
      $result.ip = ip;
    }
    if (nodeType != null) {
      $result.nodeType = nodeType;
    }
    if (version != null) {
      $result.version = version;
    }
    if (backupStatus != null) {
      $result.backupStatus = backupStatus;
    }
    return $result;
  }
  MetricsInfo_NodeInfo._() : super();
  factory MetricsInfo_NodeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NodeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NodeInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ip')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'nodeType', $pb.PbFieldType.O3, protoName: 'nodeType')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'backupStatus', $pb.PbFieldType.O3, protoName: 'backupStatus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NodeInfo clone() => MetricsInfo_NodeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NodeInfo copyWith(void Function(MetricsInfo_NodeInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NodeInfo)) as MetricsInfo_NodeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NodeInfo create() => MetricsInfo_NodeInfo._();
  MetricsInfo_NodeInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NodeInfo> createRepeated() => $pb.PbList<MetricsInfo_NodeInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NodeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NodeInfo>(create);
  static MetricsInfo_NodeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ip => $_getSZ(0);
  @$pb.TagNumber(1)
  set ip($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIp() => $_has(0);
  @$pb.TagNumber(1)
  void clearIp() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nodeType => $_getIZ(1);
  @$pb.TagNumber(2)
  set nodeType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNodeType() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get backupStatus => $_getIZ(3);
  @$pb.TagNumber(4)
  set backupStatus($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBackupStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackupStatus() => clearField(4);
}

class MetricsInfo_BlockChainInfo_Witness extends $pb.GeneratedMessage {
  factory MetricsInfo_BlockChainInfo_Witness({
    $core.String? address,
    $core.int? version,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  MetricsInfo_BlockChainInfo_Witness._() : super();
  factory MetricsInfo_BlockChainInfo_Witness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_BlockChainInfo_Witness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.BlockChainInfo.Witness', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo_Witness clone() => MetricsInfo_BlockChainInfo_Witness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo_Witness copyWith(void Function(MetricsInfo_BlockChainInfo_Witness) updates) => super.copyWith((message) => updates(message as MetricsInfo_BlockChainInfo_Witness)) as MetricsInfo_BlockChainInfo_Witness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo_Witness create() => MetricsInfo_BlockChainInfo_Witness._();
  MetricsInfo_BlockChainInfo_Witness createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_BlockChainInfo_Witness> createRepeated() => $pb.PbList<MetricsInfo_BlockChainInfo_Witness>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo_Witness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_BlockChainInfo_Witness>(create);
  static MetricsInfo_BlockChainInfo_Witness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class MetricsInfo_BlockChainInfo_DupWitness extends $pb.GeneratedMessage {
  factory MetricsInfo_BlockChainInfo_DupWitness({
    $core.String? address,
    $fixnum.Int64? blockNum,
    $core.int? count,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (blockNum != null) {
      $result.blockNum = blockNum;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  MetricsInfo_BlockChainInfo_DupWitness._() : super();
  factory MetricsInfo_BlockChainInfo_DupWitness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_BlockChainInfo_DupWitness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.BlockChainInfo.DupWitness', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aInt64(2, _omitFieldNames ? '' : 'blockNum', protoName: 'blockNum')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo_DupWitness clone() => MetricsInfo_BlockChainInfo_DupWitness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo_DupWitness copyWith(void Function(MetricsInfo_BlockChainInfo_DupWitness) updates) => super.copyWith((message) => updates(message as MetricsInfo_BlockChainInfo_DupWitness)) as MetricsInfo_BlockChainInfo_DupWitness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo_DupWitness create() => MetricsInfo_BlockChainInfo_DupWitness._();
  MetricsInfo_BlockChainInfo_DupWitness createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_BlockChainInfo_DupWitness> createRepeated() => $pb.PbList<MetricsInfo_BlockChainInfo_DupWitness>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo_DupWitness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_BlockChainInfo_DupWitness>(create);
  static MetricsInfo_BlockChainInfo_DupWitness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockNum => $_getI64(1);
  @$pb.TagNumber(2)
  set blockNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class MetricsInfo_BlockChainInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_BlockChainInfo({
    $fixnum.Int64? headBlockNum,
    $fixnum.Int64? headBlockTimestamp,
    $core.String? headBlockHash,
    $core.int? forkCount,
    $core.int? failForkCount,
    MetricsInfo_RateInfo? blockProcessTime,
    MetricsInfo_RateInfo? tps,
    $core.int? transactionCacheSize,
    MetricsInfo_RateInfo? missedTransaction,
    $core.Iterable<MetricsInfo_BlockChainInfo_Witness>? witnesses,
    $fixnum.Int64? failProcessBlockNum,
    $core.String? failProcessBlockReason,
    $core.Iterable<MetricsInfo_BlockChainInfo_DupWitness>? dupWitness,
  }) {
    final $result = create();
    if (headBlockNum != null) {
      $result.headBlockNum = headBlockNum;
    }
    if (headBlockTimestamp != null) {
      $result.headBlockTimestamp = headBlockTimestamp;
    }
    if (headBlockHash != null) {
      $result.headBlockHash = headBlockHash;
    }
    if (forkCount != null) {
      $result.forkCount = forkCount;
    }
    if (failForkCount != null) {
      $result.failForkCount = failForkCount;
    }
    if (blockProcessTime != null) {
      $result.blockProcessTime = blockProcessTime;
    }
    if (tps != null) {
      $result.tps = tps;
    }
    if (transactionCacheSize != null) {
      $result.transactionCacheSize = transactionCacheSize;
    }
    if (missedTransaction != null) {
      $result.missedTransaction = missedTransaction;
    }
    if (witnesses != null) {
      $result.witnesses.addAll(witnesses);
    }
    if (failProcessBlockNum != null) {
      $result.failProcessBlockNum = failProcessBlockNum;
    }
    if (failProcessBlockReason != null) {
      $result.failProcessBlockReason = failProcessBlockReason;
    }
    if (dupWitness != null) {
      $result.dupWitness.addAll(dupWitness);
    }
    return $result;
  }
  MetricsInfo_BlockChainInfo._() : super();
  factory MetricsInfo_BlockChainInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_BlockChainInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.BlockChainInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'headBlockNum', protoName: 'headBlockNum')
    ..aInt64(2, _omitFieldNames ? '' : 'headBlockTimestamp', protoName: 'headBlockTimestamp')
    ..aOS(3, _omitFieldNames ? '' : 'headBlockHash', protoName: 'headBlockHash')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'forkCount', $pb.PbFieldType.O3, protoName: 'forkCount')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'failForkCount', $pb.PbFieldType.O3, protoName: 'failForkCount')
    ..aOM<MetricsInfo_RateInfo>(6, _omitFieldNames ? '' : 'blockProcessTime', protoName: 'blockProcessTime', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(7, _omitFieldNames ? '' : 'tps', subBuilder: MetricsInfo_RateInfo.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'transactionCacheSize', $pb.PbFieldType.O3, protoName: 'transactionCacheSize')
    ..aOM<MetricsInfo_RateInfo>(9, _omitFieldNames ? '' : 'missedTransaction', protoName: 'missedTransaction', subBuilder: MetricsInfo_RateInfo.create)
    ..pc<MetricsInfo_BlockChainInfo_Witness>(10, _omitFieldNames ? '' : 'witnesses', $pb.PbFieldType.PM, subBuilder: MetricsInfo_BlockChainInfo_Witness.create)
    ..aInt64(11, _omitFieldNames ? '' : 'failProcessBlockNum', protoName: 'failProcessBlockNum')
    ..aOS(12, _omitFieldNames ? '' : 'failProcessBlockReason', protoName: 'failProcessBlockReason')
    ..pc<MetricsInfo_BlockChainInfo_DupWitness>(13, _omitFieldNames ? '' : 'dupWitness', $pb.PbFieldType.PM, protoName: 'dupWitness', subBuilder: MetricsInfo_BlockChainInfo_DupWitness.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo clone() => MetricsInfo_BlockChainInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_BlockChainInfo copyWith(void Function(MetricsInfo_BlockChainInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_BlockChainInfo)) as MetricsInfo_BlockChainInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo create() => MetricsInfo_BlockChainInfo._();
  MetricsInfo_BlockChainInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_BlockChainInfo> createRepeated() => $pb.PbList<MetricsInfo_BlockChainInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_BlockChainInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_BlockChainInfo>(create);
  static MetricsInfo_BlockChainInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get headBlockNum => $_getI64(0);
  @$pb.TagNumber(1)
  set headBlockNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeadBlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeadBlockNum() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get headBlockTimestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set headBlockTimestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeadBlockTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeadBlockTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get headBlockHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set headBlockHash($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeadBlockHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeadBlockHash() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get forkCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set forkCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasForkCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearForkCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get failForkCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set failForkCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFailForkCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFailForkCount() => clearField(5);

  @$pb.TagNumber(6)
  MetricsInfo_RateInfo get blockProcessTime => $_getN(5);
  @$pb.TagNumber(6)
  set blockProcessTime(MetricsInfo_RateInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBlockProcessTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlockProcessTime() => clearField(6);
  @$pb.TagNumber(6)
  MetricsInfo_RateInfo ensureBlockProcessTime() => $_ensure(5);

  @$pb.TagNumber(7)
  MetricsInfo_RateInfo get tps => $_getN(6);
  @$pb.TagNumber(7)
  set tps(MetricsInfo_RateInfo v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTps() => $_has(6);
  @$pb.TagNumber(7)
  void clearTps() => clearField(7);
  @$pb.TagNumber(7)
  MetricsInfo_RateInfo ensureTps() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get transactionCacheSize => $_getIZ(7);
  @$pb.TagNumber(8)
  set transactionCacheSize($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTransactionCacheSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransactionCacheSize() => clearField(8);

  @$pb.TagNumber(9)
  MetricsInfo_RateInfo get missedTransaction => $_getN(8);
  @$pb.TagNumber(9)
  set missedTransaction(MetricsInfo_RateInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasMissedTransaction() => $_has(8);
  @$pb.TagNumber(9)
  void clearMissedTransaction() => clearField(9);
  @$pb.TagNumber(9)
  MetricsInfo_RateInfo ensureMissedTransaction() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<MetricsInfo_BlockChainInfo_Witness> get witnesses => $_getList(9);

  @$pb.TagNumber(11)
  $fixnum.Int64 get failProcessBlockNum => $_getI64(10);
  @$pb.TagNumber(11)
  set failProcessBlockNum($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFailProcessBlockNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearFailProcessBlockNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get failProcessBlockReason => $_getSZ(11);
  @$pb.TagNumber(12)
  set failProcessBlockReason($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasFailProcessBlockReason() => $_has(11);
  @$pb.TagNumber(12)
  void clearFailProcessBlockReason() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<MetricsInfo_BlockChainInfo_DupWitness> get dupWitness => $_getList(12);
}

class MetricsInfo_RateInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_RateInfo({
    $fixnum.Int64? count,
    $core.double? meanRate,
    $core.double? oneMinuteRate,
    $core.double? fiveMinuteRate,
    $core.double? fifteenMinuteRate,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    if (meanRate != null) {
      $result.meanRate = meanRate;
    }
    if (oneMinuteRate != null) {
      $result.oneMinuteRate = oneMinuteRate;
    }
    if (fiveMinuteRate != null) {
      $result.fiveMinuteRate = fiveMinuteRate;
    }
    if (fifteenMinuteRate != null) {
      $result.fifteenMinuteRate = fifteenMinuteRate;
    }
    return $result;
  }
  MetricsInfo_RateInfo._() : super();
  factory MetricsInfo_RateInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_RateInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.RateInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'count')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'meanRate', $pb.PbFieldType.OD, protoName: 'meanRate')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'oneMinuteRate', $pb.PbFieldType.OD, protoName: 'oneMinuteRate')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'fiveMinuteRate', $pb.PbFieldType.OD, protoName: 'fiveMinuteRate')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'fifteenMinuteRate', $pb.PbFieldType.OD, protoName: 'fifteenMinuteRate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_RateInfo clone() => MetricsInfo_RateInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_RateInfo copyWith(void Function(MetricsInfo_RateInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_RateInfo)) as MetricsInfo_RateInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_RateInfo create() => MetricsInfo_RateInfo._();
  MetricsInfo_RateInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_RateInfo> createRepeated() => $pb.PbList<MetricsInfo_RateInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_RateInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_RateInfo>(create);
  static MetricsInfo_RateInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get count => $_getI64(0);
  @$pb.TagNumber(1)
  set count($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get meanRate => $_getN(1);
  @$pb.TagNumber(2)
  set meanRate($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeanRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeanRate() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get oneMinuteRate => $_getN(2);
  @$pb.TagNumber(3)
  set oneMinuteRate($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOneMinuteRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearOneMinuteRate() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get fiveMinuteRate => $_getN(3);
  @$pb.TagNumber(4)
  set fiveMinuteRate($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFiveMinuteRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearFiveMinuteRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get fifteenMinuteRate => $_getN(4);
  @$pb.TagNumber(5)
  set fifteenMinuteRate($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFifteenMinuteRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearFifteenMinuteRate() => clearField(5);
}

class MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo({
    $core.String? name,
    MetricsInfo_RateInfo? qps,
    MetricsInfo_RateInfo? failQps,
    MetricsInfo_RateInfo? outTraffic,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (qps != null) {
      $result.qps = qps;
    }
    if (failQps != null) {
      $result.failQps = failQps;
    }
    if (outTraffic != null) {
      $result.outTraffic = outTraffic;
    }
    return $result;
  }
  MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo._() : super();
  factory MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo.ApiInfo.ApiDetailInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<MetricsInfo_RateInfo>(2, _omitFieldNames ? '' : 'qps', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(3, _omitFieldNames ? '' : 'failQps', protoName: 'failQps', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(4, _omitFieldNames ? '' : 'outTraffic', protoName: 'outTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo clone() => MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo copyWith(void Function(MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo)) as MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo create() => MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo._();
  MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo>(create);
  static MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  MetricsInfo_RateInfo get qps => $_getN(1);
  @$pb.TagNumber(2)
  set qps(MetricsInfo_RateInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasQps() => $_has(1);
  @$pb.TagNumber(2)
  void clearQps() => clearField(2);
  @$pb.TagNumber(2)
  MetricsInfo_RateInfo ensureQps() => $_ensure(1);

  @$pb.TagNumber(3)
  MetricsInfo_RateInfo get failQps => $_getN(2);
  @$pb.TagNumber(3)
  set failQps(MetricsInfo_RateInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailQps() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailQps() => clearField(3);
  @$pb.TagNumber(3)
  MetricsInfo_RateInfo ensureFailQps() => $_ensure(2);

  @$pb.TagNumber(4)
  MetricsInfo_RateInfo get outTraffic => $_getN(3);
  @$pb.TagNumber(4)
  set outTraffic(MetricsInfo_RateInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOutTraffic() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutTraffic() => clearField(4);
  @$pb.TagNumber(4)
  MetricsInfo_RateInfo ensureOutTraffic() => $_ensure(3);
}

class MetricsInfo_NetInfo_ApiInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo_ApiInfo({
    MetricsInfo_RateInfo? qps,
    MetricsInfo_RateInfo? failQps,
    MetricsInfo_RateInfo? outTraffic,
    $core.Iterable<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo>? detail,
  }) {
    final $result = create();
    if (qps != null) {
      $result.qps = qps;
    }
    if (failQps != null) {
      $result.failQps = failQps;
    }
    if (outTraffic != null) {
      $result.outTraffic = outTraffic;
    }
    if (detail != null) {
      $result.detail.addAll(detail);
    }
    return $result;
  }
  MetricsInfo_NetInfo_ApiInfo._() : super();
  factory MetricsInfo_NetInfo_ApiInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo_ApiInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo.ApiInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<MetricsInfo_RateInfo>(1, _omitFieldNames ? '' : 'qps', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(2, _omitFieldNames ? '' : 'failQps', protoName: 'failQps', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(3, _omitFieldNames ? '' : 'outTraffic', protoName: 'outTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..pc<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo>(4, _omitFieldNames ? '' : 'detail', $pb.PbFieldType.PM, subBuilder: MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_ApiInfo clone() => MetricsInfo_NetInfo_ApiInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_ApiInfo copyWith(void Function(MetricsInfo_NetInfo_ApiInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo_ApiInfo)) as MetricsInfo_NetInfo_ApiInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_ApiInfo create() => MetricsInfo_NetInfo_ApiInfo._();
  MetricsInfo_NetInfo_ApiInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo_ApiInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo_ApiInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_ApiInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo_ApiInfo>(create);
  static MetricsInfo_NetInfo_ApiInfo? _defaultInstance;

  @$pb.TagNumber(1)
  MetricsInfo_RateInfo get qps => $_getN(0);
  @$pb.TagNumber(1)
  set qps(MetricsInfo_RateInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQps() => $_has(0);
  @$pb.TagNumber(1)
  void clearQps() => clearField(1);
  @$pb.TagNumber(1)
  MetricsInfo_RateInfo ensureQps() => $_ensure(0);

  @$pb.TagNumber(2)
  MetricsInfo_RateInfo get failQps => $_getN(1);
  @$pb.TagNumber(2)
  set failQps(MetricsInfo_RateInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFailQps() => $_has(1);
  @$pb.TagNumber(2)
  void clearFailQps() => clearField(2);
  @$pb.TagNumber(2)
  MetricsInfo_RateInfo ensureFailQps() => $_ensure(1);

  @$pb.TagNumber(3)
  MetricsInfo_RateInfo get outTraffic => $_getN(2);
  @$pb.TagNumber(3)
  set outTraffic(MetricsInfo_RateInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutTraffic() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutTraffic() => clearField(3);
  @$pb.TagNumber(3)
  MetricsInfo_RateInfo ensureOutTraffic() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<MetricsInfo_NetInfo_ApiInfo_ApiDetailInfo> get detail => $_getList(3);
}

class MetricsInfo_NetInfo_DisconnectionDetailInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo_DisconnectionDetailInfo({
    $core.String? reason,
    $core.int? count,
  }) {
    final $result = create();
    if (reason != null) {
      $result.reason = reason;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  MetricsInfo_NetInfo_DisconnectionDetailInfo._() : super();
  factory MetricsInfo_NetInfo_DisconnectionDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo_DisconnectionDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo.DisconnectionDetailInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reason')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_DisconnectionDetailInfo clone() => MetricsInfo_NetInfo_DisconnectionDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_DisconnectionDetailInfo copyWith(void Function(MetricsInfo_NetInfo_DisconnectionDetailInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo_DisconnectionDetailInfo)) as MetricsInfo_NetInfo_DisconnectionDetailInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_DisconnectionDetailInfo create() => MetricsInfo_NetInfo_DisconnectionDetailInfo._();
  MetricsInfo_NetInfo_DisconnectionDetailInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo_DisconnectionDetailInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo_DisconnectionDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_DisconnectionDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo_DisconnectionDetailInfo>(create);
  static MetricsInfo_NetInfo_DisconnectionDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo({
    $core.String? witness,
    $core.int? top99,
    $core.int? top95,
    $core.int? top75,
    $core.int? count,
    $core.int? delay1S,
    $core.int? delay2S,
    $core.int? delay3S,
  }) {
    final $result = create();
    if (witness != null) {
      $result.witness = witness;
    }
    if (top99 != null) {
      $result.top99 = top99;
    }
    if (top95 != null) {
      $result.top95 = top95;
    }
    if (top75 != null) {
      $result.top75 = top75;
    }
    if (count != null) {
      $result.count = count;
    }
    if (delay1S != null) {
      $result.delay1S = delay1S;
    }
    if (delay2S != null) {
      $result.delay2S = delay2S;
    }
    if (delay3S != null) {
      $result.delay3S = delay3S;
    }
    return $result;
  }
  MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo._() : super();
  factory MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo.LatencyInfo.LatencyDetailInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'witness')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'top99', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'top95', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'top75', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'delay1S', $pb.PbFieldType.O3, protoName: 'delay1S')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'delay2S', $pb.PbFieldType.O3, protoName: 'delay2S')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'delay3S', $pb.PbFieldType.O3, protoName: 'delay3S')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo clone() => MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo copyWith(void Function(MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo)) as MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo create() => MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo._();
  MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo>(create);
  static MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get witness => $_getSZ(0);
  @$pb.TagNumber(1)
  set witness($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWitness() => $_has(0);
  @$pb.TagNumber(1)
  void clearWitness() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get top99 => $_getIZ(1);
  @$pb.TagNumber(2)
  set top99($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTop99() => $_has(1);
  @$pb.TagNumber(2)
  void clearTop99() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get top95 => $_getIZ(2);
  @$pb.TagNumber(3)
  set top95($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTop95() => $_has(2);
  @$pb.TagNumber(3)
  void clearTop95() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get top75 => $_getIZ(3);
  @$pb.TagNumber(4)
  set top75($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTop75() => $_has(3);
  @$pb.TagNumber(4)
  void clearTop75() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get delay1S => $_getIZ(5);
  @$pb.TagNumber(6)
  set delay1S($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDelay1S() => $_has(5);
  @$pb.TagNumber(6)
  void clearDelay1S() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get delay2S => $_getIZ(6);
  @$pb.TagNumber(7)
  set delay2S($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDelay2S() => $_has(6);
  @$pb.TagNumber(7)
  void clearDelay2S() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get delay3S => $_getIZ(7);
  @$pb.TagNumber(8)
  set delay3S($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDelay3S() => $_has(7);
  @$pb.TagNumber(8)
  void clearDelay3S() => clearField(8);
}

class MetricsInfo_NetInfo_LatencyInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo_LatencyInfo({
    $core.int? top99,
    $core.int? top95,
    $core.int? top75,
    $core.int? totalCount,
    $core.int? delay1S,
    $core.int? delay2S,
    $core.int? delay3S,
    $core.Iterable<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo>? detail,
  }) {
    final $result = create();
    if (top99 != null) {
      $result.top99 = top99;
    }
    if (top95 != null) {
      $result.top95 = top95;
    }
    if (top75 != null) {
      $result.top75 = top75;
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    if (delay1S != null) {
      $result.delay1S = delay1S;
    }
    if (delay2S != null) {
      $result.delay2S = delay2S;
    }
    if (delay3S != null) {
      $result.delay3S = delay3S;
    }
    if (detail != null) {
      $result.detail.addAll(detail);
    }
    return $result;
  }
  MetricsInfo_NetInfo_LatencyInfo._() : super();
  factory MetricsInfo_NetInfo_LatencyInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo_LatencyInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo.LatencyInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'top99', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'top95', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'top75', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3, protoName: 'totalCount')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'delay1S', $pb.PbFieldType.O3, protoName: 'delay1S')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'delay2S', $pb.PbFieldType.O3, protoName: 'delay2S')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'delay3S', $pb.PbFieldType.O3, protoName: 'delay3S')
    ..pc<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo>(8, _omitFieldNames ? '' : 'detail', $pb.PbFieldType.PM, subBuilder: MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_LatencyInfo clone() => MetricsInfo_NetInfo_LatencyInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo_LatencyInfo copyWith(void Function(MetricsInfo_NetInfo_LatencyInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo_LatencyInfo)) as MetricsInfo_NetInfo_LatencyInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_LatencyInfo create() => MetricsInfo_NetInfo_LatencyInfo._();
  MetricsInfo_NetInfo_LatencyInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo_LatencyInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo_LatencyInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo_LatencyInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo_LatencyInfo>(create);
  static MetricsInfo_NetInfo_LatencyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get top99 => $_getIZ(0);
  @$pb.TagNumber(1)
  set top99($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTop99() => $_has(0);
  @$pb.TagNumber(1)
  void clearTop99() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get top95 => $_getIZ(1);
  @$pb.TagNumber(2)
  set top95($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTop95() => $_has(1);
  @$pb.TagNumber(2)
  void clearTop95() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get top75 => $_getIZ(2);
  @$pb.TagNumber(3)
  set top75($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTop75() => $_has(2);
  @$pb.TagNumber(3)
  void clearTop75() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get delay1S => $_getIZ(4);
  @$pb.TagNumber(5)
  set delay1S($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDelay1S() => $_has(4);
  @$pb.TagNumber(5)
  void clearDelay1S() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get delay2S => $_getIZ(5);
  @$pb.TagNumber(6)
  set delay2S($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDelay2S() => $_has(5);
  @$pb.TagNumber(6)
  void clearDelay2S() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get delay3S => $_getIZ(6);
  @$pb.TagNumber(7)
  set delay3S($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDelay3S() => $_has(6);
  @$pb.TagNumber(7)
  void clearDelay3S() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<MetricsInfo_NetInfo_LatencyInfo_LatencyDetailInfo> get detail => $_getList(7);
}

class MetricsInfo_NetInfo extends $pb.GeneratedMessage {
  factory MetricsInfo_NetInfo({
    $core.int? errorProtoCount,
    MetricsInfo_NetInfo_ApiInfo? api,
    $core.int? connectionCount,
    $core.int? validConnectionCount,
    MetricsInfo_RateInfo? tcpInTraffic,
    MetricsInfo_RateInfo? tcpOutTraffic,
    $core.int? disconnectionCount,
    $core.Iterable<MetricsInfo_NetInfo_DisconnectionDetailInfo>? disconnectionDetail,
    MetricsInfo_RateInfo? udpInTraffic,
    MetricsInfo_RateInfo? udpOutTraffic,
    MetricsInfo_NetInfo_LatencyInfo? latency,
  }) {
    final $result = create();
    if (errorProtoCount != null) {
      $result.errorProtoCount = errorProtoCount;
    }
    if (api != null) {
      $result.api = api;
    }
    if (connectionCount != null) {
      $result.connectionCount = connectionCount;
    }
    if (validConnectionCount != null) {
      $result.validConnectionCount = validConnectionCount;
    }
    if (tcpInTraffic != null) {
      $result.tcpInTraffic = tcpInTraffic;
    }
    if (tcpOutTraffic != null) {
      $result.tcpOutTraffic = tcpOutTraffic;
    }
    if (disconnectionCount != null) {
      $result.disconnectionCount = disconnectionCount;
    }
    if (disconnectionDetail != null) {
      $result.disconnectionDetail.addAll(disconnectionDetail);
    }
    if (udpInTraffic != null) {
      $result.udpInTraffic = udpInTraffic;
    }
    if (udpOutTraffic != null) {
      $result.udpOutTraffic = udpOutTraffic;
    }
    if (latency != null) {
      $result.latency = latency;
    }
    return $result;
  }
  MetricsInfo_NetInfo._() : super();
  factory MetricsInfo_NetInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo_NetInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo.NetInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'errorProtoCount', $pb.PbFieldType.O3, protoName: 'errorProtoCount')
    ..aOM<MetricsInfo_NetInfo_ApiInfo>(2, _omitFieldNames ? '' : 'api', subBuilder: MetricsInfo_NetInfo_ApiInfo.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'connectionCount', $pb.PbFieldType.O3, protoName: 'connectionCount')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'validConnectionCount', $pb.PbFieldType.O3, protoName: 'validConnectionCount')
    ..aOM<MetricsInfo_RateInfo>(5, _omitFieldNames ? '' : 'tcpInTraffic', protoName: 'tcpInTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(6, _omitFieldNames ? '' : 'tcpOutTraffic', protoName: 'tcpOutTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'disconnectionCount', $pb.PbFieldType.O3, protoName: 'disconnectionCount')
    ..pc<MetricsInfo_NetInfo_DisconnectionDetailInfo>(8, _omitFieldNames ? '' : 'disconnectionDetail', $pb.PbFieldType.PM, protoName: 'disconnectionDetail', subBuilder: MetricsInfo_NetInfo_DisconnectionDetailInfo.create)
    ..aOM<MetricsInfo_RateInfo>(9, _omitFieldNames ? '' : 'udpInTraffic', protoName: 'udpInTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_RateInfo>(10, _omitFieldNames ? '' : 'udpOutTraffic', protoName: 'udpOutTraffic', subBuilder: MetricsInfo_RateInfo.create)
    ..aOM<MetricsInfo_NetInfo_LatencyInfo>(11, _omitFieldNames ? '' : 'latency', subBuilder: MetricsInfo_NetInfo_LatencyInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo clone() => MetricsInfo_NetInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo_NetInfo copyWith(void Function(MetricsInfo_NetInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo_NetInfo)) as MetricsInfo_NetInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo create() => MetricsInfo_NetInfo._();
  MetricsInfo_NetInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo_NetInfo> createRepeated() => $pb.PbList<MetricsInfo_NetInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo_NetInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo_NetInfo>(create);
  static MetricsInfo_NetInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorProtoCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorProtoCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorProtoCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorProtoCount() => clearField(1);

  @$pb.TagNumber(2)
  MetricsInfo_NetInfo_ApiInfo get api => $_getN(1);
  @$pb.TagNumber(2)
  set api(MetricsInfo_NetInfo_ApiInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasApi() => $_has(1);
  @$pb.TagNumber(2)
  void clearApi() => clearField(2);
  @$pb.TagNumber(2)
  MetricsInfo_NetInfo_ApiInfo ensureApi() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get connectionCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set connectionCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectionCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get validConnectionCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set validConnectionCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValidConnectionCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidConnectionCount() => clearField(4);

  @$pb.TagNumber(5)
  MetricsInfo_RateInfo get tcpInTraffic => $_getN(4);
  @$pb.TagNumber(5)
  set tcpInTraffic(MetricsInfo_RateInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTcpInTraffic() => $_has(4);
  @$pb.TagNumber(5)
  void clearTcpInTraffic() => clearField(5);
  @$pb.TagNumber(5)
  MetricsInfo_RateInfo ensureTcpInTraffic() => $_ensure(4);

  @$pb.TagNumber(6)
  MetricsInfo_RateInfo get tcpOutTraffic => $_getN(5);
  @$pb.TagNumber(6)
  set tcpOutTraffic(MetricsInfo_RateInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTcpOutTraffic() => $_has(5);
  @$pb.TagNumber(6)
  void clearTcpOutTraffic() => clearField(6);
  @$pb.TagNumber(6)
  MetricsInfo_RateInfo ensureTcpOutTraffic() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get disconnectionCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set disconnectionCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDisconnectionCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisconnectionCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<MetricsInfo_NetInfo_DisconnectionDetailInfo> get disconnectionDetail => $_getList(7);

  @$pb.TagNumber(9)
  MetricsInfo_RateInfo get udpInTraffic => $_getN(8);
  @$pb.TagNumber(9)
  set udpInTraffic(MetricsInfo_RateInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUdpInTraffic() => $_has(8);
  @$pb.TagNumber(9)
  void clearUdpInTraffic() => clearField(9);
  @$pb.TagNumber(9)
  MetricsInfo_RateInfo ensureUdpInTraffic() => $_ensure(8);

  @$pb.TagNumber(10)
  MetricsInfo_RateInfo get udpOutTraffic => $_getN(9);
  @$pb.TagNumber(10)
  set udpOutTraffic(MetricsInfo_RateInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUdpOutTraffic() => $_has(9);
  @$pb.TagNumber(10)
  void clearUdpOutTraffic() => clearField(10);
  @$pb.TagNumber(10)
  MetricsInfo_RateInfo ensureUdpOutTraffic() => $_ensure(9);

  @$pb.TagNumber(11)
  MetricsInfo_NetInfo_LatencyInfo get latency => $_getN(10);
  @$pb.TagNumber(11)
  set latency(MetricsInfo_NetInfo_LatencyInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLatency() => $_has(10);
  @$pb.TagNumber(11)
  void clearLatency() => clearField(11);
  @$pb.TagNumber(11)
  MetricsInfo_NetInfo_LatencyInfo ensureLatency() => $_ensure(10);
}

class MetricsInfo extends $pb.GeneratedMessage {
  factory MetricsInfo({
    $fixnum.Int64? interval,
    MetricsInfo_NodeInfo? node,
    MetricsInfo_BlockChainInfo? blockchain,
    MetricsInfo_NetInfo? net,
  }) {
    final $result = create();
    if (interval != null) {
      $result.interval = interval;
    }
    if (node != null) {
      $result.node = node;
    }
    if (blockchain != null) {
      $result.blockchain = blockchain;
    }
    if (net != null) {
      $result.net = net;
    }
    return $result;
  }
  MetricsInfo._() : super();
  factory MetricsInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricsInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricsInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'interval')
    ..aOM<MetricsInfo_NodeInfo>(2, _omitFieldNames ? '' : 'node', subBuilder: MetricsInfo_NodeInfo.create)
    ..aOM<MetricsInfo_BlockChainInfo>(3, _omitFieldNames ? '' : 'blockchain', subBuilder: MetricsInfo_BlockChainInfo.create)
    ..aOM<MetricsInfo_NetInfo>(4, _omitFieldNames ? '' : 'net', subBuilder: MetricsInfo_NetInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricsInfo clone() => MetricsInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricsInfo copyWith(void Function(MetricsInfo) updates) => super.copyWith((message) => updates(message as MetricsInfo)) as MetricsInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricsInfo create() => MetricsInfo._();
  MetricsInfo createEmptyInstance() => create();
  static $pb.PbList<MetricsInfo> createRepeated() => $pb.PbList<MetricsInfo>();
  @$core.pragma('dart2js:noInline')
  static MetricsInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricsInfo>(create);
  static MetricsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get interval => $_getI64(0);
  @$pb.TagNumber(1)
  set interval($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearInterval() => clearField(1);

  @$pb.TagNumber(2)
  MetricsInfo_NodeInfo get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(MetricsInfo_NodeInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => clearField(2);
  @$pb.TagNumber(2)
  MetricsInfo_NodeInfo ensureNode() => $_ensure(1);

  @$pb.TagNumber(3)
  MetricsInfo_BlockChainInfo get blockchain => $_getN(2);
  @$pb.TagNumber(3)
  set blockchain(MetricsInfo_BlockChainInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockchain() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockchain() => clearField(3);
  @$pb.TagNumber(3)
  MetricsInfo_BlockChainInfo ensureBlockchain() => $_ensure(2);

  @$pb.TagNumber(4)
  MetricsInfo_NetInfo get net => $_getN(3);
  @$pb.TagNumber(4)
  set net(MetricsInfo_NetInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasNet() => $_has(3);
  @$pb.TagNumber(4)
  void clearNet() => clearField(4);
  @$pb.TagNumber(4)
  MetricsInfo_NetInfo ensureNet() => $_ensure(3);
}

class PBFTMessage_Raw extends $pb.GeneratedMessage {
  factory PBFTMessage_Raw({
    PBFTMessage_MsgType? msgType,
    PBFTMessage_DataType? dataType,
    $fixnum.Int64? viewN,
    $fixnum.Int64? epoch,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (dataType != null) {
      $result.dataType = dataType;
    }
    if (viewN != null) {
      $result.viewN = viewN;
    }
    if (epoch != null) {
      $result.epoch = epoch;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  PBFTMessage_Raw._() : super();
  factory PBFTMessage_Raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PBFTMessage_Raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PBFTMessage.Raw', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..e<PBFTMessage_MsgType>(1, _omitFieldNames ? '' : 'msgType', $pb.PbFieldType.OE, defaultOrMaker: PBFTMessage_MsgType.VIEW_CHANGE, valueOf: PBFTMessage_MsgType.valueOf, enumValues: PBFTMessage_MsgType.values)
    ..e<PBFTMessage_DataType>(2, _omitFieldNames ? '' : 'dataType', $pb.PbFieldType.OE, defaultOrMaker: PBFTMessage_DataType.BLOCK, valueOf: PBFTMessage_DataType.valueOf, enumValues: PBFTMessage_DataType.values)
    ..aInt64(3, _omitFieldNames ? '' : 'viewN')
    ..aInt64(4, _omitFieldNames ? '' : 'epoch')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PBFTMessage_Raw clone() => PBFTMessage_Raw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PBFTMessage_Raw copyWith(void Function(PBFTMessage_Raw) updates) => super.copyWith((message) => updates(message as PBFTMessage_Raw)) as PBFTMessage_Raw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PBFTMessage_Raw create() => PBFTMessage_Raw._();
  PBFTMessage_Raw createEmptyInstance() => create();
  static $pb.PbList<PBFTMessage_Raw> createRepeated() => $pb.PbList<PBFTMessage_Raw>();
  @$core.pragma('dart2js:noInline')
  static PBFTMessage_Raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PBFTMessage_Raw>(create);
  static PBFTMessage_Raw? _defaultInstance;

  @$pb.TagNumber(1)
  PBFTMessage_MsgType get msgType => $_getN(0);
  @$pb.TagNumber(1)
  set msgType(PBFTMessage_MsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgType() => clearField(1);

  @$pb.TagNumber(2)
  PBFTMessage_DataType get dataType => $_getN(1);
  @$pb.TagNumber(2)
  set dataType(PBFTMessage_DataType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDataType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDataType() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get viewN => $_getI64(2);
  @$pb.TagNumber(3)
  set viewN($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasViewN() => $_has(2);
  @$pb.TagNumber(3)
  void clearViewN() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get epoch => $_getI64(3);
  @$pb.TagNumber(4)
  set epoch($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEpoch() => $_has(3);
  @$pb.TagNumber(4)
  void clearEpoch() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => clearField(5);
}

class PBFTMessage extends $pb.GeneratedMessage {
  factory PBFTMessage({
    PBFTMessage_Raw? rawData,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (rawData != null) {
      $result.rawData = rawData;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  PBFTMessage._() : super();
  factory PBFTMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PBFTMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PBFTMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<PBFTMessage_Raw>(1, _omitFieldNames ? '' : 'rawData', subBuilder: PBFTMessage_Raw.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PBFTMessage clone() => PBFTMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PBFTMessage copyWith(void Function(PBFTMessage) updates) => super.copyWith((message) => updates(message as PBFTMessage)) as PBFTMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PBFTMessage create() => PBFTMessage._();
  PBFTMessage createEmptyInstance() => create();
  static $pb.PbList<PBFTMessage> createRepeated() => $pb.PbList<PBFTMessage>();
  @$core.pragma('dart2js:noInline')
  static PBFTMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PBFTMessage>(create);
  static PBFTMessage? _defaultInstance;

  @$pb.TagNumber(1)
  PBFTMessage_Raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(PBFTMessage_Raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  PBFTMessage_Raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}

class PBFTCommitResult extends $pb.GeneratedMessage {
  factory PBFTCommitResult({
    $core.List<$core.int>? data,
    $core.Iterable<$core.List<$core.int>>? signature,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (signature != null) {
      $result.signature.addAll(signature);
    }
    return $result;
  }
  PBFTCommitResult._() : super();
  factory PBFTCommitResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PBFTCommitResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PBFTCommitResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PBFTCommitResult clone() => PBFTCommitResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PBFTCommitResult copyWith(void Function(PBFTCommitResult) updates) => super.copyWith((message) => updates(message as PBFTCommitResult)) as PBFTCommitResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PBFTCommitResult create() => PBFTCommitResult._();
  PBFTCommitResult createEmptyInstance() => create();
  static $pb.PbList<PBFTCommitResult> createRepeated() => $pb.PbList<PBFTCommitResult>();
  @$core.pragma('dart2js:noInline')
  static PBFTCommitResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PBFTCommitResult>(create);
  static PBFTCommitResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get signature => $_getList(1);
}

class SRL extends $pb.GeneratedMessage {
  factory SRL({
    $core.Iterable<$core.List<$core.int>>? srAddress,
  }) {
    final $result = create();
    if (srAddress != null) {
      $result.srAddress.addAll(srAddress);
    }
    return $result;
  }
  SRL._() : super();
  factory SRL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SRL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SRL', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'srAddress', $pb.PbFieldType.PY, protoName: 'srAddress')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SRL clone() => SRL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SRL copyWith(void Function(SRL) updates) => super.copyWith((message) => updates(message as SRL)) as SRL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SRL create() => SRL._();
  SRL createEmptyInstance() => create();
  static $pb.PbList<SRL> createRepeated() => $pb.PbList<SRL>();
  @$core.pragma('dart2js:noInline')
  static SRL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SRL>(create);
  static SRL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get srAddress => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
