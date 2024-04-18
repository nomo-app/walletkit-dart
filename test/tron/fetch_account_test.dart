import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tron_http_repository.dart';
import 'package:walletkit_dart/src/crypto/tron/domain/tronscan_repository.dart';
import 'derive_address_test.dart';

void main() {
  test('Test Tronscan', () async {
    final tronScan = TronScanRepository(
      apiKeys: ["a875e9b5-2d45-410c-ade9-49ee456be28a"],
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
      apiKeys: ["a875e9b5-2d45-410c-ade9-49ee456be28a"],
    );

    // final addressValid = await tronHTTP.validateAddress(tronAddress);

    // print("Address Valid: $addressValid");

    final nowBlock = await tronHTTP.getBlock();

    print("Now Block: $nowBlock");
  });
}
