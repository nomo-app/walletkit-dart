import 'dart:typed_data';

import 'package:walletkit_dart/walletkit_dart.dart';

part 'erc1155_contract.g.dart';

@Contract("lib/src/crypto/evm/entities/abi/erc/erc1155_abi.json")
class ERC1155Contract extends InternalContract {
  ERC1155Contract({required super.contractAddress, required super.rpc})
      : super(abi: erc1155contract_abi);
}
