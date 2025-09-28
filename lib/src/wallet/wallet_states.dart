import 'package:walletkit_dart/walletkit_dart.dart';

// Wallet state representations split from wallet.dart

sealed class CoinPurposeWalletState {
  // Total Balance across Accounts
  TokenState get coinState;

  List<int> get activeAccounts;

  Map<int, CoinAccountState> get accountStates;

  const CoinPurposeWalletState();
}

final class EVMCoinPurposeWalletState extends CoinPurposeWalletState {
  final EVMTokenState coinState;
  final Map<int, EthCoinAccountState> accountStates;
  final List<int> activeAccounts;

  const EVMCoinPurposeWalletState({
    required this.coinState,
    required this.accountStates,
    required this.activeAccounts,
  });
}

final class UTXOCoinPurposeWalletState extends CoinPurposeWalletState {
  final UTXOTokenState coinState;
  final Map<int, UTXOCoinAccountState> accountStates;
  final List<int> activeAccounts;
  const UTXOCoinPurposeWalletState({
    required this.coinState,
    required this.activeAccounts,
    required this.accountStates,
  });
}

sealed class CoinWalletState {
  // Total Balance across Accounts
  TokenState get coinState;

  Map<HDWalletPurpose, CoinPurposeWalletState> get purposeStates;

  Set<HDWalletPurpose> get activePurposes;

  const CoinWalletState();
}

final class EVMCoinWalletState extends CoinWalletState {
  final EVMTokenState coinState;
  final Map<HDWalletPurpose, EVMCoinPurposeWalletState> purposeStates;
  final Set<HDWalletPurpose> activePurposes;

  const EVMCoinWalletState({
    required this.coinState,
    required this.purposeStates,
    required this.activePurposes,
  });
}

final class UTXOCoinWalletState extends CoinWalletState {
  final UTXOTokenState coinState;
  final Map<HDWalletPurpose, UTXOCoinPurposeWalletState> purposeStates;

  final Set<HDWalletPurpose> activePurposes;

  const UTXOCoinWalletState({
    required this.coinState,
    required this.activePurposes,
    required this.purposeStates,
  });
}

sealed class CoinAccountState {
  TokenState get coinState;

  const CoinAccountState();
}

final class UTXOCoinAccountState extends CoinAccountState {
  final List<NodeWithAddress> receive;
  final List<NodeWithAddress> change;
  final UTXOTokenState coinState;
  String get address => receive.last.address;

  const UTXOCoinAccountState({
    required this.receive,
    required this.change,
    required this.coinState,
  });
}

final class EthCoinAccountState extends CoinAccountState {
  final EVMTokenState coinState;
  final Map<ERC20Entity, EVMTokenState> tokenStates;

  EthCoinAccountState({required this.coinState, required this.tokenStates});
}

// TokenStateUpdate carries partial changes to a TokenState.
// Null fields mean "no change"; non-null values overwrite.
final class TokenStateUpdate {
  final Amount? balance;
  final List<GenericTransaction>? transactions;

  const TokenStateUpdate({
    this.balance,
    this.transactions,
  });
}

sealed class TokenState {
  Amount get balance;
  List<GenericTransaction> get transactions;
}

final class EVMTokenState extends TokenState {
  final Amount balance;
  final List<EVMTransaction> transactions;

  EVMTokenState({required this.balance, required this.transactions});
}

final class UTXOTokenState extends TokenState {
  final Amount balance;
  final List<UTXOTransaction> transactions;

  UTXOTokenState({required this.balance, required this.transactions});
}
