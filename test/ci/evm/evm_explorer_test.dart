@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';

import '../../utils.dart';

void main() {
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

    final balance = await bscscan.fetchBalance(rejectEVM, binanceSmart);

    print('BNB Balance: $balance');

    final zeniqBSCBalance =
        await bscscan.fetchBalance(rejectEVM, zeniqBSCToken);

    print('Zeniq BSC Balance: $zeniqBSCBalance');

    ///
    /// Transactions
    ///

    final transactions = await bscscan.fetchTransactions(
      address: rejectEVM,
      token: binanceSmart,
    );

    expect(transactions, isNotEmpty);

    print('BNB Transactions: $transactions');

    final zeniqBSCTokenTransactions = await bscscan.fetchERC20Transactions(
      address: rejectEVM,
      token: zeniqBSCToken,
      currency: binanceSmart,
    );

    expect(zeniqBSCTokenTransactions, isNotEmpty);

    print('Zeniq BSC Transactions: $zeniqBSCTokenTransactions');

    ///
    /// ERC721
    ///

    final erc721 = await bscscan.fetchEtherscanNFTs(address: rejectEVM);

    print('ERC721: $erc721');
  });

  test('GasFees Test', () async {
    final result = await etherscan.fetchGasPrice();

    print(result);
  });

  test("Test Arbitrum Fetching", () async {
    final balance =
        await arbitrumscan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await arbitrumscan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);

    final erc20T = await arbitrumscan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: arbitrum,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);
  });

  test("Test Avalanche Fetching", () async {
    final transactions = await avalancheScan.fetchAvaTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    print(transactions.length);
  });

  test('Test Base Fetching', () async {
    final balance = await basescan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await basescan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);

    final erc20Transactions = await basescan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: mathToken,
      currency: ethNative,
    );

    expect(erc20Transactions, isNotEmpty);

    final erc20balance =
        await basescan.fetchBalance(arbitrumTestWallet, mathToken);
    expect(erc20balance, greaterThan(BigInt.zero));
  });

  test("Test MoonBeam Fetching", () async {
    final balance =
        await moonbeamscan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await moonbeamscan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );

    expect(transactions, isNotEmpty);

    final erc20T = await moonbeamscan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: frax,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);

    final fraxBalance =
        await moonbeamscan.fetchBalance(arbitrumTestWallet, frax);

    expect(fraxBalance, greaterThan(BigInt.zero));
  });

  test('Test Optimism Fetching', () async {
    final balance =
        await optimismscan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    final transactions = await optimismscan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );
    expect(transactions, isNotEmpty);

    final erc20T = await optimismscan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: optimism,
      currency: ethNative,
    );
    expect(erc20T, isNotEmpty);

    final optimismBalance =
        await optimismscan.fetchBalance(arbitrumTestWallet, optimism);

    expect(optimismBalance, greaterThan(BigInt.zero));
  });

  test('Test zkSync Fetching', () async {
    final balance =
        await zksyncscan.fetchBalance(arbitrumTestWallet, ethNative);

    expect(balance, greaterThanOrEqualTo(BigInt.zero));

    print(balance);
    final transactions = await zksyncscan.fetchTransactions(
      address: arbitrumTestWallet,
      token: ethNative,
    );
    expect(transactions, isNotEmpty);

    final erc20T = await zksyncscan.fetchERC20Transactions(
      address: arbitrumTestWallet,
      token: wbtcZKSync,
      currency: ethNative,
    );

    expect(erc20T, isNotEmpty);

    final wbtcBalance =
        await zksyncscan.fetchBalance(arbitrumTestWallet, wbtcZKSync);

    expect(wbtcBalance, greaterThan(BigInt.zero));
  });
}
