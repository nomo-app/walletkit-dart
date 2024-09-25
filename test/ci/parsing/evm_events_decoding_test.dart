import 'package:test/test.dart';
import 'package:walletkit_dart/src/domain/repository/function_selector_repository.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';

void main() async {
  test(
    "Transfer Event Ethereum",
    () async {
      final receipt = await ethereumRPC.getTransactionReceipt(
        "0x151c9791e739567573ed69ef9a558474748eb5936deab1bc0e95160cf91c502e",
      );
      expect(receipt, isNotNull);
      expect(receipt!.status, 1);

      final log = receipt.logs.first;
      final event = contractAbiErc20.getEvent("Transfer")!;
      final values = log.decode(event);

      expect(values.first.name, "from");
      expect(values.first.value, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");

      expect(values[1].name, "to");
      expect(values[1].value, "0x6d00562cb7cb37044accbd6d75d2933e35ab9b01");

      expect(values[2].name, "value");
      expect(values[2].value, BigInt.from(96570000));
    },
  );

  test(
    "Transfer Event Zeniq Smart Chain",
    () async {
      final receipt = await zeniqSmartChainRPC.getTransactionReceipt(
        "0xdf65145349be456c73b4bd6b094c0177d3ee8e7d4fc22a92a54865ecca169d81",
      );
      expect(receipt, isNotNull);
      expect(receipt!.status, 1);

      final log = receipt.logs.first;
      final event = contractAbiErc20.getEvent("Transfer")!;
      final values = log.decode(event);

      expect(values.first.name, "from");
      expect(values.first.value, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");

      expect(values[1].name, "to");
      expect(values[1].value, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");

      expect(values[2].name, "value");
      expect(values[2].value, BigInt.from(5000000000000000000));
    },
  );

  test(
    "Approve Event ZeniqSmartChain",
    () async {
      final receipt = await zeniqSmartChainRPC.getTransactionReceipt(
        "0x14d49a8bce7ddd7b1929aaf9baf88ced8109c9aa119685d110da79c207475d27",
      );
      expect(receipt, isNotNull);
      expect(receipt!.status, 1);

      final log = receipt.logs.first;
      final event = contractAbiErc20.getEvent("Approval")!;
      final values = log.decode(event);

      expect(values.first.name, "owner");
      expect(values.first.value, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");

      expect(values[1].name, "spender");
      expect(values[1].value, "0x7963c1bd24e4511a0b14bf148f93e2556afe3c27");

      expect(values[2].name, "value");
      expect(values[2].value, BigInt.from(387720900000000000));
    },
  );

  test(
    "Swap ExaxtEthToToken Events",
    () async {
      final receipt = await zeniqSmartChainRPC.getTransactionReceipt(
        "0x3d6258eae79f13c4f3d94f35b36885f1ea98dc0c5859116837ced9ed107e4cd7",
      );
      expect(receipt, isNotNull);
      expect(receipt!.status, 1);
    },
  );
}
