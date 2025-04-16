// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ContractGenerator
// **************************************************************************

// Generated code - do not modify by hand
// ignore_for_file: type=lint

part of 'erc721_contract.dart';

// Contract ABI definition
final erc721contract_abi = ContractABI.fromAbi('''[
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "approved",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "tokenId",
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
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "bool",
          "name": "approved",
          "type": "bool"
        }
      ],
      "name": "ApprovalForAll",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "approve",
      "outputs": [],
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
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "balance",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "getApproved",
      "outputs": [
        {
          "internalType": "address",
          "name": "operator",
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
          "name": "owner",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        }
      ],
      "name": "isApprovedForAll",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "name",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "ownerOf",
      "outputs": [
        {
          "internalType": "address",
          "name": "owner",
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
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "safeTransferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        },
        {
          "internalType": "bytes",
          "name": "data",
          "type": "bytes"
        }
      ],
      "name": "safeTransferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
        {
          "internalType": "bool",
          "name": "_approved",
          "type": "bool"
        }
      ],
      "name": "setApprovalForAll",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "bytes4",
          "name": "interfaceId",
          "type": "bytes4"
        }
      ],
      "name": "supportsInterface",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "symbol",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "tokenURI",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]''');

extension Erc721ContractExtension on Erc721Contract {
  Future<String> approve({
    required String to,
    required BigInt tokenId,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('approve')!;
    final result = await interact(
      function: function.addValues(values: [to, tokenId]),
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

  Future<BigInt> balanceOf({required String owner}) async {
    final function = abi.getFunction('balanceOf')!;
    final result = await readSafe(
      function: function.addValues(values: [owner]),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<String> getApproved({required BigInt tokenId}) async {
    final function = abi.getFunction('getApproved')!;
    final result = await readSafe(
      function: function.addValues(values: [tokenId]),
    );
    return result.outputs.first.value as String;
  }

  Future<bool> isApprovedForAll(
      {required String owner, required String operator}) async {
    final function = abi.getFunction('isApprovedForAll')!;
    final result = await readSafe(
      function: function.addValues(values: [owner, operator]),
    );
    return result.outputs.first.value as bool;
  }

  Future<String> name() async {
    final function = abi.getFunction('name')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as String;
  }

  Future<String> ownerOf({required BigInt tokenId}) async {
    final function = abi.getFunction('ownerOf')!;
    final result = await readSafe(
      function: function.addValues(values: [tokenId]),
    );
    return result.outputs.first.value as String;
  }

  Future<String> safeTransferFrom({
    required String from,
    required String to,
    required BigInt tokenId,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('safeTransferFrom')!;
    final result = await interact(
      function: function.addValues(values: [from, to, tokenId]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<String> setApprovalForAll({
    required String operator,
    required bool approved,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('setApprovalForAll')!;
    final result = await interact(
      function: function.addValues(values: [operator, approved]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<bool> supportsInterface({required Uint8List interfaceId}) async {
    final function = abi.getFunction('supportsInterface')!;
    final result = await readSafe(
      function: function.addValues(values: [interfaceId]),
    );
    return result.outputs.first.value as bool;
  }

  Future<String> symbol() async {
    final function = abi.getFunction('symbol')!;
    final result = await readSafe(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as String;
  }

  Future<String> tokenURI({required BigInt tokenId}) async {
    final function = abi.getFunction('tokenURI')!;
    final result = await readSafe(
      function: function.addValues(values: [tokenId]),
    );
    return result.outputs.first.value as String;
  }

  Future<String> transferFrom({
    required String from,
    required String to,
    required BigInt tokenId,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('transferFrom')!;
    final result = await interact(
      function: function.addValues(values: [from, to, tokenId]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }
}
