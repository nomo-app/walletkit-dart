import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import 'rpc_test_config.dart';

void runSharedRPCTests({
  required String description,
  required RPCTestConfig config,
  required RPCTestParameters params,
}) {
  group(description, () {
    late EvmRpcInterface rpc;

    setUp(() async {
      rpc = await config.setupRPC();
      if (config is RPCMockTestConfig) await config.setupBlockNumber("0x11114b3d");
    });

    test('block number', () async {
      final blockNumber = await rpc.getBlockNumber();
      expect(blockNumber, isNotNull);
      expect(blockNumber, greaterThan(1));
    });

    test('fetching token balance', () async {
      if (config is RPCMockTestConfig) {
        await config.setupBalance("0x2e10ca4c6ba9bad23");
        await config
            .setupTokenCall("0x000000000000000000000000000000000000000000000001908fb23b90585e0c");
      }

      final tokenBalance = await rpc.fetchTokenBalance(rejectEVM, params.token ?? avinocZSC);

      expect(tokenBalance.displayDouble, greaterThanOrEqualTo(tokenBalance.displayDouble));
    });

    test('fetching balance', () async {
      if (config is RPCMockTestConfig) {
        await config.setupBalance("0x2e10ca4c6ba9bad23");
        await config
            .setupTokenCall("0x000000000000000000000000000000000000000000000001908fb23b90585e0c");
      }

      final zscBalance = await rpc.fetchBalance(
        address: rejectEVM,
      );

      expect(zscBalance.displayDouble, greaterThanOrEqualTo(zscBalance.displayDouble));
    });

    test('estimate Gas Limit', () async {
      if (config is RPCMockTestConfig) {
        await config.setupEstimateGas("0x87dd");
      }

      var data = erc20TransferSig +
          spoilEVM.substring(2).padLeft(64, '0') +
          BigInt.from(0).toHex.padLeft(64, '0');

      var gasLimit = await rpc.estimateGasLimit(
        sender: rejectEVM,
        recipient: rejectEVM,
        gasPrice: null,
        value: BigInt.zero,
        data: data.hexToBytes,
      );

      expect(gasLimit, greaterThanOrEqualTo(GasLimits.ethSend.value));

      data = "Test memo";

      gasLimit = await rpc.estimateGasLimit(
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
      if (config is RPCMockTestConfig) {
        await config.setupGasResponses(
          gasPrice: "0x2540be400",
          estimateGas: "0x65b6",
        );
      }

      final fees = await rpc.estimateNetworkFees(
        recipient: rejectEVM,
        data: null,
        sender: rejectEVM,
        value: BigInt.one,
      );

      expect(fees, isNotNull);
      expect(fees.$2, greaterThanOrEqualTo(21000));
      expect(fees.$1.value, greaterThanOrEqualTo(BigInt.zero));
    });

    test('Fetch gas Price', () async {
      if (config is RPCMockTestConfig) {
        await config.setupGasPrice("0x2540be400");
      }

      final gasPriceAmount = await rpc.getGasPriceAmount();
      final gasPrice = await rpc.getGasPrice();

      expect(gasPrice, greaterThanOrEqualTo(BigInt.from(0)));
      expect(gasPriceAmount, greaterThan(Amount.zero));
    });

    if (description != "Zeniq_Smart_Network RPC Tests") {
      test('Fetch priority fee', () async {
        if (config is RPCMockTestConfig) {
          await config.setupPriorityFee("0x5fba18");
        }
        final fee = await rpc.getPriorityFee();

        expect(fee.value, greaterThanOrEqualTo(BigInt.zero));
      });
      sleep(Duration(milliseconds: 500));
    }

    if (description != "Zeniq_Smart_Network RPC Tests") {
      test("getType2 Gas Price", () async {
        if (config is RPCMockTestConfig) {
          await config.setupGasPrice("0x989680");
          await config.setupPriorityFee("0x0");
        }

        final gasPrice = await rpc.getType2GasPrice();

        expect(
          gasPrice.maxFeePerGas,
          greaterThan(Amount.zero),
        );
        expect(gasPrice.maxPriorityFeePerGas.value, greaterThanOrEqualTo(BigInt.zero));
      });
      sleep(Duration(milliseconds: 500));
    }
    if (description != "Zeniq_Smart_Network RPC Tests") {
      test('fetch network fees type2', () async {
        if (config is RPCMockTestConfig) {
          await config.setupGasPrice("0xd3de48");
          await config.setupPriorityFee("0x0");
          await config.setupEstimateGas("0x150bd");
        }

        final data = Uint8List.fromList(
          hex.decode(
            "77306bb02155b0d8ed8d854ecb2d38a185ca737c3d3d68c25643c47e9a24b4ec",
          ),
        );
        final netweokfees = await rpc.fetchNetworkFees(
          recipient: arbitrumTestWallet,
          sender: arbitrumTestWallet,
          data: data,
          value: BigInt.one,
        );

        final type2GasPrice = netweokfees.$2 as EvmType2GasPrice;

        expect(netweokfees.$1, greaterThan(0));
        expect(type2GasPrice.maxFeePerGas, greaterThan(Amount.zero));
        expect(type2GasPrice.maxPriorityFeePerGas.value, greaterThanOrEqualTo(BigInt.zero));
      });
    }
  });
}
