import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:walletkit_dart/src/crypto/evm/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_function_encoding.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final contractAbiErc20 = ContractABI.fromAbi('''[
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
]
 ''');

class ERC20Contract extends InternalContract {
  ERC20Contract({
    required super.contractAddress,
    required super.rpc,
  }) : super(
          abi: contractAbiErc20,
        );

  Future<String> transfer({
    required String sender,
    required String to,
    required BigInt value,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.functions[7];
    assert(function.functionSelectorHex == "a9059cbb");
    return await interact(
      function: function.addValues(values: [to, value]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
  }

  Future<String> approve({
    required String sender,
    required String spender,
    required BigInt value,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.functions[1];
    assert(function.functionSelectorHex == "095ea7b3");

    return await interact(
      function: function.addValues(values: [spender, value]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
  }

  Future<BigInt> getBalance(String address, {BlockNum? atBlock}) async {
    final function = abi.functions[5];
    assert(function.functionSelectorHex == "70a08231");

    final response = await read(
      function: function.addValues(values: [address]),
      atBlock: atBlock,
    );
    return response.toBigInt;
  }

  Future<String> getName() async {
    final function = abi.functions[0];
    assert(function.functionSelectorHex == "06fdde03");

    final response = await read(
      function: function.addValues(values: []),
    );
    final encoded = hex.decode(response.substring(2));
    final name = decodeString(Uint8List.fromList(encoded));
    return name;
  }

  Future<String> getSymbol() async {
    final function = abi.functions[6];
    assert(function.functionSelectorHex == "95d89b41");
    final response = await read(
      function: function.addValues(values: []),
    );

    final encoded = hex.decode(response.substring(2));
    final symbol = decodeString(Uint8List.fromList(encoded));
    return symbol;
  }

  Future<BigInt> getSupply() async {
    final function = abi.functions[2];
    assert(function.functionSelectorHex == "18160ddd");
    final response = await read(
      function: function.addValues(values: []),
    );
    return response.toBigInt;
  }

  Future<int> getDecimals() async {
    final function = abi.functions[4];
    assert(function.functionSelectorHex == "313ce567");
    final response = await read(
      function: function.addValues(values: []),
    );
    return response.toBigInt.toInt();
  }

  Future<BigInt> balanceOf({required String address}) async {
    final function = abi.functions[5];
    assert(function.functionSelectorHex == "70a08231");
    final response = await read(
      function: function.addValues(values: []),
    );
    return response.toBigInt;
  }

  Future<BigInt> allowance({
    required String owner,
    required String spender,
  }) async {
    final function = abi.functions[8];
    assert(function.functionSelectorHex == "dd62ed3e");
    final response = await read(
      function: function.addValues(values: []),
    );
    return response.toBigInt;
  }
}
