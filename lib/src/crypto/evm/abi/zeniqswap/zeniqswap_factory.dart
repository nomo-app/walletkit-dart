import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:web3dart/web3dart.dart';

final _abi = """
[
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_feeToSetter",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "_WZENIQ",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "token0",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "token1",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "address",
          "name": "pair",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "name": "PairCreated",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "WZENIQ",
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
          "name": "",
          "type": "uint256"
        }
      ],
      "name": "allPairs",
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
      "inputs": [],
      "name": "allPairsLength",
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
          "internalType": "address",
          "name": "tokenA",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "tokenB",
          "type": "address"
        }
      ],
      "name": "createPair",
      "outputs": [
        {
          "internalType": "address",
          "name": "pair",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "feeTo",
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
      "inputs": [],
      "name": "feeToSetter",
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
          "name": "",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "getPair",
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
          "name": "_feeTo",
          "type": "address"
        }
      ],
      "name": "setFeeTo",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_feeToSetter",
          "type": "address"
        }
      ],
      "name": "setFeeToSetter",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]
""";

final zeniqSwapFactoryContract = DeployedContract(
  ContractAbi.fromJson(_abi, "ZeniqSwapFactory"),
  EthereumAddress.fromHex(
    "0x7D0cbcE25EaaB8D5434a53fB3B42077034a9bB99",
  ),
);

class ZeniqSmartChainContract extends GeneratedContract {
  ZeniqSmartChainContract({
    required Web3Client client,
    required DeployedContract contract,
  }) : super(
          contract,
          client,
          ZeniqSmartNetwork.chainId,
        );
}

class ZeniqSwapFactoryContract extends ZeniqSmartChainContract {
  ZeniqSwapFactoryContract({
    required super.client,
  }) : super(
          contract: zeniqSwapFactoryContract,
        );

  Future<dynamic> getPairs(BigInt i) async {
    final function = self.abi.functions[2];

    return read(function, [i], null);
  }

  Future<dynamic> allPairsLength() async {
    final function = self.abi.functions[3];

    return read(function, [], null);
  }

  Future<String?> getPair(String tokenA, String tokenB) async {
    final function = self.abi.functions[7];

    final result = await read(
      function,
      [
        EthereumAddress.fromHex(tokenA),
        EthereumAddress.fromHex(tokenB),
      ],
      null,
    );

    final hex = (result.first as EthereumAddress).hex;
    if (hex == "0x0000000000000000000000000000000000000000") {
      return null;
    }

    return hex;
  }
}

// void main(List<String> args) async {
//   final rpc = EvmRpcInterface(ZeniqSmartNetwork);

//   final factory = ZeniqSwapFactoryContract(client: rpc.client.asWeb3);

//   final allPairs = await factory.getPairs(BigInt.zero);

//   print(allPairs);

//   final length = await factory.allPairsLength();

//   print(length);

//   final pair = await factory.getPair(
//     wrappedZeniqSmart.contractAddress,
//     avinocZSC.contractAddress,
//   );

//   print(pair);
// }
