import 'dart:typed_data';

import 'package:walletkit_dart/walletkit_dart.dart';

part 'erc721_contract.g.dart';

@Contract("lib/src/crypto/evm/entities/abi/erc/erc721_abi.json")
class Erc721Contract extends InternalContract {
  Erc721Contract({required super.contractAddress, required super.rpc})
      : super(abi: erc721contract_abi);
}
