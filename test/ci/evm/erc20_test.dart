import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  final zeniqSmartRpcInterface = EvmRpcInterface(ZeniqSmartNetwork);
  test('Get Token Info for Avinoc', () async {
    final tokenInfo = await getTokenInfo(
      contractAddress: avinocZSC.contractAddress,
      client: zeniqSmartRpcInterface.client.asWeb3,
      chainId: zeniqSmartRpcInterface.type.chainId,
    );

    expect(tokenInfo, isNotNull);

    expect(tokenInfo!.decimals, avinocZSC.decimals);
    expect(tokenInfo.name, "AVINOC Token");
    expect(tokenInfo.symbol, "AVINOC");
  });
}
