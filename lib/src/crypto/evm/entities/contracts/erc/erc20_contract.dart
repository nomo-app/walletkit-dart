import 'dart:typed_data';

import 'package:walletkit_dart/walletkit_dart.dart';

part 'erc20_contract.g.dart';

@Contract('lib/src/crypto/evm/entities/abi/erc/erc20_abi.json')
class ERC20Contract extends InternalContract {
  ERC20Contract({required super.contractAddress, required super.rpc})
      : super(abi: erc20contract_abi);
}
