import 'package:walletkit_dart/walletkit_dart.dart';

class ContractFunctionLogs {
  final List<EVMTransactionLog> logs;

  const ContractFunctionLogs(this.logs);

  factory ContractFunctionLogs.fromReceipt(EVMTransactionReceipt receipt) {
    return ContractFunctionLogs(receipt.logs);
  }
}
