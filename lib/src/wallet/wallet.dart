// Barrel file splitting wallet states and structure
export 'wallet_states.dart';
export 'wallet_structure.dart';
export 'wallet_db.dart';
export 'state/wallet_state_engine.dart';
export 'state/wallet_state_manager.dart';

// Local imports for demo main()
import 'bip32/hd_node.dart';
import 'bip32/hd_wallet_type.dart';
import '../crypto/network_type.dart';
import 'wallet_structure.dart';
import 'wallet_db.dart';

void main(List<String> args) {
  final seed = walletDB.loadSeedForId('DEV_SEED').data;

  final masterNode = HDNode.fromSeed(seed);

  final wallet = HDWallet(
    masterNode: masterNode,
    coins: {
      ETHEREUM_NETWORK(): [HDWalletPurpose.BIP44],
      BITCOIN_NETWORK(): [
        HDWalletPurpose.NO_STRUCTURE,
        HDWalletPurpose.BIP44,
        HDWalletPurpose.BIP49,
        HDWalletPurpose.BIP84,
        HDWalletPurpose.BIP86,
      ],
    },
  );

  print(wallet.coinWallets);
}
