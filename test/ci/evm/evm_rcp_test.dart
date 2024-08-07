@Timeout(Duration(seconds: 600))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';

void main() {
  final zeniqSmartRpcInterface = zeniqSmartChainRPC;
  test('ZeniqSmartChain Fetching rejectWallet', () async {
    final zscTransactions =
        await zeniqSmartRpcInterface.fetchAllTransactionsZSC(
      address: rejectEVM,
    );

    expect(zscTransactions.length, 100);
    print('ZSC Transactions: ${zscTransactions.length}');

    final zscBalance = await zeniqSmartRpcInterface.fetchBalance(
      address: rejectEVM,
    );

    print('ZSC Balance: $zscBalance');

    final avinocZSCBalance = await zeniqSmartRpcInterface.fetchTokenBalance(
      rejectEVM,
      avinocZSC,
    );

    print('AVINOC ZSC Balance: $avinocZSCBalance');

    final avinocZSCTransactions =
        await zeniqSmartRpcInterface.fetchZEN20Transfers(
      token: avinocZSC,
      address: rejectEVM,
    );

    expect(avinocZSCTransactions.length, 100);
    print('AVINOC ZSC Transactions: ${avinocZSCTransactions.length}');

    final erc721 = await zeniqSmartRpcInterface.fetchZEN721Transfers(
      address: rejectEVM,
      nftContractAddress: smartChainStakingContract,
    );

    expect(
      erc721.length,
      greaterThanOrEqualTo(109),
    ); // May Fail if NFTs are send inbetween test wallets
    print('ERC721: ${erc721.length}');
  });

  test('ZSC fetch set-merge and cache performance', () async {
    Set<GenericTransaction> set = {};
    for (int i = 0; i < 4; i++) {
      final zscTransactions =
          await zeniqSmartRpcInterface.fetchAllTransactionsZSC(
        address: rejectEVM,
      );
      expect(zscTransactions.length, 100);
      set = {...set, ...zscTransactions.toSet()};
      expect(set.length, zscTransactions.length);
    }
  });

  test('fetch Staking ZEN721 transfers', () async {
    final txs = await zeniqSmartRpcInterface.fetchZEN721Transfers(
      nftContractAddress: smartChainStakingContract,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(
      txs.length,
      greaterThanOrEqualTo(109),
    ); // May Fail if NFTs are send inbetween test wallets
  });

  test('fetch AVINOC ZSC transfers', () async {
    final txs = await zeniqSmartRpcInterface.fetchZEN20Transfers(
      token: avinocZSC,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(txs.length, 100);
  });

  test('fetch TUPAN transfers', () async {
    final txs = await zeniqSmartRpcInterface.fetchZEN20Transfers(
      token: tupanToken,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(txs.length, 100);
  });

  test('estimate Gas Limit', () async {
    var data = erc20TransferSig +
        spoilEVM.substring(2).padLeft(64, '0') +
        BigInt.from(0).toHex.padLeft(64, '0');

    var gasLimit = await zeniqSmartRpcInterface.estimateGasLimit(
      sender: rejectEVM,
      recipient: avinocZSC.contractAddress,
      gasPrice: null,
      value: BigInt.zero,
      data: data.hexToBytes,
    );

    expect(gasLimit, greaterThanOrEqualTo(GasLimits.ethSend.value));

    data = "Test memo";

    gasLimit = await zeniqSmartRpcInterface.estimateGasLimit(
      sender: rejectEVM,
      recipient: spoilEVM,
      gasPrice: null,
      value: BigInt.one,
      data: data.asUTF8,
    );

    final memoGasLimit = GasLimits.ethSend.value + 16 * data.length;

    expect(gasLimit, greaterThanOrEqualTo(memoGasLimit));
  });

  test('Arbitrum Test', () async {
    final balance = await arbitrumRPC.fetchBalance(
      address: arbitrumTestWallet,
    );
    expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));
  });

  // test('Base Test', () async {
  //   final rpcInterface = EvmRpcInterface(BaseNetwork);

  //   final balance = await rpcInterface.fetchBalance(
  //     address: arbitrumTestWallet,
  //   );
  //   expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));

  //   final tokenBalance =
  //       await rpcInterface.fetchTokenBalance(arbitrumTestWallet, mathToken);

  //   expect(tokenBalance.value, greaterThanOrEqualTo(BigInt.from(0)));
  // });

  test('MoonBeam Test', () async {
    final balance = await moonbeamRPC.fetchBalance(
      address: arbitrumTestWallet,
    );

    expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));

    final fraxBalance = await moonbeamRPC.fetchTokenBalance(
      arbitrumTestWallet,
      frax,
    );

    expect(fraxBalance.value, greaterThan(BigInt.zero));
  });

  test('Avalanche Test', () async {
    final balance = await avalancheRPC.fetchBalance(
      address: arbitrumTestWallet,
    );

    print(balance);
    expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));
  });

  test('Optimism Test', () async {
    final balance = await optimismRPC.fetchBalance(
      address: arbitrumTestWallet,
    );

    expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));

    final opBalance = await optimismRPC.fetchTokenBalance(
      arbitrumTestWallet,
      optimism,
    );

    expect(opBalance.value, greaterThanOrEqualTo(BigInt.from(0)));
  });
  test('zkSync Test', () async {
    final balance = await zksyncRPC.fetchBalance(
      address: arbitrumTestWallet,
    );

    expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));

    final wbtcBalance = await zksyncRPC.fetchTokenBalance(
      arbitrumTestWallet,
      wbtcZKSync,
    );

    expect(wbtcBalance.value, greaterThanOrEqualTo(BigInt.from(0)));
  });
}
