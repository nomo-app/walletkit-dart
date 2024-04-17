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

import 'package:protobuf/protobuf.dart' as $pb;

class AccountType extends $pb.ProtobufEnum {
  static const AccountType Normal = AccountType._(0, _omitEnumNames ? '' : 'Normal');
  static const AccountType AssetIssue = AccountType._(1, _omitEnumNames ? '' : 'AssetIssue');
  static const AccountType Contract = AccountType._(2, _omitEnumNames ? '' : 'Contract');

  static const $core.List<AccountType> values = <AccountType> [
    Normal,
    AssetIssue,
    Contract,
  ];

  static final $core.Map<$core.int, AccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountType? valueOf($core.int value) => _byValue[value];

  const AccountType._($core.int v, $core.String n) : super(v, n);
}

class ReasonCode extends $pb.ProtobufEnum {
  static const ReasonCode REQUESTED = ReasonCode._(0, _omitEnumNames ? '' : 'REQUESTED');
  static const ReasonCode BAD_PROTOCOL = ReasonCode._(2, _omitEnumNames ? '' : 'BAD_PROTOCOL');
  static const ReasonCode TOO_MANY_PEERS = ReasonCode._(4, _omitEnumNames ? '' : 'TOO_MANY_PEERS');
  static const ReasonCode DUPLICATE_PEER = ReasonCode._(5, _omitEnumNames ? '' : 'DUPLICATE_PEER');
  static const ReasonCode INCOMPATIBLE_PROTOCOL = ReasonCode._(6, _omitEnumNames ? '' : 'INCOMPATIBLE_PROTOCOL');
  static const ReasonCode RANDOM_ELIMINATION = ReasonCode._(7, _omitEnumNames ? '' : 'RANDOM_ELIMINATION');
  static const ReasonCode PEER_QUITING = ReasonCode._(8, _omitEnumNames ? '' : 'PEER_QUITING');
  static const ReasonCode UNEXPECTED_IDENTITY = ReasonCode._(9, _omitEnumNames ? '' : 'UNEXPECTED_IDENTITY');
  static const ReasonCode LOCAL_IDENTITY = ReasonCode._(10, _omitEnumNames ? '' : 'LOCAL_IDENTITY');
  static const ReasonCode PING_TIMEOUT = ReasonCode._(11, _omitEnumNames ? '' : 'PING_TIMEOUT');
  static const ReasonCode USER_REASON = ReasonCode._(16, _omitEnumNames ? '' : 'USER_REASON');
  static const ReasonCode RESET = ReasonCode._(17, _omitEnumNames ? '' : 'RESET');
  static const ReasonCode SYNC_FAIL = ReasonCode._(18, _omitEnumNames ? '' : 'SYNC_FAIL');
  static const ReasonCode FETCH_FAIL = ReasonCode._(19, _omitEnumNames ? '' : 'FETCH_FAIL');
  static const ReasonCode BAD_TX = ReasonCode._(20, _omitEnumNames ? '' : 'BAD_TX');
  static const ReasonCode BAD_BLOCK = ReasonCode._(21, _omitEnumNames ? '' : 'BAD_BLOCK');
  static const ReasonCode FORKED = ReasonCode._(22, _omitEnumNames ? '' : 'FORKED');
  static const ReasonCode UNLINKABLE = ReasonCode._(23, _omitEnumNames ? '' : 'UNLINKABLE');
  static const ReasonCode INCOMPATIBLE_VERSION = ReasonCode._(24, _omitEnumNames ? '' : 'INCOMPATIBLE_VERSION');
  static const ReasonCode INCOMPATIBLE_CHAIN = ReasonCode._(25, _omitEnumNames ? '' : 'INCOMPATIBLE_CHAIN');
  static const ReasonCode TIME_OUT = ReasonCode._(32, _omitEnumNames ? '' : 'TIME_OUT');
  static const ReasonCode CONNECT_FAIL = ReasonCode._(33, _omitEnumNames ? '' : 'CONNECT_FAIL');
  static const ReasonCode TOO_MANY_PEERS_WITH_SAME_IP = ReasonCode._(34, _omitEnumNames ? '' : 'TOO_MANY_PEERS_WITH_SAME_IP');
  static const ReasonCode LIGHT_NODE_SYNC_FAIL = ReasonCode._(35, _omitEnumNames ? '' : 'LIGHT_NODE_SYNC_FAIL');
  static const ReasonCode BELOW_THAN_ME = ReasonCode._(36, _omitEnumNames ? '' : 'BELOW_THAN_ME');
  static const ReasonCode NOT_WITNESS = ReasonCode._(37, _omitEnumNames ? '' : 'NOT_WITNESS');
  static const ReasonCode NO_SUCH_MESSAGE = ReasonCode._(38, _omitEnumNames ? '' : 'NO_SUCH_MESSAGE');
  static const ReasonCode UNKNOWN = ReasonCode._(255, _omitEnumNames ? '' : 'UNKNOWN');

  static const $core.List<ReasonCode> values = <ReasonCode> [
    REQUESTED,
    BAD_PROTOCOL,
    TOO_MANY_PEERS,
    DUPLICATE_PEER,
    INCOMPATIBLE_PROTOCOL,
    RANDOM_ELIMINATION,
    PEER_QUITING,
    UNEXPECTED_IDENTITY,
    LOCAL_IDENTITY,
    PING_TIMEOUT,
    USER_REASON,
    RESET,
    SYNC_FAIL,
    FETCH_FAIL,
    BAD_TX,
    BAD_BLOCK,
    FORKED,
    UNLINKABLE,
    INCOMPATIBLE_VERSION,
    INCOMPATIBLE_CHAIN,
    TIME_OUT,
    CONNECT_FAIL,
    TOO_MANY_PEERS_WITH_SAME_IP,
    LIGHT_NODE_SYNC_FAIL,
    BELOW_THAN_ME,
    NOT_WITNESS,
    NO_SUCH_MESSAGE,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, ReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReasonCode? valueOf($core.int value) => _byValue[value];

  const ReasonCode._($core.int v, $core.String n) : super(v, n);
}

class Proposal_State extends $pb.ProtobufEnum {
  static const Proposal_State PENDING = Proposal_State._(0, _omitEnumNames ? '' : 'PENDING');
  static const Proposal_State DISAPPROVED = Proposal_State._(1, _omitEnumNames ? '' : 'DISAPPROVED');
  static const Proposal_State APPROVED = Proposal_State._(2, _omitEnumNames ? '' : 'APPROVED');
  static const Proposal_State CANCELED = Proposal_State._(3, _omitEnumNames ? '' : 'CANCELED');

  static const $core.List<Proposal_State> values = <Proposal_State> [
    PENDING,
    DISAPPROVED,
    APPROVED,
    CANCELED,
  ];

  static final $core.Map<$core.int, Proposal_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Proposal_State? valueOf($core.int value) => _byValue[value];

  const Proposal_State._($core.int v, $core.String n) : super(v, n);
}

class MarketOrder_State extends $pb.ProtobufEnum {
  static const MarketOrder_State ACTIVE = MarketOrder_State._(0, _omitEnumNames ? '' : 'ACTIVE');
  static const MarketOrder_State INACTIVE = MarketOrder_State._(1, _omitEnumNames ? '' : 'INACTIVE');
  static const MarketOrder_State CANCELED = MarketOrder_State._(2, _omitEnumNames ? '' : 'CANCELED');

  static const $core.List<MarketOrder_State> values = <MarketOrder_State> [
    ACTIVE,
    INACTIVE,
    CANCELED,
  ];

  static final $core.Map<$core.int, MarketOrder_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MarketOrder_State? valueOf($core.int value) => _byValue[value];

  const MarketOrder_State._($core.int v, $core.String n) : super(v, n);
}

class Permission_PermissionType extends $pb.ProtobufEnum {
  static const Permission_PermissionType Owner = Permission_PermissionType._(0, _omitEnumNames ? '' : 'Owner');
  static const Permission_PermissionType Witness = Permission_PermissionType._(1, _omitEnumNames ? '' : 'Witness');
  static const Permission_PermissionType Active = Permission_PermissionType._(2, _omitEnumNames ? '' : 'Active');

  static const $core.List<Permission_PermissionType> values = <Permission_PermissionType> [
    Owner,
    Witness,
    Active,
  ];

  static final $core.Map<$core.int, Permission_PermissionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Permission_PermissionType? valueOf($core.int value) => _byValue[value];

  const Permission_PermissionType._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Contract_ContractType extends $pb.ProtobufEnum {
  static const Transaction_Contract_ContractType AccountCreateContract = Transaction_Contract_ContractType._(0, _omitEnumNames ? '' : 'AccountCreateContract');
  static const Transaction_Contract_ContractType TransferContract = Transaction_Contract_ContractType._(1, _omitEnumNames ? '' : 'TransferContract');
  static const Transaction_Contract_ContractType TransferAssetContract = Transaction_Contract_ContractType._(2, _omitEnumNames ? '' : 'TransferAssetContract');
  static const Transaction_Contract_ContractType VoteAssetContract = Transaction_Contract_ContractType._(3, _omitEnumNames ? '' : 'VoteAssetContract');
  static const Transaction_Contract_ContractType VoteWitnessContract = Transaction_Contract_ContractType._(4, _omitEnumNames ? '' : 'VoteWitnessContract');
  static const Transaction_Contract_ContractType WitnessCreateContract = Transaction_Contract_ContractType._(5, _omitEnumNames ? '' : 'WitnessCreateContract');
  static const Transaction_Contract_ContractType AssetIssueContract = Transaction_Contract_ContractType._(6, _omitEnumNames ? '' : 'AssetIssueContract');
  static const Transaction_Contract_ContractType WitnessUpdateContract = Transaction_Contract_ContractType._(8, _omitEnumNames ? '' : 'WitnessUpdateContract');
  static const Transaction_Contract_ContractType ParticipateAssetIssueContract = Transaction_Contract_ContractType._(9, _omitEnumNames ? '' : 'ParticipateAssetIssueContract');
  static const Transaction_Contract_ContractType AccountUpdateContract = Transaction_Contract_ContractType._(10, _omitEnumNames ? '' : 'AccountUpdateContract');
  static const Transaction_Contract_ContractType FreezeBalanceContract = Transaction_Contract_ContractType._(11, _omitEnumNames ? '' : 'FreezeBalanceContract');
  static const Transaction_Contract_ContractType UnfreezeBalanceContract = Transaction_Contract_ContractType._(12, _omitEnumNames ? '' : 'UnfreezeBalanceContract');
  static const Transaction_Contract_ContractType WithdrawBalanceContract = Transaction_Contract_ContractType._(13, _omitEnumNames ? '' : 'WithdrawBalanceContract');
  static const Transaction_Contract_ContractType UnfreezeAssetContract = Transaction_Contract_ContractType._(14, _omitEnumNames ? '' : 'UnfreezeAssetContract');
  static const Transaction_Contract_ContractType UpdateAssetContract = Transaction_Contract_ContractType._(15, _omitEnumNames ? '' : 'UpdateAssetContract');
  static const Transaction_Contract_ContractType ProposalCreateContract = Transaction_Contract_ContractType._(16, _omitEnumNames ? '' : 'ProposalCreateContract');
  static const Transaction_Contract_ContractType ProposalApproveContract = Transaction_Contract_ContractType._(17, _omitEnumNames ? '' : 'ProposalApproveContract');
  static const Transaction_Contract_ContractType ProposalDeleteContract = Transaction_Contract_ContractType._(18, _omitEnumNames ? '' : 'ProposalDeleteContract');
  static const Transaction_Contract_ContractType SetAccountIdContract = Transaction_Contract_ContractType._(19, _omitEnumNames ? '' : 'SetAccountIdContract');
  static const Transaction_Contract_ContractType CustomContract = Transaction_Contract_ContractType._(20, _omitEnumNames ? '' : 'CustomContract');
  static const Transaction_Contract_ContractType CreateSmartContract = Transaction_Contract_ContractType._(30, _omitEnumNames ? '' : 'CreateSmartContract');
  static const Transaction_Contract_ContractType TriggerSmartContract = Transaction_Contract_ContractType._(31, _omitEnumNames ? '' : 'TriggerSmartContract');
  static const Transaction_Contract_ContractType GetContract = Transaction_Contract_ContractType._(32, _omitEnumNames ? '' : 'GetContract');
  static const Transaction_Contract_ContractType UpdateSettingContract = Transaction_Contract_ContractType._(33, _omitEnumNames ? '' : 'UpdateSettingContract');
  static const Transaction_Contract_ContractType ExchangeCreateContract = Transaction_Contract_ContractType._(41, _omitEnumNames ? '' : 'ExchangeCreateContract');
  static const Transaction_Contract_ContractType ExchangeInjectContract = Transaction_Contract_ContractType._(42, _omitEnumNames ? '' : 'ExchangeInjectContract');
  static const Transaction_Contract_ContractType ExchangeWithdrawContract = Transaction_Contract_ContractType._(43, _omitEnumNames ? '' : 'ExchangeWithdrawContract');
  static const Transaction_Contract_ContractType ExchangeTransactionContract = Transaction_Contract_ContractType._(44, _omitEnumNames ? '' : 'ExchangeTransactionContract');
  static const Transaction_Contract_ContractType UpdateEnergyLimitContract = Transaction_Contract_ContractType._(45, _omitEnumNames ? '' : 'UpdateEnergyLimitContract');
  static const Transaction_Contract_ContractType AccountPermissionUpdateContract = Transaction_Contract_ContractType._(46, _omitEnumNames ? '' : 'AccountPermissionUpdateContract');
  static const Transaction_Contract_ContractType ClearABIContract = Transaction_Contract_ContractType._(48, _omitEnumNames ? '' : 'ClearABIContract');
  static const Transaction_Contract_ContractType UpdateBrokerageContract = Transaction_Contract_ContractType._(49, _omitEnumNames ? '' : 'UpdateBrokerageContract');
  static const Transaction_Contract_ContractType ShieldedTransferContract = Transaction_Contract_ContractType._(51, _omitEnumNames ? '' : 'ShieldedTransferContract');
  static const Transaction_Contract_ContractType MarketSellAssetContract = Transaction_Contract_ContractType._(52, _omitEnumNames ? '' : 'MarketSellAssetContract');
  static const Transaction_Contract_ContractType MarketCancelOrderContract = Transaction_Contract_ContractType._(53, _omitEnumNames ? '' : 'MarketCancelOrderContract');
  static const Transaction_Contract_ContractType FreezeBalanceV2Contract = Transaction_Contract_ContractType._(54, _omitEnumNames ? '' : 'FreezeBalanceV2Contract');
  static const Transaction_Contract_ContractType UnfreezeBalanceV2Contract = Transaction_Contract_ContractType._(55, _omitEnumNames ? '' : 'UnfreezeBalanceV2Contract');
  static const Transaction_Contract_ContractType WithdrawExpireUnfreezeContract = Transaction_Contract_ContractType._(56, _omitEnumNames ? '' : 'WithdrawExpireUnfreezeContract');
  static const Transaction_Contract_ContractType DelegateResourceContract = Transaction_Contract_ContractType._(57, _omitEnumNames ? '' : 'DelegateResourceContract');
  static const Transaction_Contract_ContractType UnDelegateResourceContract = Transaction_Contract_ContractType._(58, _omitEnumNames ? '' : 'UnDelegateResourceContract');
  static const Transaction_Contract_ContractType CancelAllUnfreezeV2Contract = Transaction_Contract_ContractType._(59, _omitEnumNames ? '' : 'CancelAllUnfreezeV2Contract');

  static const $core.List<Transaction_Contract_ContractType> values = <Transaction_Contract_ContractType> [
    AccountCreateContract,
    TransferContract,
    TransferAssetContract,
    VoteAssetContract,
    VoteWitnessContract,
    WitnessCreateContract,
    AssetIssueContract,
    WitnessUpdateContract,
    ParticipateAssetIssueContract,
    AccountUpdateContract,
    FreezeBalanceContract,
    UnfreezeBalanceContract,
    WithdrawBalanceContract,
    UnfreezeAssetContract,
    UpdateAssetContract,
    ProposalCreateContract,
    ProposalApproveContract,
    ProposalDeleteContract,
    SetAccountIdContract,
    CustomContract,
    CreateSmartContract,
    TriggerSmartContract,
    GetContract,
    UpdateSettingContract,
    ExchangeCreateContract,
    ExchangeInjectContract,
    ExchangeWithdrawContract,
    ExchangeTransactionContract,
    UpdateEnergyLimitContract,
    AccountPermissionUpdateContract,
    ClearABIContract,
    UpdateBrokerageContract,
    ShieldedTransferContract,
    MarketSellAssetContract,
    MarketCancelOrderContract,
    FreezeBalanceV2Contract,
    UnfreezeBalanceV2Contract,
    WithdrawExpireUnfreezeContract,
    DelegateResourceContract,
    UnDelegateResourceContract,
    CancelAllUnfreezeV2Contract,
  ];

  static final $core.Map<$core.int, Transaction_Contract_ContractType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Contract_ContractType? valueOf($core.int value) => _byValue[value];

  const Transaction_Contract_ContractType._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Result_code extends $pb.ProtobufEnum {
  static const Transaction_Result_code SUCESS = Transaction_Result_code._(0, _omitEnumNames ? '' : 'SUCESS');
  static const Transaction_Result_code FAILED = Transaction_Result_code._(1, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<Transaction_Result_code> values = <Transaction_Result_code> [
    SUCESS,
    FAILED,
  ];

  static final $core.Map<$core.int, Transaction_Result_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Result_code? valueOf($core.int value) => _byValue[value];

  const Transaction_Result_code._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Result_contractResult extends $pb.ProtobufEnum {
  static const Transaction_Result_contractResult DEFAULT = Transaction_Result_contractResult._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const Transaction_Result_contractResult SUCCESS = Transaction_Result_contractResult._(1, _omitEnumNames ? '' : 'SUCCESS');
  static const Transaction_Result_contractResult REVERT = Transaction_Result_contractResult._(2, _omitEnumNames ? '' : 'REVERT');
  static const Transaction_Result_contractResult BAD_JUMP_DESTINATION = Transaction_Result_contractResult._(3, _omitEnumNames ? '' : 'BAD_JUMP_DESTINATION');
  static const Transaction_Result_contractResult OUT_OF_MEMORY = Transaction_Result_contractResult._(4, _omitEnumNames ? '' : 'OUT_OF_MEMORY');
  static const Transaction_Result_contractResult PRECOMPILED_CONTRACT = Transaction_Result_contractResult._(5, _omitEnumNames ? '' : 'PRECOMPILED_CONTRACT');
  static const Transaction_Result_contractResult STACK_TOO_SMALL = Transaction_Result_contractResult._(6, _omitEnumNames ? '' : 'STACK_TOO_SMALL');
  static const Transaction_Result_contractResult STACK_TOO_LARGE = Transaction_Result_contractResult._(7, _omitEnumNames ? '' : 'STACK_TOO_LARGE');
  static const Transaction_Result_contractResult ILLEGAL_OPERATION = Transaction_Result_contractResult._(8, _omitEnumNames ? '' : 'ILLEGAL_OPERATION');
  static const Transaction_Result_contractResult STACK_OVERFLOW = Transaction_Result_contractResult._(9, _omitEnumNames ? '' : 'STACK_OVERFLOW');
  static const Transaction_Result_contractResult OUT_OF_ENERGY = Transaction_Result_contractResult._(10, _omitEnumNames ? '' : 'OUT_OF_ENERGY');
  static const Transaction_Result_contractResult OUT_OF_TIME = Transaction_Result_contractResult._(11, _omitEnumNames ? '' : 'OUT_OF_TIME');
  static const Transaction_Result_contractResult JVM_STACK_OVER_FLOW = Transaction_Result_contractResult._(12, _omitEnumNames ? '' : 'JVM_STACK_OVER_FLOW');
  static const Transaction_Result_contractResult UNKNOWN = Transaction_Result_contractResult._(13, _omitEnumNames ? '' : 'UNKNOWN');
  static const Transaction_Result_contractResult TRANSFER_FAILED = Transaction_Result_contractResult._(14, _omitEnumNames ? '' : 'TRANSFER_FAILED');
  static const Transaction_Result_contractResult INVALID_CODE = Transaction_Result_contractResult._(15, _omitEnumNames ? '' : 'INVALID_CODE');

  static const $core.List<Transaction_Result_contractResult> values = <Transaction_Result_contractResult> [
    DEFAULT,
    SUCCESS,
    REVERT,
    BAD_JUMP_DESTINATION,
    OUT_OF_MEMORY,
    PRECOMPILED_CONTRACT,
    STACK_TOO_SMALL,
    STACK_TOO_LARGE,
    ILLEGAL_OPERATION,
    STACK_OVERFLOW,
    OUT_OF_ENERGY,
    OUT_OF_TIME,
    JVM_STACK_OVER_FLOW,
    UNKNOWN,
    TRANSFER_FAILED,
    INVALID_CODE,
  ];

  static final $core.Map<$core.int, Transaction_Result_contractResult> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Result_contractResult? valueOf($core.int value) => _byValue[value];

  const Transaction_Result_contractResult._($core.int v, $core.String n) : super(v, n);
}

class TransactionInfo_code extends $pb.ProtobufEnum {
  static const TransactionInfo_code SUCESS = TransactionInfo_code._(0, _omitEnumNames ? '' : 'SUCESS');
  static const TransactionInfo_code FAILED = TransactionInfo_code._(1, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<TransactionInfo_code> values = <TransactionInfo_code> [
    SUCESS,
    FAILED,
  ];

  static final $core.Map<$core.int, TransactionInfo_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionInfo_code? valueOf($core.int value) => _byValue[value];

  const TransactionInfo_code._($core.int v, $core.String n) : super(v, n);
}

class BlockInventory_Type extends $pb.ProtobufEnum {
  static const BlockInventory_Type SYNC = BlockInventory_Type._(0, _omitEnumNames ? '' : 'SYNC');
  static const BlockInventory_Type ADVTISE = BlockInventory_Type._(1, _omitEnumNames ? '' : 'ADVTISE');
  static const BlockInventory_Type FETCH = BlockInventory_Type._(2, _omitEnumNames ? '' : 'FETCH');

  static const $core.List<BlockInventory_Type> values = <BlockInventory_Type> [
    SYNC,
    ADVTISE,
    FETCH,
  ];

  static final $core.Map<$core.int, BlockInventory_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BlockInventory_Type? valueOf($core.int value) => _byValue[value];

  const BlockInventory_Type._($core.int v, $core.String n) : super(v, n);
}

class Inventory_InventoryType extends $pb.ProtobufEnum {
  static const Inventory_InventoryType TRX = Inventory_InventoryType._(0, _omitEnumNames ? '' : 'TRX');
  static const Inventory_InventoryType BLOCK = Inventory_InventoryType._(1, _omitEnumNames ? '' : 'BLOCK');

  static const $core.List<Inventory_InventoryType> values = <Inventory_InventoryType> [
    TRX,
    BLOCK,
  ];

  static final $core.Map<$core.int, Inventory_InventoryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Inventory_InventoryType? valueOf($core.int value) => _byValue[value];

  const Inventory_InventoryType._($core.int v, $core.String n) : super(v, n);
}

class Items_ItemType extends $pb.ProtobufEnum {
  static const Items_ItemType ERR = Items_ItemType._(0, _omitEnumNames ? '' : 'ERR');
  static const Items_ItemType TRX = Items_ItemType._(1, _omitEnumNames ? '' : 'TRX');
  static const Items_ItemType BLOCK = Items_ItemType._(2, _omitEnumNames ? '' : 'BLOCK');
  static const Items_ItemType BLOCKHEADER = Items_ItemType._(3, _omitEnumNames ? '' : 'BLOCKHEADER');

  static const $core.List<Items_ItemType> values = <Items_ItemType> [
    ERR,
    TRX,
    BLOCK,
    BLOCKHEADER,
  ];

  static final $core.Map<$core.int, Items_ItemType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Items_ItemType? valueOf($core.int value) => _byValue[value];

  const Items_ItemType._($core.int v, $core.String n) : super(v, n);
}

class PBFTMessage_MsgType extends $pb.ProtobufEnum {
  static const PBFTMessage_MsgType VIEW_CHANGE = PBFTMessage_MsgType._(0, _omitEnumNames ? '' : 'VIEW_CHANGE');
  static const PBFTMessage_MsgType REQUEST = PBFTMessage_MsgType._(1, _omitEnumNames ? '' : 'REQUEST');
  static const PBFTMessage_MsgType PREPREPARE = PBFTMessage_MsgType._(2, _omitEnumNames ? '' : 'PREPREPARE');
  static const PBFTMessage_MsgType PREPARE = PBFTMessage_MsgType._(3, _omitEnumNames ? '' : 'PREPARE');
  static const PBFTMessage_MsgType COMMIT = PBFTMessage_MsgType._(4, _omitEnumNames ? '' : 'COMMIT');

  static const $core.List<PBFTMessage_MsgType> values = <PBFTMessage_MsgType> [
    VIEW_CHANGE,
    REQUEST,
    PREPREPARE,
    PREPARE,
    COMMIT,
  ];

  static final $core.Map<$core.int, PBFTMessage_MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PBFTMessage_MsgType? valueOf($core.int value) => _byValue[value];

  const PBFTMessage_MsgType._($core.int v, $core.String n) : super(v, n);
}

class PBFTMessage_DataType extends $pb.ProtobufEnum {
  static const PBFTMessage_DataType BLOCK = PBFTMessage_DataType._(0, _omitEnumNames ? '' : 'BLOCK');
  static const PBFTMessage_DataType SRL = PBFTMessage_DataType._(1, _omitEnumNames ? '' : 'SRL');

  static const $core.List<PBFTMessage_DataType> values = <PBFTMessage_DataType> [
    BLOCK,
    SRL,
  ];

  static final $core.Map<$core.int, PBFTMessage_DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PBFTMessage_DataType? valueOf($core.int value) => _byValue[value];

  const PBFTMessage_DataType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
