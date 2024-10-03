import 'dart:typed_data';

import 'package:walletkit_dart/walletkit_dart.dart';

final zeniqswap_v2_router_abi = ContractABI.fromAbi('''
[
   {
      "type":"constructor",
      "stateMutability":"nonpayable",
      "inputs":[
         {
            "type":"address",
            "name":"_factory",
            "internalType":"address"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountA",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountB",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"liquidity",
            "internalType":"uint256"
         }
      ],
      "name":"addLiquidity",
      "inputs":[
         {
            "type":"address",
            "name":"tokenA",
            "internalType":"address"
         },
         {
            "type":"address",
            "name":"tokenB",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"amountADesired",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountBDesired",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountAMin",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountBMin",
            "internalType":"uint256"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"view",
      "outputs":[
         {
            "type":"address",
            "name":"",
            "internalType":"address"
         }
      ],
      "name":"factory",
      "inputs":[
         
      ]
   },
   {
      "type":"function",
      "stateMutability":"pure",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountIn",
            "internalType":"uint256"
         }
      ],
      "name":"getAmountIn",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountOut",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveIn",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveOut",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"pure",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountOut",
            "internalType":"uint256"
         }
      ],
      "name":"getAmountOut",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountIn",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveIn",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveOut",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"view",
      "outputs":[
         {
            "type":"uint256[]",
            "name":"amounts",
            "internalType":"uint256[]"
         }
      ],
      "name":"getAmountsIn",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountOut",
            "internalType":"uint256"
         },
         {
            "type":"address[]",
            "name":"path",
            "internalType":"address[]"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"view",
      "outputs":[
         {
            "type":"uint256[]",
            "name":"amounts",
            "internalType":"uint256[]"
         }
      ],
      "name":"getAmountsOut",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountIn",
            "internalType":"uint256"
         },
         {
            "type":"address[]",
            "name":"path",
            "internalType":"address[]"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"pure",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountB",
            "internalType":"uint256"
         }
      ],
      "name":"quote",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountA",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveA",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"reserveB",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountA",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountB",
            "internalType":"uint256"
         }
      ],
      "name":"removeLiquidity",
      "inputs":[
         {
            "type":"address",
            "name":"tokenA",
            "internalType":"address"
         },
         {
            "type":"address",
            "name":"tokenB",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"liquidity",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountAMin",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountBMin",
            "internalType":"uint256"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"uint256",
            "name":"amountA",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountB",
            "internalType":"uint256"
         }
      ],
      "name":"removeLiquidityWithPermit",
      "inputs":[
         {
            "type":"address",
            "name":"tokenA",
            "internalType":"address"
         },
         {
            "type":"address",
            "name":"tokenB",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"liquidity",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountAMin",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountBMin",
            "internalType":"uint256"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         },
         {
            "type":"bool",
            "name":"approveMax",
            "internalType":"bool"
         },
         {
            "type":"uint8",
            "name":"v",
            "internalType":"uint8"
         },
         {
            "type":"bytes32",
            "name":"r",
            "internalType":"bytes32"
         },
         {
            "type":"bytes32",
            "name":"s",
            "internalType":"bytes32"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"uint256[]",
            "name":"amounts",
            "internalType":"uint256[]"
         }
      ],
      "name":"swapExactTokensForTokens",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountIn",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountOutMin",
            "internalType":"uint256"
         },
         {
            "type":"address[]",
            "name":"path",
            "internalType":"address[]"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         
      ],
      "name":"swapExactTokensForTokensSupportingFeeOnTransferTokens",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountIn",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountOutMin",
            "internalType":"uint256"
         },
         {
            "type":"address[]",
            "name":"path",
            "internalType":"address[]"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"uint256[]",
            "name":"amounts",
            "internalType":"uint256[]"
         }
      ],
      "name":"swapTokensForExactTokens",
      "inputs":[
         {
            "type":"uint256",
            "name":"amountOut",
            "internalType":"uint256"
         },
         {
            "type":"uint256",
            "name":"amountInMax",
            "internalType":"uint256"
         },
         {
            "type":"address[]",
            "name":"path",
            "internalType":"address[]"
         },
         {
            "type":"address",
            "name":"to",
            "internalType":"address"
         },
         {
            "type":"uint256",
            "name":"deadline",
            "internalType":"uint256"
         }
      ]
   }
]
''');

class ZeniqswapV2Router extends InternalContract {
  ZeniqswapV2Router({
    required super.rpc,
    required super.contractAddress,
  }) : super(
          abi: uniswap_v2_router_abi,
        );

  Future<List<BigInt>> getAmountsOut({
    required BigInt amountIn,
    required List<String> path,
  }) async {
    final function = abi.getFunction("getAmountsOut")!;

    final result = await read(
      function: function.addValues(values: [amountIn, path]),
    );

    return [
      for (final r in result.outputs.first.value) r as BigInt,
    ];
  }

  Future<List<BigInt>> getAmountsIn({
    required BigInt amountOut,
    required List<String> path,
  }) async {
    final function = abi.getFunction("getAmountsIn")!;

    final result = await read(
      function: function.addValues(values: [amountOut, path]),
    );

    return [
      for (final r in result.outputs.first.value) r as BigInt,
    ];
  }

  Future<String> swapExactEthForTokens({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
    EvmFeeInformation? feeInformation,
  }) async {
    final function = abi.getFunction("swapExactETHForTokens")!;

    final result = await interact(
      seed: seed,
      value: amountIn,
      function: function.addValues(values: [amountOutMin, path, to, deadline]),
      sender: sender,
      feeInfo: feeInformation,
    );

    return result;
  }

  Future<RawEvmTransaction> swapExactEthForTokensTransaction({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
    EvmFeeInformation? feeInformation,
  }) async {
    final function = abi.getFunction("swapExactETHForTokens")!;

    final result = await buildTransactionForFunction(
      value: amountIn,
      function: function.addValues(values: [amountOutMin, path, to, deadline]),
      sender: sender,
      feeInfo: feeInformation,
    );

    return result;
  }

  Future<String> swapExactTokensForEth({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
  }) async {
    final function = abi.getFunction("swapExactTokensForETH")!;

    final result = await interact(
      seed: seed,
      sender: sender,
      function: function
          .addValues(values: [amountIn, amountOutMin, path, to, deadline]),
    );

    return result;
  }

  Future<RawEvmTransaction> swapExactTokensForEthTx({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("swapExactTokensForETH")!;

    final result = await buildTransactionForFunction(
      sender: sender,
      function: function
          .addValues(values: [amountIn, amountOutMin, path, to, deadline]),
    );

    return result;
  }

  Future<String> swapExactTokenForTokens({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
  }) async {
    final function = abi.getFunction("swapExactTokensForTokens")!;

    final result = await interact(
      seed: seed,
      sender: sender,
      function: function
          .addValues(values: [amountIn, amountOutMin, path, to, deadline]),
    );

    return result;
  }

  Future<RawEvmTransaction> swapExactTokenForTokensTx({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("swapExactTokensForTokens")!;

    final result = await buildTransactionForFunction(
      sender: sender,
      function: function
          .addValues(values: [amountIn, amountOutMin, path, to, deadline]),
    );

    return result;
  }

  Future<String> swapEthForExactTokens({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
  }) async {
    final function = abi.getFunction("swapETHForExactTokens")!;

    final result = await interact(
      seed: seed,
      sender: sender,
      function: function.addValues(values: [amountOut, path, to, deadline]),
      value: amountInMax,
    );

    return result;
  }

  Future<RawEvmTransaction> swapEthForExactTokensTx({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("swapETHForExactTokens")!;

    final result = await buildTransactionForFunction(
      sender: sender,
      function: function.addValues(values: [amountOut, path, to, deadline]),
      value: amountInMax,
    );

    return result;
  }

  Future<String> swapTokenForExactEth({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
  }) async {
    final function = abi.getFunction("swapTokensForExactETH")!;

    final result = await interact(
      seed: seed,
      sender: sender,
      function: function
          .addValues(values: [amountOut, amountInMax, path, to, deadline]),
    );

    return result;
  }

  Future<RawEvmTransaction> swapTokenForExactEthTx({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("swapTokensForExactETH")!;

    final result = await buildTransactionForFunction(
      sender: sender,
      function: function
          .addValues(values: [amountOut, amountInMax, path, to, deadline]),
    );

    return result;
  }

  Future<String> swapTokenForExactTokens({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required Uint8List seed,
    required String sender,
  }) async {
    final function = abi.getFunction("swapTokensForExactTokens")!;

    final result = await interact(
      seed: seed,
      sender: sender,
      function: function
          .addValues(values: [amountOut, amountInMax, path, to, deadline]),
    );

    return result;
  }

  Future<RawEvmTransaction> swapTokenForExactTokensTx({
    required BigInt amountOut,
    required BigInt amountInMax,
    required List<String> path,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("swapTokensForExactTokens")!;

    final result = await buildTransactionForFunction(
      sender: sender,
      function: function
          .addValues(values: [amountOut, amountInMax, path, to, deadline]),
    );

    return result;
  }

  Future<BigInt> quote({
    required BigInt amountA,
    required BigInt reserveA,
    required BigInt reserveB,
  }) async {
    final function = abi.getFunction("quote")!;

    final result = await read(
      function: function.addValues(values: [
        amountA,
        reserveA,
        reserveB,
      ]),
    );

    return result.outputs.first.value as BigInt;
  }

  Future<RawEvmTransaction> addLiquidityTx({
    required String tokenA,
    required String tokenB,
    required BigInt amountADesired,
    required BigInt amountBDesired,
    required BigInt amountAMin,
    required BigInt amountBMin,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("addLiquidity")!;
    final result = await buildTransactionForFunction(
      sender: sender,
      function: function.addValues(values: [
        tokenA,
        tokenB,
        amountADesired,
        amountBDesired,
        amountAMin,
        amountBMin,
        to,
        deadline,
      ]),
    );
    return result;
  }

  Future<RawEvmTransaction> removeLiquidityTx({
    required String tokenA,
    required String tokenB,
    required BigInt liquidity,
    required BigInt amountAMin,
    required BigInt amountBMin,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("removeLiquidity")!;
    final result = await buildTransactionForFunction(
      sender: sender,
      function: function.addValues(values: [
        tokenA,
        tokenB,
        liquidity,
        amountAMin,
        amountBMin,
        to,
        deadline,
      ]),
    );
    return result;
  }
}
