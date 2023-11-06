import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/crypto/wallet_utils.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/domain/entities/predefined_assets.dart';
import 'package:walletkit_dart/src/domain/entities/fee.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/transfer_intent.dart';
import 'package:walletkit_dart/src/domain/repository/evm_rpc_interface.dart';

void main() {
  final zeniqSmartRpcInterface = EvmRpcInterface(ZeniqSmartNetwork);

  test('Test ZeniqSmart Sending: 1 Zeniq to Spoil Wallet', () async {
    final credentials = getETHCredentials(
      seed: helloSeed,
      wipeCache: true,
    );

    final hash = await zeniqSmartRpcInterface.sendCoin(
      intent: TransferIntent(
        recipient: spoilEVM,
        amount: Amount.num(value: 1, decimals: zeniqSmart.decimals),
        feePriority: FeePriority.high,
        token: zeniqSmart,
      ),
      credentials: credentials,
    );

    print('Hash: $hash');
  });

  test('Test ZeniqSmart Sending: 0.001 Avinoc ZSC to Spoil Wallet', () async {
    final credentials = getETHCredentials(
      seed: helloSeed,
      wipeCache: true,
    );

    final hash = await zeniqSmartRpcInterface.sendERC20Token(
      intent: TransferIntent(
        recipient: spoilEVM,
        amount: Amount.num(value: 0.001, decimals: avinocZSC.decimals),
        feePriority: FeePriority.high,
        token: avinocZSC,
      ),
      credentials: credentials,
    );

    print('Hash: $hash');
  });
}
