import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/raw_transaction.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';

void main() {
  test('Fetch Tx and Parse', () async {
    final tx = await fetchRawTxByHash(
      "6e1228f048c590062399a4fbaf4eab2f445935874fa56fa3ab54bcd02d278715",
      ZeniqNetwork,
    );

    print(tx);

    expect(
      tx,
      "0100000001d1c7005d77d10069ed2997f21eb09b988b12b456277153dd4c827e239dc61b38010000006a47304402205a9dbbbd297a88feac6da182ea71c3f3e108fda48762c6a11fbeaf83feb71cea02206a028b49ce12f1cdeaebb0ded322a798177abd600035fda8d1294a54e8b0e1c04121021dad9bb5cbcacf0a8fd5d7739ee649f8bb1f0ab235e6b825b6155ee053a8b21cffffffff02e8030000000000001976a9142c9dbe9677d85ce872fa942165c1c5300b58240188acf8b8d51f000000001976a9143ac3b15137e8995b8dbc55aac65f0380d3d39cd788ac00000000",
    );

    final parsedTx = RawTransaction.fromHex(tx);

    expect(
      parsedTx.toHex(),
      "0100000001d1c7005d77d10069ed2997f21eb09b988b12b456277153dd4c827e239dc61b38010000006a47304402205a9dbbbd297a88feac6da182ea71c3f3e108fda48762c6a11fbeaf83feb71cea02206a028b49ce12f1cdeaebb0ded322a798177abd600035fda8d1294a54e8b0e1c04121021dad9bb5cbcacf0a8fd5d7739ee649f8bb1f0ab235e6b825b6155ee053a8b21cffffffff02e8030000000000001976a9142c9dbe9677d85ce872fa942165c1c5300b58240188acf8b8d51f000000001976a9143ac3b15137e8995b8dbc55aac65f0380d3d39cd788ac00000000",
    );
  });
}

Future<String> fetchRawTxByHash(
  String hash,
  UTXONetworkType networkType,
) async {
  final (result, _, _) = await fetchFromRandomElectrumXNode(
    (client) async {
      return await client.getRaw(hash);
    },
    client: null,
    endpoints: networkType.endpoints,
    token: networkType.coin,
  );
  if (result == null) {
    throw Exception("No result for $hash");
  }

  return result;
}
