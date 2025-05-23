//
//  Generated code. Do not modify.
//  source: core/contract/exchange_contract.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ExchangeCreateContract extends $pb.GeneratedMessage {
  factory ExchangeCreateContract({
    $core.List<$core.int>? ownerAddress,
    $core.List<$core.int>? firstTokenId,
    $fixnum.Int64? firstTokenBalance,
    $core.List<$core.int>? secondTokenId,
    $fixnum.Int64? secondTokenBalance,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
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
  ExchangeCreateContract._() : super();
  factory ExchangeCreateContract.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExchangeCreateContract.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeCreateContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'firstTokenId', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'firstTokenBalance')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'secondTokenId', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'secondTokenBalance')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExchangeCreateContract clone() => ExchangeCreateContract()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExchangeCreateContract copyWith(void Function(ExchangeCreateContract) updates) =>
      super.copyWith((message) => updates(message as ExchangeCreateContract))
          as ExchangeCreateContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeCreateContract create() => ExchangeCreateContract._();
  ExchangeCreateContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeCreateContract> createRepeated() =>
      $pb.PbList<ExchangeCreateContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeCreateContract getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeCreateContract>(create);
  static ExchangeCreateContract? _defaultInstance;

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
  $core.List<$core.int> get firstTokenId => $_getN(1);
  @$pb.TagNumber(2)
  set firstTokenId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFirstTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstTokenId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get firstTokenBalance => $_getI64(2);
  @$pb.TagNumber(3)
  set firstTokenBalance($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFirstTokenBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstTokenBalance() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get secondTokenId => $_getN(3);
  @$pb.TagNumber(4)
  set secondTokenId($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSecondTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondTokenId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get secondTokenBalance => $_getI64(4);
  @$pb.TagNumber(5)
  set secondTokenBalance($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSecondTokenBalance() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecondTokenBalance() => clearField(5);
}

class ExchangeInjectContract extends $pb.GeneratedMessage {
  factory ExchangeInjectContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? exchangeId,
    $core.List<$core.int>? tokenId,
    $fixnum.Int64? quant,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    if (quant != null) {
      $result.quant = quant;
    }
    return $result;
  }
  ExchangeInjectContract._() : super();
  factory ExchangeInjectContract.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExchangeInjectContract.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeInjectContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'exchangeId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'quant')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExchangeInjectContract clone() => ExchangeInjectContract()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExchangeInjectContract copyWith(void Function(ExchangeInjectContract) updates) =>
      super.copyWith((message) => updates(message as ExchangeInjectContract))
          as ExchangeInjectContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeInjectContract create() => ExchangeInjectContract._();
  ExchangeInjectContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeInjectContract> createRepeated() =>
      $pb.PbList<ExchangeInjectContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeInjectContract getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeInjectContract>(create);
  static ExchangeInjectContract? _defaultInstance;

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
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);
}

class ExchangeWithdrawContract extends $pb.GeneratedMessage {
  factory ExchangeWithdrawContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? exchangeId,
    $core.List<$core.int>? tokenId,
    $fixnum.Int64? quant,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    if (quant != null) {
      $result.quant = quant;
    }
    return $result;
  }
  ExchangeWithdrawContract._() : super();
  factory ExchangeWithdrawContract.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExchangeWithdrawContract.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeWithdrawContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'exchangeId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'quant')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExchangeWithdrawContract clone() => ExchangeWithdrawContract()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExchangeWithdrawContract copyWith(void Function(ExchangeWithdrawContract) updates) =>
      super.copyWith((message) => updates(message as ExchangeWithdrawContract))
          as ExchangeWithdrawContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeWithdrawContract create() => ExchangeWithdrawContract._();
  ExchangeWithdrawContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeWithdrawContract> createRepeated() =>
      $pb.PbList<ExchangeWithdrawContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeWithdrawContract getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeWithdrawContract>(create);
  static ExchangeWithdrawContract? _defaultInstance;

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
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);
}

class ExchangeTransactionContract extends $pb.GeneratedMessage {
  factory ExchangeTransactionContract({
    $core.List<$core.int>? ownerAddress,
    $fixnum.Int64? exchangeId,
    $core.List<$core.int>? tokenId,
    $fixnum.Int64? quant,
    $fixnum.Int64? expected,
  }) {
    final $result = create();
    if (ownerAddress != null) {
      $result.ownerAddress = ownerAddress;
    }
    if (exchangeId != null) {
      $result.exchangeId = exchangeId;
    }
    if (tokenId != null) {
      $result.tokenId = tokenId;
    }
    if (quant != null) {
      $result.quant = quant;
    }
    if (expected != null) {
      $result.expected = expected;
    }
    return $result;
  }
  ExchangeTransactionContract._() : super();
  factory ExchangeTransactionContract.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExchangeTransactionContract.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeTransactionContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protocol'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'exchangeId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'quant')
    ..aInt64(5, _omitFieldNames ? '' : 'expected')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExchangeTransactionContract clone() => ExchangeTransactionContract()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExchangeTransactionContract copyWith(void Function(ExchangeTransactionContract) updates) =>
      super.copyWith((message) => updates(message as ExchangeTransactionContract))
          as ExchangeTransactionContract;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeTransactionContract create() => ExchangeTransactionContract._();
  ExchangeTransactionContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeTransactionContract> createRepeated() =>
      $pb.PbList<ExchangeTransactionContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeTransactionContract getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeTransactionContract>(create);
  static ExchangeTransactionContract? _defaultInstance;

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
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expected => $_getI64(4);
  @$pb.TagNumber(5)
  set expected($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpected() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpected() => clearField(5);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
