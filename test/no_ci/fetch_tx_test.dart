import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/utxo/utils/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  test('Fetch Any tx by Hash', () async {
    final addressTypes = [
      AddressType.legacy,
      AddressType.segwit,
      //AddressType.compatibility,
    ];
    final (_, nodes) = await fetchUTXOTransactionsFromEpubKey(
      networkType: BitcoinNetwork,
      ePubKey: rejectXpub,
      addressTypes: addressTypes,
      purpose: HDWalletPurpose.NO_STRUCTURE,
    );

    final tx = await fetchFromRandomElectrumXNode(
      (client) => client.getTransaction(
        txHash: "3bc8073dc796f3d7ee27deaee392caf8db1dd29d558f591e9a915e27dd2ae008",
        type: BitcoinNetwork,
        nodes: nodes,
        addressTypes: addressTypes,
      ),
      client: null,
      endpoints: BitcoinNetwork.endpoints,
      token: btcCoin,
    );

    print(tx);
  });
}
