//
//  Generated code. Do not modify.
//  source: core/Discover.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Endpoint extends $pb.GeneratedMessage {
  factory Endpoint({
    $core.List<$core.int>? address,
    $core.int? port,
    $core.List<$core.int>? nodeId,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (port != null) {
      $result.port = port;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    return $result;
  }
  Endpoint._() : super();
  factory Endpoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Endpoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Endpoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'nodeId', $pb.PbFieldType.OY,
        protoName: 'nodeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Endpoint clone() => Endpoint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Endpoint copyWith(void Function(Endpoint) updates) =>
      super.copyWith((message) => updates(message as Endpoint)) as Endpoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Endpoint create() => Endpoint._();
  Endpoint createEmptyInstance() => create();
  static $pb.PbList<Endpoint> createRepeated() => $pb.PbList<Endpoint>();
  @$core.pragma('dart2js:noInline')
  static Endpoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Endpoint>(create);
  static Endpoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.List<$core.int> get nodeId => $_getN(2);
  @$pb.TagNumber(3)
  set nodeId($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNodeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeId() => clearField(3);
}

class PingMessage extends $pb.GeneratedMessage {
  factory PingMessage({
    Endpoint? from,
    Endpoint? to,
    $core.int? version,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (version != null) {
      $result.version = version;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  PingMessage._() : super();
  factory PingMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PingMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from', subBuilder: Endpoint.create)
    ..aOM<Endpoint>(2, _omitFieldNames ? '' : 'to', subBuilder: Endpoint.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aInt64(4, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PingMessage clone() => PingMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PingMessage copyWith(void Function(PingMessage) updates) =>
      super.copyWith((message) => updates(message as PingMessage)) as PingMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingMessage create() => PingMessage._();
  PingMessage createEmptyInstance() => create();
  static $pb.PbList<PingMessage> createRepeated() => $pb.PbList<PingMessage>();
  @$core.pragma('dart2js:noInline')
  static PingMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingMessage>(create);
  static PingMessage? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  Endpoint get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(Endpoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  Endpoint ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
}

class PongMessage extends $pb.GeneratedMessage {
  factory PongMessage({
    Endpoint? from,
    $core.int? echo,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (echo != null) {
      $result.echo = echo;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  PongMessage._() : super();
  factory PongMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PongMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PongMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from', subBuilder: Endpoint.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'echo', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PongMessage clone() => PongMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PongMessage copyWith(void Function(PongMessage) updates) =>
      super.copyWith((message) => updates(message as PongMessage)) as PongMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PongMessage create() => PongMessage._();
  PongMessage createEmptyInstance() => create();
  static $pb.PbList<PongMessage> createRepeated() => $pb.PbList<PongMessage>();
  @$core.pragma('dart2js:noInline')
  static PongMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PongMessage>(create);
  static PongMessage? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get echo => $_getIZ(1);
  @$pb.TagNumber(2)
  set echo($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEcho() => $_has(1);
  @$pb.TagNumber(2)
  void clearEcho() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class FindNeighbours extends $pb.GeneratedMessage {
  factory FindNeighbours({
    Endpoint? from,
    $core.List<$core.int>? targetId,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (targetId != null) {
      $result.targetId = targetId;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  FindNeighbours._() : super();
  factory FindNeighbours.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FindNeighbours.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindNeighbours',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from', subBuilder: Endpoint.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'targetId', $pb.PbFieldType.OY,
        protoName: 'targetId')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FindNeighbours clone() => FindNeighbours()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FindNeighbours copyWith(void Function(FindNeighbours) updates) =>
      super.copyWith((message) => updates(message as FindNeighbours)) as FindNeighbours;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindNeighbours create() => FindNeighbours._();
  FindNeighbours createEmptyInstance() => create();
  static $pb.PbList<FindNeighbours> createRepeated() => $pb.PbList<FindNeighbours>();
  @$core.pragma('dart2js:noInline')
  static FindNeighbours getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindNeighbours>(create);
  static FindNeighbours? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get targetId => $_getN(1);
  @$pb.TagNumber(2)
  set targetId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class Neighbours extends $pb.GeneratedMessage {
  factory Neighbours({
    Endpoint? from,
    $core.Iterable<Endpoint>? neighbours,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (neighbours != null) {
      $result.neighbours.addAll(neighbours);
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  Neighbours._() : super();
  factory Neighbours.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Neighbours.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Neighbours',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOM<Endpoint>(1, _omitFieldNames ? '' : 'from', subBuilder: Endpoint.create)
    ..pc<Endpoint>(2, _omitFieldNames ? '' : 'neighbours', $pb.PbFieldType.PM,
        subBuilder: Endpoint.create)
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Neighbours clone() => Neighbours()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Neighbours copyWith(void Function(Neighbours) updates) =>
      super.copyWith((message) => updates(message as Neighbours)) as Neighbours;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Neighbours create() => Neighbours._();
  Neighbours createEmptyInstance() => create();
  static $pb.PbList<Neighbours> createRepeated() => $pb.PbList<Neighbours>();
  @$core.pragma('dart2js:noInline')
  static Neighbours getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Neighbours>(create);
  static Neighbours? _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Endpoint> get neighbours => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class BackupMessage extends $pb.GeneratedMessage {
  factory BackupMessage({
    $core.bool? flag,
    $core.int? priority,
  }) {
    final $result = create();
    if (flag != null) {
      $result.flag = flag;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    return $result;
  }
  BackupMessage._() : super();
  factory BackupMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BackupMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BackupMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'flag')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BackupMessage clone() => BackupMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BackupMessage copyWith(void Function(BackupMessage) updates) =>
      super.copyWith((message) => updates(message as BackupMessage)) as BackupMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackupMessage create() => BackupMessage._();
  BackupMessage createEmptyInstance() => create();
  static $pb.PbList<BackupMessage> createRepeated() => $pb.PbList<BackupMessage>();
  @$core.pragma('dart2js:noInline')
  static BackupMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackupMessage>(create);
  static BackupMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get flag => $_getBF(0);
  @$pb.TagNumber(1)
  set flag($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFlag() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlag() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get priority => $_getIZ(1);
  @$pb.TagNumber(2)
  set priority($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPriority() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriority() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
