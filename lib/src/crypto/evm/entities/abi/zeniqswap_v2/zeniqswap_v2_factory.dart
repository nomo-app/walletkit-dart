import 'package:walletkit_dart/walletkit_dart.dart';

final zeniqswap_v2_factory_abi = ContractABI.fromAbi('''
[
   {
      "type":"constructor",
      "stateMutability":"nonpayable",
      "inputs":[
         
      ]
   },
   {
      "type":"event",
      "name":"PairCreated",
      "inputs":[
         {
            "type":"address",
            "name":"token0",
            "internalType":"address",
            "indexed":true
         },
         {
            "type":"address",
            "name":"token1",
            "internalType":"address",
            "indexed":true
         },
         {
            "type":"address",
            "name":"pair",
            "internalType":"address",
            "indexed":false
         },
         {
            "type":"uint256",
            "name":"",
            "internalType":"uint256",
            "indexed":false
         }
      ],
      "anonymous":false
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
      "name":"ZENIQ",
      "inputs":[
         
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
      "name":"allPairs",
      "inputs":[
         {
            "type":"uint256",
            "name":"",
            "internalType":"uint256"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"view",
      "outputs":[
         {
            "type":"uint256",
            "name":"",
            "internalType":"uint256"
         }
      ],
      "name":"allPairsLength",
      "inputs":[
         
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         {
            "type":"address",
            "name":"pair",
            "internalType":"address"
         }
      ],
      "name":"createPair",
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
      "name":"feeTo",
      "inputs":[
         
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
      "name":"feeToSetter",
      "inputs":[
         
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
      "name":"getPair",
      "inputs":[
         {
            "type":"address",
            "name":"",
            "internalType":"address"
         },
         {
            "type":"address",
            "name":"",
            "internalType":"address"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         
      ],
      "name":"setFeeTo",
      "inputs":[
         {
            "type":"address",
            "name":"_feeTo",
            "internalType":"address"
         }
      ]
   },
   {
      "type":"function",
      "stateMutability":"nonpayable",
      "outputs":[
         
      ],
      "name":"setFeeToSetter",
      "inputs":[
         {
            "type":"address",
            "name":"_feeToSetter",
            "internalType":"address"
         }
      ]
   }
]
''');

class ZeniqswapV2Factory extends InternalContract {
  ZeniqswapV2Factory({
    required super.contractAddress,
    required super.rpc,
  }) : super(abi: uniswap_v2_factory_abi);

  Future<String> getPair({
    required String tokenA,
    required String tokenB,
  }) async {
    final function = abi.getFunction('getPair')!;

    final result = await read(
      function: function.addValues(values: [tokenA, tokenB]),
    );

    return result.outputs.first.value as String;
  }

  Future<BigInt> allPairsLength() async {
    final function = abi.getFunction("allPairsLength")!;
    final result = await read(
      function: function.addValues(values: []),
    );
    return result.outputs.first.value as BigInt;
  }

  Future<String> allPairs(BigInt index) async {
    final function = abi.getFunction("allPairs")!;
    final result = await read(
      function: function.addValues(values: [index]),
    );
    return result.outputs.first.value as String;
  }
}
