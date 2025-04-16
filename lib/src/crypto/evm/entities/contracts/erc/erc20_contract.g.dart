// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ContractGenerator
// **************************************************************************

// Generated code - do not modify by hand
// ignore_for_file: type=lint

part of 'erc20_contract.dart';

// Contract ABI definition
final erc20contract_abi = ContractABI.fromAbi('''[
    {
      "constant": true,
      "inputs": [],
      "name": "name",
      "outputs": [
        {
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "_spender",
          "type": "address"
        },
        {
          "name": "_value",
          "type": "uint256"
        }
      ],
      "name": "approve",
      "outputs": [
        {
          "name": "",
          "type": "bool"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "totalSupply",
      "outputs": [
        {
          "name": "",
          "type": "uint256"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "_from",
          "type": "address"
        },
        {
          "name": "_to",
          "type": "address"
        },
        {
          "name": "_value",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [
        {
          "name": "",
          "type": "bool"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "decimals",
      "outputs": [
        {
          "name": "",
          "type": "uint8"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "_owner",
          "type": "address"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "name": "balance",
          "type": "uint256"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "symbol",
      "outputs": [
        {
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "_to",
          "type": "address"
        },
        {
          "name": "_value",
          "type": "uint256"
        }
      ],
      "name": "transfer",
      "outputs": [
        {
          "name": "",
          "type": "bool"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "_owner",
          "type": "address"
        },
        {
          "name": "_spender",
          "type": "address"
        }
      ],
      "name": "allowance",
      "outputs": [
        {
          "name": "",
          "type": "uint256"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "payable": true,
      "stateMutability": "payable",
      "type": "fallback"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "name": "spender",
          "type": "address"
        },
        {
          "indexed": false,
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Approval",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "name": "from",
          "type": "address"
        },
        {
          "indexed": true,
          "name": "to",
          "type": "address"
        },
        {
          "indexed": false,
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
    }
  ]''');

extension ERC20ContractExtension on ERC20Contract {
  Future<String> name() async {
    final function = abi.getFunction('name')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as String;
  }

  Future<String> approve({
    required String spender,
    required BigInt value,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('approve')!;
    final result = await interact(
      function: function.addValues(values: [spender, value]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<BigInt> totalSupply() async {
    final function = abi.getFunction('totalSupply')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<String> transferFrom({
    required String from,
    required String to,
    required BigInt value,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('transferFrom')!;
    final result = await interact(
      function: function.addValues(values: [from, to, value]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<BigInt> decimals() async {
    final function = abi.getFunction('decimals')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<BigInt> balanceOf({required String owner}) async {
    final function = abi.getFunction('balanceOf')!;
    final result = await readSafe(
      function: function.addValues(values: [owner]),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<String> symbol() async {
    final function = abi.getFunction('symbol')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as String;
  }

  Future<String> transfer({
    required String to,
    required BigInt value,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('transfer')!;
    final result = await interact(
      function: function.addValues(values: [to, value]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<BigInt> allowance(
      {required String owner, required String spender}) async {
    final function = abi.getFunction('allowance')!;
    final result = await readSafe(
      function: function.addValues(values: [owner, spender]),
    );
    return result.outputs.first.value as BigInt;
  }
}
