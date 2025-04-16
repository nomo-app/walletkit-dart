// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ContractGenerator
// **************************************************************************

// Generated code - do not modify by hand
// ignore_for_file: type=lint

part of 'erc1155_contract.dart';

// Contract ABI definition
final erc1155contract_abi = ContractABI.fromAbi('''[
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "account",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address[]",
          "name": "accounts",
          "type": "address[]"
        },
        {
          "internalType": "uint256[]",
          "name": "ids",
          "type": "uint256[]"
        }
      ],
      "name": "balanceOfBatch",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "account",
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
          "internalType": "uint256[]",
          "name": "ids",
          "type": "uint256[]"
        },
        {
          "internalType": "uint256[]",
          "name": "amounts",
          "type": "uint256[]"
        },
        {
          "internalType": "bytes",
          "name": "data",
          "type": "bytes"
        }
      ],
      "name": "safeBatchTransferFrom",
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
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "amount",
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
          "name": "approved",
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
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "uri",
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
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "account",
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
          "name": "operator",
          "type": "address"
        },
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
          "indexed": false,
          "internalType": "uint256[]",
          "name": "ids",
          "type": "uint256[]"
        },
        {
          "indexed": false,
          "internalType": "uint256[]",
          "name": "values",
          "type": "uint256[]"
        }
      ],
      "name": "TransferBatch",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
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
          "indexed": false,
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "TransferSingle",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "string",
          "name": "value",
          "type": "string"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "URI",
      "type": "event"
    }
  ]
  ''');

extension ERC1155ContractExtension on ERC1155Contract {
  Future<BigInt> balanceOf(
      {required String account, required BigInt id}) async {
    final function = abi.getFunction('balanceOf')!;
    final result = await readSafe(
      function: function.addValues(values: [account, id]),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<List<BigInt>> balanceOfBatch(
      {required List<String> accounts, required List<BigInt> ids}) async {
    final function = abi.getFunction('balanceOfBatch')!;
    final result = await readSafe(
      function: function.addValues(values: [accounts, ids]),
    );
    return result.outputs.first.value as List<BigInt>;
  }

  Future<bool> isApprovedForAll(
      {required String account, required String operator}) async {
    final function = abi.getFunction('isApprovedForAll')!;
    final result = await readSafe(
      function: function.addValues(values: [account, operator]),
    );
    return result.outputs.first.value as bool;
  }

  Future<String> safeBatchTransferFrom({
    required String from,
    required String to,
    required List<BigInt> ids,
    required List<BigInt> amounts,
    required Uint8List data,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('safeBatchTransferFrom')!;
    final result = await interact(
      function: function.addValues(values: [from, to, ids, amounts, data]),
      seed: seed,
      sender: sender,
      feeInfo: feeInfo,
    );
    return result;
  }

  Future<String> safeTransferFrom({
    required String from,
    required String to,
    required BigInt id,
    required BigInt amount,
    required Uint8List data,
    required String sender,
    required Uint8List seed,
    EvmFeeInformation? feeInfo,
  }) async {
    final function = abi.getFunction('safeTransferFrom')!;
    final result = await interact(
      function: function.addValues(values: [from, to, id, amount, data]),
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

  Future<String> uri({required BigInt id}) async {
    final function = abi.getFunction('uri')!;
    final result = await readSafe(
      function: function.addValues(values: [id]),
    );
    return result.outputs.first.value as String;
  }
}
