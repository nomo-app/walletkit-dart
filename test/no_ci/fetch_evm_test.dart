import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Test EVM Wallet', () async {
    final etherscan = EVMExplorer(etherscanBaseEndpoint, []);

    final rpc = EvmRpcInterface(ZeniqSmartNetwork);

    const address = "0x935B5aBa58344b8914F1287C0760f9863b311c79";

    final balance = await etherscan.fetchBalance(address, ethNative);
    print('ETH Balance: $balance');

    final smartChainBalance = await rpc.fetchBalance(address: address);

    print('Smart Chain Balance: $smartChainBalance');

    final ethNFts = await etherscan.fetchEtherscanNFTs(address: address);

    print('ETH NFTs: $ethNFts');

    final smartChainNFts = await rpc.fetchZEN721Transfers(
      address: address,
      nftContractAddress: smartChainStakingContract,
    );

    print('Smart Chain NFTs: $smartChainNFts');
  });
}
