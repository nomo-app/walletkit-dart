import 'dart:async';

import 'package:test/test.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

void main() {
  group('Wallet state syncing events', () {
    test('EVM native balance change emits EvmBalanceChanged', () async {
      final ctrl = EVMAccountStateController(
        network: EthereumNetwork,
        address: '0x0000000000000000000000000000000000000001',
        decimals: 18,
      );

      // Arrange: override fetcher to return 0 then 1 ETH
      var call = 0;
      fetchEvmTokenStateFn = ({
        required EVMNetworkType network,
        required String address,
        int decimals = 18,
      }) async {
        call++;
        final bal = call == 1
            ? Amount(value: BigInt.zero, decimals: decimals)
            : Amount(value: BigInt.from(10).pow(decimals), decimals: decimals);
        return EVMTokenState(balance: bal, transactions: const []);
      };

      final events = <AccountEvent>[];
      final sub = ctrl.events.listen(events.add);

      // Act
      await ctrl.refresh(); // prime
      await ctrl.refresh(); // change

      // Assert
      expect(
        events.whereType<EvmBalanceChanged>().length,
        1,
      );

      await sub.cancel();
    });

    test('UTXO tx update emits UtxoTransactionsUpdated', () async {
      final ctrl = UTXOAccountStateController(
        network: BitcoinNetwork,
        accountXpub: 'zpub-TEST',
        decimals: 8,
      );

      // Arrange: override fetcher to return 0 tx then 1 tx
      var call = 0;
      fetchUtxoTokenStateFn = ({
        required UTXONetworkType network,
        required String accountXpub,
        int decimals = 8,
      }) async {
        call++;
        final amount = Amount(value: BigInt.zero, decimals: decimals);
        final txs = call == 1
            ? const <UTXOTransaction>[]
            : <UTXOTransaction>[
                UTXOTransaction(
                  hash: 'h',
                  block: 1,
                  confirmations: 1,
                  timeMilli: DateTime.now().millisecondsSinceEpoch,
                  amount: amount,
                  fee: null,
                  sender: 's',
                  recipient: 'r',
                  transferMethod: TransactionTransferMethod.receive,
                  token: btcCoin,
                  status: ConfirmationStatus.confirmed,
                  id: 'id',
                  version: 1,
                  inputs: const [],
                  outputs: const [],
                ),
              ];
        return UTXOTokenState(balance: amount, transactions: txs);
      };

      final events = <AccountEvent>[];
      final sub = ctrl.events.listen(events.add);

      await ctrl.refresh(); // prime
      await ctrl.refresh(); // new tx appears

      expect(
        events.whereType<UtxoTransactionsUpdated>().length,
        1,
      );

      await sub.cancel();
    });

    test('UTXO addresses derived event is forwarded', () async {
      final ctrl = UTXOAccountStateController(
        network: BitcoinNetwork,
        accountXpub: 'zpub-ADDR',
        decimals: 8,
      );

      final c = Completer<UtxoAddressesDerived>();
      final sub = ctrl.events
          .where((e) => e is UtxoAddressesDerived)
          .cast<UtxoAddressesDerived>()
          .listen(c.complete);

      ctrl.notifyAddressesDerived(receive: 5, change: 2);

      final ev = await c.future.timeout(const Duration(seconds: 1));
      expect(ev.receive, 5);
      expect(ev.change, 2);

      await sub.cancel();
    });
  });
}
