@Timeout(Duration(seconds: 600))
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
  final avaCloud = EVMExplorer(avalancheAPIEndpoint, [avalancheAPIKey]);
  final optiScan = EVMExplorer(optimismScanEndpoint, [optimismAPIKey]);
  final zkSyncScan = EVMExplorer(zksyncAPIEndpoint, [zksyncAPIKey]);
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

    final erc20T = await arbiScan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: arbitrum,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);
  });

  test("Test Avalanche Fetching", () async {
    final transactions = await avaCloud.fetchAvaTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    print(transactions.length);
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

    expect(transactions, isNotEmpty);

    final erc20T = await moonScan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: frax,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);

    final fraxBalance = await moonScan.fetchBalance(arbitrumTestWallet, frax);

    expect(fraxBalance, greaterThan(BigInt.zero));
  });

  test('Test Optimism Fetching', () async {
    final balance = await optiScan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await optiScan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );
    expect(transactions, isNotEmpty);

    final erc20T = await optiScan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: optimism,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);

    final optimismBalance =
        await optiScan.fetchBalance(arbitrumTestWallet, optimism);

    expect(optimismBalance, greaterThan(BigInt.zero));
  });

  test('Test zkSync Fetching', () async {
    final balance =
        await zkSyncScan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    print(balance);
    final transactions = await zkSyncScan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );
    expect(transactions, isNotEmpty);

    final erc20T = await zkSyncScan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: wbtcZKSync,
      currency: ethNative,
    );

    expect(erc20T, isNotEmpty);

    final wbtcBalance =
        await zkSyncScan.fetchBalance(arbitrumTestWallet, wbtcZKSync);

    expect(wbtcBalance, greaterThan(BigInt.zero));
  });
}
