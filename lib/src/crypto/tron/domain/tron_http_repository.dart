import 'package:walletkit_dart/src/common/http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/contract/smart_contract.pb.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const _tronGridBaseUrl = 'https://api.trongrid.io';

class TronHTTPRepository extends HTTPRepository {
  final List<String> apiKeys;

  const TronHTTPRepository({required this.apiKeys})
      : super(
          apiKeys: apiKeys,
          baseURL: _tronGridBaseUrl,
          apiKeyHeader: "TRON-PRO-API-KEY",
        );

  Future<JSON> validateAddress(String address) async {
    final result = await postCall<JSON>(
      "$baseURL/wallet/validateaddress",
      data: {
        "address": address,
        "visible": true,
      },
    );

    return result;
  }

  Future<JSON> getBlock() {
    return postCall<JSON>("$baseURL/wallet/getnowblock", data: {});
  }

  Future<JSON> getAccount({required String address, bool visible = true}) {
    return postCall<JSON>(
      "$baseURL/wallet/getaccount",
      data: {
        "address": address,
        "visible": visible,
      },
    );
  }

  Future<({int bandwidth, int energy})> getAccountResource({
    required String address,
    bool visible = true,
  }) async {
    final json = await postCall<JSON>(
      "$baseURL/wallet/getaccountresource",
      data: {
        "address": address,
        "visible": visible,
      },
    );

    final freeNetUsed = json["freeNetUsed"] as int? ?? 0;
    final freeNetLimit = json["freeNetLimit"] as int;

    final remainingFreeBandwidth = freeNetLimit - freeNetUsed;

    final energyLimit = json["EnergyLimit"] as int?;
    final energyUsed = json["EnergyUsed"] as int?;
    final energyBalance = (energyUsed != null && energyLimit != null)
        ? energyLimit - energyUsed
        : 0;

    return (
      bandwidth: remainingFreeBandwidth,
      energy: energyBalance,
    );
  }

  Future<Amount> getBalance({required String address}) async {
    final accountInfo = await getAccount(address: address);

    final balance = accountInfo["balance"] as int;

    return Amount(value: balance.toBigInt, decimals: 6);
  }

  Future<JSON> getAllTRC10Tokens() {
    return getCall<JSON>("$baseURL/wallet/getassetissuelist");
  }

  Future<JSON> listNodes() {
    return getCall<JSON>("$baseURL/wallet/listnodes");
  }

  Future<JSON> getTRC10byID(String id) {
    return postCall<JSON>(
      "$baseURL/wallet/getassetissuebyid",
      data: {"value": id},
    );
  }

  Future<JSON> getTransactionById(String id) {
    return postCall<JSON>(
      "$baseURL/wallet/gettransactionbyid",
      data: {"value": id},
    );
  }

  Future<JSON> getAccountInfo({required String address}) {
    return getCall<JSON>(
      "$baseURL/v1/accounts/$address",
    );
  }

  Future<JSON> getTRC20TransactionList({
    required String address,
    required String contractAddress,
    int limit = 200,
  }) {
    return getCall<JSON>(
      "$baseURL/v1/accounts/$address/transactions/trc20?limit=$limit&contract_address=$contractAddress",
    );
  }

  Future<JSON> getTRXTransactionList({
    required String address,
    int limit = 200,
  }) {
    return getCall<JSON>(
      "$baseURL/v1/accounts/$address/transactions?limit=$limit",
    );
  }

  ///
  ///  Trigger a constant contract (read-only, does not modify the blockchain)
  ///
  Future<JSON> triggerConstantContract({
    required String address,
    required String contractAddress,
    String? functionSelector,
    String? parameter,
    String? data,
    bool visible = true,
  }) {
    assert(
      functionSelector != null || data != null,
      "FunctionSelector or Data must be provided",
    );

    return postCall<JSON>(
      "$baseURL/wallet/triggerconstantcontract",
      data: {
        "owner_address": address,
        "contract_address": contractAddress,
        if (functionSelector != null) "function_selector": functionSelector,
        if (parameter != null) "parameter": parameter,
        if (data != null) "data": data,
        "visible": visible,
      },
    );
  }

  Future<JSON> transferTRC20({
    required String address,
    required String contractAddress,
    required Amount amount,
  }) {
    final functionSelector = "transfer(address,uint256)";
    final addressParameter = base58ToEVM(address, false).padLeft(64, '0');
    final amountParameter = amount.value.toHex.padLeft(64, '0');
    final parmeter = "$addressParameter$amountParameter";

    return triggerSmartContract(
      address: address,
      contractAddress: contractAddress,
      functionSelector: functionSelector,
      parameter: parmeter,
    );
  }

  ///
  ///  Trigger a smart contract (write, modifies the blockchain)
  ///
  Future<JSON> triggerSmartContract({
    required String address,
    required String contractAddress,
    required String functionSelector,
    required String parameter,
    bool visible = true,
    int feeLimit = 1000000, // 1 TRX
    int? call_value, // Amount of TRX within the transaction
    int? call_token_value, // Amount of TRC10 token within the transaction
    String? token_id, // Token ID for TRC10
  }) {
    return postCall<JSON>(
      "$baseURL/wallet/triggercontract",
      data: {
        "owner_address": address,
        "contract_address": contractAddress,
        "function_selector": functionSelector,
        "parameter": parameter,
        "visible": visible,
        "fee_limit": feeLimit,
        if (call_value != null) "call_value": call_value,
        if (call_token_value != null) "call_token_value": call_token_value,
        if (token_id != null) "token_id": token_id,
      },
    );
  }

  Future<Amount> getTRC20Balance({
    required String address,
    required EthBasedTokenEntity trc20,
  }) async {
    final addressParameter = base58ToEVM(address, false).padLeft(64, '0');
    final result = await triggerConstantContract(
      address: address,
      contractAddress: trc20.contractAddress,
      functionSelector: "balanceOf(address)",
      parameter: addressParameter,
    );

    final balance_s = result["constant_result"][0] as String;

    final balance_bi = balance_s.toBigIntFromHex;

    return Amount(
      value: balance_bi,
      decimals: trc20.decimals,
    );
  }

  Future<int> estimateEnergy(TriggerSmartContract contract) async {
    final json = await triggerConstantContract(
      address: contract.ownerAddress.toUint8List.toHex,
      contractAddress: contract.contractAddress.toUint8List.toHex,
      visible: false,
      data: contract.data.toUint8List.toHex,
    );

    final energy_used = json["energy_used"] as int;
    return energy_used;
  }

  Future<JSON> broadcastCastTransactionHex(String hex) {
    return postCall<JSON>(
      "$baseURL/wallet/broadcasthex",
      data: {"transaction": hex},
    );
  }

  Future<JSON> createTransaction({
    required String ownerAddress,
    required String toAddress,
    required Amount amount,
    bool visible = true,
  }) {
    return postCall<JSON>(
      "$baseURL/wallet/createtransaction",
      data: {
        "owner_address": ownerAddress,
        "to_address": toAddress,
        "amount": amount.value.toInt(),
        "visible": visible,
      },
    );
  }

  Future<JSON> broadcastTransaction({required JSON json}) {
    return postCall<JSON>(
      "$baseURL/wallet/broadcasttransaction",
      data: json,
    );
  }

  Future<JSON> getBlockByNumber(int number) {
    return postCall<JSON>(
      "$baseURL/wallet/getblockbynum",
      data: {
        "num": number,
      },
    );
  }

  // Future<JSON> transferTRC20({
  //   required String address,
  //   required EthBasedTokenEntity trc20,
  // }){

  // }
}
