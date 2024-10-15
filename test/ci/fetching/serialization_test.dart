import 'package:test/test.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/crypto/utxo/entities/raw_transaction/raw_transaction.dart';
import 'package:walletkit_dart/src/crypto/utxo/repositories/electrum_json_rpc_client.dart';

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

    final parsedTx = BTCRawTransaction.fromHex(tx);

    expect(parsedTx.asHex, tx);
  });

  test('Fetch Tx and Parse Segwit', () async {
    final tx = await fetchRawTxByHash(
      "2ed76399271c94a65935c6e76f1c44220447cb3c7203a8b1d38de2b3e1b4edc4",
      BitcoinNetwork,
    );

    expect(
      tx,
      "0200000000010276bd19485d40fa1498a8fd4b1e533af9bf2e866dfc831d755872fbb82f9e7004010000006b4830450221009cd84a095f81726fcfc420c14a175908eed929865254f08d6769a37a6dd820880220566ec7398675e918381d83377b93cab8b38cc4a5658df82f8709151553ac682801210326096ea021c6a568ef454ccafb6f3ffa485223d550aabe319f82822bf80c25c0ffffffff76bd19485d40fa1498a8fd4b1e533af9bf2e866dfc831d755872fbb82f9e70040000000000ffffffff02ff7002000000000017a914ab2189eb45452859b855a9e8d1acc6620603742887a0590200000000001976a9146403a693463d1d32948633dc1117b755680382fb88ac0002483045022100c356b72902a25578a968e05b0d41aa8faedb7e9ebefcaac50e275f8cca3e970402202aebc16d1b041e507ac5338fd962fba0844780845e211cf6a7f2e1074c8b1d920121021f11dcd00fd82a27d7eb1511a8a6f5593ccb9777b72263f5af382109bed9e1fb00000000",
    );

    final parsedTx = BTCRawTransaction.fromHex(tx);

    expect(parsedTx.asHex, tx);
  });
}
