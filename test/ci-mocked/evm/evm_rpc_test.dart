@Timeout(Duration(seconds: 600))
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockJsonRPC mockJsonRPC;
  late EvmRpcInterface evmRpcInterface;

  setUp(() {
    mockJsonRPC = MockJsonRPC();
    evmRpcInterface = EvmRpcInterface(
      type: ArbitrumNetwork,
      clients: [
        EvmRpcClient.withRPC(mockJsonRPC),
      ],
    );
    when(mockJsonRPC.call('eth_blockNumber', any))
        .thenAnswer((_) async => RPCResponse(1, "0x11114b3d"));
  });
  test('fetching balance', () async {
    when(mockJsonRPC.call('eth_getBalance', any))
        .thenAnswer((_) async => RPCResponse(1, "0x2e10ca4c6ba9bad23"));

    when(mockJsonRPC.call('eth_call', any)).thenAnswer((_) async => RPCResponse(
        1,
        "0x000000000000000000000000000000000000000000000001908fb23b90585e0c"));

    final zscBalance = await evmRpcInterface.fetchBalance(
      address: rejectEVM,
    );

    expect(zscBalance,
        Amount(value: BigInt.parse("53110005679114661155"), decimals: 18));

    final avinocZSCBalance = await evmRpcInterface.fetchTokenBalance(
      rejectEVM,
      avinocZSC,
    );

    expect(avinocZSCBalance,
        Amount(value: BigInt.parse("28863484505735323148"), decimals: 18));
  });

  test('estimate Gas Limit', () async {
    when(mockJsonRPC.call('eth_estimateGas', any))
        .thenAnswer((_) async => RPCResponse(1, "0x87dd"));

    var data = erc20TransferSig +
        spoilEVM.substring(2).padLeft(64, '0') +
        BigInt.from(0).toHex.padLeft(64, '0');

    var gasLimit = await evmRpcInterface.estimateGasLimit(
      sender: rejectEVM,
      recipient: avinocZSC.contractAddress,
      gasPrice: null,
      value: BigInt.zero,
      data: data.hexToBytes,
    );

    expect(gasLimit, greaterThanOrEqualTo(GasLimits.ethSend.value));

    data = "Test memo";

    gasLimit = await evmRpcInterface.estimateGasLimit(
      sender: rejectEVM,
      recipient: spoilEVM,
      gasPrice: null,
      value: BigInt.one,
      data: data.asUTF8,
    );

    final memoGasLimit = GasLimits.ethSend.value + 16 * data.length;

    expect(gasLimit, greaterThanOrEqualTo(memoGasLimit));
  });
  test('Fetch Network Fees', () async {
    when(mockJsonRPC.call('eth_gasPrice', any))
        .thenAnswer((_) async => RPCResponse(1, "0x2540be400"));

    when(mockJsonRPC.call('eth_estimateGas', any))
        .thenAnswer((_) async => RPCResponse(1, "0x65b6"));

    final fees = await evmRpcInterface.estimateNetworkFees(
      recipient: rejectEVM,
      data: null,
      sender: rejectEVM,
      value: BigInt.one,
    );

    expect(fees, isNotNull);
    expect(fees.$1.value, equals(BigInt.from(10000000000))); // 10 Gwei
    expect(fees.$2, greaterThanOrEqualTo(21000));
  });

  test('Fetch gas Price', () async {
    when(mockJsonRPC.call('eth_gasPrice', any))
        .thenAnswer((_) async => RPCResponse(1, "0x2540be400"));

    final gasPriceAmount = await evmRpcInterface.getGasPriceAmount();
    final gasPrice = await evmRpcInterface.getGasPrice();

    expect(gasPrice, equals(BigInt.from(10000000000)));
    expect(gasPriceAmount,
        Amount(value: BigInt.parse("10000000000"), decimals: 18));
  });

  test('Fetch Transaction Count', () async {
    when(mockJsonRPC.call('eth_getTransactionCount', any))
        .thenAnswer((_) async => RPCResponse(1, "0x16"));

    final transactionCount = await evmRpcInterface.getTransactionCount(
      rejectEVM,
    );

    expect(transactionCount, equals(BigInt.from(22)));
  });

  test('Fetch transaction type0 by Hash', () async {
    final testTxHash =
        "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b";
    when(mockJsonRPC.call('eth_getTransactionByHash', [testTxHash]))
        .thenAnswer((_) async => RPCResponse(
              1,
              {
                "blockHash":
                    "0x442bf21bfa82c64b53a0e7ef51bd32174ad401b40e01ee3b1fc81a5c6b34716d",
                "blockNumber": "0xce2e175",
                "chainId": "0xa4b1",
                "from": "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
                "gas": "0x186a0",
                "gasPrice": "0x989680",
                "hash":
                    "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b",
                "input": "0x",
                "nonce": "0x16",
                "r":
                    "0x1182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14",
                "s":
                    "0x2e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6",
                "to": "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
                "transactionIndex": "0xc",
                "type": "0x0",
                "v": "0x14985",
                "value": "0x38d7ea4c68000",
              },
            ));

    final testTx = await evmRpcInterface.getTransactionByHash(
      "0x08f35900fd8452eb06cb5f5ac7e7e7da20e9004af423159571d66defeb65485b",
    ) as RawEVMTransactionType0;

    expect(testTx.chainId, "0xa4b1".toInt);
    expect(testTx.gasLimit, BigInt.from(100000));
    expect(testTx.gasPrice, "0x989680".toBigInt);
    expect(testTx.nonce, "0x16".toBigInt);
    expect(
        testTx.r,
        "0x1182f44be301418adb401ccca9c9d3236fe1f3de066ff2f425296262b9a4ce14"
            .toBigInt);
    expect(
        testTx.s,
        "0x2e1a9afb021a6dc36fd94c18a5e43e1fa1a6870743dd1786a9cde3f3547eefa6"
            .toBigInt);
    expect(testTx.to, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");
    expect(testTx.v, "0x14985".toInt);
    expect(testTx.value, "0x38d7ea4c68000".toBigInt);
    expect(testTx.data, "0x".hexToBytesWithPrefixOrNull);
  });

  test('Fetch priority fee', () async {
    when(mockJsonRPC.call('eth_maxPriorityFeePerGas', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0x5fba18",
            ));

    final fee = await evmRpcInterface.getPriorityFee();

    expect(fee, Amount(value: "0x5fba18".toBigInt, decimals: 9));
  });

  test("getType2 Gas Price", () async {
    when(mockJsonRPC.call('eth_gasPrice', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0x989680",
            ));
    when(mockJsonRPC.call('eth_maxPriorityFeePerGas', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0x0",
            ));

    final gasPrice = await evmRpcInterface.getType2GasPrice();

    expect(
      gasPrice.maxFeePerGas,
      Amount(value: BigInt.from(15000000), decimals: 18),
    );
    expect(gasPrice.maxPriorityFeePerGas,
        Amount(value: BigInt.from(0), decimals: 9));
  });

  test("fetch network fees", () async {
    when(mockJsonRPC.call('eth_gasPrice', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0xd3de48",
            ));
    when(mockJsonRPC.call('eth_maxPriorityFeePerGas', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0x0",
            ));
    when(mockJsonRPC.call('eth_estimateGas', any))
        .thenAnswer((_) async => RPCResponse(
              1,
              "0x150bd",
            ));

    final data = Uint8List.fromList(
      hex.decode(
        "77306bb02155b0d8ed8d854ecb2d38a185ca737c3d3d68c25643c47e9a24b4ec",
      ),
    );
    final netweokfees = await evmRpcInterface.fetchNetworkFees(
      recipient: "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
      sender: "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616",
      data: data,
      value: BigInt.one,
    );

    final type2GasPrice = netweokfees.$2 as EvmType2GasPrice;

    expect(netweokfees.$1, 86205);
    expect(type2GasPrice.maxFeePerGas,
        Amount(value: BigInt.from(20827500), decimals: 18));
    expect(type2GasPrice.maxPriorityFeePerGas,
        Amount(value: BigInt.from(0), decimals: 9));
  });
}
