library coin_selection;

import 'dart:math';

import 'package:walletkit_dart/walletkit_dart.dart';

const kMinInputs = 2;

List<ElectrumOutput> singleRandomDrawUTXOSelection(
  List<ElectrumOutput> utxos,
  BigInt targetAmount,
) {
  List<ElectrumOutput> selectedUTXOs = [];
  BigInt selectedAmount = BigInt.zero;
  Random random = Random();

  // try to use at least 2 UTXOs if possible
  while (selectedAmount < targetAmount ||
      (selectedUTXOs.length < kMinInputs && utxos.isNotEmpty)) {
    if (utxos.isEmpty) {
      throw SendFailure('Insufficient UTXOs to reach the target amount');
    }

    // Randomly select a UTXO and remove it from the available list.
    int randomIndex = random.nextInt(utxos.length);
    ElectrumOutput selectedUTXO = utxos.removeAt(randomIndex);

    // Add the chosen UTXO to the selected list and update the selected amount.
    selectedUTXOs.add(selectedUTXO);
    selectedAmount += selectedUTXO.value;
  }
  return selectedUTXOs;
}

List<ElectrumOutput> smallestFirstUTXOSelection(
  List<ElectrumOutput> utxos,
  BigInt targetAmount,
) {
  // Sort UTXOs by value, smallest first.
  utxos.sort((a, b) => a.value.compareTo(b.value));

  List<ElectrumOutput> selectedUTXOs = [];
  BigInt selectedAmount = BigInt.zero;

  for (ElectrumOutput utxo in utxos) {
    selectedUTXOs.add(utxo);
    selectedAmount += utxo.value;

    if (selectedAmount >= targetAmount) {
      break;
    }
  }

  if (selectedAmount < targetAmount) {
    throw Exception('Insufficient UTXOs to reach the target amount');
  }

  return selectedUTXOs;
}

///
/// FIFO: TODO: Get blockheigt information for each Input
///
// List<Input> fifoUTXOSelection(List<Input> utxos, int targetAmount) {
//   // Sort UTXOs by block height, older first.
//   utxos.sort((a, b) => a.blockHeight.compareTo(b.blockHeight));

//   List<Input> selectedUTXOs = [];
//   int selectedAmount = 0;

//   for (Input utxo in utxos) {
//     selectedUTXOs.add(utxo);
//     selectedAmount += utxo.vout;

//     if (selectedAmount >= targetAmount) {
//       break;
//     }
//   }

//   if (selectedAmount < targetAmount) {
//     throw Exception('Insufficient UTXOs to reach the target amount');
//   }

//   return selectedUTXOs;
// }

///
///
///
List<ElectrumOutput> fillUpToTargetAmount(
  List<ElectrumOutput> alreadyUsedUTXOs,
  List<ElectrumOutput> utxos,
  BigInt targetAmount,
) {
  List<ElectrumOutput> selectedUTXOs = [...alreadyUsedUTXOs];
  BigInt selectedAmount = selectedUTXOs.fold(
    BigInt.zero,
    (preV, utxo) => preV + utxo.value,
  );

  /// Remove already used UTXOs from the available list.
  utxos.removeWhere((element) => alreadyUsedUTXOs.contains(element));

  // try to use at least 2 UTXOs if possible
  while (selectedAmount < targetAmount ||
      (selectedUTXOs.length < kMinInputs && utxos.isNotEmpty)) {
    if (utxos.isEmpty) {
      throw SendFailure(
        'Insufficient UTXOs for Fee + Target Amount ($targetAmount)',
      );
    }

    final max = utxos.reduce(
      (value, element) => value.value > element.value ? value : element,
    );

    utxos.remove(max);

    // Add the chosen UTXO to the selected list and update the selected amount.
    selectedUTXOs.add(max);
    selectedAmount += max.value;
  }
  return selectedUTXOs;
}
