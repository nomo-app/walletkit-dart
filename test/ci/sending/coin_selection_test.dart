import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/input_selection.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final inputs = [
  ElectrumOutput(
    value: 100.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
  ElectrumOutput(
    value: 2400.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
  ElectrumOutput(
    value: 10000.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
  ElectrumOutput(
    value: 5000.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
  ElectrumOutput(
    value: 88000.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
  ElectrumOutput(
    value: 800.toBI,
    n: 0,
    scriptPubKey: ElectrumScriptPubKey(hexString: "1", type: "pubkeyhash"),
    node: EmptyNode(),
  ),
];

void main() {
  test("coin selection singleRandomDrawUTXOSelection", () {
    final targetValue = BigInt.from(10000);

    final inputsCopy = List.of(inputs);
    final selectedUTXOs =
        singleRandomDrawUTXOSelection(inputsCopy, targetValue);
    final totalInputAmount = selectedUTXOs.totalAmount;
    final change = totalInputAmount - targetValue;

    expect(selectedUTXOs.length, greaterThanOrEqualTo(2));
    expect(totalInputAmount, greaterThanOrEqualTo(targetValue));
    print("Single Random Draw");
    print("Total Input Amount: $totalInputAmount");
    print("Change: $change");
    print("Outputs used: ${selectedUTXOs.length}");
    print("");
  });

  test("coin selection smallestFirstUTXOSelection", () {
    final targetValue = BigInt.from(10000);

    final inputsCopy = List.of(inputs);
    final selectedUTXOs = smallestFirstUTXOSelection(inputsCopy, targetValue);
    final totalInputAmount = selectedUTXOs.totalAmount;
    final change = totalInputAmount - targetValue;

    expect(totalInputAmount, greaterThanOrEqualTo(targetValue));
    print("Smallest First");
    print("Total Input Amount: $totalInputAmount");
    print("Change: $change");
    print("Outputs used: ${selectedUTXOs.length}");
  });
}

extension on List<ElectrumOutput> {
  BigInt get totalAmount =>
      fold(BigInt.zero, (prev, element) => prev + element.value);
}
