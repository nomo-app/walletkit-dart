import 'package:walletkit_dart/src/common/http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/tron_address.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const testNode = 'https://api.trongrid.io';

class TronHTTPRepository extends HTTPRepository {
  final List<String> apiKeys;

  const TronHTTPRepository({required this.apiKeys})
      : super(
          apiKeys: apiKeys,
          baseURL: testNode,
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

  Future<JSON> getAccountBalance({required String address}) async {
    final nowBlock = await getBlock();
    final hash = nowBlock["blockID"] as String;
    final number = nowBlock["block_header"]["raw_data"]["number"] as int;

    return postCall<JSON>(
      "$baseURL/wallet/getaccountbalance",
      data: {
        "account_identifier": {"address": address},
        "block_identifier": {"hash": hash, "number": number},
        "visible": true
      },
    );
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

  Future<JSON> triggerConstantContract({
    required String address,
    required String contractAddress,
    required String functionSelector,
    required String parameter,
    bool visible = true,
  }) {
    return postCall<JSON>(
      "$baseURL/wallet/triggerconstantcontract",
      data: {
        "owner_address": address,
        "contract_address": contractAddress,
        "function_selector": functionSelector,
        "parameter": parameter,
        "visible": visible,
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

  // Future<JSON> transferTRC20({
  //   required String address,
  //   required EthBasedTokenEntity trc20,
  // }){

  // }
}
