import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Fetch Peers Bitcoin', () async {
    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.fetchPeers(),
      client: null,
      endpoints: BitcoinNetwork.endpoints,
      token: btcCoin,
    );

    expect(result, isNotEmpty);

    for (var element in result!) {
      print("\"" + element.host + "\",");
    }
  });

  test('Fetch Peers Litecoin', () async {
    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.fetchPeers(),
      client: null,
      endpoints: LitecoinNetwork.endpoints,
      token: ltcCoin,
    );

    expect(result, isNotEmpty);

    for (var element in result!) {
      print("\"" + element.host + "\",");
    }
  });

  test('Fetch Peers BitcoinCash', () async {
    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.fetchPeers(),
      client: null,
      endpoints: [("bch.mullvad.net", 50001)],
      token: bchCoin,
    );

    expect(result, isNotEmpty);

    for (var element in result!) {
      print("\"" + element.host + "\",");
    }
  });

  test('Fetch Peers Zeniq', () async {
    final (result, _, _) = await fetchFromRandomElectrumXNode(
      (client) => client.fetchPeers(),
      client: null,
      endpoints: ZeniqNetwork.endpoints,
      token: zeniqCoin,
    );

    print(result);
  });
}
