import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../../utils.dart';

void main() {
  test('Get Token Info for Avinoc', () async {
    final tokenInfo = await getTokenInfo(
      contractAddress: avinocZSC.contractAddress,
      rpc: zeniqSmartChainRPC,
    );

    expect(tokenInfo, isNotNull);
    expect(tokenInfo!.decimals, avinocZSC.decimals);
    expect(tokenInfo.name, "AVINOC Token");
    expect(tokenInfo.symbol, "AVINOC");
  });
}
