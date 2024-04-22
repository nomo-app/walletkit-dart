import 'dart:convert';

import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tronscan_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/api/api.pb.dart';
import 'package:walletkit_dart/src/crypto/tron/rpc/core/Tron.pb.dart';
import 'package:walletkit_dart/src/domain/repository/evm_rpc_interface.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'derive_address_test.dart';

import 'package:protobuf/protobuf.dart' as $pb;

void main() {
  test('Test Tronscan', () async {
    final tronScan = TronScanRepository(
      apiKeys: TronNetwork.blockExplorer!.$2.toList(),
    );

    final block = await tronScan.getLatestBlock();

    print(block);

    final txs = await tronScan.getTransactions(address: tronAddress);

    print(txs);

    final price = await tronScan.getTokenPrice("trx");

    print("Price: $price");

    final tps = await tronScan.getCurrentTPS();

    print("TPS: $tps");

    final walletTokens =
        await tronScan.getWalletTokens(address: tronAddress, asset_type: 1);

    print("Wallet Tokens: $walletTokens");

    final trxTransferList =
        await tronScan.getTRXTransferList(address: tronAddress, fee: true);

    print("TRX Transfer List: $trxTransferList");

    final trc10Tranfers = await tronScan.getTRC10TransferList(
      address: tronAddress,
      trc10Id: "1002000", // BitTorrent Old
    );

    print("BitTorrent Old TRC10 Transfers: $trc10Tranfers");

    final trc20Transfers = await tronScan.getTRC20TransferList(
      address: tronAddress,
      trc20Id: tronUSDTAddress,
    );

    print("USDT TRC20 Transfers: $trc20Transfers");

    final unfreezableBalance = await tronScan.getUnfreezableBalance(
      tronAddress,
    );

    print("Unfreezable Balance: $unfreezableBalance");

    final accountSecurity = await tronScan.getAccountSecurity(tronAddress);

    print("Account Security: $accountSecurity");

    final tokenSecurity = await tronScan.getTokenSecurity(tronUSDTAddress);

    print("Token Security: $tokenSecurity");
  });

  test('Test RPC', () async {
    final tronHTTP = TronHTTPRepository(
      apiKeys: ["1d06fa37-79bf-4250-a4aa-9656a92a71b0"],
    );

    // final valid = await tronHTTP.validateAddress(tronAddress);

    // print("Valid: $valid");

    // final balance = await tronHTTP.getAccountBalance(
    //     address: "TMbyqJkw2RsSG7tT6VzJzbzDQuHEMvrGGj");

    // print("Balance: $balance");

    final nowBlock = await tronHTTP.getBlock();

    print("Now Block: $nowBlock");

    // final list = await tronHTTP.getAllTRC10Tokens();

    // print("Account: $list");

    // final trc = await tronHTTP.getTRC10byID("1000001");

    // print("TRC10: $trc");

    // final nodeList = await tronHTTP.listNodes();

    // print("Node List: $nodeList");

    // final tx = await tronHTTP.getTransactionById(
    //     "d0807adb3c5412aa150787b944c96ee898c997debdc27e2f6a643c771edb5933");

    // print("Transaction: $tx");

    // final accoutInfo = await tronHTTP.getAccountInfo(address: tronAddress);

    // print("Account Info: $accoutInfo");

    // final usdtHistory = await tronHTTP.getTRC20TransactionList(
    //   address: tronAddress,
    //   contractAddress: tronUSDTAddress,
    // );

    // print("USDT History: $usdtHistory");

    // final usdtBalance = await tronHTTP.getTRC20Balance(
    //   address: tronAddress,
    //   trc20: tronUSDT,
    // );

    // print("USDT Balance: $usdtBalance");

    final rawTx = await tronHTTP.getTransactionById(
        "387302162b58c458434f184fa99ef5e9c9670f1c95388641fdfb15f6429e58e3");

    print(jsonEncode(rawTx));

    print("Raw Transaction: $rawTx");
  });

  test('Solidity RPC', () async {
    final rpc = EvmRpcInterface(TRON_NETWORK());

    final balance = await rpc.fetchBalance(
      address: "0x7F9DC8311E51C1685764BBB0F5CEAC7AD79B0128",
    );

    print("Balance: $balance");
  });
}
