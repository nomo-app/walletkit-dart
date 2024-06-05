import 'dart:convert';

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'derive_address_test.dart';

void main() {
  test('Test Tronscan', () async {
    final tronScan = TronScanRepository(
      apiKeys: TRON_Network.blockExplorer!.$2.toList(),
    );

    final block = await tronScan.getLatestBlock();

    print(block);

    final txs =
        await tronScan.getTransactions(address: tronAddress, token: tron);

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
      trc20: tronUSDT,
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
      apiKeys: ["9b3974db-6887-41b3-bb70-39f43be242bd"],
    );

    final valid = await tronHTTP.validateAddress(tronAddress);

    print("Valid: $valid");

    final balance = await tronHTTP.getBalance(
        address: "TMbyqJkw2RsSG7tT6VzJzbzDQuHEMvrGGj");

    print("Balance: $balance");

    final nowBlock = await tronHTTP.getBlock();

    print("Now Block: $nowBlock");

    final list = await tronHTTP.getAllTRC10Tokens();

    print("Account: $list");

    final trc = await tronHTTP.getTRC10byID("1000001");

    print("TRC10: $trc");

    final nodeList = await tronHTTP.listNodes();

    print("Node List: $nodeList");

    final tx = await tronHTTP.getTransactionById(
        "0a1c7735b6b63f656301d433e0aa3b0a3a901b4333e157a01c6ec9545706f1e8");

    print(tx["raw_data_hex"]);

    print("Transaction: $tx");

    final accoutInfo = await tronHTTP.getAccountInfo(address: tronAddress);

    print("Account Info: $accoutInfo");

    final usdtHistory = await tronHTTP.getTRC20TransactionList(
      address: tronAddress,
      contractAddress: tronUSDTAddress,
    );

    print("USDT History: $usdtHistory");

    final usdtBalance = await tronHTTP.getTRC20Balance(
      address: tronAddress,
      trc20: tronUSDT,
    );

    print("USDT Balance: $usdtBalance");

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

  test('Fetch Account Resources', () async {
    final tronHTTP = TronHTTPRepository(
      apiKeys: [
        // "1d06fa37-79bf-4250-a4aa-9656a92a71b0",
        "9b3974db-6887-41b3-bb70-39f43be242bd"
      ],
    );

    final resource = await tronHTTP.getAccountResource(address: tronAddress);

    print(resource);
  });

  test('Fetch Tron Balance ', () async {
    final tronScan = TronScanRepository(
      apiKeys: TRON_Network.blockExplorer!.$2.toList(),
    );

    final scanTxs =
        await tronScan.getTransactions(address: tronAddress, token: tron);

    expect(scanTxs.length, greaterThanOrEqualTo(52));
  });

  test('Fetch TRX Transfers', () async {
    final tronHttp = TronHTTPRepository(
      apiKeys: ["9b3974db-6887-41b3-bb70-39f43be242bd"],
    );

    final transfers =
        await tronHttp.getTRXTransactionList(address: tronAddress);

    final data = transfers['data'];

    final txs = [
      for (final tx in data) TronTransaction.fromJson(tx, tron, tronAddress)
    ].whereType<TronTransaction>();

    print(txs.length);
  });
}
