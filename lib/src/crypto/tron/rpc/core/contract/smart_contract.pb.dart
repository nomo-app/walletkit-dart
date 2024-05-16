//
//  Generated code. Do not modify.
//  source: core/contract/smart_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'smart_contract.pbenum.dart';

export 'smart_contract.pbenum.dart';

class SmartContract_ABI_Entry_Param extends $pb.GeneratedMessage {
  factory SmartContract_ABI_Entry_Param({
    $core.bool? indexed,
    $core.String? name,
    $core.String? type,
  }) {
    final $result = create();
    if (indexed != null) {
      $result.indexed = indexed;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  SmartContract_ABI_Entry_Param._() : super();
  factory SmartContract_ABI_Entry_Param.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI_Entry_Param.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SmartContract.ABI.Entry.Param', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'indexed')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartContract_ABI_Entry_Param clone() => SmartContract_ABI_Entry_Param()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartContract_ABI_Entry_Param copyWith(void Function(SmartContract_ABI_Entry_Param) updates) => super.copyWith((message) => updates(message as SmartContract_ABI_Entry_Param)) as SmartContract_ABI_Entry_Param;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry_Param create() => SmartContract_ABI_Entry_Param._();
  SmartContract_ABI_Entry_Param createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI_Entry_Param> createRepeated() => $pb.PbList<SmartContract_ABI_Entry_Param>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry_Param getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI_Entry_Param>(create);
  static SmartContract_ABI_Entry_Param? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get indexed => $_getBF(0);
  @$pb.TagNumber(1)
  set indexed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexed() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexed() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class SmartContract_ABI_Entry extends $pb.GeneratedMessage {
  factory SmartContract_ABI_Entry({
    $core.bool? anonymous,
    $core.bool? constant,
    $core.String? name,
    $core.Iterable<SmartContract_ABI_Entry_Param>? inputs,
    $core.Iterable<SmartContract_ABI_Entry_Param>? outputs,
    SmartContract_ABI_Entry_EntryType? type,
    $core.bool? payable,
    SmartContract_ABI_Entry_StateMutabilityType? stateMutability,
  }) {
    final $result = create();
    if (anonymous != null) {
      $result.anonymous = anonymous;
    }
    if (constant != null) {
      $result.constant = constant;
    }
    if (name != null) {
      $result.name = name;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (type != null) {
      $result.type = type;
    }
    if (payable != null) {
      $result.payable = payable;
    }
    if (stateMutability != null) {
      $result.stateMutability = stateMutability;
    }
    return $result;
  }
  SmartContract_ABI_Entry._() : super();
  factory SmartContract_ABI_Entry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI_Entry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SmartContract.ABI.Entry', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'anonymous')
    ..aOB(2, _omitFieldNames ? '' : 'constant')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pc<SmartContract_ABI_Entry_Param>(4, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry_Param.create)
    ..pc<SmartContract_ABI_Entry_Param>(5, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry_Param.create)
    ..e<SmartContract_ABI_Entry_EntryType>(6, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SmartContract_ABI_Entry_EntryType.UnknownEntryType, valueOf: SmartContract_ABI_Entry_EntryType.valueOf, enumValues: SmartContract_ABI_Entry_EntryType.values)
    ..aOB(7, _omitFieldNames ? '' : 'payable')
    ..e<SmartContract_ABI_Entry_StateMutabilityType>(8, _omitFieldNames ? '' : 'stateMutability', $pb.PbFieldType.OE, protoName: 'stateMutability', defaultOrMaker: SmartContract_ABI_Entry_StateMutabilityType.UnknownMutabilityType, valueOf: SmartContract_ABI_Entry_StateMutabilityType.valueOf, enumValues: SmartContract_ABI_Entry_StateMutabilityType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartContract_ABI_Entry clone() => SmartContract_ABI_Entry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartContract_ABI_Entry copyWith(void Function(SmartContract_ABI_Entry) updates) => super.copyWith((message) => updates(message as SmartContract_ABI_Entry)) as SmartContract_ABI_Entry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry create() => SmartContract_ABI_Entry._();
  SmartContract_ABI_Entry createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI_Entry> createRepeated() => $pb.PbList<SmartContract_ABI_Entry>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI_Entry>(create);
  static SmartContract_ABI_Entry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get anonymous => $_getBF(0);
  @$pb.TagNumber(1)
  set anonymous($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnonymous() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnonymous() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get constant => $_getBF(1);
  @$pb.TagNumber(2)
  set constant($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConstant() => $_has(1);
  @$pb.TagNumber(2)
  void clearConstant() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SmartContract_ABI_Entry_Param> get inputs => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<SmartContract_ABI_Entry_Param> get outputs => $_getList(4);

  @$pb.TagNumber(6)
  SmartContract_ABI_Entry_EntryType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(SmartContract_ABI_Entry_EntryType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get payable => $_getBF(6);
  @$pb.TagNumber(7)
  set payable($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPayable() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayable() => clearField(7);

  @$pb.TagNumber(8)
  SmartContract_ABI_Entry_StateMutabilityType get stateMutability => $_getN(7);
  @$pb.TagNumber(8)
  set stateMutability(SmartContract_ABI_Entry_StateMutabilityType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStateMutability() => $_has(7);
  @$pb.TagNumber(8)
  void clearStateMutability() => clearField(8);
}

class SmartContract_ABI extends $pb.GeneratedMessage {
  factory SmartContract_ABI({
    $core.Iterable<SmartContract_ABI_Entry>? entrys,
  }) {
    final $result = create();
    if (entrys != null) {
      $result.entrys.addAll(entrys);
    }
    return $result;
  }
  SmartContract_ABI._() : super();
  factory SmartContract_ABI.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SmartContract.ABI', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..pc<SmartContract_ABI_Entry>(1, _omitFieldNames ? '' : 'entrys', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartContract_ABI clone() => SmartContract_ABI()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartContract_ABI copyWith(void Function(SmartContract_ABI) updates) => super.copyWith((message) => updates(message as SmartContract_ABI)) as SmartContract_ABI;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI create() => SmartContract_ABI._();
  SmartContract_ABI createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI> createRepeated() => $pb.PbList<SmartContract_ABI>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI>(create);
  static SmartContract_ABI? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SmartContract_ABI_Entry> get entrys => $_getList(0);
}

class SmartContract extends $pb.GeneratedMessage {
  factory SmartContract({
    $core.List<$core.int>? originAddress,
    $core.List<$core.int>? contractAddress,
    SmartContract_ABI? abi,
    $core.List<$core.int>? bytecode,
    $fixnum.Int64? callValue,
    $fixnum.Int64? consumeUserResourcePercent,
    $core.String? name,
    $fixnum.Int64? originEnergyLimit,
    $core.List<$core.int>? codeHash,
    $core.List<$core.int>? trxHash,
    $core.int? version,
  }) {
    final $result = create();
    if (originAddress != null) {
      $result.originAddress = originAddress;
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    if (abi != null) {
      $result.abi = abi;
    }
    if (bytecode != null) {
      $result.bytecode = bytecode;
    }
    if (callValue != null) {
      $result.callValue = callValue;
    }
    if (consumeUserResourcePercent != null) {
      $result.consumeUserResourcePercent = consumeUserResourcePercent;
    }
    if (name != null) {
      $result.name = name;
    }
    if (originEnergyLimit != null) {
      $result.originEnergyLimit = originEnergyLimit;
    }
    if (codeHash != null) {
      $result.codeHash = codeHash;
    }
    if (trxHash != null) {
      $result.trxHash = trxHash;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  SmartContract._() : super();
  factory SmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SmartContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'originAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..aOM<SmartContract_ABI>(3, _omitFieldNames ? '' : 'abi', subBuilder: SmartContract_ABI.create)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'bytecode', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'callValue')
    ..aInt64(6, _omitFieldNames ? '' : 'consumeUserResourcePercent')
    ..aOS(7, _omitFieldNames ? '' : 'name')
    ..aInt64(8, _omitFieldNames ? '' : 'originEnergyLimit')
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'codeHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'trxHash', $pb.PbFieldType.OY)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartContract clone() => SmartContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartContract copyWith(void Function(SmartContract) updates) => super.copyWith((message) => updates(message as SmartContract)) as SmartContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmartContract create() => SmartContract._();
  SmartContract createEmptyInstance() => create();
  static $pb.PbList<SmartContract> createRepeated() => $pb.PbList<SmartContract>();
  @$core.pragma('dart2js:noInline')
  static SmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract>(create);
  static SmartContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get originAddress => $_getN(0);
  @$pb.TagNumber(1)
  set originAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOriginAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  SmartContract_ABI get abi => $_getN(2);
  @$pb.TagNumber(3)
  set abi(SmartContract_ABI v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbi() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbi() => clearField(3);
  @$pb.TagNumber(3)
  SmartContract_ABI ensureAbi() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bytecode => $_getN(3);
  @$pb.TagNumber(4)
  set bytecode($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBytecode() => $_has(3);
  @$pb.TagNumber(4)
  void clearBytecode() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get callValue => $_getI64(4);
  @$pb.TagNumber(5)
  set callValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCallValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCallValue() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get consumeUserResourcePercent => $_getI64(5);
  @$pb.TagNumber(6)
  set consumeUserResourcePercent($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConsumeUserResourcePercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearConsumeUserResourcePercent() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get originEnergyLimit => $_getI64(7);
  @$pb.TagNumber(8)
  set originEnergyLimit($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOriginEnergyLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearOriginEnergyLimit() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get codeHash => $_getN(8);
  @$pb.TagNumber(9)
  set codeHash($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCodeHash() => $_has(8);
  @$pb.TagNumber(9)
  void clearCodeHash() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get trxHash => $_getN(9);
  @$pb.TagNumber(10)
  set trxHash($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTrxHash() => $_has(9);
  @$pb.TagNumber(10)
  void clearTrxHash() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get version => $_getIZ(10);
  @$pb.TagNumber(11)
  set version($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVersion() => $_has(10);
  @$pb.TagNumber(11)
  void clearVersion() => clearField(11);
}

class ContractState extends $pb.GeneratedMessage {
  factory ContractState({
    $fixnum.Int64? energyUsage,
    $fixnum.Int64? energyFactor,
    $fixnum.Int64? updateCycle,
  }) {
    final $result = create();
    if (energyUsage != null) {
      $result.energyUsage = energyUsage;
    }
    if (energyFactor != null) {
      $result.energyFactor = energyFactor;
    }
    if (updateCycle != null) {
      $result.updateCycle = updateCycle;
    }
    return $result;
  }
  ContractState._() : super();
  factory ContractState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContractState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContractState', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'energyUsage')
    ..aInt64(2, _omitFieldNames ? '' : 'energyFactor')
    ..aInt64(3, _omitFieldNames ? '' : 'updateCycle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContractState clone() => ContractState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContractState copyWith(void Function(ContractState) updates) => super.copyWith((message) => updates(message as ContractState)) as ContractState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractState create() => ContractState._();
  ContractState createEmptyInstance() => create();
  static $pb.PbList<ContractState> createRepeated() => $pb.PbList<ContractState>();
  @$core.pragma('dart2js:noInline')
  static ContractState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContractState>(create);
  static ContractState? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get energyUsage => $_getI64(0);
  @$pb.TagNumber(1)
  set energyUsage($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnergyUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnergyUsage() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energyFactor => $_getI64(1);
  @$pb.TagNumber(2)
  set energyFactor($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnergyFactor() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergyFactor() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updateCycle => $_getI64(2);
  @$pb.TagNumber(3)
  set updateCycle($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateCycle() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateCycle() => clearField(3);
}

class CreateSmartContract extends $pb.GeneratedMessage {
  factory CreateSmartContract({
    $core.List<$core.int>? ownerAddress,
    SmartContract? newContract,
    $fixnum.Int64? callTokenValue,
    $fixnum.Int64? tokenId,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (newContract != null) {
      $result.newContract = newContract;
    }
    if (callTokenValue != null) {
      $result.callTokenValue = callTokenValue;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    return $result;
  }
  CreateSmartContract._() : super();
  factory CreateSmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSmartContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aOM<SmartContract>(2, _omitFieldNames ? '' : 'newContract', subBuilder: SmartContract.create)
    ..aInt64(3, _omitFieldNames ? '' : 'callTokenValue')
    ..aInt64(4, _omitFieldNames ? '' : 'tokenId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSmartContract clone() => CreateSmartContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSmartContract copyWith(void Function(CreateSmartContract) updates) => super.copyWith((message) => updates(message as CreateSmartContract)) as CreateSmartContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSmartContract create() => CreateSmartContract._();
  CreateSmartContract createEmptyInstance() => create();
  static $pb.PbList<CreateSmartContract> createRepeated() => $pb.PbList<CreateSmartContract>();
  @$core.pragma('dart2js:noInline')
  static CreateSmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSmartContract>(create);
  static CreateSmartContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  SmartContract get newContract => $_getN(1);
  @$pb.TagNumber(2)
  set newContract(SmartContract v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewContract() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewContract() => clearField(2);
  @$pb.TagNumber(2)
  SmartContract ensureNewContract() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get callTokenValue => $_getI64(2);
  @$pb.TagNumber(3)
  set callTokenValue($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCallTokenValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallTokenValue() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get tokenId => $_getI64(3);
  @$pb.TagNumber(4)
  set tokenId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenId() => clearField(4);
}

class TriggerSmartContract extends $pb.GeneratedMessage {
  factory TriggerSmartContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? contractAddress,
    $fixnum.Int64? callValue,
    $core.List<$core.int>? data,
    $fixnum.Int64? callTokenValue,
    $fixnum.Int64? tokenId,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    if (callValue != null) {
      $result.callValue = callValue;
    }
    if (data != null) {
      $result.data = data;
    }
    if (callTokenValue != null) {
      $result.callTokenValue = callTokenValue;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    return $result;
  }
  TriggerSmartContract._() : super();
  factory TriggerSmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TriggerSmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TriggerSmartContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'callValue')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'callTokenValue')
    ..aInt64(6, _omitFieldNames ? '' : 'tokenId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TriggerSmartContract clone() => TriggerSmartContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TriggerSmartContract copyWith(void Function(TriggerSmartContract) updates) => super.copyWith((message) => updates(message as TriggerSmartContract)) as TriggerSmartContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract create() => TriggerSmartContract._();
  TriggerSmartContract createEmptyInstance() => create();
  static $pb.PbList<TriggerSmartContract> createRepeated() => $pb.PbList<TriggerSmartContract>();
  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TriggerSmartContract>(create);
  static TriggerSmartContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get callValue => $_getI64(2);
  @$pb.TagNumber(3)
  set callValue($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCallValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get callTokenValue => $_getI64(4);
  @$pb.TagNumber(5)
  set callTokenValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCallTokenValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCallTokenValue() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get tokenId => $_getI64(5);
  @$pb.TagNumber(6)
  set tokenId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTokenId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenId() => clearField(6);
}

class ClearABIContract extends $pb.GeneratedMessage {
  factory ClearABIContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? contractAddress,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    return $result;
  }
  ClearABIContract._() : super();
  factory ClearABIContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClearABIContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClearABIContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClearABIContract clone() => ClearABIContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClearABIContract copyWith(void Function(ClearABIContract) updates) => super.copyWith((message) => updates(message as ClearABIContract)) as ClearABIContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearABIContract create() => ClearABIContract._();
  ClearABIContract createEmptyInstance() => create();
  static $pb.PbList<ClearABIContract> createRepeated() => $pb.PbList<ClearABIContract>();
  @$core.pragma('dart2js:noInline')
  static ClearABIContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClearABIContract>(create);
  static ClearABIContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);
}

class UpdateSettingContract extends $pb.GeneratedMessage {
  factory UpdateSettingContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? contractAddress,
    $fixnum.Int64? consumeUserResourcePercent,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    if (consumeUserResourcePercent != null) {
      $result.consumeUserResourcePercent = consumeUserResourcePercent;
    }
    return $result;
  }
  UpdateSettingContract._() : super();
  factory UpdateSettingContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSettingContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSettingContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'consumeUserResourcePercent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSettingContract clone() => UpdateSettingContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSettingContract copyWith(void Function(UpdateSettingContract) updates) => super.copyWith((message) => updates(message as UpdateSettingContract)) as UpdateSettingContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSettingContract create() => UpdateSettingContract._();
  UpdateSettingContract createEmptyInstance() => create();
  static $pb.PbList<UpdateSettingContract> createRepeated() => $pb.PbList<UpdateSettingContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateSettingContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSettingContract>(create);
  static UpdateSettingContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get consumeUserResourcePercent => $_getI64(2);
  @$pb.TagNumber(3)
  set consumeUserResourcePercent($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConsumeUserResourcePercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearConsumeUserResourcePercent() => clearField(3);
}

class UpdateEnergyLimitContract extends $pb.GeneratedMessage {
  factory UpdateEnergyLimitContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? contractAddress,
    $fixnum.Int64? originEnergyLimit,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (contractAddress != null) {
      $result.contractAddress = contractAddress;
    }
    if (originEnergyLimit != null) {
      $result.originEnergyLimit = originEnergyLimit;
    }
    return $result;
  }
  UpdateEnergyLimitContract._() : super();
  factory UpdateEnergyLimitContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEnergyLimitContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEnergyLimitContract', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'originEnergyLimit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEnergyLimitContract clone() => UpdateEnergyLimitContract()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEnergyLimitContract copyWith(void Function(UpdateEnergyLimitContract) updates) => super.copyWith((message) => updates(message as UpdateEnergyLimitContract)) as UpdateEnergyLimitContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEnergyLimitContract create() => UpdateEnergyLimitContract._();
  UpdateEnergyLimitContract createEmptyInstance() => create();
  static $pb.PbList<UpdateEnergyLimitContract> createRepeated() => $pb.PbList<UpdateEnergyLimitContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateEnergyLimitContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEnergyLimitContract>(create);
  static UpdateEnergyLimitContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get originEnergyLimit => $_getI64(2);
  @$pb.TagNumber(3)
  set originEnergyLimit($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginEnergyLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginEnergyLimit() => clearField(3);
}

class SmartContractDataWrapper extends $pb.GeneratedMessage {
  factory SmartContractDataWrapper({
    SmartContract? smartContract,
    $core.List<$core.int>? runtimecode,
    ContractState? contractState,
  }) {
    final $result = create();
    if (smartContract != null) {
      $result.smartContract = smartContract;
    }
    if (runtimecode != null) {
      $result.runtimecode = runtimecode;
    }
    if (contractState != null) {
      $result.contractState = contractState;
    }
    return $result;
  }
  SmartContractDataWrapper._() : super();
  factory SmartContractDataWrapper.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContractDataWrapper.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SmartContractDataWrapper', package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'), createEmptyInstance: create)
    ..aOM<SmartContract>(1, _omitFieldNames ? '' : 'smartContract', subBuilder: SmartContract.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'runtimecode', $pb.PbFieldType.OY)
    ..aOM<ContractState>(3, _omitFieldNames ? '' : 'contractState', subBuilder: ContractState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartContractDataWrapper clone() => SmartContractDataWrapper()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartContractDataWrapper copyWith(void Function(SmartContractDataWrapper) updates) => super.copyWith((message) => updates(message as SmartContractDataWrapper)) as SmartContractDataWrapper;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmartContractDataWrapper create() => SmartContractDataWrapper._();
  SmartContractDataWrapper createEmptyInstance() => create();
  static $pb.PbList<SmartContractDataWrapper> createRepeated() => $pb.PbList<SmartContractDataWrapper>();
  @$core.pragma('dart2js:noInline')
  static SmartContractDataWrapper getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContractDataWrapper>(create);
  static SmartContractDataWrapper? _defaultInstance;

  @$pb.TagNumber(1)
  SmartContract get smartContract => $_getN(0);
  @$pb.TagNumber(1)
  set smartContract(SmartContract v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSmartContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearSmartContract() => clearField(1);
  @$pb.TagNumber(1)
  SmartContract ensureSmartContract() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get runtimecode => $_getN(1);
  @$pb.TagNumber(2)
  set runtimecode($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRuntimecode() => $_has(1);
  @$pb.TagNumber(2)
  void clearRuntimecode() => clearField(2);

  @$pb.TagNumber(3)
  ContractState get contractState => $_getN(2);
  @$pb.TagNumber(3)
  set contractState(ContractState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContractState() => $_has(2);
  @$pb.TagNumber(3)
  void clearContractState() => clearField(3);
  @$pb.TagNumber(3)
  ContractState ensureContractState() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
