import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/any.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/contract/asset_issue_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/contract/smart_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/entities/tron_parameter_type.dart';
import 'package:walletkit_dart/src/utils/keccak.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:walletkit_dart/src/crypto/tron/repositories/rpc/core/Tron.pb.dart'
    as tron;
import 'package:protobuf/protobuf.dart' as $pb;

sealed class TronContractData {
  const TronContractData(this.type);

  final tron.Transaction_Contract_ContractType type;

  tron.Transaction_Contract createContract() {
    return tron.Transaction_Contract(
      type: type,
      parameter: Any.pack(contract),
    );
  }

  $pb.GeneratedMessage get contract;

  static TronContractData from(
      tron.Transaction_Contract_ContractType type, Any parameter) {
    return switch (type) {
      tron.Transaction_Contract_ContractType.TransferContract =>
        TronTransferContractData.fromPB(
          parameter.unpackInto<TransferContract>(TransferContract()),
        ),
      tron.Transaction_Contract_ContractType.TriggerSmartContract =>
        TronTriggerSmartContractData.from(
          parameter.unpackInto<TriggerSmartContract>(TriggerSmartContract()),
        ),
      tron.Transaction_Contract_ContractType.TransferAssetContract =>
        TronTransferAssetContractData.fromPB(
          parameter.unpackInto<TransferAssetContract>(TransferAssetContract()),
        ),
      _ => throw UnsupportedError(
          "Unsupported Contract Type: $type with $parameter",
        ),
    };
  }
}

///
/// Used for Transferring of TRX
///
final class TronTransferContractData extends TronContractData {
  final String to;
  final String from;
  final BigInt amount;

  const TronTransferContractData({
    required this.to,
    required this.from,
    required this.amount,
  }) : super(tron.Transaction_Contract_ContractType.TransferContract);

  factory TronTransferContractData.fromPB(
    TransferContract contract,
  ) {
    return TronTransferContractData(
      to: base58CheckFromHex(contract.toAddress.toUint8List),
      from: base58CheckFromHex(contract.ownerAddress.toUint8List),
      amount: contract.amount.toInt().toBigInt,
    );
  }

  @override
  TransferContract get contract {
    final contract = TransferContract(
      ownerAddress: base58ToHex(from),
      toAddress: base58ToHex(to),
      amount: Int64(amount.toInt()),
    );

    return contract;
  }
}

///
/// Used for Transferring of TRC10 Tokens
///
final class TronTransferAssetContractData extends TronContractData {
  final String to;
  final String from;
  final String assetName;
  final BigInt amount;

  const TronTransferAssetContractData({
    required this.to,
    required this.from,
    required this.amount,
    required this.assetName,
  }) : super(tron.Transaction_Contract_ContractType.TransferAssetContract);

  @override
  TransferAssetContract get contract {
    return TransferAssetContract(
      ownerAddress: base58ToHex(from),
      toAddress: base58ToHex(to),
      assetName: assetName.hexToBytes,
      amount: Int64(amount.toInt()),
    );
  }

  factory TronTransferAssetContractData.fromPB(
    TransferAssetContract contract,
  ) {
    return TronTransferAssetContractData(
      to: base58CheckFromHex(contract.toAddress.toUint8List),
      from: base58CheckFromHex(contract.ownerAddress.toUint8List),
      amount: contract.amount.toInt().toBigInt,
      assetName: contract.assetName.toUint8List.toHex,
    );
  }
}

sealed class TronTriggerSmartContractData extends TronContractData {
  final String ownerAddress;
  final String contractAddress;
  final Uint8List data;
  final Int64? callValue;
  final Int64? callTokenValue;
  final Int64? token_id;

  final String function_selector;
  final List<TronParameter> parameters;

  TronTriggerSmartContractData({
    required this.ownerAddress,
    required this.contractAddress,
    required this.parameters,
    required this.function_selector,
    this.callValue,
    this.callTokenValue,
    this.token_id,
  })  : data = createParameter(
          getFunctionSignature(function_selector),
          parameters,
        ),
        super(tron.Transaction_Contract_ContractType.TriggerSmartContract);

  Uint8List get functionSignature {
    return data.sublist(0, 4);
  }

  @override
  TriggerSmartContract get contract {
    return TriggerSmartContract(
      ownerAddress: base58ToHex(ownerAddress),
      contractAddress: base58ToHex(contractAddress),
      data: data,
      callValue: callValue,
      callTokenValue: callTokenValue,
      tokenId: token_id,
    );
  }

  static TronTriggerSmartContractData from(
    TriggerSmartContract contract,
  ) {
    final owner = base58CheckFromHex(contract.ownerAddress.toUint8List);
    final contractAddress =
        base58CheckFromHex(contract.contractAddress.toUint8List);

    final data = contract.data.toUint8List;
    final functionSelector = getFunctionSelectorFromData(data);

    return switch (functionSelector) {
      TronTRC20TransferContractData.selector =>
        TronTRC20TransferContractData.fromPB(
          data,
          ownerAddress: owner,
          contractAddress: contractAddress,
        ),
      _ => throw UnsupportedError(
          "Unsupported Contract Type: $functionSelector with $contract",
        ),
    };
  }
}

final class TronTRC20TransferContractData extends TronTriggerSmartContractData {
  final String recipient;
  final String ownerAddress;
  final String contractAddress;
  final Amount amount;

  static const selector = "transfer(address,uint256)";
  static const selectorHex = "a9059cbb";

  TronTRC20TransferContractData({
    required this.recipient,
    required this.ownerAddress,
    required this.contractAddress,
    required this.amount,
  }) : super(
          function_selector: selector,
          ownerAddress: ownerAddress,
          contractAddress: contractAddress,
          parameters: [
            TronAddressParameter(recipient),
            TronIntParameter(amount.value),
          ],
        );

  factory TronTRC20TransferContractData.fromPB(
    Uint8List data, {
    required String ownerAddress,
    required String contractAddress,
  }) {
    final paramData = decodeParams(
      data.sublist(4),
      [TronParameterType.ADDRESS, TronParameterType.INT256],
    );

    final recipient = paramData[0] as TronAddressParameter;
    final amount = paramData[1] as TronIntParameter;

    return TronTRC20TransferContractData(
      recipient: recipient.value,
      ownerAddress: "",
      contractAddress: "",
      amount: Amount(value: amount.value, decimals: 6),
    );
  }
}

Uint8List getFunctionSignature(String function_selector) {
  final hash = keccakUtf8(function_selector);
  return hash.sublist(0, 4);
}
