//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../core/Tron.pb.dart' as $0;
import '../core/contract/asset_issue_contract.pb.dart' as $6;
import '../core/contract/shield_contract.pb.dart' as $11;
import 'api.pbenum.dart';

export 'api.pbenum.dart';

class Return extends $pb.GeneratedMessage {
  factory Return({
    $core.bool? result,
    Return_response_code? code,
    $core.List<$core.int>? message,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  Return._() : super();
  factory Return.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Return.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Return',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..e<Return_response_code>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE,
        defaultOrMaker: Return_response_code.SUCCESS,
        valueOf: Return_response_code.valueOf,
        enumValues: Return_response_code.values)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Return clone() => Return()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Return copyWith(void Function(Return) updates) =>
      super.copyWith((message) => updates(message as Return)) as Return;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Return create() => Return._();
  Return createEmptyInstance() => create();
  static $pb.PbList<Return> createRepeated() => $pb.PbList<Return>();
  @$core.pragma('dart2js:noInline')
  static Return getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Return>(create);
  static Return? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  Return_response_code get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(Return_response_code v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class BlockReference extends $pb.GeneratedMessage {
  factory BlockReference({
    $fixnum.Int64? blockNum,
    $core.List<$core.int>? blockHash,
  }) {
    final $result = create();
    if (blockNum != null) {
      $result.blockNum = blockNum;
    }
    if (blockHash != null) {
      $result.blockHash = blockHash;
    }
    return $result;
  }
  BlockReference._() : super();
  factory BlockReference.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockReference.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockReference',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'blockNum')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'blockHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockReference clone() => BlockReference()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockReference copyWith(void Function(BlockReference) updates) =>
      super.copyWith((message) => updates(message as BlockReference)) as BlockReference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockReference create() => BlockReference._();
  BlockReference createEmptyInstance() => create();
  static $pb.PbList<BlockReference> createRepeated() => $pb.PbList<BlockReference>();
  @$core.pragma('dart2js:noInline')
  static BlockReference getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockReference>(create);
  static BlockReference? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockNum => $_getI64(0);
  @$pb.TagNumber(1)
  set blockNum($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get blockHash => $_getN(1);
  @$pb.TagNumber(2)
  set blockHash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlockHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHash() => clearField(2);
}

class WitnessList extends $pb.GeneratedMessage {
  factory WitnessList({
    $core.Iterable<$0.Witness>? witnesses,
  }) {
    final $result = create();
    if (witnesses != null) {
      $result.witnesses.addAll(witnesses);
    }
    return $result;
  }
  WitnessList._() : super();
  factory WitnessList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WitnessList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WitnessList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.Witness>(1, _omitFieldNames ? '' : 'witnesses', $pb.PbFieldType.PM,
        subBuilder: $0.Witness.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WitnessList clone() => WitnessList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WitnessList copyWith(void Function(WitnessList) updates) =>
      super.copyWith((message) => updates(message as WitnessList)) as WitnessList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WitnessList create() => WitnessList._();
  WitnessList createEmptyInstance() => create();
  static $pb.PbList<WitnessList> createRepeated() => $pb.PbList<WitnessList>();
  @$core.pragma('dart2js:noInline')
  static WitnessList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessList>(create);
  static WitnessList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Witness> get witnesses => $_getList(0);
}

class ProposalList extends $pb.GeneratedMessage {
  factory ProposalList({
    $core.Iterable<$0.Proposal>? proposals,
  }) {
    final $result = create();
    if (proposals != null) {
      $result.proposals.addAll(proposals);
    }
    return $result;
  }
  ProposalList._() : super();
  factory ProposalList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProposalList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProposalList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.Proposal>(1, _omitFieldNames ? '' : 'proposals', $pb.PbFieldType.PM,
        subBuilder: $0.Proposal.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProposalList clone() => ProposalList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProposalList copyWith(void Function(ProposalList) updates) =>
      super.copyWith((message) => updates(message as ProposalList)) as ProposalList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProposalList create() => ProposalList._();
  ProposalList createEmptyInstance() => create();
  static $pb.PbList<ProposalList> createRepeated() => $pb.PbList<ProposalList>();
  @$core.pragma('dart2js:noInline')
  static ProposalList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalList>(create);
  static ProposalList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Proposal> get proposals => $_getList(0);
}

class ExchangeList extends $pb.GeneratedMessage {
  factory ExchangeList({
    $core.Iterable<$0.Exchange>? exchanges,
  }) {
    final $result = create();
    if (exchanges != null) {
      $result.exchanges.addAll(exchanges);
    }
    return $result;
  }
  ExchangeList._() : super();
  factory ExchangeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExchangeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExchangeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.Exchange>(1, _omitFieldNames ? '' : 'exchanges', $pb.PbFieldType.PM,
        subBuilder: $0.Exchange.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExchangeList clone() => ExchangeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExchangeList copyWith(void Function(ExchangeList) updates) =>
      super.copyWith((message) => updates(message as ExchangeList)) as ExchangeList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeList create() => ExchangeList._();
  ExchangeList createEmptyInstance() => create();
  static $pb.PbList<ExchangeList> createRepeated() => $pb.PbList<ExchangeList>();
  @$core.pragma('dart2js:noInline')
  static ExchangeList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeList>(create);
  static ExchangeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Exchange> get exchanges => $_getList(0);
}

class AssetIssueList extends $pb.GeneratedMessage {
  factory AssetIssueList({
    $core.Iterable<$6.AssetIssueContract>? assetIssue,
  }) {
    final $result = create();
    if (assetIssue != null) {
      $result.assetIssue.addAll(assetIssue);
    }
    return $result;
  }
  AssetIssueList._() : super();
  factory AssetIssueList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AssetIssueList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetIssueList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$6.AssetIssueContract>(1, _omitFieldNames ? '' : 'assetIssue', $pb.PbFieldType.PM,
        protoName: 'assetIssue', subBuilder: $6.AssetIssueContract.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AssetIssueList clone() => AssetIssueList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AssetIssueList copyWith(void Function(AssetIssueList) updates) =>
      super.copyWith((message) => updates(message as AssetIssueList)) as AssetIssueList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetIssueList create() => AssetIssueList._();
  AssetIssueList createEmptyInstance() => create();
  static $pb.PbList<AssetIssueList> createRepeated() => $pb.PbList<AssetIssueList>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueList>(create);
  static AssetIssueList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.AssetIssueContract> get assetIssue => $_getList(0);
}

class BlockList extends $pb.GeneratedMessage {
  factory BlockList({
    $core.Iterable<$0.Block>? block,
  }) {
    final $result = create();
    if (block != null) {
      $result.block.addAll(block);
    }
    return $result;
  }
  BlockList._() : super();
  factory BlockList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.Block>(1, _omitFieldNames ? '' : 'block', $pb.PbFieldType.PM,
        subBuilder: $0.Block.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockList clone() => BlockList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockList copyWith(void Function(BlockList) updates) =>
      super.copyWith((message) => updates(message as BlockList)) as BlockList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockList create() => BlockList._();
  BlockList createEmptyInstance() => create();
  static $pb.PbList<BlockList> createRepeated() => $pb.PbList<BlockList>();
  @$core.pragma('dart2js:noInline')
  static BlockList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockList>(create);
  static BlockList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Block> get block => $_getList(0);
}

class TransactionList extends $pb.GeneratedMessage {
  factory TransactionList({
    $core.Iterable<$0.Transaction>? transaction,
  }) {
    final $result = create();
    if (transaction != null) {
      $result.transaction.addAll(transaction);
    }
    return $result;
  }
  TransactionList._() : super();
  factory TransactionList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.Transaction>(1, _omitFieldNames ? '' : 'transaction', $pb.PbFieldType.PM,
        subBuilder: $0.Transaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionList clone() => TransactionList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionList copyWith(void Function(TransactionList) updates) =>
      super.copyWith((message) => updates(message as TransactionList)) as TransactionList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionList create() => TransactionList._();
  TransactionList createEmptyInstance() => create();
  static $pb.PbList<TransactionList> createRepeated() => $pb.PbList<TransactionList>();
  @$core.pragma('dart2js:noInline')
  static TransactionList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionList>(create);
  static TransactionList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Transaction> get transaction => $_getList(0);
}

class TransactionIdList extends $pb.GeneratedMessage {
  factory TransactionIdList({
    $core.Iterable<$core.String>? txId,
  }) {
    final $result = create();
    if (txId != null) {
      $result.txId.addAll(txId);
    }
    return $result;
  }
  TransactionIdList._() : super();
  factory TransactionIdList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionIdList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionIdList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'txId', protoName: 'txId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionIdList clone() => TransactionIdList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionIdList copyWith(void Function(TransactionIdList) updates) =>
      super.copyWith((message) => updates(message as TransactionIdList)) as TransactionIdList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionIdList create() => TransactionIdList._();
  TransactionIdList createEmptyInstance() => create();
  static $pb.PbList<TransactionIdList> createRepeated() => $pb.PbList<TransactionIdList>();
  @$core.pragma('dart2js:noInline')
  static TransactionIdList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionIdList>(create);
  static TransactionIdList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get txId => $_getList(0);
}

class DelegatedResourceMessage extends $pb.GeneratedMessage {
  factory DelegatedResourceMessage({
    $core.List<$core.int>? fromAddress,
    $core.List<$core.int>? toAddress,
  }) {
    final $result = create();
    if (fromAddress != null) {
      $result.fromAddress = fromAddress;
    }
    if (toAddress != null) {
      $result.toAddress = toAddress;
    }
    return $result;
  }
  DelegatedResourceMessage._() : super();
  factory DelegatedResourceMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DelegatedResourceMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DelegatedResourceMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'fromAddress', $pb.PbFieldType.OY,
        protoName: 'fromAddress')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'toAddress', $pb.PbFieldType.OY,
        protoName: 'toAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DelegatedResourceMessage clone() => DelegatedResourceMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DelegatedResourceMessage copyWith(void Function(DelegatedResourceMessage) updates) =>
      super.copyWith((message) => updates(message as DelegatedResourceMessage))
          as DelegatedResourceMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegatedResourceMessage create() => DelegatedResourceMessage._();
  DelegatedResourceMessage createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceMessage> createRepeated() =>
      $pb.PbList<DelegatedResourceMessage>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceMessage>(create);
  static DelegatedResourceMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get fromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set fromAddress($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);
}

class DelegatedResourceList extends $pb.GeneratedMessage {
  factory DelegatedResourceList({
    $core.Iterable<$0.DelegatedResource>? delegatedResource,
  }) {
    final $result = create();
    if (delegatedResource != null) {
      $result.delegatedResource.addAll(delegatedResource);
    }
    return $result;
  }
  DelegatedResourceList._() : super();
  factory DelegatedResourceList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DelegatedResourceList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DelegatedResourceList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.DelegatedResource>(1, _omitFieldNames ? '' : 'delegatedResource', $pb.PbFieldType.PM,
        protoName: 'delegatedResource', subBuilder: $0.DelegatedResource.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DelegatedResourceList clone() => DelegatedResourceList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DelegatedResourceList copyWith(void Function(DelegatedResourceList) updates) =>
      super.copyWith((message) => updates(message as DelegatedResourceList))
          as DelegatedResourceList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegatedResourceList create() => DelegatedResourceList._();
  DelegatedResourceList createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceList> createRepeated() => $pb.PbList<DelegatedResourceList>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceList>(create);
  static DelegatedResourceList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.DelegatedResource> get delegatedResource => $_getList(0);
}

class GetAvailableUnfreezeCountRequestMessage extends $pb.GeneratedMessage {
  factory GetAvailableUnfreezeCountRequestMessage({
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  GetAvailableUnfreezeCountRequestMessage._() : super();
  factory GetAvailableUnfreezeCountRequestMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetAvailableUnfreezeCountRequestMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAvailableUnfreezeCountRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetAvailableUnfreezeCountRequestMessage clone() =>
      GetAvailableUnfreezeCountRequestMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetAvailableUnfreezeCountRequestMessage copyWith(
          void Function(GetAvailableUnfreezeCountRequestMessage) updates) =>
      super.copyWith((message) => updates(message as GetAvailableUnfreezeCountRequestMessage))
          as GetAvailableUnfreezeCountRequestMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableUnfreezeCountRequestMessage create() =>
      GetAvailableUnfreezeCountRequestMessage._();
  GetAvailableUnfreezeCountRequestMessage createEmptyInstance() => create();
  static $pb.PbList<GetAvailableUnfreezeCountRequestMessage> createRepeated() =>
      $pb.PbList<GetAvailableUnfreezeCountRequestMessage>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableUnfreezeCountRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAvailableUnfreezeCountRequestMessage>(create);
  static GetAvailableUnfreezeCountRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class GetAvailableUnfreezeCountResponseMessage extends $pb.GeneratedMessage {
  factory GetAvailableUnfreezeCountResponseMessage({
    $fixnum.Int64? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  GetAvailableUnfreezeCountResponseMessage._() : super();
  factory GetAvailableUnfreezeCountResponseMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetAvailableUnfreezeCountResponseMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAvailableUnfreezeCountResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetAvailableUnfreezeCountResponseMessage clone() =>
      GetAvailableUnfreezeCountResponseMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetAvailableUnfreezeCountResponseMessage copyWith(
          void Function(GetAvailableUnfreezeCountResponseMessage) updates) =>
      super.copyWith((message) => updates(message as GetAvailableUnfreezeCountResponseMessage))
          as GetAvailableUnfreezeCountResponseMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableUnfreezeCountResponseMessage create() =>
      GetAvailableUnfreezeCountResponseMessage._();
  GetAvailableUnfreezeCountResponseMessage createEmptyInstance() => create();
  static $pb.PbList<GetAvailableUnfreezeCountResponseMessage> createRepeated() =>
      $pb.PbList<GetAvailableUnfreezeCountResponseMessage>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableUnfreezeCountResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAvailableUnfreezeCountResponseMessage>(create);
  static GetAvailableUnfreezeCountResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get count => $_getI64(0);
  @$pb.TagNumber(1)
  set count($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class CanDelegatedMaxSizeRequestMessage extends $pb.GeneratedMessage {
  factory CanDelegatedMaxSizeRequestMessage({
    $core.int? type,
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  CanDelegatedMaxSizeRequestMessage._() : super();
  factory CanDelegatedMaxSizeRequestMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CanDelegatedMaxSizeRequestMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CanDelegatedMaxSizeRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CanDelegatedMaxSizeRequestMessage clone() =>
      CanDelegatedMaxSizeRequestMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CanDelegatedMaxSizeRequestMessage copyWith(
          void Function(CanDelegatedMaxSizeRequestMessage) updates) =>
      super.copyWith((message) => updates(message as CanDelegatedMaxSizeRequestMessage))
          as CanDelegatedMaxSizeRequestMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanDelegatedMaxSizeRequestMessage create() => CanDelegatedMaxSizeRequestMessage._();
  CanDelegatedMaxSizeRequestMessage createEmptyInstance() => create();
  static $pb.PbList<CanDelegatedMaxSizeRequestMessage> createRepeated() =>
      $pb.PbList<CanDelegatedMaxSizeRequestMessage>();
  @$core.pragma('dart2js:noInline')
  static CanDelegatedMaxSizeRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CanDelegatedMaxSizeRequestMessage>(create);
  static CanDelegatedMaxSizeRequestMessage? _defaultInstance;

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
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);
}

class CanDelegatedMaxSizeResponseMessage extends $pb.GeneratedMessage {
  factory CanDelegatedMaxSizeResponseMessage({
    $fixnum.Int64? maxSize,
  }) {
    final $result = create();
    if (maxSize != null) {
      $result.maxSize = maxSize;
    }
    return $result;
  }
  CanDelegatedMaxSizeResponseMessage._() : super();
  factory CanDelegatedMaxSizeResponseMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CanDelegatedMaxSizeResponseMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CanDelegatedMaxSizeResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'maxSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CanDelegatedMaxSizeResponseMessage clone() =>
      CanDelegatedMaxSizeResponseMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CanDelegatedMaxSizeResponseMessage copyWith(
          void Function(CanDelegatedMaxSizeResponseMessage) updates) =>
      super.copyWith((message) => updates(message as CanDelegatedMaxSizeResponseMessage))
          as CanDelegatedMaxSizeResponseMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanDelegatedMaxSizeResponseMessage create() => CanDelegatedMaxSizeResponseMessage._();
  CanDelegatedMaxSizeResponseMessage createEmptyInstance() => create();
  static $pb.PbList<CanDelegatedMaxSizeResponseMessage> createRepeated() =>
      $pb.PbList<CanDelegatedMaxSizeResponseMessage>();
  @$core.pragma('dart2js:noInline')
  static CanDelegatedMaxSizeResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CanDelegatedMaxSizeResponseMessage>(create);
  static CanDelegatedMaxSizeResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get maxSize => $_getI64(0);
  @$pb.TagNumber(1)
  set maxSize($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaxSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxSize() => clearField(1);
}

class CanWithdrawUnfreezeAmountRequestMessage extends $pb.GeneratedMessage {
  factory CanWithdrawUnfreezeAmountRequestMessage({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  CanWithdrawUnfreezeAmountRequestMessage._() : super();
  factory CanWithdrawUnfreezeAmountRequestMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CanWithdrawUnfreezeAmountRequestMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CanWithdrawUnfreezeAmountRequestMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CanWithdrawUnfreezeAmountRequestMessage clone() =>
      CanWithdrawUnfreezeAmountRequestMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CanWithdrawUnfreezeAmountRequestMessage copyWith(
          void Function(CanWithdrawUnfreezeAmountRequestMessage) updates) =>
      super.copyWith((message) => updates(message as CanWithdrawUnfreezeAmountRequestMessage))
          as CanWithdrawUnfreezeAmountRequestMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanWithdrawUnfreezeAmountRequestMessage create() =>
      CanWithdrawUnfreezeAmountRequestMessage._();
  CanWithdrawUnfreezeAmountRequestMessage createEmptyInstance() => create();
  static $pb.PbList<CanWithdrawUnfreezeAmountRequestMessage> createRepeated() =>
      $pb.PbList<CanWithdrawUnfreezeAmountRequestMessage>();
  @$core.pragma('dart2js:noInline')
  static CanWithdrawUnfreezeAmountRequestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CanWithdrawUnfreezeAmountRequestMessage>(create);
  static CanWithdrawUnfreezeAmountRequestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);
}

class CanWithdrawUnfreezeAmountResponseMessage extends $pb.GeneratedMessage {
  factory CanWithdrawUnfreezeAmountResponseMessage({
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  CanWithdrawUnfreezeAmountResponseMessage._() : super();
  factory CanWithdrawUnfreezeAmountResponseMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CanWithdrawUnfreezeAmountResponseMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CanWithdrawUnfreezeAmountResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CanWithdrawUnfreezeAmountResponseMessage clone() =>
      CanWithdrawUnfreezeAmountResponseMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CanWithdrawUnfreezeAmountResponseMessage copyWith(
          void Function(CanWithdrawUnfreezeAmountResponseMessage) updates) =>
      super.copyWith((message) => updates(message as CanWithdrawUnfreezeAmountResponseMessage))
          as CanWithdrawUnfreezeAmountResponseMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanWithdrawUnfreezeAmountResponseMessage create() =>
      CanWithdrawUnfreezeAmountResponseMessage._();
  CanWithdrawUnfreezeAmountResponseMessage createEmptyInstance() => create();
  static $pb.PbList<CanWithdrawUnfreezeAmountResponseMessage> createRepeated() =>
      $pb.PbList<CanWithdrawUnfreezeAmountResponseMessage>();
  @$core.pragma('dart2js:noInline')
  static CanWithdrawUnfreezeAmountResponseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CanWithdrawUnfreezeAmountResponseMessage>(create);
  static CanWithdrawUnfreezeAmountResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class PricesResponseMessage extends $pb.GeneratedMessage {
  factory PricesResponseMessage({
    $core.String? prices,
  }) {
    final $result = create();
    if (prices != null) {
      $result.prices = prices;
    }
    return $result;
  }
  PricesResponseMessage._() : super();
  factory PricesResponseMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PricesResponseMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PricesResponseMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prices')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PricesResponseMessage clone() => PricesResponseMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PricesResponseMessage copyWith(void Function(PricesResponseMessage) updates) =>
      super.copyWith((message) => updates(message as PricesResponseMessage))
          as PricesResponseMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PricesResponseMessage create() => PricesResponseMessage._();
  PricesResponseMessage createEmptyInstance() => create();
  static $pb.PbList<PricesResponseMessage> createRepeated() => $pb.PbList<PricesResponseMessage>();
  @$core.pragma('dart2js:noInline')
  static PricesResponseMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PricesResponseMessage>(create);
  static PricesResponseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prices => $_getSZ(0);
  @$pb.TagNumber(1)
  set prices($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrices() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrices() => clearField(1);
}

/// Gossip node list
class NodeList extends $pb.GeneratedMessage {
  factory NodeList({
    $core.Iterable<Node>? nodes,
  }) {
    final $result = create();
    if (nodes != null) {
      $result.nodes.addAll(nodes);
    }
    return $result;
  }
  NodeList._() : super();
  factory NodeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NodeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<Node>(1, _omitFieldNames ? '' : 'nodes', $pb.PbFieldType.PM, subBuilder: Node.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NodeList clone() => NodeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NodeList copyWith(void Function(NodeList) updates) =>
      super.copyWith((message) => updates(message as NodeList)) as NodeList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeList create() => NodeList._();
  NodeList createEmptyInstance() => create();
  static $pb.PbList<NodeList> createRepeated() => $pb.PbList<NodeList>();
  @$core.pragma('dart2js:noInline')
  static NodeList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeList>(create);
  static NodeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Node> get nodes => $_getList(0);
}

/// Gossip node
class Node extends $pb.GeneratedMessage {
  factory Node({
    Address? address,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  Node._() : super();
  factory Node.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Node.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Node',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Address>(1, _omitFieldNames ? '' : 'address', subBuilder: Address.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Node clone() => Node()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Node copyWith(void Function(Node) updates) =>
      super.copyWith((message) => updates(message as Node)) as Node;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  Node createEmptyInstance() => create();
  static $pb.PbList<Node> createRepeated() => $pb.PbList<Node>();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node? _defaultInstance;

  @$pb.TagNumber(1)
  Address get address => $_getN(0);
  @$pb.TagNumber(1)
  set address(Address v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  Address ensureAddress() => $_ensure(0);
}

/// Gossip node address
class Address extends $pb.GeneratedMessage {
  factory Address({
    $core.List<$core.int>? host,
    $core.int? port,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  Address._() : super();
  factory Address.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Address.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Address',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'host', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Address clone() => Address()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Address copyWith(void Function(Address) updates) =>
      super.copyWith((message) => updates(message as Address)) as Address;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get host => $_getN(0);
  @$pb.TagNumber(1)
  set host($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);
}

class EmptyMessage extends $pb.GeneratedMessage {
  factory EmptyMessage() => create();
  EmptyMessage._() : super();
  factory EmptyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmptyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmptyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmptyMessage clone() => EmptyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmptyMessage copyWith(void Function(EmptyMessage) updates) =>
      super.copyWith((message) => updates(message as EmptyMessage)) as EmptyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmptyMessage create() => EmptyMessage._();
  EmptyMessage createEmptyInstance() => create();
  static $pb.PbList<EmptyMessage> createRepeated() => $pb.PbList<EmptyMessage>();
  @$core.pragma('dart2js:noInline')
  static EmptyMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyMessage>(create);
  static EmptyMessage? _defaultInstance;
}

class NumberMessage extends $pb.GeneratedMessage {
  factory NumberMessage({
    $fixnum.Int64? num,
  }) {
    final $result = create();
    if (num != null) {
      $result.num = num;
    }
    return $result;
  }
  NumberMessage._() : super();
  factory NumberMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NumberMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NumberMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'num')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NumberMessage clone() => NumberMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NumberMessage copyWith(void Function(NumberMessage) updates) =>
      super.copyWith((message) => updates(message as NumberMessage)) as NumberMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NumberMessage create() => NumberMessage._();
  NumberMessage createEmptyInstance() => create();
  static $pb.PbList<NumberMessage> createRepeated() => $pb.PbList<NumberMessage>();
  @$core.pragma('dart2js:noInline')
  static NumberMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NumberMessage>(create);
  static NumberMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get num => $_getI64(0);
  @$pb.TagNumber(1)
  set num($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);
}

class BytesMessage extends $pb.GeneratedMessage {
  factory BytesMessage({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BytesMessage._() : super();
  factory BytesMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BytesMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BytesMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BytesMessage clone() => BytesMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BytesMessage copyWith(void Function(BytesMessage) updates) =>
      super.copyWith((message) => updates(message as BytesMessage)) as BytesMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BytesMessage create() => BytesMessage._();
  BytesMessage createEmptyInstance() => create();
  static $pb.PbList<BytesMessage> createRepeated() => $pb.PbList<BytesMessage>();
  @$core.pragma('dart2js:noInline')
  static BytesMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BytesMessage>(create);
  static BytesMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TimeMessage extends $pb.GeneratedMessage {
  factory TimeMessage({
    $fixnum.Int64? beginInMilliseconds,
    $fixnum.Int64? endInMilliseconds,
  }) {
    final $result = create();
    if (beginInMilliseconds != null) {
      $result.beginInMilliseconds = beginInMilliseconds;
    }
    if (endInMilliseconds != null) {
      $result.endInMilliseconds = endInMilliseconds;
    }
    return $result;
  }
  TimeMessage._() : super();
  factory TimeMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TimeMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'beginInMilliseconds', protoName: 'beginInMilliseconds')
    ..aInt64(2, _omitFieldNames ? '' : 'endInMilliseconds', protoName: 'endInMilliseconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TimeMessage clone() => TimeMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TimeMessage copyWith(void Function(TimeMessage) updates) =>
      super.copyWith((message) => updates(message as TimeMessage)) as TimeMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeMessage create() => TimeMessage._();
  TimeMessage createEmptyInstance() => create();
  static $pb.PbList<TimeMessage> createRepeated() => $pb.PbList<TimeMessage>();
  @$core.pragma('dart2js:noInline')
  static TimeMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeMessage>(create);
  static TimeMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginInMilliseconds => $_getI64(0);
  @$pb.TagNumber(1)
  set beginInMilliseconds($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBeginInMilliseconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginInMilliseconds() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endInMilliseconds => $_getI64(1);
  @$pb.TagNumber(2)
  set endInMilliseconds($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndInMilliseconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndInMilliseconds() => clearField(2);
}

class BlockReq extends $pb.GeneratedMessage {
  factory BlockReq({
    $core.String? idOrNum,
    $core.bool? detail,
  }) {
    final $result = create();
    if (idOrNum != null) {
      $result.idOrNum = idOrNum;
    }
    if (detail != null) {
      $result.detail = detail;
    }
    return $result;
  }
  BlockReq._() : super();
  factory BlockReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idOrNum')
    ..aOB(2, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockReq clone() => BlockReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockReq copyWith(void Function(BlockReq) updates) =>
      super.copyWith((message) => updates(message as BlockReq)) as BlockReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockReq create() => BlockReq._();
  BlockReq createEmptyInstance() => create();
  static $pb.PbList<BlockReq> createRepeated() => $pb.PbList<BlockReq>();
  @$core.pragma('dart2js:noInline')
  static BlockReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockReq>(create);
  static BlockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idOrNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set idOrNum($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdOrNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdOrNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get detail => $_getBF(1);
  @$pb.TagNumber(2)
  set detail($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetail() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetail() => clearField(2);
}

class BlockLimit extends $pb.GeneratedMessage {
  factory BlockLimit({
    $fixnum.Int64? startNum,
    $fixnum.Int64? endNum,
  }) {
    final $result = create();
    if (startNum != null) {
      $result.startNum = startNum;
    }
    if (endNum != null) {
      $result.endNum = endNum;
    }
    return $result;
  }
  BlockLimit._() : super();
  factory BlockLimit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockLimit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockLimit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startNum', protoName: 'startNum')
    ..aInt64(2, _omitFieldNames ? '' : 'endNum', protoName: 'endNum')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockLimit clone() => BlockLimit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockLimit copyWith(void Function(BlockLimit) updates) =>
      super.copyWith((message) => updates(message as BlockLimit)) as BlockLimit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockLimit create() => BlockLimit._();
  BlockLimit createEmptyInstance() => create();
  static $pb.PbList<BlockLimit> createRepeated() => $pb.PbList<BlockLimit>();
  @$core.pragma('dart2js:noInline')
  static BlockLimit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockLimit>(create);
  static BlockLimit? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startNum => $_getI64(0);
  @$pb.TagNumber(1)
  set startNum($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartNum() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endNum => $_getI64(1);
  @$pb.TagNumber(2)
  set endNum($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndNum() => clearField(2);
}

class TransactionLimit extends $pb.GeneratedMessage {
  factory TransactionLimit({
    $core.List<$core.int>? transactionId,
    $fixnum.Int64? limitNum,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (limitNum != null) {
      $result.limitNum = limitNum;
    }
    return $result;
  }
  TransactionLimit._() : super();
  factory TransactionLimit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionLimit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionLimit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'transactionId', $pb.PbFieldType.OY,
        protoName: 'transactionId')
    ..aInt64(2, _omitFieldNames ? '' : 'limitNum', protoName: 'limitNum')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionLimit clone() => TransactionLimit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionLimit copyWith(void Function(TransactionLimit) updates) =>
      super.copyWith((message) => updates(message as TransactionLimit)) as TransactionLimit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionLimit create() => TransactionLimit._();
  TransactionLimit createEmptyInstance() => create();
  static $pb.PbList<TransactionLimit> createRepeated() => $pb.PbList<TransactionLimit>();
  @$core.pragma('dart2js:noInline')
  static TransactionLimit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionLimit>(create);
  static TransactionLimit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limitNum => $_getI64(1);
  @$pb.TagNumber(2)
  set limitNum($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimitNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimitNum() => clearField(2);
}

class AccountPaginated extends $pb.GeneratedMessage {
  factory AccountPaginated({
    $0.Account? account,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  AccountPaginated._() : super();
  factory AccountPaginated.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountPaginated.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountPaginated',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<$0.Account>(1, _omitFieldNames ? '' : 'account', subBuilder: $0.Account.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..aInt64(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountPaginated clone() => AccountPaginated()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountPaginated copyWith(void Function(AccountPaginated) updates) =>
      super.copyWith((message) => updates(message as AccountPaginated)) as AccountPaginated;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountPaginated create() => AccountPaginated._();
  AccountPaginated createEmptyInstance() => create();
  static $pb.PbList<AccountPaginated> createRepeated() => $pb.PbList<AccountPaginated>();
  @$core.pragma('dart2js:noInline')
  static AccountPaginated getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountPaginated>(create);
  static AccountPaginated? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($0.Account v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  $0.Account ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

class TimePaginatedMessage extends $pb.GeneratedMessage {
  factory TimePaginatedMessage({
    TimeMessage? timeMessage,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final $result = create();
    if (timeMessage != null) {
      $result.timeMessage = timeMessage;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  TimePaginatedMessage._() : super();
  factory TimePaginatedMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TimePaginatedMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimePaginatedMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<TimeMessage>(1, _omitFieldNames ? '' : 'timeMessage',
        protoName: 'timeMessage', subBuilder: TimeMessage.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..aInt64(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TimePaginatedMessage clone() => TimePaginatedMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TimePaginatedMessage copyWith(void Function(TimePaginatedMessage) updates) =>
      super.copyWith((message) => updates(message as TimePaginatedMessage)) as TimePaginatedMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimePaginatedMessage create() => TimePaginatedMessage._();
  TimePaginatedMessage createEmptyInstance() => create();
  static $pb.PbList<TimePaginatedMessage> createRepeated() => $pb.PbList<TimePaginatedMessage>();
  @$core.pragma('dart2js:noInline')
  static TimePaginatedMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePaginatedMessage>(create);
  static TimePaginatedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  TimeMessage get timeMessage => $_getN(0);
  @$pb.TagNumber(1)
  set timeMessage(TimeMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTimeMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeMessage() => clearField(1);
  @$pb.TagNumber(1)
  TimeMessage ensureTimeMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

/// deprecated
class AccountNetMessage extends $pb.GeneratedMessage {
  factory AccountNetMessage({
    $fixnum.Int64? freeNetUsed,
    $fixnum.Int64? freeNetLimit,
    $fixnum.Int64? netUsed,
    $fixnum.Int64? netLimit,
    $core.Map<$core.String, $fixnum.Int64>? assetNetUsed,
    $core.Map<$core.String, $fixnum.Int64>? assetNetLimit,
    $fixnum.Int64? totalNetLimit,
    $fixnum.Int64? totalNetWeight,
  }) {
    final $result = create();
    if (freeNetUsed != null) {
      $result.freeNetUsed = freeNetUsed;
    }
    if (freeNetLimit != null) {
      $result.freeNetLimit = freeNetLimit;
    }
    if (netUsed != null) {
      $result.netUsed = netUsed;
    }
    if (netLimit != null) {
      $result.netLimit = netLimit;
    }
    if (assetNetUsed != null) {
      $result.assetNetUsed.addAll(assetNetUsed);
    }
    if (assetNetLimit != null) {
      $result.assetNetLimit.addAll(assetNetLimit);
    }
    if (totalNetLimit != null) {
      $result.totalNetLimit = totalNetLimit;
    }
    if (totalNetWeight != null) {
      $result.totalNetWeight = totalNetWeight;
    }
    return $result;
  }
  AccountNetMessage._() : super();
  factory AccountNetMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountNetMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountNetMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'freeNetUsed', protoName: 'freeNetUsed')
    ..aInt64(2, _omitFieldNames ? '' : 'freeNetLimit', protoName: 'freeNetLimit')
    ..aInt64(3, _omitFieldNames ? '' : 'NetUsed', protoName: 'NetUsed')
    ..aInt64(4, _omitFieldNames ? '' : 'NetLimit', protoName: 'NetLimit')
    ..m<$core.String, $fixnum.Int64>(5, _omitFieldNames ? '' : 'assetNetUsed',
        protoName: 'assetNetUsed',
        entryClassName: 'AccountNetMessage.AssetNetUsedEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(6, _omitFieldNames ? '' : 'assetNetLimit',
        protoName: 'assetNetLimit',
        entryClassName: 'AccountNetMessage.AssetNetLimitEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('protocol'))
    ..aInt64(7, _omitFieldNames ? '' : 'TotalNetLimit', protoName: 'TotalNetLimit')
    ..aInt64(8, _omitFieldNames ? '' : 'TotalNetWeight', protoName: 'TotalNetWeight')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountNetMessage clone() => AccountNetMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountNetMessage copyWith(void Function(AccountNetMessage) updates) =>
      super.copyWith((message) => updates(message as AccountNetMessage)) as AccountNetMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountNetMessage create() => AccountNetMessage._();
  AccountNetMessage createEmptyInstance() => create();
  static $pb.PbList<AccountNetMessage> createRepeated() => $pb.PbList<AccountNetMessage>();
  @$core.pragma('dart2js:noInline')
  static AccountNetMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountNetMessage>(create);
  static AccountNetMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get freeNetUsed => $_getI64(0);
  @$pb.TagNumber(1)
  set freeNetUsed($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFreeNetUsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeNetUsed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get freeNetLimit => $_getI64(1);
  @$pb.TagNumber(2)
  set freeNetLimit($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFreeNetLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeNetLimit() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get netUsed => $_getI64(2);
  @$pb.TagNumber(3)
  set netUsed($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNetUsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetUsed() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get netLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set netLimit($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNetLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $fixnum.Int64> get assetNetUsed => $_getMap(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get assetNetLimit => $_getMap(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalNetLimit => $_getI64(6);
  @$pb.TagNumber(7)
  set totalNetLimit($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotalNetLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalNetLimit() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalNetWeight => $_getI64(7);
  @$pb.TagNumber(8)
  set totalNetWeight($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTotalNetWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalNetWeight() => clearField(8);
}

class AccountResourceMessage extends $pb.GeneratedMessage {
  factory AccountResourceMessage({
    $fixnum.Int64? freeNetUsed,
    $fixnum.Int64? freeNetLimit,
    $fixnum.Int64? netUsed,
    $fixnum.Int64? netLimit,
    $core.Map<$core.String, $fixnum.Int64>? assetNetUsed,
    $core.Map<$core.String, $fixnum.Int64>? assetNetLimit,
    $fixnum.Int64? totalNetLimit,
    $fixnum.Int64? totalNetWeight,
    $fixnum.Int64? totalTronPowerWeight,
    $fixnum.Int64? tronPowerUsed,
    $fixnum.Int64? tronPowerLimit,
    $fixnum.Int64? energyUsed,
    $fixnum.Int64? energyLimit,
    $fixnum.Int64? totalEnergyLimit,
    $fixnum.Int64? totalEnergyWeight,
    $fixnum.Int64? storageUsed,
    $fixnum.Int64? storageLimit,
  }) {
    final $result = create();
    if (freeNetUsed != null) {
      $result.freeNetUsed = freeNetUsed;
    }
    if (freeNetLimit != null) {
      $result.freeNetLimit = freeNetLimit;
    }
    if (netUsed != null) {
      $result.netUsed = netUsed;
    }
    if (netLimit != null) {
      $result.netLimit = netLimit;
    }
    if (assetNetUsed != null) {
      $result.assetNetUsed.addAll(assetNetUsed);
    }
    if (assetNetLimit != null) {
      $result.assetNetLimit.addAll(assetNetLimit);
    }
    if (totalNetLimit != null) {
      $result.totalNetLimit = totalNetLimit;
    }
    if (totalNetWeight != null) {
      $result.totalNetWeight = totalNetWeight;
    }
    if (totalTronPowerWeight != null) {
      $result.totalTronPowerWeight = totalTronPowerWeight;
    }
    if (tronPowerUsed != null) {
      $result.tronPowerUsed = tronPowerUsed;
    }
    if (tronPowerLimit != null) {
      $result.tronPowerLimit = tronPowerLimit;
    }
    if (energyUsed != null) {
      $result.energyUsed = energyUsed;
    }
    if (energyLimit != null) {
      $result.energyLimit = energyLimit;
    }
    if (totalEnergyLimit != null) {
      $result.totalEnergyLimit = totalEnergyLimit;
    }
    if (totalEnergyWeight != null) {
      $result.totalEnergyWeight = totalEnergyWeight;
    }
    if (storageUsed != null) {
      $result.storageUsed = storageUsed;
    }
    if (storageLimit != null) {
      $result.storageLimit = storageLimit;
    }
    return $result;
  }
  AccountResourceMessage._() : super();
  factory AccountResourceMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountResourceMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountResourceMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'freeNetUsed', protoName: 'freeNetUsed')
    ..aInt64(2, _omitFieldNames ? '' : 'freeNetLimit', protoName: 'freeNetLimit')
    ..aInt64(3, _omitFieldNames ? '' : 'NetUsed', protoName: 'NetUsed')
    ..aInt64(4, _omitFieldNames ? '' : 'NetLimit', protoName: 'NetLimit')
    ..m<$core.String, $fixnum.Int64>(5, _omitFieldNames ? '' : 'assetNetUsed',
        protoName: 'assetNetUsed',
        entryClassName: 'AccountResourceMessage.AssetNetUsedEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(6, _omitFieldNames ? '' : 'assetNetLimit',
        protoName: 'assetNetLimit',
        entryClassName: 'AccountResourceMessage.AssetNetLimitEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('protocol'))
    ..aInt64(7, _omitFieldNames ? '' : 'TotalNetLimit', protoName: 'TotalNetLimit')
    ..aInt64(8, _omitFieldNames ? '' : 'TotalNetWeight', protoName: 'TotalNetWeight')
    ..aInt64(9, _omitFieldNames ? '' : 'TotalTronPowerWeight', protoName: 'TotalTronPowerWeight')
    ..aInt64(10, _omitFieldNames ? '' : 'tronPowerUsed', protoName: 'tronPowerUsed')
    ..aInt64(11, _omitFieldNames ? '' : 'tronPowerLimit', protoName: 'tronPowerLimit')
    ..aInt64(13, _omitFieldNames ? '' : 'EnergyUsed', protoName: 'EnergyUsed')
    ..aInt64(14, _omitFieldNames ? '' : 'EnergyLimit', protoName: 'EnergyLimit')
    ..aInt64(15, _omitFieldNames ? '' : 'TotalEnergyLimit', protoName: 'TotalEnergyLimit')
    ..aInt64(16, _omitFieldNames ? '' : 'TotalEnergyWeight', protoName: 'TotalEnergyWeight')
    ..aInt64(21, _omitFieldNames ? '' : 'storageUsed', protoName: 'storageUsed')
    ..aInt64(22, _omitFieldNames ? '' : 'storageLimit', protoName: 'storageLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountResourceMessage clone() => AccountResourceMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountResourceMessage copyWith(void Function(AccountResourceMessage) updates) =>
      super.copyWith((message) => updates(message as AccountResourceMessage))
          as AccountResourceMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountResourceMessage create() => AccountResourceMessage._();
  AccountResourceMessage createEmptyInstance() => create();
  static $pb.PbList<AccountResourceMessage> createRepeated() =>
      $pb.PbList<AccountResourceMessage>();
  @$core.pragma('dart2js:noInline')
  static AccountResourceMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountResourceMessage>(create);
  static AccountResourceMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get freeNetUsed => $_getI64(0);
  @$pb.TagNumber(1)
  set freeNetUsed($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFreeNetUsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeNetUsed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get freeNetLimit => $_getI64(1);
  @$pb.TagNumber(2)
  set freeNetLimit($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFreeNetLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeNetLimit() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get netUsed => $_getI64(2);
  @$pb.TagNumber(3)
  set netUsed($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNetUsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetUsed() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get netLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set netLimit($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNetLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $fixnum.Int64> get assetNetUsed => $_getMap(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get assetNetLimit => $_getMap(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalNetLimit => $_getI64(6);
  @$pb.TagNumber(7)
  set totalNetLimit($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotalNetLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalNetLimit() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalNetWeight => $_getI64(7);
  @$pb.TagNumber(8)
  set totalNetWeight($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTotalNetWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalNetWeight() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalTronPowerWeight => $_getI64(8);
  @$pb.TagNumber(9)
  set totalTronPowerWeight($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalTronPowerWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalTronPowerWeight() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get tronPowerUsed => $_getI64(9);
  @$pb.TagNumber(10)
  set tronPowerUsed($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTronPowerUsed() => $_has(9);
  @$pb.TagNumber(10)
  void clearTronPowerUsed() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get tronPowerLimit => $_getI64(10);
  @$pb.TagNumber(11)
  set tronPowerLimit($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTronPowerLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearTronPowerLimit() => clearField(11);

  @$pb.TagNumber(13)
  $fixnum.Int64 get energyUsed => $_getI64(11);
  @$pb.TagNumber(13)
  set energyUsed($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasEnergyUsed() => $_has(11);
  @$pb.TagNumber(13)
  void clearEnergyUsed() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get energyLimit => $_getI64(12);
  @$pb.TagNumber(14)
  set energyLimit($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasEnergyLimit() => $_has(12);
  @$pb.TagNumber(14)
  void clearEnergyLimit() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get totalEnergyLimit => $_getI64(13);
  @$pb.TagNumber(15)
  set totalEnergyLimit($fixnum.Int64 v) {
    $_setInt64(13, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTotalEnergyLimit() => $_has(13);
  @$pb.TagNumber(15)
  void clearTotalEnergyLimit() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get totalEnergyWeight => $_getI64(14);
  @$pb.TagNumber(16)
  set totalEnergyWeight($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTotalEnergyWeight() => $_has(14);
  @$pb.TagNumber(16)
  void clearTotalEnergyWeight() => clearField(16);

  @$pb.TagNumber(21)
  $fixnum.Int64 get storageUsed => $_getI64(15);
  @$pb.TagNumber(21)
  set storageUsed($fixnum.Int64 v) {
    $_setInt64(15, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasStorageUsed() => $_has(15);
  @$pb.TagNumber(21)
  void clearStorageUsed() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get storageLimit => $_getI64(16);
  @$pb.TagNumber(22)
  set storageLimit($fixnum.Int64 v) {
    $_setInt64(16, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasStorageLimit() => $_has(16);
  @$pb.TagNumber(22)
  void clearStorageLimit() => clearField(22);
}

class PaginatedMessage extends $pb.GeneratedMessage {
  factory PaginatedMessage({
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final $result = create();
    if (offset != null) {
      $result.offset = offset;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  PaginatedMessage._() : super();
  factory PaginatedMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaginatedMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaginatedMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'offset')
    ..aInt64(2, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PaginatedMessage clone() => PaginatedMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PaginatedMessage copyWith(void Function(PaginatedMessage) updates) =>
      super.copyWith((message) => updates(message as PaginatedMessage)) as PaginatedMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaginatedMessage create() => PaginatedMessage._();
  PaginatedMessage createEmptyInstance() => create();
  static $pb.PbList<PaginatedMessage> createRepeated() => $pb.PbList<PaginatedMessage>();
  @$core.pragma('dart2js:noInline')
  static PaginatedMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaginatedMessage>(create);
  static PaginatedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class TransactionExtention extends $pb.GeneratedMessage {
  factory TransactionExtention({
    $0.Transaction? transaction,
    $core.List<$core.int>? txid,
    $core.Iterable<$core.List<$core.int>>? constantResult,
    Return? result,
    $fixnum.Int64? energyUsed,
    $core.Iterable<$0.TransactionInfo_Log>? logs,
    $core.Iterable<$0.InternalTransaction>? internalTransactions,
    $fixnum.Int64? energyPenalty,
  }) {
    final $result = create();
    if (transaction != null) {
      $result.transaction = transaction;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (constantResult != null) {
      $result.constantResult.addAll(constantResult);
    }
    if (result != null) {
      $result.result = result;
    }
    if (energyUsed != null) {
      $result.energyUsed = energyUsed;
    }
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    if (internalTransactions != null) {
      $result.internalTransactions.addAll(internalTransactions);
    }
    if (energyPenalty != null) {
      $result.energyPenalty = energyPenalty;
    }
    return $result;
  }
  TransactionExtention._() : super();
  factory TransactionExtention.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionExtention.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionExtention',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<$0.Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: $0.Transaction.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'constantResult', $pb.PbFieldType.PY)
    ..aOM<Return>(4, _omitFieldNames ? '' : 'result', subBuilder: Return.create)
    ..aInt64(5, _omitFieldNames ? '' : 'energyUsed')
    ..pc<$0.TransactionInfo_Log>(6, _omitFieldNames ? '' : 'logs', $pb.PbFieldType.PM,
        subBuilder: $0.TransactionInfo_Log.create)
    ..pc<$0.InternalTransaction>(
        7, _omitFieldNames ? '' : 'internalTransactions', $pb.PbFieldType.PM,
        subBuilder: $0.InternalTransaction.create)
    ..aInt64(8, _omitFieldNames ? '' : 'energyPenalty')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionExtention clone() => TransactionExtention()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionExtention copyWith(void Function(TransactionExtention) updates) =>
      super.copyWith((message) => updates(message as TransactionExtention)) as TransactionExtention;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionExtention create() => TransactionExtention._();
  TransactionExtention createEmptyInstance() => create();
  static $pb.PbList<TransactionExtention> createRepeated() => $pb.PbList<TransactionExtention>();
  @$core.pragma('dart2js:noInline')
  static TransactionExtention getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionExtention>(create);
  static TransactionExtention? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($0.Transaction v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $0.Transaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txid => $_getN(1);
  @$pb.TagNumber(2)
  set txid($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxid() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get constantResult => $_getList(2);

  @$pb.TagNumber(4)
  Return get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(Return v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  Return ensureResult() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get energyUsed => $_getI64(4);
  @$pb.TagNumber(5)
  set energyUsed($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEnergyUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnergyUsed() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$0.TransactionInfo_Log> get logs => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.InternalTransaction> get internalTransactions => $_getList(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get energyPenalty => $_getI64(7);
  @$pb.TagNumber(8)
  set energyPenalty($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEnergyPenalty() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnergyPenalty() => clearField(8);
}

class EstimateEnergyMessage extends $pb.GeneratedMessage {
  factory EstimateEnergyMessage({
    Return? result,
    $fixnum.Int64? energyRequired,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (energyRequired != null) {
      $result.energyRequired = energyRequired;
    }
    return $result;
  }
  EstimateEnergyMessage._() : super();
  factory EstimateEnergyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EstimateEnergyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstimateEnergyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Return>(1, _omitFieldNames ? '' : 'result', subBuilder: Return.create)
    ..aInt64(2, _omitFieldNames ? '' : 'energyRequired')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EstimateEnergyMessage clone() => EstimateEnergyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EstimateEnergyMessage copyWith(void Function(EstimateEnergyMessage) updates) =>
      super.copyWith((message) => updates(message as EstimateEnergyMessage))
          as EstimateEnergyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EstimateEnergyMessage create() => EstimateEnergyMessage._();
  EstimateEnergyMessage createEmptyInstance() => create();
  static $pb.PbList<EstimateEnergyMessage> createRepeated() => $pb.PbList<EstimateEnergyMessage>();
  @$core.pragma('dart2js:noInline')
  static EstimateEnergyMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EstimateEnergyMessage>(create);
  static EstimateEnergyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  Return get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(Return v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  Return ensureResult() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energyRequired => $_getI64(1);
  @$pb.TagNumber(2)
  set energyRequired($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnergyRequired() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergyRequired() => clearField(2);
}

class BlockExtention extends $pb.GeneratedMessage {
  factory BlockExtention({
    $core.Iterable<TransactionExtention>? transactions,
    $0.BlockHeader? blockHeader,
    $core.List<$core.int>? blockid,
  }) {
    final $result = create();
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    if (blockHeader != null) {
      $result.blockHeader = blockHeader;
    }
    if (blockid != null) {
      $result.blockid = blockid;
    }
    return $result;
  }
  BlockExtention._() : super();
  factory BlockExtention.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockExtention.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockExtention',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<TransactionExtention>(1, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM,
        subBuilder: TransactionExtention.create)
    ..aOM<$0.BlockHeader>(2, _omitFieldNames ? '' : 'blockHeader',
        subBuilder: $0.BlockHeader.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'blockid', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockExtention clone() => BlockExtention()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockExtention copyWith(void Function(BlockExtention) updates) =>
      super.copyWith((message) => updates(message as BlockExtention)) as BlockExtention;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockExtention create() => BlockExtention._();
  BlockExtention createEmptyInstance() => create();
  static $pb.PbList<BlockExtention> createRepeated() => $pb.PbList<BlockExtention>();
  @$core.pragma('dart2js:noInline')
  static BlockExtention getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockExtention>(create);
  static BlockExtention? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionExtention> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  $0.BlockHeader get blockHeader => $_getN(1);
  @$pb.TagNumber(2)
  set blockHeader($0.BlockHeader v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlockHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeader() => clearField(2);
  @$pb.TagNumber(2)
  $0.BlockHeader ensureBlockHeader() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get blockid => $_getN(2);
  @$pb.TagNumber(3)
  set blockid($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBlockid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockid() => clearField(3);
}

class BlockListExtention extends $pb.GeneratedMessage {
  factory BlockListExtention({
    $core.Iterable<BlockExtention>? block,
  }) {
    final $result = create();
    if (block != null) {
      $result.block.addAll(block);
    }
    return $result;
  }
  BlockListExtention._() : super();
  factory BlockListExtention.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockListExtention.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockListExtention',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<BlockExtention>(1, _omitFieldNames ? '' : 'block', $pb.PbFieldType.PM,
        subBuilder: BlockExtention.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockListExtention clone() => BlockListExtention()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockListExtention copyWith(void Function(BlockListExtention) updates) =>
      super.copyWith((message) => updates(message as BlockListExtention)) as BlockListExtention;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockListExtention create() => BlockListExtention._();
  BlockListExtention createEmptyInstance() => create();
  static $pb.PbList<BlockListExtention> createRepeated() => $pb.PbList<BlockListExtention>();
  @$core.pragma('dart2js:noInline')
  static BlockListExtention getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockListExtention>(create);
  static BlockListExtention? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BlockExtention> get block => $_getList(0);
}

class TransactionListExtention extends $pb.GeneratedMessage {
  factory TransactionListExtention({
    $core.Iterable<TransactionExtention>? transaction,
  }) {
    final $result = create();
    if (transaction != null) {
      $result.transaction.addAll(transaction);
    }
    return $result;
  }
  TransactionListExtention._() : super();
  factory TransactionListExtention.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionListExtention.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionListExtention',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<TransactionExtention>(1, _omitFieldNames ? '' : 'transaction', $pb.PbFieldType.PM,
        subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionListExtention clone() => TransactionListExtention()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionListExtention copyWith(void Function(TransactionListExtention) updates) =>
      super.copyWith((message) => updates(message as TransactionListExtention))
          as TransactionListExtention;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionListExtention create() => TransactionListExtention._();
  TransactionListExtention createEmptyInstance() => create();
  static $pb.PbList<TransactionListExtention> createRepeated() =>
      $pb.PbList<TransactionListExtention>();
  @$core.pragma('dart2js:noInline')
  static TransactionListExtention getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionListExtention>(create);
  static TransactionListExtention? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionExtention> get transaction => $_getList(0);
}

class BlockIncrementalMerkleTree extends $pb.GeneratedMessage {
  factory BlockIncrementalMerkleTree({
    $fixnum.Int64? number,
    $11.IncrementalMerkleTree? merkleTree,
  }) {
    final $result = create();
    if (number != null) {
      $result.number = number;
    }
    if (merkleTree != null) {
      $result.merkleTree = merkleTree;
    }
    return $result;
  }
  BlockIncrementalMerkleTree._() : super();
  factory BlockIncrementalMerkleTree.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BlockIncrementalMerkleTree.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockIncrementalMerkleTree',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'number')
    ..aOM<$11.IncrementalMerkleTree>(2, _omitFieldNames ? '' : 'merkleTree',
        protoName: 'merkleTree', subBuilder: $11.IncrementalMerkleTree.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BlockIncrementalMerkleTree clone() => BlockIncrementalMerkleTree()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BlockIncrementalMerkleTree copyWith(void Function(BlockIncrementalMerkleTree) updates) =>
      super.copyWith((message) => updates(message as BlockIncrementalMerkleTree))
          as BlockIncrementalMerkleTree;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockIncrementalMerkleTree create() => BlockIncrementalMerkleTree._();
  BlockIncrementalMerkleTree createEmptyInstance() => create();
  static $pb.PbList<BlockIncrementalMerkleTree> createRepeated() =>
      $pb.PbList<BlockIncrementalMerkleTree>();
  @$core.pragma('dart2js:noInline')
  static BlockIncrementalMerkleTree getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockIncrementalMerkleTree>(create);
  static BlockIncrementalMerkleTree? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get number => $_getI64(0);
  @$pb.TagNumber(1)
  set number($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $11.IncrementalMerkleTree get merkleTree => $_getN(1);
  @$pb.TagNumber(2)
  set merkleTree($11.IncrementalMerkleTree v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMerkleTree() => $_has(1);
  @$pb.TagNumber(2)
  void clearMerkleTree() => clearField(2);
  @$pb.TagNumber(2)
  $11.IncrementalMerkleTree ensureMerkleTree() => $_ensure(1);
}

class TransactionSignWeight_Result extends $pb.GeneratedMessage {
  factory TransactionSignWeight_Result({
    TransactionSignWeight_Result_response_code? code,
    $core.String? message,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  TransactionSignWeight_Result._() : super();
  factory TransactionSignWeight_Result.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionSignWeight_Result.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionSignWeight.Result',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..e<TransactionSignWeight_Result_response_code>(
        1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE,
        defaultOrMaker: TransactionSignWeight_Result_response_code.ENOUGH_PERMISSION,
        valueOf: TransactionSignWeight_Result_response_code.valueOf,
        enumValues: TransactionSignWeight_Result_response_code.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionSignWeight_Result clone() => TransactionSignWeight_Result()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionSignWeight_Result copyWith(void Function(TransactionSignWeight_Result) updates) =>
      super.copyWith((message) => updates(message as TransactionSignWeight_Result))
          as TransactionSignWeight_Result;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight_Result create() => TransactionSignWeight_Result._();
  TransactionSignWeight_Result createEmptyInstance() => create();
  static $pb.PbList<TransactionSignWeight_Result> createRepeated() =>
      $pb.PbList<TransactionSignWeight_Result>();
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight_Result getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSignWeight_Result>(create);
  static TransactionSignWeight_Result? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionSignWeight_Result_response_code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(TransactionSignWeight_Result_response_code v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class TransactionSignWeight extends $pb.GeneratedMessage {
  factory TransactionSignWeight({
    $0.Permission? permission,
    $core.Iterable<$core.List<$core.int>>? approvedList,
    $fixnum.Int64? currentWeight,
    TransactionSignWeight_Result? result,
    TransactionExtention? transaction,
  }) {
    final $result = create();
    if (permission != null) {
      $result.permission = permission;
    }
    if (approvedList != null) {
      $result.approvedList.addAll(approvedList);
    }
    if (currentWeight != null) {
      $result.currentWeight = currentWeight;
    }
    if (result != null) {
      $result.result = result;
    }
    if (transaction != null) {
      $result.transaction = transaction;
    }
    return $result;
  }
  TransactionSignWeight._() : super();
  factory TransactionSignWeight.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionSignWeight.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionSignWeight',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<$0.Permission>(1, _omitFieldNames ? '' : 'permission', subBuilder: $0.Permission.create)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'approvedList', $pb.PbFieldType.PY)
    ..aInt64(3, _omitFieldNames ? '' : 'currentWeight')
    ..aOM<TransactionSignWeight_Result>(4, _omitFieldNames ? '' : 'result',
        subBuilder: TransactionSignWeight_Result.create)
    ..aOM<TransactionExtention>(5, _omitFieldNames ? '' : 'transaction',
        subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionSignWeight clone() => TransactionSignWeight()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionSignWeight copyWith(void Function(TransactionSignWeight) updates) =>
      super.copyWith((message) => updates(message as TransactionSignWeight))
          as TransactionSignWeight;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight create() => TransactionSignWeight._();
  TransactionSignWeight createEmptyInstance() => create();
  static $pb.PbList<TransactionSignWeight> createRepeated() => $pb.PbList<TransactionSignWeight>();
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSignWeight>(create);
  static TransactionSignWeight? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Permission get permission => $_getN(0);
  @$pb.TagNumber(1)
  set permission($0.Permission v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermission() => clearField(1);
  @$pb.TagNumber(1)
  $0.Permission ensurePermission() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get approvedList => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentWeight => $_getI64(2);
  @$pb.TagNumber(3)
  set currentWeight($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentWeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentWeight() => clearField(3);

  @$pb.TagNumber(4)
  TransactionSignWeight_Result get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(TransactionSignWeight_Result v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  TransactionSignWeight_Result ensureResult() => $_ensure(3);

  @$pb.TagNumber(5)
  TransactionExtention get transaction => $_getN(4);
  @$pb.TagNumber(5)
  set transaction(TransactionExtention v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTransaction() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransaction() => clearField(5);
  @$pb.TagNumber(5)
  TransactionExtention ensureTransaction() => $_ensure(4);
}

class TransactionApprovedList_Result extends $pb.GeneratedMessage {
  factory TransactionApprovedList_Result({
    TransactionApprovedList_Result_response_code? code,
    $core.String? message,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  TransactionApprovedList_Result._() : super();
  factory TransactionApprovedList_Result.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionApprovedList_Result.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionApprovedList.Result',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..e<TransactionApprovedList_Result_response_code>(
        1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE,
        defaultOrMaker: TransactionApprovedList_Result_response_code.SUCCESS,
        valueOf: TransactionApprovedList_Result_response_code.valueOf,
        enumValues: TransactionApprovedList_Result_response_code.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionApprovedList_Result clone() =>
      TransactionApprovedList_Result()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionApprovedList_Result copyWith(void Function(TransactionApprovedList_Result) updates) =>
      super.copyWith((message) => updates(message as TransactionApprovedList_Result))
          as TransactionApprovedList_Result;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList_Result create() => TransactionApprovedList_Result._();
  TransactionApprovedList_Result createEmptyInstance() => create();
  static $pb.PbList<TransactionApprovedList_Result> createRepeated() =>
      $pb.PbList<TransactionApprovedList_Result>();
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList_Result getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionApprovedList_Result>(create);
  static TransactionApprovedList_Result? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionApprovedList_Result_response_code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(TransactionApprovedList_Result_response_code v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class TransactionApprovedList extends $pb.GeneratedMessage {
  factory TransactionApprovedList({
    $core.Iterable<$core.List<$core.int>>? approvedList,
    TransactionApprovedList_Result? result,
    TransactionExtention? transaction,
  }) {
    final $result = create();
    if (approvedList != null) {
      $result.approvedList.addAll(approvedList);
    }
    if (result != null) {
      $result.result = result;
    }
    if (transaction != null) {
      $result.transaction = transaction;
    }
    return $result;
  }
  TransactionApprovedList._() : super();
  factory TransactionApprovedList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionApprovedList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionApprovedList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'approvedList', $pb.PbFieldType.PY)
    ..aOM<TransactionApprovedList_Result>(4, _omitFieldNames ? '' : 'result',
        subBuilder: TransactionApprovedList_Result.create)
    ..aOM<TransactionExtention>(5, _omitFieldNames ? '' : 'transaction',
        subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionApprovedList clone() => TransactionApprovedList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionApprovedList copyWith(void Function(TransactionApprovedList) updates) =>
      super.copyWith((message) => updates(message as TransactionApprovedList))
          as TransactionApprovedList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList create() => TransactionApprovedList._();
  TransactionApprovedList createEmptyInstance() => create();
  static $pb.PbList<TransactionApprovedList> createRepeated() =>
      $pb.PbList<TransactionApprovedList>();
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionApprovedList>(create);
  static TransactionApprovedList? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get approvedList => $_getList(0);

  @$pb.TagNumber(4)
  TransactionApprovedList_Result get result => $_getN(1);
  @$pb.TagNumber(4)
  set result(TransactionApprovedList_Result v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  TransactionApprovedList_Result ensureResult() => $_ensure(1);

  @$pb.TagNumber(5)
  TransactionExtention get transaction => $_getN(2);
  @$pb.TagNumber(5)
  set transaction(TransactionExtention v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTransaction() => $_has(2);
  @$pb.TagNumber(5)
  void clearTransaction() => clearField(5);
  @$pb.TagNumber(5)
  TransactionExtention ensureTransaction() => $_ensure(2);
}

class IvkDecryptParameters extends $pb.GeneratedMessage {
  factory IvkDecryptParameters({
    $fixnum.Int64? startBlockIndex,
    $fixnum.Int64? endBlockIndex,
    $core.List<$core.int>? ivk,
  }) {
    final $result = create();
    if (startBlockIndex != null) {
      $result.startBlockIndex = startBlockIndex;
    }
    if (endBlockIndex != null) {
      $result.endBlockIndex = endBlockIndex;
    }
    if (ivk != null) {
      $result.ivk = ivk;
    }
    return $result;
  }
  IvkDecryptParameters._() : super();
  factory IvkDecryptParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IvkDecryptParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IvkDecryptParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startBlockIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'endBlockIndex')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ivk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IvkDecryptParameters clone() => IvkDecryptParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IvkDecryptParameters copyWith(void Function(IvkDecryptParameters) updates) =>
      super.copyWith((message) => updates(message as IvkDecryptParameters)) as IvkDecryptParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvkDecryptParameters create() => IvkDecryptParameters._();
  IvkDecryptParameters createEmptyInstance() => create();
  static $pb.PbList<IvkDecryptParameters> createRepeated() => $pb.PbList<IvkDecryptParameters>();
  @$core.pragma('dart2js:noInline')
  static IvkDecryptParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvkDecryptParameters>(create);
  static IvkDecryptParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startBlockIndex => $_getI64(0);
  @$pb.TagNumber(1)
  set startBlockIndex($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartBlockIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartBlockIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endBlockIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set endBlockIndex($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndBlockIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndBlockIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ivk => $_getN(2);
  @$pb.TagNumber(3)
  set ivk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearIvk() => clearField(3);
}

class IvkDecryptAndMarkParameters extends $pb.GeneratedMessage {
  factory IvkDecryptAndMarkParameters({
    $fixnum.Int64? startBlockIndex,
    $fixnum.Int64? endBlockIndex,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
    $core.List<$core.int>? ivk,
  }) {
    final $result = create();
    if (startBlockIndex != null) {
      $result.startBlockIndex = startBlockIndex;
    }
    if (endBlockIndex != null) {
      $result.endBlockIndex = endBlockIndex;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    if (ivk != null) {
      $result.ivk = ivk;
    }
    return $result;
  }
  IvkDecryptAndMarkParameters._() : super();
  factory IvkDecryptAndMarkParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IvkDecryptAndMarkParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IvkDecryptAndMarkParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startBlockIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'endBlockIndex')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'ivk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IvkDecryptAndMarkParameters clone() => IvkDecryptAndMarkParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IvkDecryptAndMarkParameters copyWith(void Function(IvkDecryptAndMarkParameters) updates) =>
      super.copyWith((message) => updates(message as IvkDecryptAndMarkParameters))
          as IvkDecryptAndMarkParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvkDecryptAndMarkParameters create() => IvkDecryptAndMarkParameters._();
  IvkDecryptAndMarkParameters createEmptyInstance() => create();
  static $pb.PbList<IvkDecryptAndMarkParameters> createRepeated() =>
      $pb.PbList<IvkDecryptAndMarkParameters>();
  @$core.pragma('dart2js:noInline')
  static IvkDecryptAndMarkParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvkDecryptAndMarkParameters>(create);
  static IvkDecryptAndMarkParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startBlockIndex => $_getI64(0);
  @$pb.TagNumber(1)
  set startBlockIndex($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartBlockIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartBlockIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endBlockIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set endBlockIndex($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndBlockIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndBlockIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ak => $_getN(2);
  @$pb.TagNumber(3)
  set ak($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAk() => $_has(2);
  @$pb.TagNumber(3)
  void clearAk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get nk => $_getN(3);
  @$pb.TagNumber(4)
  set nk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNk() => $_has(3);
  @$pb.TagNumber(4)
  void clearNk() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get ivk => $_getN(4);
  @$pb.TagNumber(5)
  set ivk($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIvk() => $_has(4);
  @$pb.TagNumber(5)
  void clearIvk() => clearField(5);
}

class OvkDecryptParameters extends $pb.GeneratedMessage {
  factory OvkDecryptParameters({
    $fixnum.Int64? startBlockIndex,
    $fixnum.Int64? endBlockIndex,
    $core.List<$core.int>? ovk,
  }) {
    final $result = create();
    if (startBlockIndex != null) {
      $result.startBlockIndex = startBlockIndex;
    }
    if (endBlockIndex != null) {
      $result.endBlockIndex = endBlockIndex;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    return $result;
  }
  OvkDecryptParameters._() : super();
  factory OvkDecryptParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OvkDecryptParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OvkDecryptParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startBlockIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'endBlockIndex')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OvkDecryptParameters clone() => OvkDecryptParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OvkDecryptParameters copyWith(void Function(OvkDecryptParameters) updates) =>
      super.copyWith((message) => updates(message as OvkDecryptParameters)) as OvkDecryptParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OvkDecryptParameters create() => OvkDecryptParameters._();
  OvkDecryptParameters createEmptyInstance() => create();
  static $pb.PbList<OvkDecryptParameters> createRepeated() => $pb.PbList<OvkDecryptParameters>();
  @$core.pragma('dart2js:noInline')
  static OvkDecryptParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OvkDecryptParameters>(create);
  static OvkDecryptParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startBlockIndex => $_getI64(0);
  @$pb.TagNumber(1)
  set startBlockIndex($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartBlockIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartBlockIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endBlockIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set endBlockIndex($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndBlockIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndBlockIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ovk => $_getN(2);
  @$pb.TagNumber(3)
  set ovk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOvk() => clearField(3);
}

class DecryptNotes_NoteTx extends $pb.GeneratedMessage {
  factory DecryptNotes_NoteTx({
    Note? note,
    $core.List<$core.int>? txid,
    $core.int? index,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (index != null) {
      $result.index = index;
    }
    return $result;
  }
  DecryptNotes_NoteTx._() : super();
  factory DecryptNotes_NoteTx.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotes_NoteTx.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DecryptNotes.NoteTx',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotes_NoteTx clone() => DecryptNotes_NoteTx()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotes_NoteTx copyWith(void Function(DecryptNotes_NoteTx) updates) =>
      super.copyWith((message) => updates(message as DecryptNotes_NoteTx)) as DecryptNotes_NoteTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotes_NoteTx create() => DecryptNotes_NoteTx._();
  DecryptNotes_NoteTx createEmptyInstance() => create();
  static $pb.PbList<DecryptNotes_NoteTx> createRepeated() => $pb.PbList<DecryptNotes_NoteTx>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotes_NoteTx getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotes_NoteTx>(create);
  static DecryptNotes_NoteTx? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txid => $_getN(1);
  @$pb.TagNumber(2)
  set txid($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);
}

class DecryptNotes extends $pb.GeneratedMessage {
  factory DecryptNotes({
    $core.Iterable<DecryptNotes_NoteTx>? noteTxs,
  }) {
    final $result = create();
    if (noteTxs != null) {
      $result.noteTxs.addAll(noteTxs);
    }
    return $result;
  }
  DecryptNotes._() : super();
  factory DecryptNotes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DecryptNotes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<DecryptNotes_NoteTx>(1, _omitFieldNames ? '' : 'noteTxs', $pb.PbFieldType.PM,
        protoName: 'noteTxs', subBuilder: DecryptNotes_NoteTx.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotes clone() => DecryptNotes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotes copyWith(void Function(DecryptNotes) updates) =>
      super.copyWith((message) => updates(message as DecryptNotes)) as DecryptNotes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotes create() => DecryptNotes._();
  DecryptNotes createEmptyInstance() => create();
  static $pb.PbList<DecryptNotes> createRepeated() => $pb.PbList<DecryptNotes>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotes getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotes>(create);
  static DecryptNotes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DecryptNotes_NoteTx> get noteTxs => $_getList(0);
}

class DecryptNotesMarked_NoteTx extends $pb.GeneratedMessage {
  factory DecryptNotesMarked_NoteTx({
    Note? note,
    $core.List<$core.int>? txid,
    $core.int? index,
    $core.bool? isSpend,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (index != null) {
      $result.index = index;
    }
    if (isSpend != null) {
      $result.isSpend = isSpend;
    }
    return $result;
  }
  DecryptNotesMarked_NoteTx._() : super();
  factory DecryptNotesMarked_NoteTx.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotesMarked_NoteTx.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecryptNotesMarked.NoteTx',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'isSpend')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotesMarked_NoteTx clone() => DecryptNotesMarked_NoteTx()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotesMarked_NoteTx copyWith(void Function(DecryptNotesMarked_NoteTx) updates) =>
      super.copyWith((message) => updates(message as DecryptNotesMarked_NoteTx))
          as DecryptNotesMarked_NoteTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotesMarked_NoteTx create() => DecryptNotesMarked_NoteTx._();
  DecryptNotesMarked_NoteTx createEmptyInstance() => create();
  static $pb.PbList<DecryptNotesMarked_NoteTx> createRepeated() =>
      $pb.PbList<DecryptNotesMarked_NoteTx>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotesMarked_NoteTx getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotesMarked_NoteTx>(create);
  static DecryptNotesMarked_NoteTx? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txid => $_getN(1);
  @$pb.TagNumber(2)
  set txid($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSpend => $_getBF(3);
  @$pb.TagNumber(4)
  set isSpend($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsSpend() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSpend() => clearField(4);
}

class DecryptNotesMarked extends $pb.GeneratedMessage {
  factory DecryptNotesMarked({
    $core.Iterable<DecryptNotesMarked_NoteTx>? noteTxs,
  }) {
    final $result = create();
    if (noteTxs != null) {
      $result.noteTxs.addAll(noteTxs);
    }
    return $result;
  }
  DecryptNotesMarked._() : super();
  factory DecryptNotesMarked.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotesMarked.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DecryptNotesMarked',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<DecryptNotesMarked_NoteTx>(1, _omitFieldNames ? '' : 'noteTxs', $pb.PbFieldType.PM,
        protoName: 'noteTxs', subBuilder: DecryptNotesMarked_NoteTx.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotesMarked clone() => DecryptNotesMarked()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotesMarked copyWith(void Function(DecryptNotesMarked) updates) =>
      super.copyWith((message) => updates(message as DecryptNotesMarked)) as DecryptNotesMarked;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotesMarked create() => DecryptNotesMarked._();
  DecryptNotesMarked createEmptyInstance() => create();
  static $pb.PbList<DecryptNotesMarked> createRepeated() => $pb.PbList<DecryptNotesMarked>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotesMarked getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotesMarked>(create);
  static DecryptNotesMarked? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DecryptNotesMarked_NoteTx> get noteTxs => $_getList(0);
}

class Note extends $pb.GeneratedMessage {
  factory Note({
    $fixnum.Int64? value,
    $core.String? paymentAddress,
    $core.List<$core.int>? rcm,
    $core.List<$core.int>? memo,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (paymentAddress != null) {
      $result.paymentAddress = paymentAddress;
    }
    if (rcm != null) {
      $result.rcm = rcm;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    return $result;
  }
  Note._() : super();
  factory Note.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Note.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Note',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..aOS(2, _omitFieldNames ? '' : 'paymentAddress')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'rcm', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'memo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Note clone() => Note()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Note copyWith(void Function(Note) updates) =>
      super.copyWith((message) => updates(message as Note)) as Note;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Note create() => Note._();
  Note createEmptyInstance() => create();
  static $pb.PbList<Note> createRepeated() => $pb.PbList<Note>();
  @$core.pragma('dart2js:noInline')
  static Note getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Note>(create);
  static Note? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentAddress($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPaymentAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get rcm => $_getN(2);
  @$pb.TagNumber(3)
  set rcm($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRcm() => $_has(2);
  @$pb.TagNumber(3)
  void clearRcm() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get memo => $_getN(3);
  @$pb.TagNumber(4)
  set memo($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemo() => clearField(4);
}

class SpendNote extends $pb.GeneratedMessage {
  factory SpendNote({
    Note? note,
    $core.List<$core.int>? alpha,
    $11.IncrementalMerkleVoucher? voucher,
    $core.List<$core.int>? path,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (alpha != null) {
      $result.alpha = alpha;
    }
    if (voucher != null) {
      $result.voucher = voucher;
    }
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  SpendNote._() : super();
  factory SpendNote.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpendNote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpendNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(3, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'alpha', $pb.PbFieldType.OY)
    ..aOM<$11.IncrementalMerkleVoucher>(5, _omitFieldNames ? '' : 'voucher',
        subBuilder: $11.IncrementalMerkleVoucher.create)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'path', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpendNote clone() => SpendNote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpendNote copyWith(void Function(SpendNote) updates) =>
      super.copyWith((message) => updates(message as SpendNote)) as SpendNote;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpendNote create() => SpendNote._();
  SpendNote createEmptyInstance() => create();
  static $pb.PbList<SpendNote> createRepeated() => $pb.PbList<SpendNote>();
  @$core.pragma('dart2js:noInline')
  static SpendNote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpendNote>(create);
  static SpendNote? _defaultInstance;

  @$pb.TagNumber(3)
  Note get note => $_getN(0);
  @$pb.TagNumber(3)
  set note(Note v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);
  @$pb.TagNumber(3)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.List<$core.int> get alpha => $_getN(1);
  @$pb.TagNumber(4)
  set alpha($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAlpha() => $_has(1);
  @$pb.TagNumber(4)
  void clearAlpha() => clearField(4);

  @$pb.TagNumber(5)
  $11.IncrementalMerkleVoucher get voucher => $_getN(2);
  @$pb.TagNumber(5)
  set voucher($11.IncrementalMerkleVoucher v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVoucher() => $_has(2);
  @$pb.TagNumber(5)
  void clearVoucher() => clearField(5);
  @$pb.TagNumber(5)
  $11.IncrementalMerkleVoucher ensureVoucher() => $_ensure(2);

  @$pb.TagNumber(6)
  $core.List<$core.int> get path => $_getN(3);
  @$pb.TagNumber(6)
  set path($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(6)
  void clearPath() => clearField(6);
}

class ReceiveNote extends $pb.GeneratedMessage {
  factory ReceiveNote({
    Note? note,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    return $result;
  }
  ReceiveNote._() : super();
  factory ReceiveNote.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReceiveNote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReceiveNote clone() => ReceiveNote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReceiveNote copyWith(void Function(ReceiveNote) updates) =>
      super.copyWith((message) => updates(message as ReceiveNote)) as ReceiveNote;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveNote create() => ReceiveNote._();
  ReceiveNote createEmptyInstance() => create();
  static $pb.PbList<ReceiveNote> createRepeated() => $pb.PbList<ReceiveNote>();
  @$core.pragma('dart2js:noInline')
  static ReceiveNote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveNote>(create);
  static ReceiveNote? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);
}

class PrivateParameters extends $pb.GeneratedMessage {
  factory PrivateParameters({
    $core.List<$core.int>? transparentFromAddress,
    $core.List<$core.int>? ask,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
    $fixnum.Int64? fromAmount,
    $core.Iterable<SpendNote>? shieldedSpends,
    $core.Iterable<ReceiveNote>? shieldedReceives,
    $core.List<$core.int>? transparentToAddress,
    $fixnum.Int64? toAmount,
    $fixnum.Int64? timeout,
  }) {
    final $result = create();
    if (transparentFromAddress != null) {
      $result.transparentFromAddress = transparentFromAddress;
    }
    if (ask != null) {
      $result.ask = ask;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (fromAmount != null) {
      $result.fromAmount = fromAmount;
    }
    if (shieldedSpends != null) {
      $result.shieldedSpends.addAll(shieldedSpends);
    }
    if (shieldedReceives != null) {
      $result.shieldedReceives.addAll(shieldedReceives);
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    if (toAmount != null) {
      $result.toAmount = toAmount;
    }
    if (timeout != null) {
      $result.timeout = timeout;
    }
    return $result;
  }
  PrivateParameters._() : super();
  factory PrivateParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PrivateParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transparentFromAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ask', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'fromAmount')
    ..pc<SpendNote>(6, _omitFieldNames ? '' : 'shieldedSpends', $pb.PbFieldType.PM,
        subBuilder: SpendNote.create)
    ..pc<ReceiveNote>(7, _omitFieldNames ? '' : 'shieldedReceives', $pb.PbFieldType.PM,
        subBuilder: ReceiveNote.create)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..aInt64(9, _omitFieldNames ? '' : 'toAmount')
    ..aInt64(10, _omitFieldNames ? '' : 'timeout')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateParameters clone() => PrivateParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateParameters copyWith(void Function(PrivateParameters) updates) =>
      super.copyWith((message) => updates(message as PrivateParameters)) as PrivateParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivateParameters create() => PrivateParameters._();
  PrivateParameters createEmptyInstance() => create();
  static $pb.PbList<PrivateParameters> createRepeated() => $pb.PbList<PrivateParameters>();
  @$core.pragma('dart2js:noInline')
  static PrivateParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrivateParameters>(create);
  static PrivateParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transparentFromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set transparentFromAddress($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTransparentFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransparentFromAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ask => $_getN(1);
  @$pb.TagNumber(2)
  set ask($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearAsk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nsk => $_getN(2);
  @$pb.TagNumber(3)
  set nsk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNsk() => $_has(2);
  @$pb.TagNumber(3)
  void clearNsk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ovk => $_getN(3);
  @$pb.TagNumber(4)
  set ovk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOvk() => $_has(3);
  @$pb.TagNumber(4)
  void clearOvk() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fromAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set fromAmount($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFromAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromAmount() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SpendNote> get shieldedSpends => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<ReceiveNote> get shieldedReceives => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get transparentToAddress => $_getN(7);
  @$pb.TagNumber(8)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTransparentToAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransparentToAddress() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get toAmount => $_getI64(8);
  @$pb.TagNumber(9)
  set toAmount($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasToAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearToAmount() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get timeout => $_getI64(9);
  @$pb.TagNumber(10)
  set timeout($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTimeout() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimeout() => clearField(10);
}

class PrivateParametersWithoutAsk extends $pb.GeneratedMessage {
  factory PrivateParametersWithoutAsk({
    $core.List<$core.int>? transparentFromAddress,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
    $fixnum.Int64? fromAmount,
    $core.Iterable<SpendNote>? shieldedSpends,
    $core.Iterable<ReceiveNote>? shieldedReceives,
    $core.List<$core.int>? transparentToAddress,
    $fixnum.Int64? toAmount,
    $fixnum.Int64? timeout,
  }) {
    final $result = create();
    if (transparentFromAddress != null) {
      $result.transparentFromAddress = transparentFromAddress;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (fromAmount != null) {
      $result.fromAmount = fromAmount;
    }
    if (shieldedSpends != null) {
      $result.shieldedSpends.addAll(shieldedSpends);
    }
    if (shieldedReceives != null) {
      $result.shieldedReceives.addAll(shieldedReceives);
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    if (toAmount != null) {
      $result.toAmount = toAmount;
    }
    if (timeout != null) {
      $result.timeout = timeout;
    }
    return $result;
  }
  PrivateParametersWithoutAsk._() : super();
  factory PrivateParametersWithoutAsk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateParametersWithoutAsk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrivateParametersWithoutAsk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transparentFromAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'fromAmount')
    ..pc<SpendNote>(6, _omitFieldNames ? '' : 'shieldedSpends', $pb.PbFieldType.PM,
        subBuilder: SpendNote.create)
    ..pc<ReceiveNote>(7, _omitFieldNames ? '' : 'shieldedReceives', $pb.PbFieldType.PM,
        subBuilder: ReceiveNote.create)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..aInt64(9, _omitFieldNames ? '' : 'toAmount')
    ..aInt64(10, _omitFieldNames ? '' : 'timeout')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateParametersWithoutAsk clone() => PrivateParametersWithoutAsk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateParametersWithoutAsk copyWith(void Function(PrivateParametersWithoutAsk) updates) =>
      super.copyWith((message) => updates(message as PrivateParametersWithoutAsk))
          as PrivateParametersWithoutAsk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivateParametersWithoutAsk create() => PrivateParametersWithoutAsk._();
  PrivateParametersWithoutAsk createEmptyInstance() => create();
  static $pb.PbList<PrivateParametersWithoutAsk> createRepeated() =>
      $pb.PbList<PrivateParametersWithoutAsk>();
  @$core.pragma('dart2js:noInline')
  static PrivateParametersWithoutAsk getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrivateParametersWithoutAsk>(create);
  static PrivateParametersWithoutAsk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transparentFromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set transparentFromAddress($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTransparentFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransparentFromAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ak => $_getN(1);
  @$pb.TagNumber(2)
  set ak($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAk() => $_has(1);
  @$pb.TagNumber(2)
  void clearAk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nsk => $_getN(2);
  @$pb.TagNumber(3)
  set nsk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNsk() => $_has(2);
  @$pb.TagNumber(3)
  void clearNsk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ovk => $_getN(3);
  @$pb.TagNumber(4)
  set ovk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOvk() => $_has(3);
  @$pb.TagNumber(4)
  void clearOvk() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fromAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set fromAmount($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFromAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromAmount() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SpendNote> get shieldedSpends => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<ReceiveNote> get shieldedReceives => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get transparentToAddress => $_getN(7);
  @$pb.TagNumber(8)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTransparentToAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransparentToAddress() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get toAmount => $_getI64(8);
  @$pb.TagNumber(9)
  set toAmount($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasToAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearToAmount() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get timeout => $_getI64(9);
  @$pb.TagNumber(10)
  set timeout($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTimeout() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimeout() => clearField(10);
}

class SpendAuthSigParameters extends $pb.GeneratedMessage {
  factory SpendAuthSigParameters({
    $core.List<$core.int>? ask,
    $core.List<$core.int>? txHash,
    $core.List<$core.int>? alpha,
  }) {
    final $result = create();
    if (ask != null) {
      $result.ask = ask;
    }
    if (txHash != null) {
      $result.txHash = txHash;
    }
    if (alpha != null) {
      $result.alpha = alpha;
    }
    return $result;
  }
  SpendAuthSigParameters._() : super();
  factory SpendAuthSigParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpendAuthSigParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpendAuthSigParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ask', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'alpha', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpendAuthSigParameters clone() => SpendAuthSigParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpendAuthSigParameters copyWith(void Function(SpendAuthSigParameters) updates) =>
      super.copyWith((message) => updates(message as SpendAuthSigParameters))
          as SpendAuthSigParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpendAuthSigParameters create() => SpendAuthSigParameters._();
  SpendAuthSigParameters createEmptyInstance() => create();
  static $pb.PbList<SpendAuthSigParameters> createRepeated() =>
      $pb.PbList<SpendAuthSigParameters>();
  @$core.pragma('dart2js:noInline')
  static SpendAuthSigParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpendAuthSigParameters>(create);
  static SpendAuthSigParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ask => $_getN(0);
  @$pb.TagNumber(1)
  set ask($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAsk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txHash => $_getN(1);
  @$pb.TagNumber(2)
  set txHash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get alpha => $_getN(2);
  @$pb.TagNumber(3)
  set alpha($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAlpha() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlpha() => clearField(3);
}

class NfParameters extends $pb.GeneratedMessage {
  factory NfParameters({
    Note? note,
    $11.IncrementalMerkleVoucher? voucher,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (voucher != null) {
      $result.voucher = voucher;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    return $result;
  }
  NfParameters._() : super();
  factory NfParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NfParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NfParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..aOM<$11.IncrementalMerkleVoucher>(2, _omitFieldNames ? '' : 'voucher',
        subBuilder: $11.IncrementalMerkleVoucher.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NfParameters clone() => NfParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NfParameters copyWith(void Function(NfParameters) updates) =>
      super.copyWith((message) => updates(message as NfParameters)) as NfParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NfParameters create() => NfParameters._();
  NfParameters createEmptyInstance() => create();
  static $pb.PbList<NfParameters> createRepeated() => $pb.PbList<NfParameters>();
  @$core.pragma('dart2js:noInline')
  static NfParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NfParameters>(create);
  static NfParameters? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $11.IncrementalMerkleVoucher get voucher => $_getN(1);
  @$pb.TagNumber(2)
  set voucher($11.IncrementalMerkleVoucher v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVoucher() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucher() => clearField(2);
  @$pb.TagNumber(2)
  $11.IncrementalMerkleVoucher ensureVoucher() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ak => $_getN(2);
  @$pb.TagNumber(3)
  set ak($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAk() => $_has(2);
  @$pb.TagNumber(3)
  void clearAk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get nk => $_getN(3);
  @$pb.TagNumber(4)
  set nk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNk() => $_has(3);
  @$pb.TagNumber(4)
  void clearNk() => clearField(4);
}

class ExpandedSpendingKeyMessage extends $pb.GeneratedMessage {
  factory ExpandedSpendingKeyMessage({
    $core.List<$core.int>? ask,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
  }) {
    final $result = create();
    if (ask != null) {
      $result.ask = ask;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    return $result;
  }
  ExpandedSpendingKeyMessage._() : super();
  factory ExpandedSpendingKeyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExpandedSpendingKeyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExpandedSpendingKeyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ask', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExpandedSpendingKeyMessage clone() => ExpandedSpendingKeyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExpandedSpendingKeyMessage copyWith(void Function(ExpandedSpendingKeyMessage) updates) =>
      super.copyWith((message) => updates(message as ExpandedSpendingKeyMessage))
          as ExpandedSpendingKeyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExpandedSpendingKeyMessage create() => ExpandedSpendingKeyMessage._();
  ExpandedSpendingKeyMessage createEmptyInstance() => create();
  static $pb.PbList<ExpandedSpendingKeyMessage> createRepeated() =>
      $pb.PbList<ExpandedSpendingKeyMessage>();
  @$core.pragma('dart2js:noInline')
  static ExpandedSpendingKeyMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExpandedSpendingKeyMessage>(create);
  static ExpandedSpendingKeyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ask => $_getN(0);
  @$pb.TagNumber(1)
  set ask($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAsk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nsk => $_getN(1);
  @$pb.TagNumber(2)
  set nsk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearNsk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ovk => $_getN(2);
  @$pb.TagNumber(3)
  set ovk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOvk() => clearField(3);
}

class ViewingKeyMessage extends $pb.GeneratedMessage {
  factory ViewingKeyMessage({
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
  }) {
    final $result = create();
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    return $result;
  }
  ViewingKeyMessage._() : super();
  factory ViewingKeyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViewingKeyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ViewingKeyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViewingKeyMessage clone() => ViewingKeyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViewingKeyMessage copyWith(void Function(ViewingKeyMessage) updates) =>
      super.copyWith((message) => updates(message as ViewingKeyMessage)) as ViewingKeyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ViewingKeyMessage create() => ViewingKeyMessage._();
  ViewingKeyMessage createEmptyInstance() => create();
  static $pb.PbList<ViewingKeyMessage> createRepeated() => $pb.PbList<ViewingKeyMessage>();
  @$core.pragma('dart2js:noInline')
  static ViewingKeyMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ViewingKeyMessage>(create);
  static ViewingKeyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ak => $_getN(0);
  @$pb.TagNumber(1)
  set ak($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nk => $_getN(1);
  @$pb.TagNumber(2)
  set nk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNk() => $_has(1);
  @$pb.TagNumber(2)
  void clearNk() => clearField(2);
}

class IncomingViewingKeyMessage extends $pb.GeneratedMessage {
  factory IncomingViewingKeyMessage({
    $core.List<$core.int>? ivk,
  }) {
    final $result = create();
    if (ivk != null) {
      $result.ivk = ivk;
    }
    return $result;
  }
  IncomingViewingKeyMessage._() : super();
  factory IncomingViewingKeyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IncomingViewingKeyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IncomingViewingKeyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ivk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IncomingViewingKeyMessage clone() => IncomingViewingKeyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IncomingViewingKeyMessage copyWith(void Function(IncomingViewingKeyMessage) updates) =>
      super.copyWith((message) => updates(message as IncomingViewingKeyMessage))
          as IncomingViewingKeyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IncomingViewingKeyMessage create() => IncomingViewingKeyMessage._();
  IncomingViewingKeyMessage createEmptyInstance() => create();
  static $pb.PbList<IncomingViewingKeyMessage> createRepeated() =>
      $pb.PbList<IncomingViewingKeyMessage>();
  @$core.pragma('dart2js:noInline')
  static IncomingViewingKeyMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingViewingKeyMessage>(create);
  static IncomingViewingKeyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ivk => $_getN(0);
  @$pb.TagNumber(1)
  set ivk($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIvk() => $_has(0);
  @$pb.TagNumber(1)
  void clearIvk() => clearField(1);
}

class DiversifierMessage extends $pb.GeneratedMessage {
  factory DiversifierMessage({
    $core.List<$core.int>? d,
  }) {
    final $result = create();
    if (d != null) {
      $result.d = d;
    }
    return $result;
  }
  DiversifierMessage._() : super();
  factory DiversifierMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DiversifierMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DiversifierMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'd', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DiversifierMessage clone() => DiversifierMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DiversifierMessage copyWith(void Function(DiversifierMessage) updates) =>
      super.copyWith((message) => updates(message as DiversifierMessage)) as DiversifierMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DiversifierMessage create() => DiversifierMessage._();
  DiversifierMessage createEmptyInstance() => create();
  static $pb.PbList<DiversifierMessage> createRepeated() => $pb.PbList<DiversifierMessage>();
  @$core.pragma('dart2js:noInline')
  static DiversifierMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiversifierMessage>(create);
  static DiversifierMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get d => $_getN(0);
  @$pb.TagNumber(1)
  set d($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasD() => $_has(0);
  @$pb.TagNumber(1)
  void clearD() => clearField(1);
}

class IncomingViewingKeyDiversifierMessage extends $pb.GeneratedMessage {
  factory IncomingViewingKeyDiversifierMessage({
    IncomingViewingKeyMessage? ivk,
    DiversifierMessage? d,
  }) {
    final $result = create();
    if (ivk != null) {
      $result.ivk = ivk;
    }
    if (d != null) {
      $result.d = d;
    }
    return $result;
  }
  IncomingViewingKeyDiversifierMessage._() : super();
  factory IncomingViewingKeyDiversifierMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IncomingViewingKeyDiversifierMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IncomingViewingKeyDiversifierMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<IncomingViewingKeyMessage>(1, _omitFieldNames ? '' : 'ivk',
        subBuilder: IncomingViewingKeyMessage.create)
    ..aOM<DiversifierMessage>(2, _omitFieldNames ? '' : 'd', subBuilder: DiversifierMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IncomingViewingKeyDiversifierMessage clone() =>
      IncomingViewingKeyDiversifierMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IncomingViewingKeyDiversifierMessage copyWith(
          void Function(IncomingViewingKeyDiversifierMessage) updates) =>
      super.copyWith((message) => updates(message as IncomingViewingKeyDiversifierMessage))
          as IncomingViewingKeyDiversifierMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IncomingViewingKeyDiversifierMessage create() => IncomingViewingKeyDiversifierMessage._();
  IncomingViewingKeyDiversifierMessage createEmptyInstance() => create();
  static $pb.PbList<IncomingViewingKeyDiversifierMessage> createRepeated() =>
      $pb.PbList<IncomingViewingKeyDiversifierMessage>();
  @$core.pragma('dart2js:noInline')
  static IncomingViewingKeyDiversifierMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IncomingViewingKeyDiversifierMessage>(create);
  static IncomingViewingKeyDiversifierMessage? _defaultInstance;

  @$pb.TagNumber(1)
  IncomingViewingKeyMessage get ivk => $_getN(0);
  @$pb.TagNumber(1)
  set ivk(IncomingViewingKeyMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIvk() => $_has(0);
  @$pb.TagNumber(1)
  void clearIvk() => clearField(1);
  @$pb.TagNumber(1)
  IncomingViewingKeyMessage ensureIvk() => $_ensure(0);

  @$pb.TagNumber(2)
  DiversifierMessage get d => $_getN(1);
  @$pb.TagNumber(2)
  set d(DiversifierMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasD() => $_has(1);
  @$pb.TagNumber(2)
  void clearD() => clearField(2);
  @$pb.TagNumber(2)
  DiversifierMessage ensureD() => $_ensure(1);
}

class PaymentAddressMessage extends $pb.GeneratedMessage {
  factory PaymentAddressMessage({
    DiversifierMessage? d,
    $core.List<$core.int>? pkD,
    $core.String? paymentAddress,
  }) {
    final $result = create();
    if (d != null) {
      $result.d = d;
    }
    if (pkD != null) {
      $result.pkD = pkD;
    }
    if (paymentAddress != null) {
      $result.paymentAddress = paymentAddress;
    }
    return $result;
  }
  PaymentAddressMessage._() : super();
  factory PaymentAddressMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentAddressMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaymentAddressMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<DiversifierMessage>(1, _omitFieldNames ? '' : 'd', subBuilder: DiversifierMessage.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'pkD', $pb.PbFieldType.OY,
        protoName: 'pkD')
    ..aOS(3, _omitFieldNames ? '' : 'paymentAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PaymentAddressMessage clone() => PaymentAddressMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PaymentAddressMessage copyWith(void Function(PaymentAddressMessage) updates) =>
      super.copyWith((message) => updates(message as PaymentAddressMessage))
          as PaymentAddressMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaymentAddressMessage create() => PaymentAddressMessage._();
  PaymentAddressMessage createEmptyInstance() => create();
  static $pb.PbList<PaymentAddressMessage> createRepeated() => $pb.PbList<PaymentAddressMessage>();
  @$core.pragma('dart2js:noInline')
  static PaymentAddressMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentAddressMessage>(create);
  static PaymentAddressMessage? _defaultInstance;

  @$pb.TagNumber(1)
  DiversifierMessage get d => $_getN(0);
  @$pb.TagNumber(1)
  set d(DiversifierMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasD() => $_has(0);
  @$pb.TagNumber(1)
  void clearD() => clearField(1);
  @$pb.TagNumber(1)
  DiversifierMessage ensureD() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pkD => $_getN(1);
  @$pb.TagNumber(2)
  set pkD($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPkD() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkD() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get paymentAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set paymentAddress($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPaymentAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentAddress() => clearField(3);
}

class ShieldedAddressInfo extends $pb.GeneratedMessage {
  factory ShieldedAddressInfo({
    $core.List<$core.int>? sk,
    $core.List<$core.int>? ask,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
    $core.List<$core.int>? ivk,
    $core.List<$core.int>? d,
    $core.List<$core.int>? pkD,
    $core.String? paymentAddress,
  }) {
    final $result = create();
    if (sk != null) {
      $result.sk = sk;
    }
    if (ask != null) {
      $result.ask = ask;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    if (ivk != null) {
      $result.ivk = ivk;
    }
    if (d != null) {
      $result.d = d;
    }
    if (pkD != null) {
      $result.pkD = pkD;
    }
    if (paymentAddress != null) {
      $result.paymentAddress = paymentAddress;
    }
    return $result;
  }
  ShieldedAddressInfo._() : super();
  factory ShieldedAddressInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShieldedAddressInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShieldedAddressInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'sk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ask', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'ivk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(8, _omitFieldNames ? '' : 'd', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'pkD', $pb.PbFieldType.OY,
        protoName: 'pkD')
    ..aOS(10, _omitFieldNames ? '' : 'paymentAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShieldedAddressInfo clone() => ShieldedAddressInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShieldedAddressInfo copyWith(void Function(ShieldedAddressInfo) updates) =>
      super.copyWith((message) => updates(message as ShieldedAddressInfo)) as ShieldedAddressInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShieldedAddressInfo create() => ShieldedAddressInfo._();
  ShieldedAddressInfo createEmptyInstance() => create();
  static $pb.PbList<ShieldedAddressInfo> createRepeated() => $pb.PbList<ShieldedAddressInfo>();
  @$core.pragma('dart2js:noInline')
  static ShieldedAddressInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShieldedAddressInfo>(create);
  static ShieldedAddressInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sk => $_getN(0);
  @$pb.TagNumber(1)
  set sk($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSk() => $_has(0);
  @$pb.TagNumber(1)
  void clearSk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ask => $_getN(1);
  @$pb.TagNumber(2)
  set ask($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearAsk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nsk => $_getN(2);
  @$pb.TagNumber(3)
  set nsk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNsk() => $_has(2);
  @$pb.TagNumber(3)
  void clearNsk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ovk => $_getN(3);
  @$pb.TagNumber(4)
  set ovk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOvk() => $_has(3);
  @$pb.TagNumber(4)
  void clearOvk() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get ak => $_getN(4);
  @$pb.TagNumber(5)
  set ak($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAk() => $_has(4);
  @$pb.TagNumber(5)
  void clearAk() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get nk => $_getN(5);
  @$pb.TagNumber(6)
  set nk($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNk() => $_has(5);
  @$pb.TagNumber(6)
  void clearNk() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get ivk => $_getN(6);
  @$pb.TagNumber(7)
  set ivk($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIvk() => $_has(6);
  @$pb.TagNumber(7)
  void clearIvk() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get d => $_getN(7);
  @$pb.TagNumber(8)
  set d($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasD() => $_has(7);
  @$pb.TagNumber(8)
  void clearD() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get pkD => $_getN(8);
  @$pb.TagNumber(9)
  set pkD($core.List<$core.int> v) {
    $_setBytes(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPkD() => $_has(8);
  @$pb.TagNumber(9)
  void clearPkD() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get paymentAddress => $_getSZ(9);
  @$pb.TagNumber(10)
  set paymentAddress($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPaymentAddress() => $_has(9);
  @$pb.TagNumber(10)
  void clearPaymentAddress() => clearField(10);
}

class NoteParameters extends $pb.GeneratedMessage {
  factory NoteParameters({
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
    Note? note,
    $core.List<$core.int>? txid,
    $core.int? index,
  }) {
    final $result = create();
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    if (note != null) {
      $result.note = note;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (index != null) {
      $result.index = index;
    }
    return $result;
  }
  NoteParameters._() : super();
  factory NoteParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NoteParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NoteParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..aOM<Note>(3, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NoteParameters clone() => NoteParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NoteParameters copyWith(void Function(NoteParameters) updates) =>
      super.copyWith((message) => updates(message as NoteParameters)) as NoteParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NoteParameters create() => NoteParameters._();
  NoteParameters createEmptyInstance() => create();
  static $pb.PbList<NoteParameters> createRepeated() => $pb.PbList<NoteParameters>();
  @$core.pragma('dart2js:noInline')
  static NoteParameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NoteParameters>(create);
  static NoteParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ak => $_getN(0);
  @$pb.TagNumber(1)
  set ak($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nk => $_getN(1);
  @$pb.TagNumber(2)
  set nk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNk() => $_has(1);
  @$pb.TagNumber(2)
  void clearNk() => clearField(2);

  @$pb.TagNumber(3)
  Note get note => $_getN(2);
  @$pb.TagNumber(3)
  set note(Note v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);
  @$pb.TagNumber(3)
  Note ensureNote() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get txid => $_getN(3);
  @$pb.TagNumber(4)
  set txid($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTxid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTxid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get index => $_getIZ(4);
  @$pb.TagNumber(5)
  set index($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearIndex() => clearField(5);
}

class SpendResult extends $pb.GeneratedMessage {
  factory SpendResult({
    $core.bool? result,
    $core.String? message,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  SpendResult._() : super();
  factory SpendResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpendResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpendResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpendResult clone() => SpendResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpendResult copyWith(void Function(SpendResult) updates) =>
      super.copyWith((message) => updates(message as SpendResult)) as SpendResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpendResult create() => SpendResult._();
  SpendResult createEmptyInstance() => create();
  static $pb.PbList<SpendResult> createRepeated() => $pb.PbList<SpendResult>();
  @$core.pragma('dart2js:noInline')
  static SpendResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpendResult>(create);
  static SpendResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class TransactionInfoList extends $pb.GeneratedMessage {
  factory TransactionInfoList({
    $core.Iterable<$0.TransactionInfo>? transactionInfo,
  }) {
    final $result = create();
    if (transactionInfo != null) {
      $result.transactionInfo.addAll(transactionInfo);
    }
    return $result;
  }
  TransactionInfoList._() : super();
  factory TransactionInfoList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionInfoList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$0.TransactionInfo>(1, _omitFieldNames ? '' : 'transactionInfo', $pb.PbFieldType.PM,
        protoName: 'transactionInfo', subBuilder: $0.TransactionInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionInfoList clone() => TransactionInfoList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionInfoList copyWith(void Function(TransactionInfoList) updates) =>
      super.copyWith((message) => updates(message as TransactionInfoList)) as TransactionInfoList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfoList create() => TransactionInfoList._();
  TransactionInfoList createEmptyInstance() => create();
  static $pb.PbList<TransactionInfoList> createRepeated() => $pb.PbList<TransactionInfoList>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfoList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfoList>(create);
  static TransactionInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.TransactionInfo> get transactionInfo => $_getList(0);
}

class SpendNoteTRC20 extends $pb.GeneratedMessage {
  factory SpendNoteTRC20({
    Note? note,
    $core.List<$core.int>? alpha,
    $core.List<$core.int>? root,
    $core.List<$core.int>? path,
    $fixnum.Int64? pos,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (alpha != null) {
      $result.alpha = alpha;
    }
    if (root != null) {
      $result.root = root;
    }
    if (path != null) {
      $result.path = path;
    }
    if (pos != null) {
      $result.pos = pos;
    }
    return $result;
  }
  SpendNoteTRC20._() : super();
  factory SpendNoteTRC20.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpendNoteTRC20.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpendNoteTRC20',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'alpha', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'root', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'path', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'pos')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpendNoteTRC20 clone() => SpendNoteTRC20()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpendNoteTRC20 copyWith(void Function(SpendNoteTRC20) updates) =>
      super.copyWith((message) => updates(message as SpendNoteTRC20)) as SpendNoteTRC20;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpendNoteTRC20 create() => SpendNoteTRC20._();
  SpendNoteTRC20 createEmptyInstance() => create();
  static $pb.PbList<SpendNoteTRC20> createRepeated() => $pb.PbList<SpendNoteTRC20>();
  @$core.pragma('dart2js:noInline')
  static SpendNoteTRC20 getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpendNoteTRC20>(create);
  static SpendNoteTRC20? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get alpha => $_getN(1);
  @$pb.TagNumber(2)
  set alpha($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAlpha() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlpha() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get root => $_getN(2);
  @$pb.TagNumber(3)
  set root($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoot() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get path => $_getN(3);
  @$pb.TagNumber(4)
  set path($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearPath() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get pos => $_getI64(4);
  @$pb.TagNumber(5)
  set pos($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPos() => $_has(4);
  @$pb.TagNumber(5)
  void clearPos() => clearField(5);
}

class PrivateShieldedTRC20Parameters extends $pb.GeneratedMessage {
  factory PrivateShieldedTRC20Parameters({
    $core.List<$core.int>? ask,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
    $core.String? fromAmount,
    $core.Iterable<SpendNoteTRC20>? shieldedSpends,
    $core.Iterable<ReceiveNote>? shieldedReceives,
    $core.List<$core.int>? transparentToAddress,
    $core.String? toAmount,
    $core.List<$core.int>? shieldedTRC20ContractAddress,
  }) {
    final $result = create();
    if (ask != null) {
      $result.ask = ask;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (fromAmount != null) {
      $result.fromAmount = fromAmount;
    }
    if (shieldedSpends != null) {
      $result.shieldedSpends.addAll(shieldedSpends);
    }
    if (shieldedReceives != null) {
      $result.shieldedReceives.addAll(shieldedReceives);
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    if (toAmount != null) {
      $result.toAmount = toAmount;
    }
    if (shieldedTRC20ContractAddress != null) {
      $result.shieldedTRC20ContractAddress = shieldedTRC20ContractAddress;
    }
    return $result;
  }
  PrivateShieldedTRC20Parameters._() : super();
  factory PrivateShieldedTRC20Parameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateShieldedTRC20Parameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrivateShieldedTRC20Parameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ask', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'fromAmount')
    ..pc<SpendNoteTRC20>(5, _omitFieldNames ? '' : 'shieldedSpends', $pb.PbFieldType.PM,
        subBuilder: SpendNoteTRC20.create)
    ..pc<ReceiveNote>(6, _omitFieldNames ? '' : 'shieldedReceives', $pb.PbFieldType.PM,
        subBuilder: ReceiveNote.create)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'toAmount')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'shieldedTRC20ContractAddress', $pb.PbFieldType.OY,
        protoName: 'shielded_TRC20_contract_address')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateShieldedTRC20Parameters clone() =>
      PrivateShieldedTRC20Parameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateShieldedTRC20Parameters copyWith(void Function(PrivateShieldedTRC20Parameters) updates) =>
      super.copyWith((message) => updates(message as PrivateShieldedTRC20Parameters))
          as PrivateShieldedTRC20Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivateShieldedTRC20Parameters create() => PrivateShieldedTRC20Parameters._();
  PrivateShieldedTRC20Parameters createEmptyInstance() => create();
  static $pb.PbList<PrivateShieldedTRC20Parameters> createRepeated() =>
      $pb.PbList<PrivateShieldedTRC20Parameters>();
  @$core.pragma('dart2js:noInline')
  static PrivateShieldedTRC20Parameters getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivateShieldedTRC20Parameters>(create);
  static PrivateShieldedTRC20Parameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ask => $_getN(0);
  @$pb.TagNumber(1)
  set ask($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAsk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nsk => $_getN(1);
  @$pb.TagNumber(2)
  set nsk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearNsk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ovk => $_getN(2);
  @$pb.TagNumber(3)
  set ovk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOvk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fromAmount => $_getSZ(3);
  @$pb.TagNumber(4)
  set fromAmount($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFromAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<SpendNoteTRC20> get shieldedSpends => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<ReceiveNote> get shieldedReceives => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get transparentToAddress => $_getN(6);
  @$pb.TagNumber(7)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTransparentToAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransparentToAddress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toAmount => $_getSZ(7);
  @$pb.TagNumber(8)
  set toAmount($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearToAmount() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get shieldedTRC20ContractAddress => $_getN(8);
  @$pb.TagNumber(9)
  set shieldedTRC20ContractAddress($core.List<$core.int> v) {
    $_setBytes(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasShieldedTRC20ContractAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearShieldedTRC20ContractAddress() => clearField(9);
}

class PrivateShieldedTRC20ParametersWithoutAsk extends $pb.GeneratedMessage {
  factory PrivateShieldedTRC20ParametersWithoutAsk({
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nsk,
    $core.List<$core.int>? ovk,
    $core.String? fromAmount,
    $core.Iterable<SpendNoteTRC20>? shieldedSpends,
    $core.Iterable<ReceiveNote>? shieldedReceives,
    $core.List<$core.int>? transparentToAddress,
    $core.String? toAmount,
    $core.List<$core.int>? shieldedTRC20ContractAddress,
  }) {
    final $result = create();
    if (ak != null) {
      $result.ak = ak;
    }
    if (nsk != null) {
      $result.nsk = nsk;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (fromAmount != null) {
      $result.fromAmount = fromAmount;
    }
    if (shieldedSpends != null) {
      $result.shieldedSpends.addAll(shieldedSpends);
    }
    if (shieldedReceives != null) {
      $result.shieldedReceives.addAll(shieldedReceives);
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    if (toAmount != null) {
      $result.toAmount = toAmount;
    }
    if (shieldedTRC20ContractAddress != null) {
      $result.shieldedTRC20ContractAddress = shieldedTRC20ContractAddress;
    }
    return $result;
  }
  PrivateShieldedTRC20ParametersWithoutAsk._() : super();
  factory PrivateShieldedTRC20ParametersWithoutAsk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateShieldedTRC20ParametersWithoutAsk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrivateShieldedTRC20ParametersWithoutAsk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'nsk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'fromAmount')
    ..pc<SpendNoteTRC20>(5, _omitFieldNames ? '' : 'shieldedSpends', $pb.PbFieldType.PM,
        subBuilder: SpendNoteTRC20.create)
    ..pc<ReceiveNote>(6, _omitFieldNames ? '' : 'shieldedReceives', $pb.PbFieldType.PM,
        subBuilder: ReceiveNote.create)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'toAmount')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'shieldedTRC20ContractAddress', $pb.PbFieldType.OY,
        protoName: 'shielded_TRC20_contract_address')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateShieldedTRC20ParametersWithoutAsk clone() =>
      PrivateShieldedTRC20ParametersWithoutAsk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateShieldedTRC20ParametersWithoutAsk copyWith(
          void Function(PrivateShieldedTRC20ParametersWithoutAsk) updates) =>
      super.copyWith((message) => updates(message as PrivateShieldedTRC20ParametersWithoutAsk))
          as PrivateShieldedTRC20ParametersWithoutAsk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivateShieldedTRC20ParametersWithoutAsk create() =>
      PrivateShieldedTRC20ParametersWithoutAsk._();
  PrivateShieldedTRC20ParametersWithoutAsk createEmptyInstance() => create();
  static $pb.PbList<PrivateShieldedTRC20ParametersWithoutAsk> createRepeated() =>
      $pb.PbList<PrivateShieldedTRC20ParametersWithoutAsk>();
  @$core.pragma('dart2js:noInline')
  static PrivateShieldedTRC20ParametersWithoutAsk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivateShieldedTRC20ParametersWithoutAsk>(create);
  static PrivateShieldedTRC20ParametersWithoutAsk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ak => $_getN(0);
  @$pb.TagNumber(1)
  set ak($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nsk => $_getN(1);
  @$pb.TagNumber(2)
  set nsk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearNsk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ovk => $_getN(2);
  @$pb.TagNumber(3)
  set ovk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOvk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fromAmount => $_getSZ(3);
  @$pb.TagNumber(4)
  set fromAmount($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFromAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<SpendNoteTRC20> get shieldedSpends => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<ReceiveNote> get shieldedReceives => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get transparentToAddress => $_getN(6);
  @$pb.TagNumber(7)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTransparentToAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransparentToAddress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toAmount => $_getSZ(7);
  @$pb.TagNumber(8)
  set toAmount($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearToAmount() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get shieldedTRC20ContractAddress => $_getN(8);
  @$pb.TagNumber(9)
  set shieldedTRC20ContractAddress($core.List<$core.int> v) {
    $_setBytes(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasShieldedTRC20ContractAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearShieldedTRC20ContractAddress() => clearField(9);
}

class ShieldedTRC20Parameters extends $pb.GeneratedMessage {
  factory ShieldedTRC20Parameters({
    $core.Iterable<$11.SpendDescription>? spendDescription,
    $core.Iterable<$11.ReceiveDescription>? receiveDescription,
    $core.List<$core.int>? bindingSignature,
    $core.List<$core.int>? messageHash,
    $core.String? triggerContractInput,
    $core.String? parameterType,
  }) {
    final $result = create();
    if (spendDescription != null) {
      $result.spendDescription.addAll(spendDescription);
    }
    if (receiveDescription != null) {
      $result.receiveDescription.addAll(receiveDescription);
    }
    if (bindingSignature != null) {
      $result.bindingSignature = bindingSignature;
    }
    if (messageHash != null) {
      $result.messageHash = messageHash;
    }
    if (triggerContractInput != null) {
      $result.triggerContractInput = triggerContractInput;
    }
    if (parameterType != null) {
      $result.parameterType = parameterType;
    }
    return $result;
  }
  ShieldedTRC20Parameters._() : super();
  factory ShieldedTRC20Parameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShieldedTRC20Parameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShieldedTRC20Parameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<$11.SpendDescription>(1, _omitFieldNames ? '' : 'spendDescription', $pb.PbFieldType.PM,
        subBuilder: $11.SpendDescription.create)
    ..pc<$11.ReceiveDescription>(2, _omitFieldNames ? '' : 'receiveDescription', $pb.PbFieldType.PM,
        subBuilder: $11.ReceiveDescription.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'bindingSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'messageHash', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'triggerContractInput')
    ..aOS(6, _omitFieldNames ? '' : 'parameterType')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShieldedTRC20Parameters clone() => ShieldedTRC20Parameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShieldedTRC20Parameters copyWith(void Function(ShieldedTRC20Parameters) updates) =>
      super.copyWith((message) => updates(message as ShieldedTRC20Parameters))
          as ShieldedTRC20Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShieldedTRC20Parameters create() => ShieldedTRC20Parameters._();
  ShieldedTRC20Parameters createEmptyInstance() => create();
  static $pb.PbList<ShieldedTRC20Parameters> createRepeated() =>
      $pb.PbList<ShieldedTRC20Parameters>();
  @$core.pragma('dart2js:noInline')
  static ShieldedTRC20Parameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShieldedTRC20Parameters>(create);
  static ShieldedTRC20Parameters? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.SpendDescription> get spendDescription => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$11.ReceiveDescription> get receiveDescription => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get bindingSignature => $_getN(2);
  @$pb.TagNumber(3)
  set bindingSignature($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBindingSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearBindingSignature() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get messageHash => $_getN(3);
  @$pb.TagNumber(4)
  set messageHash($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMessageHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageHash() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get triggerContractInput => $_getSZ(4);
  @$pb.TagNumber(5)
  set triggerContractInput($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTriggerContractInput() => $_has(4);
  @$pb.TagNumber(5)
  void clearTriggerContractInput() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get parameterType => $_getSZ(5);
  @$pb.TagNumber(6)
  set parameterType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasParameterType() => $_has(5);
  @$pb.TagNumber(6)
  void clearParameterType() => clearField(6);
}

class IvkDecryptTRC20Parameters extends $pb.GeneratedMessage {
  factory IvkDecryptTRC20Parameters({
    $fixnum.Int64? startBlockIndex,
    $fixnum.Int64? endBlockIndex,
    $core.List<$core.int>? shieldedTRC20ContractAddress,
    $core.List<$core.int>? ivk,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
    $core.Iterable<$core.String>? events,
  }) {
    final $result = create();
    if (startBlockIndex != null) {
      $result.startBlockIndex = startBlockIndex;
    }
    if (endBlockIndex != null) {
      $result.endBlockIndex = endBlockIndex;
    }
    if (shieldedTRC20ContractAddress != null) {
      $result.shieldedTRC20ContractAddress = shieldedTRC20ContractAddress;
    }
    if (ivk != null) {
      $result.ivk = ivk;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  IvkDecryptTRC20Parameters._() : super();
  factory IvkDecryptTRC20Parameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IvkDecryptTRC20Parameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IvkDecryptTRC20Parameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startBlockIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'endBlockIndex')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'shieldedTRC20ContractAddress', $pb.PbFieldType.OY,
        protoName: 'shielded_TRC20_contract_address')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'ivk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..pPS(7, _omitFieldNames ? '' : 'events')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IvkDecryptTRC20Parameters clone() => IvkDecryptTRC20Parameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IvkDecryptTRC20Parameters copyWith(void Function(IvkDecryptTRC20Parameters) updates) =>
      super.copyWith((message) => updates(message as IvkDecryptTRC20Parameters))
          as IvkDecryptTRC20Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IvkDecryptTRC20Parameters create() => IvkDecryptTRC20Parameters._();
  IvkDecryptTRC20Parameters createEmptyInstance() => create();
  static $pb.PbList<IvkDecryptTRC20Parameters> createRepeated() =>
      $pb.PbList<IvkDecryptTRC20Parameters>();
  @$core.pragma('dart2js:noInline')
  static IvkDecryptTRC20Parameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IvkDecryptTRC20Parameters>(create);
  static IvkDecryptTRC20Parameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startBlockIndex => $_getI64(0);
  @$pb.TagNumber(1)
  set startBlockIndex($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartBlockIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartBlockIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endBlockIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set endBlockIndex($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndBlockIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndBlockIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get shieldedTRC20ContractAddress => $_getN(2);
  @$pb.TagNumber(3)
  set shieldedTRC20ContractAddress($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShieldedTRC20ContractAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearShieldedTRC20ContractAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ivk => $_getN(3);
  @$pb.TagNumber(4)
  set ivk($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIvk() => $_has(3);
  @$pb.TagNumber(4)
  void clearIvk() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get ak => $_getN(4);
  @$pb.TagNumber(5)
  set ak($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAk() => $_has(4);
  @$pb.TagNumber(5)
  void clearAk() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get nk => $_getN(5);
  @$pb.TagNumber(6)
  set nk($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNk() => $_has(5);
  @$pb.TagNumber(6)
  void clearNk() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get events => $_getList(6);
}

class OvkDecryptTRC20Parameters extends $pb.GeneratedMessage {
  factory OvkDecryptTRC20Parameters({
    $fixnum.Int64? startBlockIndex,
    $fixnum.Int64? endBlockIndex,
    $core.List<$core.int>? ovk,
    $core.List<$core.int>? shieldedTRC20ContractAddress,
    $core.Iterable<$core.String>? events,
  }) {
    final $result = create();
    if (startBlockIndex != null) {
      $result.startBlockIndex = startBlockIndex;
    }
    if (endBlockIndex != null) {
      $result.endBlockIndex = endBlockIndex;
    }
    if (ovk != null) {
      $result.ovk = ovk;
    }
    if (shieldedTRC20ContractAddress != null) {
      $result.shieldedTRC20ContractAddress = shieldedTRC20ContractAddress;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  OvkDecryptTRC20Parameters._() : super();
  factory OvkDecryptTRC20Parameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OvkDecryptTRC20Parameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OvkDecryptTRC20Parameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startBlockIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'endBlockIndex')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'ovk', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'shieldedTRC20ContractAddress', $pb.PbFieldType.OY,
        protoName: 'shielded_TRC20_contract_address')
    ..pPS(5, _omitFieldNames ? '' : 'events')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OvkDecryptTRC20Parameters clone() => OvkDecryptTRC20Parameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OvkDecryptTRC20Parameters copyWith(void Function(OvkDecryptTRC20Parameters) updates) =>
      super.copyWith((message) => updates(message as OvkDecryptTRC20Parameters))
          as OvkDecryptTRC20Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OvkDecryptTRC20Parameters create() => OvkDecryptTRC20Parameters._();
  OvkDecryptTRC20Parameters createEmptyInstance() => create();
  static $pb.PbList<OvkDecryptTRC20Parameters> createRepeated() =>
      $pb.PbList<OvkDecryptTRC20Parameters>();
  @$core.pragma('dart2js:noInline')
  static OvkDecryptTRC20Parameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OvkDecryptTRC20Parameters>(create);
  static OvkDecryptTRC20Parameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startBlockIndex => $_getI64(0);
  @$pb.TagNumber(1)
  set startBlockIndex($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartBlockIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartBlockIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endBlockIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set endBlockIndex($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndBlockIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndBlockIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ovk => $_getN(2);
  @$pb.TagNumber(3)
  set ovk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOvk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOvk() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get shieldedTRC20ContractAddress => $_getN(3);
  @$pb.TagNumber(4)
  set shieldedTRC20ContractAddress($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShieldedTRC20ContractAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearShieldedTRC20ContractAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get events => $_getList(4);
}

class DecryptNotesTRC20_NoteTx extends $pb.GeneratedMessage {
  factory DecryptNotesTRC20_NoteTx({
    Note? note,
    $fixnum.Int64? position,
    $core.bool? isSpent,
    $core.List<$core.int>? txid,
    $core.int? index,
    $core.String? toAmount,
    $core.List<$core.int>? transparentToAddress,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (position != null) {
      $result.position = position;
    }
    if (isSpent != null) {
      $result.isSpent = isSpent;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (index != null) {
      $result.index = index;
    }
    if (toAmount != null) {
      $result.toAmount = toAmount;
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    return $result;
  }
  DecryptNotesTRC20_NoteTx._() : super();
  factory DecryptNotesTRC20_NoteTx.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotesTRC20_NoteTx.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecryptNotesTRC20.NoteTx',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..aInt64(2, _omitFieldNames ? '' : 'position')
    ..aOB(3, _omitFieldNames ? '' : 'isSpent')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'toAmount')
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotesTRC20_NoteTx clone() => DecryptNotesTRC20_NoteTx()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotesTRC20_NoteTx copyWith(void Function(DecryptNotesTRC20_NoteTx) updates) =>
      super.copyWith((message) => updates(message as DecryptNotesTRC20_NoteTx))
          as DecryptNotesTRC20_NoteTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotesTRC20_NoteTx create() => DecryptNotesTRC20_NoteTx._();
  DecryptNotesTRC20_NoteTx createEmptyInstance() => create();
  static $pb.PbList<DecryptNotesTRC20_NoteTx> createRepeated() =>
      $pb.PbList<DecryptNotesTRC20_NoteTx>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotesTRC20_NoteTx getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotesTRC20_NoteTx>(create);
  static DecryptNotesTRC20_NoteTx? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get position => $_getI64(1);
  @$pb.TagNumber(2)
  set position($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSpent => $_getBF(2);
  @$pb.TagNumber(3)
  set isSpent($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsSpent() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSpent() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get txid => $_getN(3);
  @$pb.TagNumber(4)
  set txid($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTxid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTxid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get index => $_getIZ(4);
  @$pb.TagNumber(5)
  set index($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearIndex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get toAmount => $_getSZ(5);
  @$pb.TagNumber(6)
  set toAmount($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearToAmount() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get transparentToAddress => $_getN(6);
  @$pb.TagNumber(7)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTransparentToAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransparentToAddress() => clearField(7);
}

class DecryptNotesTRC20 extends $pb.GeneratedMessage {
  factory DecryptNotesTRC20({
    $core.Iterable<DecryptNotesTRC20_NoteTx>? noteTxs,
  }) {
    final $result = create();
    if (noteTxs != null) {
      $result.noteTxs.addAll(noteTxs);
    }
    return $result;
  }
  DecryptNotesTRC20._() : super();
  factory DecryptNotesTRC20.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptNotesTRC20.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DecryptNotesTRC20',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..pc<DecryptNotesTRC20_NoteTx>(1, _omitFieldNames ? '' : 'noteTxs', $pb.PbFieldType.PM,
        protoName: 'noteTxs', subBuilder: DecryptNotesTRC20_NoteTx.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptNotesTRC20 clone() => DecryptNotesTRC20()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptNotesTRC20 copyWith(void Function(DecryptNotesTRC20) updates) =>
      super.copyWith((message) => updates(message as DecryptNotesTRC20)) as DecryptNotesTRC20;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecryptNotesTRC20 create() => DecryptNotesTRC20._();
  DecryptNotesTRC20 createEmptyInstance() => create();
  static $pb.PbList<DecryptNotesTRC20> createRepeated() => $pb.PbList<DecryptNotesTRC20>();
  @$core.pragma('dart2js:noInline')
  static DecryptNotesTRC20 getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DecryptNotesTRC20>(create);
  static DecryptNotesTRC20? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DecryptNotesTRC20_NoteTx> get noteTxs => $_getList(0);
}

class NfTRC20Parameters extends $pb.GeneratedMessage {
  factory NfTRC20Parameters({
    Note? note,
    $core.List<$core.int>? ak,
    $core.List<$core.int>? nk,
    $fixnum.Int64? position,
    $core.List<$core.int>? shieldedTRC20ContractAddress,
  }) {
    final $result = create();
    if (note != null) {
      $result.note = note;
    }
    if (ak != null) {
      $result.ak = ak;
    }
    if (nk != null) {
      $result.nk = nk;
    }
    if (position != null) {
      $result.position = position;
    }
    if (shieldedTRC20ContractAddress != null) {
      $result.shieldedTRC20ContractAddress = shieldedTRC20ContractAddress;
    }
    return $result;
  }
  NfTRC20Parameters._() : super();
  factory NfTRC20Parameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NfTRC20Parameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NfTRC20Parameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Note>(1, _omitFieldNames ? '' : 'note', subBuilder: Note.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'ak', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'nk', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'position')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'shieldedTRC20ContractAddress', $pb.PbFieldType.OY,
        protoName: 'shielded_TRC20_contract_address')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NfTRC20Parameters clone() => NfTRC20Parameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NfTRC20Parameters copyWith(void Function(NfTRC20Parameters) updates) =>
      super.copyWith((message) => updates(message as NfTRC20Parameters)) as NfTRC20Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NfTRC20Parameters create() => NfTRC20Parameters._();
  NfTRC20Parameters createEmptyInstance() => create();
  static $pb.PbList<NfTRC20Parameters> createRepeated() => $pb.PbList<NfTRC20Parameters>();
  @$core.pragma('dart2js:noInline')
  static NfTRC20Parameters getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NfTRC20Parameters>(create);
  static NfTRC20Parameters? _defaultInstance;

  @$pb.TagNumber(1)
  Note get note => $_getN(0);
  @$pb.TagNumber(1)
  set note(Note v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => clearField(1);
  @$pb.TagNumber(1)
  Note ensureNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ak => $_getN(1);
  @$pb.TagNumber(2)
  set ak($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAk() => $_has(1);
  @$pb.TagNumber(2)
  void clearAk() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nk => $_getN(2);
  @$pb.TagNumber(3)
  set nk($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNk() => $_has(2);
  @$pb.TagNumber(3)
  void clearNk() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get position => $_getI64(3);
  @$pb.TagNumber(4)
  set position($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get shieldedTRC20ContractAddress => $_getN(4);
  @$pb.TagNumber(5)
  set shieldedTRC20ContractAddress($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShieldedTRC20ContractAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearShieldedTRC20ContractAddress() => clearField(5);
}

class NullifierResult extends $pb.GeneratedMessage {
  factory NullifierResult({
    $core.bool? isSpent,
  }) {
    final $result = create();
    if (isSpent != null) {
      $result.isSpent = isSpent;
    }
    return $result;
  }
  NullifierResult._() : super();
  factory NullifierResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NullifierResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullifierResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSpent')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NullifierResult clone() => NullifierResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NullifierResult copyWith(void Function(NullifierResult) updates) =>
      super.copyWith((message) => updates(message as NullifierResult)) as NullifierResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullifierResult create() => NullifierResult._();
  NullifierResult createEmptyInstance() => create();
  static $pb.PbList<NullifierResult> createRepeated() => $pb.PbList<NullifierResult>();
  @$core.pragma('dart2js:noInline')
  static NullifierResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullifierResult>(create);
  static NullifierResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSpent => $_getBF(0);
  @$pb.TagNumber(1)
  set isSpent($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsSpent() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSpent() => clearField(1);
}

class ShieldedTRC20TriggerContractParameters extends $pb.GeneratedMessage {
  factory ShieldedTRC20TriggerContractParameters({
    ShieldedTRC20Parameters? shieldedTRC20Parameters,
    $core.Iterable<BytesMessage>? spendAuthoritySignature,
    $core.String? amount,
    $core.List<$core.int>? transparentToAddress,
  }) {
    final $result = create();
    if (shieldedTRC20Parameters != null) {
      $result.shieldedTRC20Parameters = shieldedTRC20Parameters;
    }
    if (spendAuthoritySignature != null) {
      $result.spendAuthoritySignature.addAll(spendAuthoritySignature);
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (transparentToAddress != null) {
      $result.transparentToAddress = transparentToAddress;
    }
    return $result;
  }
  ShieldedTRC20TriggerContractParameters._() : super();
  factory ShieldedTRC20TriggerContractParameters.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShieldedTRC20TriggerContractParameters.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShieldedTRC20TriggerContractParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<ShieldedTRC20Parameters>(1, _omitFieldNames ? '' : 'shieldedTRC20Parameters',
        protoName: 'shielded_TRC20_Parameters', subBuilder: ShieldedTRC20Parameters.create)
    ..pc<BytesMessage>(2, _omitFieldNames ? '' : 'spendAuthoritySignature', $pb.PbFieldType.PM,
        subBuilder: BytesMessage.create)
    ..aOS(3, _omitFieldNames ? '' : 'amount')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'transparentToAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShieldedTRC20TriggerContractParameters clone() =>
      ShieldedTRC20TriggerContractParameters()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShieldedTRC20TriggerContractParameters copyWith(
          void Function(ShieldedTRC20TriggerContractParameters) updates) =>
      super.copyWith((message) => updates(message as ShieldedTRC20TriggerContractParameters))
          as ShieldedTRC20TriggerContractParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShieldedTRC20TriggerContractParameters create() =>
      ShieldedTRC20TriggerContractParameters._();
  ShieldedTRC20TriggerContractParameters createEmptyInstance() => create();
  static $pb.PbList<ShieldedTRC20TriggerContractParameters> createRepeated() =>
      $pb.PbList<ShieldedTRC20TriggerContractParameters>();
  @$core.pragma('dart2js:noInline')
  static ShieldedTRC20TriggerContractParameters getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShieldedTRC20TriggerContractParameters>(create);
  static ShieldedTRC20TriggerContractParameters? _defaultInstance;

  @$pb.TagNumber(1)
  ShieldedTRC20Parameters get shieldedTRC20Parameters => $_getN(0);
  @$pb.TagNumber(1)
  set shieldedTRC20Parameters(ShieldedTRC20Parameters v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShieldedTRC20Parameters() => $_has(0);
  @$pb.TagNumber(1)
  void clearShieldedTRC20Parameters() => clearField(1);
  @$pb.TagNumber(1)
  ShieldedTRC20Parameters ensureShieldedTRC20Parameters() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<BytesMessage> get spendAuthoritySignature => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get amount => $_getSZ(2);
  @$pb.TagNumber(3)
  set amount($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get transparentToAddress => $_getN(3);
  @$pb.TagNumber(4)
  set transparentToAddress($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTransparentToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransparentToAddress() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
