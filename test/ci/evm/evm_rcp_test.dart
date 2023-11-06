@Timeout(Duration(seconds: 600))
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  final zeniqSmartRpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
  test('ZeniqSmartChain Fetching rejectWallet', () async {
    final zscTransactions =
        await zeniqSmartRpcInterface.fetchAllTransactionsZSC(
      address: rejectEVM,
    );

    expect(zscTransactions.length, greaterThanOrEqualTo(1000));
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

    expect(avinocZSCTransactions.length, greaterThanOrEqualTo(181));
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
      expect(zscTransactions.length, greaterThanOrEqualTo(1000));
      set = {...set, ...zscTransactions.toSet()};
      expect(set.length, zscTransactions.length);
    }
  });

  test('fetch Staking ZEN721 transfers', () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
    final txs = await rpcInterface.fetchZEN721Transfers(
      nftContractAddress: smartChainStakingContract,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(
      txs.length,
      greaterThanOrEqualTo(109),
    ); // May Fail if NFTs are send inbetween test wallets
  });

  test('fetch AVINOC ZSC transfers', () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
    final txs = await rpcInterface.fetchZEN20Transfers(
      token: avinocZSC,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(txs.length, greaterThanOrEqualTo(181));
  });

  test('fetch TUPAN transfers', () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
    final txs = await rpcInterface.fetchZEN20Transfers(
      token: tupanToken,
      address: "0x05870f1507d820212E921e1f39f14660336231D1",
    );
    expect(txs.length, greaterThanOrEqualTo(103));
  });

  test('estimate Gas Limit', () async {
    final rpcInterface = EvmRpcInterface(ZeniqSmartNetwork);

    final data = erc20TransferSig +
        spoilEVM.substring(2).padLeft(64, '0') +
        BigInt.from(0).toHex.padLeft(64, '0');

    final gasLimit = await rpcInterface.client.estimateGasFee(
      from: rejectEVM,
      to: avinocZSC.contractAddress,
      data: data,
    );

    expect(gasLimit, greaterThanOrEqualTo(GasLimits.ethSend.value.toBigInt));
  });
}
