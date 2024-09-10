import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/ens/ens_registry_contract.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/ens/ens_resolver_contract.dart';

import '../../../utils.dart';

void main() {
  test(
    "Test ENS",
    () async {
      final contract = EnsRegistryContract.mainnet(rpc: ethereumRPC);

      final resolverAddress = await contract.resolver(name: 'vitalik.eth');

      expect(resolverAddress, "0x231b0ee14048e9dccd1d247744d114a4eb5e8e63");

      final resolver = EnsResolverContract(
        contractAddress: resolverAddress!,
        rpc: ethereumRPC,
      );

      final addr = await resolver.addr(name: 'vitalik.eth');

      expect(addr, "0xd8da6bf26964af9d7eed9e03e53415d37aa96045");
    },
  );

  test(
    "High Level Impl",
    () async {
      final address = await ethereumRPC.resolveENS(
        name: "vitalik.eth",
        contractAddress: ensRegistryMainnetContractAddress,
      );

      expect(address, "0xd8da6bf26964af9d7eed9e03e53415d37aa96045");

      final address2 = await ethereumRPC.resolveENS(
        name: "asdasdasdasdasd.eth",
        contractAddress: znsRegistryContractAddress,
      );

      expect(address2, null);
    },
  );

  test(
    "High Level Impl Zeniq",
    () async {
      final address = await zeniqSmartChainRPC.resolveENS(
        name: "michaelrossmann.znq",
        contractAddress: znsRegistryContractAddress,
      );

      expect(address, "0xa7fa4bb0bba164f999e8c7b83c9da96a3be44616");

      final address2 = await zeniqSmartChainRPC.resolveENS(
        name: "asdasdasdasdasd.znq",
        contractAddress: znsRegistryContractAddress,
      );

      expect(address2, null);
    },
  );
}
