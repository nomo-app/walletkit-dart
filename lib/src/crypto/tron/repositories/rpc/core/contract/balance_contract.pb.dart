//
//  Generated code. Do not modify.
//  source: core/contract/balance_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $14;

class FreezeBalanceContract extends $pb.GeneratedMessage {
  factory FreezeBalanceContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? frozenBalance,
    $fixnum.Int64? frozenDuration,
    $14.ResourceCode? resource,
    $core.List<$core.int>? receiverAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (frozenBalance != null) {
      $result.frozenBalance = frozenBalance;
    }
    if (frozenDuration != null) {
      $result.frozenDuration = frozenDuration;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (receiverAddress != null) {
      $result.receiverAddress = receiverAddress;
    }
    return $result;
  }
  FreezeBalanceContract._() : super();
  factory FreezeBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FreezeBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FreezeBalanceContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'frozenBalance')
    ..aInt64(3, _omitFieldNames ? '' : 'frozenDuration')
    ..e<$14.ResourceCode>(10, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..a<$core.List<$core.int>>(15, _omitFieldNames ? '' : 'receiverAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FreezeBalanceContract clone() => FreezeBalanceContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FreezeBalanceContract copyWith(void Function(FreezeBalanceContract) updates) => super.copyWith((message) => updates(message as FreezeBalanceContract)) as FreezeBalanceContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract create() => FreezeBalanceContract._();
  FreezeBalanceContract createEmptyInstance() => create();
  static $pb.PbList<FreezeBalanceContract> createRepeated() => $pb.PbList<FreezeBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FreezeBalanceContract>(create);
  static FreezeBalanceContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenBalance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalance() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get frozenDuration => $_getI64(2);
  @$pb.TagNumber(3)
  set frozenDuration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrozenDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrozenDuration() => clearField(3);

  @$pb.TagNumber(10)
  $14.ResourceCode get resource => $_getN(3);
  @$pb.TagNumber(10)
  set resource($14.ResourceCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(3);
  @$pb.TagNumber(10)
  void clearResource() => clearField(10);

  @$pb.TagNumber(15)
  $core.List<$core.int> get receiverAddress => $_getN(4);
  @$pb.TagNumber(15)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(4);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => clearField(15);
}

class UnfreezeBalanceContract extends $pb.GeneratedMessage {
  factory UnfreezeBalanceContract({
    $core.List<$core.int>? ownerAddress,
    $14.ResourceCode? resource,
    $core.List<$core.int>? receiverAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (receiverAddress != null) {
      $result.receiverAddress = receiverAddress;
    }
    return $result;
  }
  UnfreezeBalanceContract._() : super();
  factory UnfreezeBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfreezeBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnfreezeBalanceContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..e<$14.ResourceCode>(10, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..a<$core.List<$core.int>>(15, _omitFieldNames ? '' : 'receiverAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnfreezeBalanceContract clone() => UnfreezeBalanceContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnfreezeBalanceContract copyWith(void Function(UnfreezeBalanceContract) updates) => super.copyWith((message) => updates(message as UnfreezeBalanceContract)) as UnfreezeBalanceContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract create() => UnfreezeBalanceContract._();
  UnfreezeBalanceContract createEmptyInstance() => create();
  static $pb.PbList<UnfreezeBalanceContract> createRepeated() => $pb.PbList<UnfreezeBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfreezeBalanceContract>(create);
  static UnfreezeBalanceContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(10)
  $14.ResourceCode get resource => $_getN(1);
  @$pb.TagNumber(10)
  set resource($14.ResourceCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(10)
  void clearResource() => clearField(10);

  @$pb.TagNumber(15)
  $core.List<$core.int> get receiverAddress => $_getN(2);
  @$pb.TagNumber(15)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(2);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => clearField(15);
}

class WithdrawBalanceContract extends $pb.GeneratedMessage {
  factory WithdrawBalanceContract({
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  WithdrawBalanceContract._() : super();
  factory WithdrawBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithdrawBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WithdrawBalanceContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WithdrawBalanceContract clone() => WithdrawBalanceContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WithdrawBalanceContract copyWith(void Function(WithdrawBalanceContract) updates) => super.copyWith((message) => updates(message as WithdrawBalanceContract)) as WithdrawBalanceContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract create() => WithdrawBalanceContract._();
  WithdrawBalanceContract createEmptyInstance() => create();
  static $pb.PbList<WithdrawBalanceContract> createRepeated() => $pb.PbList<WithdrawBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithdrawBalanceContract>(create);
  static WithdrawBalanceContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class TransferContract extends $pb.GeneratedMessage {
  factory TransferContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? toAddress,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
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
  TransferContract._() : super();
  factory TransferContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'toAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferContract clone() => TransferContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferContract copyWith(void Function(TransferContract) updates) => super.copyWith((message) => updates(message as TransferContract)) as TransferContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferContract create() => TransferContract._();
  TransferContract createEmptyInstance() => create();
  static $pb.PbList<TransferContract> createRepeated() => $pb.PbList<TransferContract>();
  @$core.pragma('dart2js:noInline')
  static TransferContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferContract>(create);
  static TransferContract? _defaultInstance;

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
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class TransactionBalanceTrace_Operation extends $pb.GeneratedMessage {
  factory TransactionBalanceTrace_Operation({
    $fixnum.Int64? operationIdentifier,
    $core.List<$core.int>? address,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (operationIdentifier != null) {
      $result.operationIdentifier = operationIdentifier;
    }
    if (address != null) {
      $result.address = address;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  TransactionBalanceTrace_Operation._() : super();
  factory TransactionBalanceTrace_Operation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionBalanceTrace_Operation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionBalanceTrace.Operation', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'operationIdentifier')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionBalanceTrace_Operation clone() => TransactionBalanceTrace_Operation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionBalanceTrace_Operation copyWith(void Function(TransactionBalanceTrace_Operation) updates) => super.copyWith((message) => updates(message as TransactionBalanceTrace_Operation)) as TransactionBalanceTrace_Operation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBalanceTrace_Operation create() => TransactionBalanceTrace_Operation._();
  TransactionBalanceTrace_Operation createEmptyInstance() => create();
  static $pb.PbList<TransactionBalanceTrace_Operation> createRepeated() => $pb.PbList<TransactionBalanceTrace_Operation>();
  @$core.pragma('dart2js:noInline')
  static TransactionBalanceTrace_Operation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionBalanceTrace_Operation>(create);
  static TransactionBalanceTrace_Operation? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get operationIdentifier => $_getI64(0);
  @$pb.TagNumber(1)
  set operationIdentifier($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOperationIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperationIdentifier() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get address => $_getN(1);
  @$pb.TagNumber(2)
  set address($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class TransactionBalanceTrace extends $pb.GeneratedMessage {
  factory TransactionBalanceTrace({
    $core.List<$core.int>? transactionIdentifier,
    $core.Iterable<TransactionBalanceTrace_Operation>? operation,
    $core.String? type,
    $core.String? status,
  }) {
    final $result = create();
    if (transactionIdentifier != null) {
      $result.transactionIdentifier = transactionIdentifier;
    }
    if (operation != null) {
      $result.operation.addAll(operation);
    }
    if (type != null) {
      $result.type = type;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  TransactionBalanceTrace._() : super();
  factory TransactionBalanceTrace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionBalanceTrace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionBalanceTrace', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'transactionIdentifier', $pb.PbFieldType.OY)
    ..pc<TransactionBalanceTrace_Operation>(2, _omitFieldNames ? '' : 'operation', $pb.PbFieldType.PM, subBuilder: TransactionBalanceTrace_Operation.create)
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionBalanceTrace clone() => TransactionBalanceTrace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionBalanceTrace copyWith(void Function(TransactionBalanceTrace) updates) => super.copyWith((message) => updates(message as TransactionBalanceTrace)) as TransactionBalanceTrace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBalanceTrace create() => TransactionBalanceTrace._();
  TransactionBalanceTrace createEmptyInstance() => create();
  static $pb.PbList<TransactionBalanceTrace> createRepeated() => $pb.PbList<TransactionBalanceTrace>();
  @$core.pragma('dart2js:noInline')
  static TransactionBalanceTrace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionBalanceTrace>(create);
  static TransactionBalanceTrace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set transactionIdentifier($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionIdentifier() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TransactionBalanceTrace_Operation> get operation => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class BlockBalanceTrace_BlockIdentifier extends $pb.GeneratedMessage {
  factory BlockBalanceTrace_BlockIdentifier({
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
  BlockBalanceTrace_BlockIdentifier._() : super();
  factory BlockBalanceTrace_BlockIdentifier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockBalanceTrace_BlockIdentifier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockBalanceTrace.BlockIdentifier', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockBalanceTrace_BlockIdentifier clone() => BlockBalanceTrace_BlockIdentifier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockBalanceTrace_BlockIdentifier copyWith(void Function(BlockBalanceTrace_BlockIdentifier) updates) => super.copyWith((message) => updates(message as BlockBalanceTrace_BlockIdentifier)) as BlockBalanceTrace_BlockIdentifier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockBalanceTrace_BlockIdentifier create() => BlockBalanceTrace_BlockIdentifier._();
  BlockBalanceTrace_BlockIdentifier createEmptyInstance() => create();
  static $pb.PbList<BlockBalanceTrace_BlockIdentifier> createRepeated() => $pb.PbList<BlockBalanceTrace_BlockIdentifier>();
  @$core.pragma('dart2js:noInline')
  static BlockBalanceTrace_BlockIdentifier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockBalanceTrace_BlockIdentifier>(create);
  static BlockBalanceTrace_BlockIdentifier? _defaultInstance;

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

class BlockBalanceTrace extends $pb.GeneratedMessage {
  factory BlockBalanceTrace({
    BlockBalanceTrace_BlockIdentifier? blockIdentifier,
    $fixnum.Int64? timestamp,
    $core.Iterable<TransactionBalanceTrace>? transactionBalanceTrace,
  }) {
    final $result = create();
    if (blockIdentifier != null) {
      $result.blockIdentifier = blockIdentifier;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (transactionBalanceTrace != null) {
      $result.transactionBalanceTrace.addAll(transactionBalanceTrace);
    }
    return $result;
  }
  BlockBalanceTrace._() : super();
  factory BlockBalanceTrace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockBalanceTrace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockBalanceTrace', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<BlockBalanceTrace_BlockIdentifier>(1, _omitFieldNames ? '' : 'blockIdentifier', subBuilder: BlockBalanceTrace_BlockIdentifier.create)
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..pc<TransactionBalanceTrace>(3, _omitFieldNames ? '' : 'transactionBalanceTrace', $pb.PbFieldType.PM, subBuilder: TransactionBalanceTrace.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockBalanceTrace clone() => BlockBalanceTrace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockBalanceTrace copyWith(void Function(BlockBalanceTrace) updates) => super.copyWith((message) => updates(message as BlockBalanceTrace)) as BlockBalanceTrace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockBalanceTrace create() => BlockBalanceTrace._();
  BlockBalanceTrace createEmptyInstance() => create();
  static $pb.PbList<BlockBalanceTrace> createRepeated() => $pb.PbList<BlockBalanceTrace>();
  @$core.pragma('dart2js:noInline')
  static BlockBalanceTrace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockBalanceTrace>(create);
  static BlockBalanceTrace? _defaultInstance;

  @$pb.TagNumber(1)
  BlockBalanceTrace_BlockIdentifier get blockIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set blockIdentifier(BlockBalanceTrace_BlockIdentifier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  BlockBalanceTrace_BlockIdentifier ensureBlockIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<TransactionBalanceTrace> get transactionBalanceTrace => $_getList(2);
}

class AccountTrace extends $pb.GeneratedMessage {
  factory AccountTrace({
    $fixnum.Int64? balance,
    $fixnum.Int64? placeholder,
  }) {
    final $result = create();
    if (balance != null) {
      $result.balance = balance;
    }
    if (placeholder != null) {
      $result.placeholder = placeholder;
    }
    return $result;
  }
  AccountTrace._() : super();
  factory AccountTrace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountTrace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountTrace', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'balance')
    ..aInt64(99, _omitFieldNames ? '' : 'placeholder')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountTrace clone() => AccountTrace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountTrace copyWith(void Function(AccountTrace) updates) => super.copyWith((message) => updates(message as AccountTrace)) as AccountTrace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountTrace create() => AccountTrace._();
  AccountTrace createEmptyInstance() => create();
  static $pb.PbList<AccountTrace> createRepeated() => $pb.PbList<AccountTrace>();
  @$core.pragma('dart2js:noInline')
  static AccountTrace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountTrace>(create);
  static AccountTrace? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);

  @$pb.TagNumber(99)
  $fixnum.Int64 get placeholder => $_getI64(1);
  @$pb.TagNumber(99)
  set placeholder($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(99)
  $core.bool hasPlaceholder() => $_has(1);
  @$pb.TagNumber(99)
  void clearPlaceholder() => clearField(99);
}

class AccountIdentifier extends $pb.GeneratedMessage {
  factory AccountIdentifier({
    $core.List<$core.int>? address,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  AccountIdentifier._() : super();
  factory AccountIdentifier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountIdentifier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountIdentifier', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountIdentifier clone() => AccountIdentifier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountIdentifier copyWith(void Function(AccountIdentifier) updates) => super.copyWith((message) => updates(message as AccountIdentifier)) as AccountIdentifier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountIdentifier create() => AccountIdentifier._();
  AccountIdentifier createEmptyInstance() => create();
  static $pb.PbList<AccountIdentifier> createRepeated() => $pb.PbList<AccountIdentifier>();
  @$core.pragma('dart2js:noInline')
  static AccountIdentifier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountIdentifier>(create);
  static AccountIdentifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class AccountBalanceRequest extends $pb.GeneratedMessage {
  factory AccountBalanceRequest({
    AccountIdentifier? accountIdentifier,
    BlockBalanceTrace_BlockIdentifier? blockIdentifier,
  }) {
    final $result = create();
    if (accountIdentifier != null) {
      $result.accountIdentifier = accountIdentifier;
    }
    if (blockIdentifier != null) {
      $result.blockIdentifier = blockIdentifier;
    }
    return $result;
  }
  AccountBalanceRequest._() : super();
  factory AccountBalanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountBalanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountBalanceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<AccountIdentifier>(1, _omitFieldNames ? '' : 'accountIdentifier', subBuilder: AccountIdentifier.create)
    ..aOM<BlockBalanceTrace_BlockIdentifier>(2, _omitFieldNames ? '' : 'blockIdentifier', subBuilder: BlockBalanceTrace_BlockIdentifier.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountBalanceRequest clone() => AccountBalanceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountBalanceRequest copyWith(void Function(AccountBalanceRequest) updates) => super.copyWith((message) => updates(message as AccountBalanceRequest)) as AccountBalanceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountBalanceRequest create() => AccountBalanceRequest._();
  AccountBalanceRequest createEmptyInstance() => create();
  static $pb.PbList<AccountBalanceRequest> createRepeated() => $pb.PbList<AccountBalanceRequest>();
  @$core.pragma('dart2js:noInline')
  static AccountBalanceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountBalanceRequest>(create);
  static AccountBalanceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AccountIdentifier get accountIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set accountIdentifier(AccountIdentifier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  AccountIdentifier ensureAccountIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  BlockBalanceTrace_BlockIdentifier get blockIdentifier => $_getN(1);
  @$pb.TagNumber(2)
  set blockIdentifier(BlockBalanceTrace_BlockIdentifier v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockIdentifier() => clearField(2);
  @$pb.TagNumber(2)
  BlockBalanceTrace_BlockIdentifier ensureBlockIdentifier() => $_ensure(1);
}

class AccountBalanceResponse extends $pb.GeneratedMessage {
  factory AccountBalanceResponse({
    $fixnum.Int64? balance,
    BlockBalanceTrace_BlockIdentifier? blockIdentifier,
  }) {
    final $result = create();
    if (balance != null) {
      $result.balance = balance;
    }
    if (blockIdentifier != null) {
      $result.blockIdentifier = blockIdentifier;
    }
    return $result;
  }
  AccountBalanceResponse._() : super();
  factory AccountBalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountBalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountBalanceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'balance')
    ..aOM<BlockBalanceTrace_BlockIdentifier>(2, _omitFieldNames ? '' : 'blockIdentifier', subBuilder: BlockBalanceTrace_BlockIdentifier.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountBalanceResponse clone() => AccountBalanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountBalanceResponse copyWith(void Function(AccountBalanceResponse) updates) => super.copyWith((message) => updates(message as AccountBalanceResponse)) as AccountBalanceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountBalanceResponse create() => AccountBalanceResponse._();
  AccountBalanceResponse createEmptyInstance() => create();
  static $pb.PbList<AccountBalanceResponse> createRepeated() => $pb.PbList<AccountBalanceResponse>();
  @$core.pragma('dart2js:noInline')
  static AccountBalanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountBalanceResponse>(create);
  static AccountBalanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);

  @$pb.TagNumber(2)
  BlockBalanceTrace_BlockIdentifier get blockIdentifier => $_getN(1);
  @$pb.TagNumber(2)
  set blockIdentifier(BlockBalanceTrace_BlockIdentifier v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockIdentifier() => clearField(2);
  @$pb.TagNumber(2)
  BlockBalanceTrace_BlockIdentifier ensureBlockIdentifier() => $_ensure(1);
}

class FreezeBalanceV2Contract extends $pb.GeneratedMessage {
  factory FreezeBalanceV2Contract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? frozenBalance,
    $14.ResourceCode? resource,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (frozenBalance != null) {
      $result.frozenBalance = frozenBalance;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    return $result;
  }
  FreezeBalanceV2Contract._() : super();
  factory FreezeBalanceV2Contract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FreezeBalanceV2Contract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FreezeBalanceV2Contract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'frozenBalance')
    ..e<$14.ResourceCode>(3, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FreezeBalanceV2Contract clone() => FreezeBalanceV2Contract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FreezeBalanceV2Contract copyWith(void Function(FreezeBalanceV2Contract) updates) => super.copyWith((message) => updates(message as FreezeBalanceV2Contract)) as FreezeBalanceV2Contract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeBalanceV2Contract create() => FreezeBalanceV2Contract._();
  FreezeBalanceV2Contract createEmptyInstance() => create();
  static $pb.PbList<FreezeBalanceV2Contract> createRepeated() => $pb.PbList<FreezeBalanceV2Contract>();
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceV2Contract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FreezeBalanceV2Contract>(create);
  static FreezeBalanceV2Contract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenBalance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalance() => clearField(2);

  @$pb.TagNumber(3)
  $14.ResourceCode get resource => $_getN(2);
  @$pb.TagNumber(3)
  set resource($14.ResourceCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => clearField(3);
}

class UnfreezeBalanceV2Contract extends $pb.GeneratedMessage {
  factory UnfreezeBalanceV2Contract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? unfreezeBalance,
    $14.ResourceCode? resource,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (unfreezeBalance != null) {
      $result.unfreezeBalance = unfreezeBalance;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    return $result;
  }
  UnfreezeBalanceV2Contract._() : super();
  factory UnfreezeBalanceV2Contract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfreezeBalanceV2Contract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnfreezeBalanceV2Contract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'unfreezeBalance')
    ..e<$14.ResourceCode>(3, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnfreezeBalanceV2Contract clone() => UnfreezeBalanceV2Contract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnfreezeBalanceV2Contract copyWith(void Function(UnfreezeBalanceV2Contract) updates) => super.copyWith((message) => updates(message as UnfreezeBalanceV2Contract)) as UnfreezeBalanceV2Contract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceV2Contract create() => UnfreezeBalanceV2Contract._();
  UnfreezeBalanceV2Contract createEmptyInstance() => create();
  static $pb.PbList<UnfreezeBalanceV2Contract> createRepeated() => $pb.PbList<UnfreezeBalanceV2Contract>();
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceV2Contract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfreezeBalanceV2Contract>(create);
  static UnfreezeBalanceV2Contract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get unfreezeBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set unfreezeBalance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnfreezeBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnfreezeBalance() => clearField(2);

  @$pb.TagNumber(3)
  $14.ResourceCode get resource => $_getN(2);
  @$pb.TagNumber(3)
  set resource($14.ResourceCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => clearField(3);
}

class WithdrawExpireUnfreezeContract extends $pb.GeneratedMessage {
  factory WithdrawExpireUnfreezeContract({
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  WithdrawExpireUnfreezeContract._() : super();
  factory WithdrawExpireUnfreezeContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithdrawExpireUnfreezeContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WithdrawExpireUnfreezeContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WithdrawExpireUnfreezeContract clone() => WithdrawExpireUnfreezeContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WithdrawExpireUnfreezeContract copyWith(void Function(WithdrawExpireUnfreezeContract) updates) => super.copyWith((message) => updates(message as WithdrawExpireUnfreezeContract)) as WithdrawExpireUnfreezeContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawExpireUnfreezeContract create() => WithdrawExpireUnfreezeContract._();
  WithdrawExpireUnfreezeContract createEmptyInstance() => create();
  static $pb.PbList<WithdrawExpireUnfreezeContract> createRepeated() => $pb.PbList<WithdrawExpireUnfreezeContract>();
  @$core.pragma('dart2js:noInline')
  static WithdrawExpireUnfreezeContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithdrawExpireUnfreezeContract>(create);
  static WithdrawExpireUnfreezeContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class DelegateResourceContract extends $pb.GeneratedMessage {
  factory DelegateResourceContract({
    $core.List<$core.int>? ownerAddress,
    $14.ResourceCode? resource,
    $fixnum.Int64? balance,
    $core.List<$core.int>? receiverAddress,
    $core.bool? lock,
    $fixnum.Int64? lockPeriod,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (receiverAddress != null) {
      $result.receiverAddress = receiverAddress;
    }
    if (lock != null) {
      $result.lock = lock;
    }
    if (lockPeriod != null) {
      $result.lockPeriod = lockPeriod;
    }
    return $result;
  }
  DelegateResourceContract._() : super();
  factory DelegateResourceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegateResourceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelegateResourceContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..e<$14.ResourceCode>(2, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..aInt64(3, _omitFieldNames ? '' : 'balance')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'receiverAddress', $pb.PbFieldType.OY)
    ..aOB(5, _omitFieldNames ? '' : 'lock')
    ..aInt64(6, _omitFieldNames ? '' : 'lockPeriod')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelegateResourceContract clone() => DelegateResourceContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelegateResourceContract copyWith(void Function(DelegateResourceContract) updates) => super.copyWith((message) => updates(message as DelegateResourceContract)) as DelegateResourceContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegateResourceContract create() => DelegateResourceContract._();
  DelegateResourceContract createEmptyInstance() => create();
  static $pb.PbList<DelegateResourceContract> createRepeated() => $pb.PbList<DelegateResourceContract>();
  @$core.pragma('dart2js:noInline')
  static DelegateResourceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegateResourceContract>(create);
  static DelegateResourceContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $14.ResourceCode get resource => $_getN(1);
  @$pb.TagNumber(2)
  set resource($14.ResourceCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get balance => $_getI64(2);
  @$pb.TagNumber(3)
  set balance($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get receiverAddress => $_getN(3);
  @$pb.TagNumber(4)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceiverAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get lock => $_getBF(4);
  @$pb.TagNumber(5)
  set lock($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLock() => $_has(4);
  @$pb.TagNumber(5)
  void clearLock() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lockPeriod => $_getI64(5);
  @$pb.TagNumber(6)
  set lockPeriod($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLockPeriod() => $_has(5);
  @$pb.TagNumber(6)
  void clearLockPeriod() => clearField(6);
}

class UnDelegateResourceContract extends $pb.GeneratedMessage {
  factory UnDelegateResourceContract({
    $core.List<$core.int>? ownerAddress,
    $14.ResourceCode? resource,
    $fixnum.Int64? balance,
    $core.List<$core.int>? receiverAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (receiverAddress != null) {
      $result.receiverAddress = receiverAddress;
    }
    return $result;
  }
  UnDelegateResourceContract._() : super();
  factory UnDelegateResourceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnDelegateResourceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnDelegateResourceContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..e<$14.ResourceCode>(2, _omitFieldNames ? '' : 'resource', $pb.PbFieldType.OE, defaultOrMaker: $14.ResourceCode.BANDWIDTH, valueOf: $14.ResourceCode.valueOf, enumValues: $14.ResourceCode.values)
    ..aInt64(3, _omitFieldNames ? '' : 'balance')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'receiverAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnDelegateResourceContract clone() => UnDelegateResourceContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnDelegateResourceContract copyWith(void Function(UnDelegateResourceContract) updates) => super.copyWith((message) => updates(message as UnDelegateResourceContract)) as UnDelegateResourceContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnDelegateResourceContract create() => UnDelegateResourceContract._();
  UnDelegateResourceContract createEmptyInstance() => create();
  static $pb.PbList<UnDelegateResourceContract> createRepeated() => $pb.PbList<UnDelegateResourceContract>();
  @$core.pragma('dart2js:noInline')
  static UnDelegateResourceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnDelegateResourceContract>(create);
  static UnDelegateResourceContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $14.ResourceCode get resource => $_getN(1);
  @$pb.TagNumber(2)
  set resource($14.ResourceCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get balance => $_getI64(2);
  @$pb.TagNumber(3)
  set balance($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get receiverAddress => $_getN(3);
  @$pb.TagNumber(4)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceiverAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverAddress() => clearField(4);
}

class CancelAllUnfreezeV2Contract extends $pb.GeneratedMessage {
  factory CancelAllUnfreezeV2Contract({
    $core.List<$core.int>? ownerAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    return $result;
  }
  CancelAllUnfreezeV2Contract._() : super();
  factory CancelAllUnfreezeV2Contract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CancelAllUnfreezeV2Contract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CancelAllUnfreezeV2Contract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CancelAllUnfreezeV2Contract clone() => CancelAllUnfreezeV2Contract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CancelAllUnfreezeV2Contract copyWith(void Function(CancelAllUnfreezeV2Contract) updates) => super.copyWith((message) => updates(message as CancelAllUnfreezeV2Contract)) as CancelAllUnfreezeV2Contract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelAllUnfreezeV2Contract create() => CancelAllUnfreezeV2Contract._();
  CancelAllUnfreezeV2Contract createEmptyInstance() => create();
  static $pb.PbList<CancelAllUnfreezeV2Contract> createRepeated() => $pb.PbList<CancelAllUnfreezeV2Contract>();
  @$core.pragma('dart2js:noInline')
  static CancelAllUnfreezeV2Contract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CancelAllUnfreezeV2Contract>(create);
  static CancelAllUnfreezeV2Contract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
