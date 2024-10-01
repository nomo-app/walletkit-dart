@Timeout(Duration(seconds: 600))

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';

void main() {
  test(
    "Eth RPC",
    () async {
      final ethereumRPC = EvmRpcInterface(
        type: EthereumNetwork,
        useQueuedManager: true,
        awaitRefresh: true,
        clients: [
          EvmRpcClient('https://rpc.notadegen.com/eth'), // Could be not working
          EvmRpcClient(
              'https://rpc.notadegen.com/asdasdasda'), // Definitely not working
          EvmRpcClient('https://eth.llamarpc.com'),
          EvmRpcClient('https://rpc.ankr.com/eth'),
        ],
      );

      try {
        final block = await ethereumRPC.getBlockNumber();
        expect(block, greaterThan(20764294));
        print(block);
      } catch (e) {
        print(e);
      }
    },
  );

  test('ZeniqSmartChain Fetching rejectWallet', () async {
    final zscBalance = await zeniqSmartChainRPC.fetchBalance(
      address: rejectEVM,
    );

    print('ZSC Balance: $zscBalance');

    final avinocZSCBalance = await zeniqSmartChainRPC.fetchTokenBalance(
      rejectEVM,
      avinocZSC,
    );

    print('AVINOC ZSC Balance: $avinocZSCBalance');
  });

  test('estimate Gas Limit', () async {
    var data = erc20TransferSig +
        spoilEVM.substring(2).padLeft(64, '0') +
        BigInt.from(0).toHex.padLeft(64, '0');

    var gasLimit = await zeniqSmartChainRPC.estimateGasLimit(
      sender: rejectEVM,
      recipient: avinocZSC.contractAddress,
      gasPrice: null,
      value: BigInt.zero,
      data: data.hexToBytes,
    );

    expect(gasLimit, greaterThanOrEqualTo(GasLimits.ethSend.value));

    data = "Test memo";

    gasLimit = await zeniqSmartChainRPC.estimateGasLimit(
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

  // TODO: Add API Key & Change RPC
  // test('Optimism Test', () async {
  //   final balance = await optimismRPC.fetchBalance(
  //     address: arbitrumTestWallet,
  //   );

  //   expect(balance.value, greaterThanOrEqualTo(BigInt.from(0)));

  //   final opBalance = await optimismRPC.fetchTokenBalance(
  //     arbitrumTestWallet,
  //     optimism,
  //   );

  //   expect(opBalance.value, greaterThanOrEqualTo(BigInt.from(0)));
  // });
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

  test('Fetch Network Fees', () async {
    final fees = await zeniqSmartChainRPC.estimateNetworkFees(
      recipient: rejectEVM,
      data: null,
      sender: rejectEVM,
      value: BigInt.one,
    );

    expect(fees, isNotNull);
    expect(fees.$1.value, equals(BigInt.from(10000000000))); // 10 Gwei
    expect(fees.$2, greaterThanOrEqualTo(21000));
  });
}
