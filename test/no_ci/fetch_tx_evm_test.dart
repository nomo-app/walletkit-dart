import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

void main() {
  test(
    "test evm tx fetching",
    () async {
      final transactions = await etherscan.fetchTransactions(
        address: spoilEVM,
      );
      print(transactions.last.gas);
      print(transactions.last.gasPrice.displayValue);
      print(transactions.last.gasUsed);
      print(transactions.last.hash);
      expect(transactions, isNotEmpty);
    },
  );
}
