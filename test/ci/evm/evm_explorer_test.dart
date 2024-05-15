@Timeout(Duration(seconds: 600))
import 'dart:math';

import 'package:test/test.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';
import 'package:walletkit_dart/src/domain/repository/etherscan_repository.dart';

void main() {
  final etherscan = EVMExplorer(etherscanBaseEndpoint, [etherscanApiKey]);
  final bnbScan = EVMExplorer(bnbScanBaseEndpoint, [bnbScanApiKey]);
  final arbiScan = EVMExplorer(arbitrumScanBaseEndpoint, [arbitrumScanApiKey]);
  final baseScan = EVMExplorer(baseScanEndpoint, [baseScanApiKey]);
  final moonScan = EVMExplorer(moonbeamScanBaseEndpoint, [moonbeamScanApiKey]);

  test('Test Ethereum Etherscan Fetching', () async {
    ///
    /// Balances
    ///

    final balance = await etherscan.fetchBalance(rejectEVM, ethNative);

    print('ETH Balance: $balance');

    final wbtcBalance = await etherscan.fetchBalance(rejectEVM, wbtcToken);

    print('WBTC Balance: $wbtcBalance');

    ///
    /// Transactions
    ///

    final transactions = await etherscan.fetchTransactions(
      address: rejectEVM,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);

    print('ETH Transactions: $transactions');

    final wBTCTransactions = await etherscan.fetchERC20Transactions(
      address: rejectEVM,
      token: wbtcToken,
      currency: ethNative,
    );

    expect(wBTCTransactions, isNotEmpty);

    print('WBTC Transactions: $wBTCTransactions');

    ///
    /// ERC721
    ///

    final erc721 = await etherscan.fetchEtherscanNFTs(address: rejectEVM);
    print('ERC721: $erc721');
  });

  test('Test BinanceChain BnbScan Fetching', () async {
    ///
    /// Balances
    ///

    final balance = await bnbScan.fetchBalance(rejectEVM, binanceSmart);

    print('BNB Balance: $balance');

    final zeniqBSCBalance =
        await bnbScan.fetchBalance(rejectEVM, zeniqBSCToken);

    print('Zeniq BSC Balance: $zeniqBSCBalance');

    ///
    /// Transactions
    ///

    final transactions = await bnbScan.fetchTransactions(
      address: rejectEVM,
      token: binanceSmart,
    );

    expect(transactions, isNotEmpty);

    print('BNB Transactions: $transactions');

    final zeniqBSCTokenTransactions = await bnbScan.fetchERC20Transactions(
      address: rejectEVM,
      token: zeniqBSCToken,
      currency: binanceSmart,
    );

    expect(zeniqBSCTokenTransactions, isNotEmpty);

    print('Zeniq BSC Transactions: $zeniqBSCTokenTransactions');

    ///
    /// ERC721
    ///

    final erc721 = await bnbScan.fetchEtherscanNFTs(address: rejectEVM);

    print('ERC721: $erc721');
  });

  test('GasFees Test', () async {
    final result = await etherscan.fetchGasPrice();

    print(result);
  });

  test("Test Arbitrum Fetching", () async {
    final balance = await arbiScan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await arbiScan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);
  });
  test('Test Base Fetching', () async {
    final balance = await baseScan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await baseScan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);

    final erc20Transactions = await baseScan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: mathToken,
      currency: ethNative,
    );

    expect(erc20Transactions, isNotEmpty);

    final erc20balance =
        await baseScan.fetchBalance(arbitrumTestWallet, mathToken);
    expect(erc20balance, greaterThan(BigInt.zero));
  });

  test("Test MoonBeam Fetching", () async {
    final balance = await moonScan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await moonScan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    print(transactions);

    expect(transactions, isNotEmpty);
  });
}
