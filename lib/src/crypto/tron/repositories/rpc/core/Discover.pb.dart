// This is a generated file - do not edit.
//
// Generated from core/Discover.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Endpoint extends $pb.GeneratedMessage {
  factory Endpoint({
    $core.List<$core.int>? address,
    $core.int? port,
    $core.List<$core.int>? nodeId,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (port != null) result.port = port;
    if (nodeId != null) result.nodeId = nodeId;
    return result;
  }

  Endpoint._();

  factory Endpoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Endpoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Endpoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'port')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'nodeId', $pb.PbFieldType.OY,
        protoName: 'nodeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Endpoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Endpoint copyWith(void Function(Endpoint) updates) =>
      super.copyWith((message) => updates(message as Endpoint)) as Endpoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Endpoint create() => Endpoint._();
  @$core.override
  Endpoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Endpoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Endpoint>(create);
  static Endpoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nodeId => $_getN(2);
  @$pb.TagNumber(3)
  set nodeId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNodeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeId() => $_clearField(3);
}

class PingMessage extends $pb.GeneratedMessage {
  factory PingMessage({
    Endpoint? from,
    Endpoint? to,
    $core.int? version,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (version != null) result.version = version;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  PingMessage._();

  factory PingMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PingMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PingMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from',
        subBuilder: Endpoint.create)
    ..aOM<Endpoint>(2, _omitFieldNames ? '' : 'to', subBuilder: Endpoint.create)
    ..aI(3, _omitFieldNames ? '' : 'version')
    ..aInt64(4, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PingMessage copyWith(void Function(PingMessage) updates) =>
      super.copyWith((message) => updates(message as PingMessage))
          as PingMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingMessage create() => PingMessage._();
  @$core.override
  PingMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PingMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PingMessage>(create);
  static PingMessage? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  Endpoint get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(Endpoint value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);
  @$pb.TagNumber(2)
  Endpoint ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
}

class PongMessage extends $pb.GeneratedMessage {
  factory PongMessage({
    Endpoint? from,
    $core.int? echo,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (echo != null) result.echo = echo;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  PongMessage._();

  factory PongMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PongMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PongMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from',
        subBuilder: Endpoint.create)
    ..aI(2, _omitFieldNames ? '' : 'echo')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PongMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PongMessage copyWith(void Function(PongMessage) updates) =>
      super.copyWith((message) => updates(message as PongMessage))
          as PongMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PongMessage create() => PongMessage._();
  @$core.override
  PongMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PongMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PongMessage>(create);
  static PongMessage? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get echo => $_getIZ(1);
  @$pb.TagNumber(2)
  set echo($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEcho() => $_has(1);
  @$pb.TagNumber(2)
  void clearEcho() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

class FindNeighbours extends $pb.GeneratedMessage {
  factory FindNeighbours({
    Endpoint? from,
    $core.List<$core.int>? targetId,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (targetId != null) result.targetId = targetId;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  FindNeighbours._();

  factory FindNeighbours.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindNeighbours.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindNeighbours',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from',
        subBuilder: Endpoint.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'targetId', $pb.PbFieldType.OY,
        protoName: 'targetId')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindNeighbours clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindNeighbours copyWith(void Function(FindNeighbours) updates) =>
      super.copyWith((message) => updates(message as FindNeighbours))
          as FindNeighbours;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindNeighbours create() => FindNeighbours._();
  @$core.override
  FindNeighbours createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FindNeighbours getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindNeighbours>(create);
  static FindNeighbours? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get targetId => $_getN(1);
  @$pb.TagNumber(2)
  set targetId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

class Neighbours extends $pb.GeneratedMessage {
  factory Neighbours({
    Endpoint? from,
    $core.Iterable<Endpoint>? neighbours,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (neighbours != null) result.neighbours.addAll(neighbours);
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  Neighbours._();

  factory Neighbours.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Neighbours.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Neighbours',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from',
        subBuilder: Endpoint.create)
    ..pPM<Endpoint>(2, _omitFieldNames ? '' : 'neighbours',
        subBuilder: Endpoint.create)
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Neighbours clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Neighbours copyWith(void Function(Neighbours) updates) =>
      super.copyWith((message) => updates(message as Neighbours)) as Neighbours;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Neighbours create() => Neighbours._();
  @$core.override
  Neighbours createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Neighbours getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Neighbours>(create);
  static Neighbours? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Endpoint> get neighbours => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

class BackupMessage extends $pb.GeneratedMessage {
  factory BackupMessage({
    $core.bool? flag,
    $core.int? priority,
  }) {
    final result = create();
    if (flag != null) result.flag = flag;
    if (priority != null) result.priority = priority;
    return result;
  }

  BackupMessage._();

  factory BackupMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BackupMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BackupMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'flag')
    ..aI(2, _omitFieldNames ? '' : 'priority')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackupMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackupMessage copyWith(void Function(BackupMessage) updates) =>
      super.copyWith((message) => updates(message as BackupMessage))
          as BackupMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackupMessage create() => BackupMessage._();
  @$core.override
  BackupMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BackupMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BackupMessage>(create);
  static BackupMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get flag => $_getBF(0);
  @$pb.TagNumber(1)
  set flag($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFlag() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlag() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get priority => $_getIZ(1);
  @$pb.TagNumber(2)
  set priority($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPriority() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriority() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
