@Timeout(Duration(minutes: 5))

import 'package:test/test.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import '../utils.dart';

import '../ci/fetching/fetch_utxo_transactions_test.dart';

void main() {
  final devSeed = loadDevSeedFromEnv();
  final testSeed = loadFromEnv("DEV_SEED");
  final zeniqSmartRpcInterface = EvmRpcInterface(ZeniqSmartNetwork);

  // Some sort of to low nonce error
  test('Test ZeniqSmart Sending: 1 Zeniq to Spoil Wallet', () async {
    final hash = await zeniqSmartRpcInterface.sendCoin(
      intent: TransferIntent(
        recipient: arbitrumTestWallet,
        amount: Amount.convert(value: 0.1, decimals: zeniqSmart.decimals),
        feeInfo: null,
        token: zeniqSmart,
        memo: null,
      ),
      seed: testSeed,
      from: arbitrumTestWallet,
    );

    print('Hash: $hash');
  });

  test('Test ZeniqSmart Sending: 0.001 Avinoc ZSC to Spoil Wallet', () async {
    final hash = await zeniqSmartRpcInterface.sendERC20Token(
      intent: TransferIntent(
        recipient: arbitrumTestWallet,
        amount: Amount.convert(value: 0.001, decimals: avinocZSC.decimals),
        feeInfo: null,
        token: avinocZSC,
        memo: null,
      ),
      seed: testSeed,
      from: arbitrumTestWallet,
    );

    print('Hash: $hash');
  });
  test('Send ZENIQ-UTXO to ourselves', () async {
    final seed = loadFromEnv("DEV_SEED");
    final (txList, nodes) = await fetchUTXOTransactions(
      seed: seed,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
      networkType: ZeniqNetwork,
    );

    final reveiveAddress = findUnusedAddress(
      addresses: nodes.receiveNodes.addresses,
      txs: txList,
    );

    final intent = TransferIntent(
      recipient: reveiveAddress,
      amount: Amount(value: BigInt.from(100000000), decimals: 8),
      feeInfo: null,
      token: zeniqCoin,
      memo: null,
    );

    final unsignedTx = buildUnsignedTransaction(
      intent: intent,
      networkType: ZeniqNetwork,
      walletPath: bitcoinNSHDPath,
      txList: txList,
      changeAddresses: nodes.changeNodes.addresses,
      feePerByte: Amount.from(value: 3, decimals: 8),
    );

    final signedTx = unsignedTx
        .sign(
          seed: seed,
          networkType: ZeniqNetwork,
          walletPath: bitcoinNSHDPath,
        )
        .asHex;

    expect(signedTx, isNotNull);

    print("Serialized Tx: $signedTx");

    final hash = await broadcastTransaction(
      rawTxHex: signedTx,
      type: ZeniqNetwork,
    );
    print(hash);

    final inMempool = await rebroadcastTransaction(
      hash: hash,
      serializedTx: signedTx,
      type: ZeniqNetwork,
    );

    expect(inMempool, true);

    expect(hash, isNotEmpty);
  });

  test('Send EC8 to own Address', () async {
    final (txList, nodes) = await fetchUTXOTransactions(
      networkType: EurocoinNetwork,
      seed: devSeed,
      minEndpoints: 1,
      walletTypes: [bitcoinNSHDPath],
      addressTypes: [AddressType.legacy],
    );

    reportCoinsAndAddresses(txList: txList, type: EurocoinNetwork);

    final receive = findUnusedAddress(
      addresses: nodes.receiveNodes.addresses,
      txs: txList,
    );

    print("Receive Address: $receive");

    final intent = TransferIntent(
      recipient: receive,
      amount: Amount.convert(value: 1.2, decimals: 5),
      feeInfo: null,
      token: ec8Coin,
      memo: null,
    );

    final unsignedTx = buildUnsignedTransaction(
      intent: intent,
      networkType: EurocoinNetwork,
      walletPath: bitcoinNSHDPath,
      txList: txList,
      changeAddresses: nodes.changeNodes.addresses,
      feePerByte: Amount.zero, // Not used for EC8
    );

    final signedTx = unsignedTx.sign(
      seed: devSeed,
      networkType: EurocoinNetwork,
      walletPath: bitcoinNSHDPath,
    );

    final serializedTx = signedTx.asHex;

    expect(serializedTx, isNotNull);

    print("Serialized Tx: $serializedTx");

    final hash = await broadcastTransaction(
      rawTxHex: serializedTx,
      type: EurocoinNetwork,
    );

    print(hash);

    expect(hash, isNotEmpty);
  });

  test('Broadcast Raw Tx"', () async {
    final client = await createRandomElectrumXClient(
      endpoints: List.from(BitcoinNetwork.endpoints, growable: true),
      excludedEndpoints: List.from([], growable: true),
      token: btcCoin,
    );

    if (client == null) {
      print('client is null');
      return;
    }

    final raw = await client.broadcastTransaction(
      rawTxHex:
          "0200000001eff7aee6ef80269b75de6e86f7aa5ac94f1533dbf0cf488a94174a132cf2e4420000000085483045022100b23c78c976ab6ea96504783164bf7aee3ca0667f09a4452d93c5d29f4c9ab33502204055f1956916b5aa27ce09d80f167f1f223ae17e630056ac9759c3c71ff7518601210265f34bd46e92b57a956f6e12bc3adc886626b074584a04ba1febe38aeb1835b21976a914ef451d74e9f2bd7fe673b1de3cded3a1b09a574988acffffffff0222020000000000001976a9145d0548d68c35fdd74921daf4150e60fec7f155d588ac7fd70400000000001976a9149f490d17fd11f46e58a976d173eec3a489f6208088ac00000000",
    );

    print(raw);
  });
}
