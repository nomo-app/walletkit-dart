import 'package:walletkit_dart/walletkit_dart.dart';

part 'game_items_contract.g.dart';

@Contract('lib/src/crypto/evm/entities/abi/game_contract.json')
class GameItemsContract extends InternalContract {
  GameItemsContract({required super.contractAddress, required super.rpc})
      : super(abi: ContractABI([], []));
}
