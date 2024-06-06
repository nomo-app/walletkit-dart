import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../utils.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc20_contract_without_web3.dart'
    as erc;

void main() {
  const contractAbiString = '''[
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
]''';
  final arbitrumRPC = EvmRpcInterface(ArbitrumNetwork);
  final testSeed = loadFromEnv("DEV_SEED");

  final ercContract = erc.ERC20Contract(
    contractAddress: arbitrum.contractAddress,
    seed: testSeed,
    client: arbitrumRPC.client,
  );
  test('Test to create Contract from Json', () async {
    final contract = Contract.fromAbi(contractAbiString);
    final transferFunction =
        contract.functions.firstWhere((element) => element.name == 'transfer');

    expect(transferFunction.name, "transfer");
    expect(transferFunction.parameters.length, 2);
    expect(transferFunction.stateMutability, "nonpayable");
  });

  test('Contract Interaction', () async {
    final intent = TransferIntent(
      recipient: arbitrumTestWallet,
      amount: Amount.convert(value: 10, decimals: 18),
      feeInfo: null,
      token: arbitrum,
      memo: null,
    );

    final hash = await arbitrumRPC.sendERC20Token(
      intent: intent,
      from: arbitrumTestWallet,
      seed: testSeed,
    );
    print("hash : $hash");
  });
  test('Fetch Balance', () async {
    final balance = await ercContract.getBalance(
      arbitrumTestWallet,
    );
    print("Balance : $balance");
  });
  test('Fetch Name', () async {
    final response = await ercContract.getName();
    final encoded = hex.decode(response.substring(2));
    final name = decodeString(Uint8List.fromList(encoded));
    expect(name, "Arbitrum");
  });
  test('Fetch Symbol', () async {
    final response = await ercContract.getSymbol();
    final encoded = hex.decode(response.substring(2));
    final symbol = decodeString(Uint8List.fromList(encoded));
    expect(symbol, "ARB");
  });
  test('Fetch Supply', () async {
    final supply = await ercContract.getSupply();
    expect(supply.toString(), "9999999998999999999999999996");
  });
  test('Fetch Decimals', () async {
    final decimals = await ercContract.getDecimals();
    expect(decimals, 18);
  });

  test('Fetch BalanceOf', () async {
    final balance = await ercContract.balanceOf(address: arbitrumTestWallet);
    print("Balance : $balance");
  });

  test('Fetch Allowance', () async {
    final allowance = await ercContract.allowance(
      owner: arbitrumTestWallet,
      spender: arbitrum.contractAddress,
    );
    print("Allowance : $allowance");
  });
}
