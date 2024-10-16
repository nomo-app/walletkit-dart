import 'dart:typed_data';
import 'package:walletkit_dart/walletkit_dart.dart';

final uniswap_v2_router_abi = ContractABI.fromAbi("""
[
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_factory",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "_WETH",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "inputs": [],
      "name": "WETH",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "tokenA",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "tokenB",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "amountADesired",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountBDesired",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountAMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountBMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "addLiquidity",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountA",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountB",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenDesired",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETHMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "addLiquidityETH",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountToken",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETH",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        }
      ],
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "factory",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveOut",
          "type": "uint256"
        }
      ],
      "name": "getAmountIn",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        }
      ],
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveOut",
          "type": "uint256"
        }
      ],
      "name": "getAmountOut",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        }
      ],
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        }
      ],
      "name": "getAmountsIn",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        }
      ],
      "name": "getAmountsOut",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountA",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveA",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "reserveB",
          "type": "uint256"
        }
      ],
      "name": "quote",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountB",
          "type": "uint256"
        }
      ],
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "tokenA",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "tokenB",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountAMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountBMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "removeLiquidity",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountA",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountB",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETHMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "removeLiquidityETH",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountToken",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETH",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETHMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "removeLiquidityETHSupportingFeeOnTransferTokens",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountETH",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETHMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        },
        {
          "internalType": "bool",
          "name": "approveMax",
          "type": "bool"
        },
        {
          "internalType": "uint8",
          "name": "v",
          "type": "uint8"
        },
        {
          "internalType": "bytes32",
          "name": "r",
          "type": "bytes32"
        },
        {
          "internalType": "bytes32",
          "name": "s",
          "type": "bytes32"
        }
      ],
      "name": "removeLiquidityETHWithPermit",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountToken",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETH",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountTokenMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountETHMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        },
        {
          "internalType": "bool",
          "name": "approveMax",
          "type": "bool"
        },
        {
          "internalType": "uint8",
          "name": "v",
          "type": "uint8"
        },
        {
          "internalType": "bytes32",
          "name": "r",
          "type": "bytes32"
        },
        {
          "internalType": "bytes32",
          "name": "s",
          "type": "bytes32"
        }
      ],
      "name": "removeLiquidityETHWithPermitSupportingFeeOnTransferTokens",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountETH",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "tokenA",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "tokenB",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "liquidity",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountAMin",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountBMin",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        },
        {
          "internalType": "bool",
          "name": "approveMax",
          "type": "bool"
        },
        {
          "internalType": "uint8",
          "name": "v",
          "type": "uint8"
        },
        {
          "internalType": "bytes32",
          "name": "r",
          "type": "bytes32"
        },
        {
          "internalType": "bytes32",
          "name": "s",
          "type": "bytes32"
        }
      ],
      "name": "removeLiquidityWithPermit",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amountA",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountB",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapETHForExactTokens",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactETHForTokens",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactETHForTokensSupportingFeeOnTransferTokens",
      "outputs": [],
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactTokensForETH",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactTokensForETHSupportingFeeOnTransferTokens",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactTokensForTokens",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountIn",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountOutMin",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapExactTokensForTokensSupportingFeeOnTransferTokens",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountInMax",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapTokensForExactETH",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amountOut",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amountInMax",
          "type": "uint256"
        },
        {
          "internalType": "address[]",
          "name": "path",
          "type": "address[]"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "deadline",
          "type": "uint256"
        }
      ],
      "name": "swapTokensForExactTokens",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "stateMutability": "payable",
      "type": "receive"
    }
  ]
""");

class UniswapV2Router extends InternalContract {
  UniswapV2Router({
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

  Future<RawEvmTransaction> addLiquidityETHTx({
    required String token,
    required BigInt amountTokenDesired,
    required BigInt amountETHMin,
    required BigInt amountTokenMin,
    required String to,
    required BigInt deadline,
    required String sender,
    required BigInt amountETHDesired,
  }) async {
    final function = abi.getFunction("addLiquidityETH")!;
    final result = await buildTransactionForFunction(
      value: amountETHDesired,
      sender: sender,
      function: function.addValues(values: [
        token,
        amountTokenDesired,
        amountTokenMin,
        amountETHMin,
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

  Future<RawEvmTransaction> removeLiquidityETHTx({
    required String token,
    required BigInt liquidity,
    required BigInt amountTokenMin,
    required BigInt amountETHMin,
    required String to,
    required BigInt deadline,
    required String sender,
  }) async {
    final function = abi.getFunction("removeLiquidityETH")!;
    final result = await buildTransactionForFunction(
      sender: sender,
      function: function.addValues(values: [
        token,
        liquidity,
        amountTokenMin,
        amountETHMin,
        to,
        deadline,
      ]),
    );
    return result;
  }
}
