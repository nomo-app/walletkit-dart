// Generated code, do not modify. Run `build_runner build` to re-generate!

import 'package:web3dart/web3dart.dart';

export 'package:web3dart/web3dart.dart' show EthereumAddress;

final contractAbiErc20 = ContractAbi.fromJson(
  '''[
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
 ''',
  'Token',
);

class ERC20Contract extends GeneratedContract {
  ERC20Contract({
    required EthereumAddress address,
    required Web3Client client,
    int? chainId,
  }) : super(DeployedContract(contractAbiErc20, address), client, chainId);

  Future<String> sendToken(
    EthereumAddress receiver,
    BigInt amount, {
    required Credentials credentials,
    Transaction? transaction,
  }) async {
    final function = self.abi.functions[7];
    // assert(checkSignature(function, '90b98a11'));
    final params = [receiver, amount];
    return write(credentials, transaction, function, params);
  }

  Future<BigInt> getBalance(
    String addr, {
    BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[5];

    assert(checkSignature(function, '70a08231'));
    final params = [EthereumAddress.fromHex(addr)];

    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  Future<String> getName() async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, '06fdde03'));
    final response = await read(function, [], null);
    return (response[0] as String);
  }

  Future<String> getSymbol() async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '95d89b41'));
    final response = await read(function, [], null);
    return (response[0] as String);
  }

  Future<double> getSupply() async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '18160ddd'));
    final response = await read(function, [], null);
    return (response[0] as BigInt).toDouble();
  }

  Future<int> getDecimals() async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '313ce567'));
    final response = await read(function, [], null);
    return (response[0] as BigInt).toInt();
  }

  Future<BigInt> balanceOf({required String address}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '70a08231'));
    final params = [EthereumAddress.fromHex(address)];
    final response = await read(function, params, null);

    return (response[0] as BigInt);
  }

  Future<BigInt> allowance({
    required String owner,
    required String spender,
  }) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'dd62ed3e'));
    final params = [
      EthereumAddress.fromHex(owner),
      EthereumAddress.fromHex(spender)
    ];
    final response = await read(function, params, null);

    return (response[0] as BigInt);
  }

  Future<String> approve(
    String spender,
    BigInt amount, {
    required Credentials credentials,
    Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '095ea7b3'));
    final params = [EthereumAddress.fromHex(spender), amount];
    return write(credentials, transaction, function, params);
  }
}
