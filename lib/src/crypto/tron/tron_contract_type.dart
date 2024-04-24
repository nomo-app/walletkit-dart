import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/any.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/asset_issue_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/balance_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/smart_contract.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_parameter_type.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart' as tron;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:web3dart/crypto.dart';

sealed class TronContractData {
  const TronContractData(this.type);

  final tron.Transaction_Contract_ContractType type;

  tron.Transaction_Contract createContract() {
    return tron.Transaction_Contract(
      type: this.type,
      parameter: Any.pack(this.contract),
    );
  }

  $pb.GeneratedMessage get contract;
}

///
/// Used for Transferring of TRX
///
final class TronTransferContractData extends TronContractData {
  final String to;
  final String from;
  final Amount amount;

  const TronTransferContractData({
    required this.to,
    required this.from,
    required this.amount,
  }) : super(tron.Transaction_Contract_ContractType.TransferContract);

  @override
  TransferContract get contract {
    final contract = TransferContract(
      ownerAddress: base58ToHex(from),
      toAddress: base58ToHex(to),
      amount: Int64(amount.value.toInt()),
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
  final Amount amount;

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
      amount: Int64(amount.value.toInt()),
    );
  }
}

final class TronTriggerSmartContractData extends TronContractData {
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
}

final class TronTRC20TransferContractData extends TronTriggerSmartContractData {
  final String recipient;
  final String ownerAddress;
  final String contractAddress;
  final Amount amount;

  TronTRC20TransferContractData({
    required this.recipient,
    required this.ownerAddress,
    required this.contractAddress,
    required this.amount,
  }) : super(
          function_selector: "transfer(address,uint256)",
          ownerAddress: ownerAddress,
          contractAddress: contractAddress,
          parameters: [
            TronAddressParameter(recipient),
            TronIntParameter(amount.value),
          ],
        );
}

Uint8List getFunctionSignature(String function_selector) {
  final encoded = utf8.encode(function_selector);
  final hash = keccak256(encoded);
  return hash.sublist(0, 4);
}
