import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/credentials.dart';

import 'utils.dart';

void main() {
  test('Get Pair', () async {
    final rpc = EvmRpcInterface(ZeniqSmartNetwork);

    final factory = ZeniqSwapFactoryContract(client: rpc.client.asWeb3);

    final pair = await factory.getPair(
      avinocZSC.contractAddress,
      wrappedZeniqSmart.contractAddress,
    );

    print(pair);
  });

  test('SWAP Zeniq to Token', () async {
    final devSeed = loadDevSeedFromEnv();
    final credentials = getETHCredentials(seed: devSeed);
    final rpc = EvmRpcInterface(ZeniqSmartNetwork);
    final zeniqSwapRouter = ZeniqSwapRouter(client: rpc.client.asWeb3);

    final pair = ZeniqSwapPairContract(
      client: rpc.client.asWeb3,
      pair: wZeniqAvinocPair,
    );

    final token0 = await pair.token0();

    print(token0);

    final token1 = await pair.token1();

    print(token1);

    final reserves = await pair.getReserves();

    final amountIn = Amount.convert(value: 1, decimals: 18).value;

    final amountOut = await zeniqSwapRouter.getAmountOut(
      amountIn: amountIn,
      reserveIn: reserves.$1,
      reserveOut: reserves.$2,
    );

    /// 0.5% slippage
    final amountOutMIn = (amountOut * 995.toBigInt) ~/ 1000.toBigInt;

    print(amountOut);

    final am = Amount(value: amountOutMIn, decimals: 18);

    print(am.displayDouble);

    final deadline = DateTime.now().millisecondsSinceEpoch.toBigInt;

    final swapResult = await zeniqSwapRouter.swapExactEthForTokens(
      amountIn: amountIn,
      amountOutMin: amountOutMIn,
      path: [
        token0,
        token1,
      ],
      to: credentials.address.hex,
      deadline: deadline,
      credentials: credentials,
    );

    print(swapResult);
  });

  test('SWAP Token to Zeniq', () async {
    final devSeed = loadDevSeedFromEnv();
    final credentials = getETHCredentials(seed: devSeed);
    final rpc = EvmRpcInterface(ZeniqSmartNetwork);
    final zeniqSwapRouter = ZeniqSwapRouter(client: rpc.client.asWeb3);

    final pair = ZeniqSwapPairContract(
      client: rpc.client.asWeb3,
      pair: wZeniqAvinocPair,
    );

    final token0 = await pair.token0();

    print(token0);

    final token1 = await pair.token1();

    print(token1);

    final reserves = await pair.getReserves();

    final amountIn = Amount.convert(value: 1, decimals: 18).value;

    /// Request Spending Approval for AmountIn
    final erc20Contract = ERC20Contract(
      client: rpc.client.asWeb3,
      address: EthereumAddress.fromHex(token1),
    );

    final allowance = await erc20Contract.allowance(
      owner: credentials.address.hex,
      spender: zeniqSwapRouter.self.address.hex,
    );

    print(allowance);

    final r = await erc20Contract.approve(
      zeniqSwapRouter.self.address.hex,
      amountIn,
      credentials: credentials,
    );
    print(r);

    final amountOut = await zeniqSwapRouter.getAmountOut(
      amountIn: amountIn,
      reserveIn: reserves.$2,
      reserveOut: reserves.$1,
    );

    // 0.5% slippage
    final amountOutMin = (amountOut * 995.toBigInt) ~/ 1000.toBigInt;

    print(amountOut);

    final am = Amount(value: amountOutMin, decimals: 18);

    print(am.displayDouble);

    final deadline = DateTime.now().millisecondsSinceEpoch.toBigInt;

    final swapResult = await zeniqSwapRouter.swapExactTokensForEth(
      amountIn: amountIn,
      amountOutMin: amountOutMin,
      path: [
        token1, // Contract Address From
        token0, // Contract Address To
      ],
      to: credentials.address.hex,
      deadline: deadline,
      credentials: credentials,
    );

    print(swapResult);
  });

  test('Swap Token to Token', () async {
    final devSeed = loadDevSeedFromEnv();
    final credentials = getETHCredentials(seed: devSeed);
    final rpc = EvmRpcInterface(ZeniqSmartNetwork);
    final zeniqSwapRouter = ZeniqSwapRouter(client: rpc.client.asWeb3);

    final token0 = avinocZSC;
    final token1 = tupanToken;

    final exactInput = Amount.convert(value: 1, decimals: token0.decimals);

    final token0ERC20 = ERC20Contract(
      client: rpc.client.asWeb3,
      address: EthereumAddress.fromHex(token0.contractAddress),
    );

    final allowance = await token0ERC20.allowance(
      owner: credentials.address.hex,
      spender: zeniqSwapRouter.self.address.hex,
    );

    print(allowance);

    if (allowance < exactInput.value) {
      final r = await token0ERC20.approve(
        zeniqSwapRouter.self.address.hex,
        exactInput.value,
        credentials: credentials,
      );

      print(r);
    }

    final outputs = await zeniqSwapRouter.getAmountsOut(
      amountIn: exactInput.value,
      path: [
        token0.contractAddress,
        wrappedZeniqSmart.contractAddress,
        token1.contractAddress
      ],
    );

    print(outputs);

    final amountOut = outputs.last;

    // 0.5% slippage
    final amountOutMin = (amountOut * 995.toBigInt) ~/ 1000.toBigInt;

    final deadline = DateTime.now().millisecondsSinceEpoch.toBigInt;

    final result = await zeniqSwapRouter.swapExactTokenForTokens(
      amountIn: exactInput.value,
      amountOutMin: amountOutMin,
      path: [
        token0.contractAddress,
        wrappedZeniqSmart.contractAddress,
        token1.contractAddress
      ],
      to: credentials.address.hex,
      deadline: deadline,
      credentials: credentials,
    );

    print(result);
  });
}
