import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:walletkit_dart/src/common/isolate_service.dart';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/utxo/payments/p2h.dart';
import 'package:walletkit_dart/src/domain/repository/electrum_json_rpc_client.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/src/domain/repository/models/electrum_transaction.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:walletkit_dart/walletkit_dart.dart';

const kAddressesUpperLimit = 10000;
const kEmptyLimit = 20;

/// Txs; Receive Addresses; Change Addresses
typedef UTXOTxInfo = (Set<UTXOTransaction>, Iterable<NodeWithAddress>);

typedef ElectrumXResult = (Set<ElectrumTransactionInfo>?, ElectrumXClient);

typedef SearchTransactionResult = (
  Set<ElectrumTransactionInfo>,
  Set<NodeWithAddress>
);

class UTXONetworkInfo {
  final List<UTXOTransaction> transactions;
  final List<NodeWithAddress> addresses;

  UTXONetworkInfo({
    required this.transactions,
    required this.addresses,
  });

  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'addresses': addresses.map((e) => e.toJson()).toList(),
    };
  }

  static UTXONetworkInfo fromJson(Map<String, dynamic> json) {
    return UTXONetworkInfo(
      transactions: (json['transactions'] as List)
          .map((e) => UTXOTransaction.fromJson(e))
          .toList(),
      addresses: (json['addresses'] as List)
          .map((e) => NodeWithAddress.fromJson(e))
          .toList(),
    );
  }
}

Future<UTXOTxInfo> fetchMissingUTXOTransactions({
  required Set<UTXOTransaction> cachedTransactions,
  required List<NodeWithAddress> cachedNodes,
  required Set<ElectrumTransactionInfo> allTxs,
  required Iterable<NodeWithAddress> nodes,
  required TokenEntity coin,
  required UTXONetworkType networkType,
  required Iterable<AddressType> addressTypes,
  required List<(String, int)> endpoints,
  required Stopwatch watch,
}) async {
  /// Filter out all transactions that are already cached
  final newTxs = allTxs.where(
    (tx) {
      final isCached = cachedTransactions.any((cTx) => cTx.id == tx.hash);

      return isCached == false;
    },
  );

  final pendingTxs = allTxs.where(
    (tx) {
      final cTx = cachedTransactions.singleWhereOrNull(
        (cTx) => cTx.id == tx.hash,
      );
      if (cTx == null) return false;

      return cTx.isPending || cTx is NotAvaialableUTXOTransaction;
    },
  );
  Logger.log("Found ${pendingTxs.length} pending TXs for ${coin.symbol}");
  Logger.log("Found ${newTxs.length} new TXs for ${coin.symbol}");

  ///
  /// Fetch UTXO Details for all new transactions
  ///
  var newUtxoTxs = await computeMissingUTXODetails(
    txList: newTxs,
    nodes: nodes,
    type: networkType,
    endpoints: endpoints,
    addressTypes: addressTypes,
  );

  ///
  /// Fetch Parent Transactions of P2SH Inputs to get the redeem script and in hence the address
  ///
  final unsupported = newUtxoTxs.where(
    (tx) => tx.sender == ADDRESS_NOT_SUPPORTED,
  );
  final updatedUTXOs = <UTXOTransaction>[];
  for (final tx in unsupported) {
    final firstInput = tx.inputs.firstOrNull;
    if (firstInput == null) continue;

    /// Coinbase Parent TX
    if (firstInput.isCoinbase) {
      continue;
    }

    final outputIndex = firstInput.vout!;
    final parentTxHash = firstInput.txid;
    if (parentTxHash == null) continue;

    // Check if Parent TX is already in the list
    var parentTx = newUtxoTxs
        .singleWhereOrNull((element) => element.id == firstInput.txid);

    final (_tx, _, _) = await fetchFromRandomElectrumXNode(
      (client) {
        return client.getTransaction(
          addressTypes: addressTypes,
          nodes: nodes,
          type: networkType,
          txHash: parentTxHash,
        );
      },
      client: null,
      endpoints: networkType.endpoints,
      token: coin,
    );

    parentTx ??= _tx;

    if (parentTx == null) {
      Logger.logWarning(
        "Parent TX $parentTxHash not found for ${tx.hash}",
      );
      continue;
    }

    final output = parentTx.outputs[outputIndex];

    final address = output.getAddress(networkType);

    updatedUTXOs.add(tx.copyWith(sender: address));
  }
  // Replace the unsupported transactions with the updated ones
  newUtxoTxs = newUtxoTxs.map((tx) {
    final updatedTx = updatedUTXOs.singleWhereOrNull(
      (upTx) => upTx.id == tx.id,
    );
    return updatedTx ?? tx;
  });

  ///
  /// Fetch UTXO Details for all pending transactions and replace them
  ///
  final pendingUtxoTxs = await computeMissingUTXODetails(
    txList: pendingTxs,
    nodes: nodes,
    type: networkType,
    endpoints: endpoints,
    addressTypes: addressTypes,
  );

  var utxoTXs = {
    ...newUtxoTxs,
    ...cachedTransactions,
  };

  /// Replace the pending transactions with the updated ones
  utxoTXs = utxoTXs.map((tx) {
    final pendingTx = pendingUtxoTxs.singleWhereOrNull(
      (element) => element.id == tx.id,
    );
    return pendingTx ?? tx;
  }).toSet();

  ///
  /// Mark Spent Outputs
  ///
  for (final tx in utxoTXs) {
    for (final input in tx.inputs) {
      final outputs = utxoTXs
          .singleWhereOrNull((element) => element.id == input.txid)
          ?.outputs;

      if (input.isCoinbase) continue;
      final index = input.vout!;
      if (outputs == null || outputs.length <= index) {
        continue;
      }
      outputs[index] = outputs[index].copyWith(spent: true);
    }
  }

  watch.stop();
  Logger.logFetch("Fetched TXs in ${watch.elapsed}");

  final sortedTxs = utxoTXs.sortedBy<GenericTransaction>((tx) => tx).toSet();

  return (sortedTxs, nodes);
}

/// Fetches UTXO Transactions for a given ePubKey
/// if [purpose] is not provied the returned [nodes] cant be used to derive the master node (used in Proof of Payment)
Future<UTXOTxInfo> fetchUTXOTransactionsFromEpubKey({
  required Iterable<AddressType> addressTypes,
  required UTXONetworkType networkType,
  required String ePubKey,
  HDWalletPurpose? purpose,
  Set<UTXOTransaction> cachedTransactions = const {},
  List<NodeWithAddress> cachedNodes = const [],
  int minEndpoints = 2,
  Duration maxLatency = const Duration(milliseconds: 800),
}) async {
  final watch = Stopwatch()..start();

  final endpoints = await getBestHealthEndpointsWithRetry(
    endpointPool: networkType.endpoints,
    token: networkType.coin,
    maxLatency: maxLatency,
    min: minEndpoints,
  );

  final isolateManager = IsolateManager();

  ///
  /// Search for Receive and Change Addresses
  ///

  final masterNode = await isolateManager.executeTask(
    IsolateTask(
      task: (arg) {
        return deriveMasterNodeFromEpubKey(arg).$1;
      },
      argument: ePubKey,
    ),
  );

  final (allTxs, nodes) = await searchTransactionsForWalletType(
    masterNode: masterNode,
    purpose: purpose,
    addressTypes: addressTypes,
    networkType: networkType,
    endpoints: endpoints,
    cachedNodes: cachedNodes,
    isolateManager: isolateManager,
  );

  isolateManager.dispose();

  return fetchMissingUTXOTransactions(
    allTxs: allTxs,
    nodes: nodes,
    cachedNodes: cachedNodes,
    cachedTransactions: cachedTransactions,
    addressTypes: addressTypes,
    coin: networkType.coin,
    endpoints: endpoints,
    networkType: networkType,
    watch: watch,
  );
}

Future<UTXOTxInfo> fetchUTXOTransactions({
  required Iterable<HDWalletPath> walletTypes,
  required Iterable<AddressType> addressTypes,
  required UTXONetworkType networkType,
  required Uint8List seed,
  Set<UTXOTransaction> cachedTransactions = const {},
  List<NodeWithAddress> cachedNodes = const [],
  int minEndpoints = 2,
  Duration maxLatency = const Duration(milliseconds: 800),
}) async {
  final watch = Stopwatch()..start();

  final endpoints = await getBestHealthEndpointsWithRetry(
    endpointPool: networkType.endpoints,
    token: networkType.coin,
    maxLatency: maxLatency,
    min: minEndpoints,
  );

  final isolateManager = IsolateManager();

  ///
  /// Search for Receive and Change Addresses
  ///

  final (allTxs, nodes) = await Future.wait([
    for (final walletType in walletTypes)
      () async {
        final masterNode = await isolateManager.executeTask(
          IsolateTask(
            task: (arg) {
              return deriveMasterNodeFromSeed(seed: arg.$1, walletPath: arg.$2);
            },
            argument: (seed, walletType),
          ),
        );
        return searchTransactionsForWalletType(
          masterNode: masterNode,
          purpose: walletType.purpose,
          addressTypes: addressTypes,
          networkType: networkType,
          endpoints: endpoints,
          cachedNodes: cachedNodes,
          isolateManager: isolateManager,
        );
      }.call()
  ]).then((value) => (
        value.expand((element) => element.$1).toSet(),
        value.expand((element) => element.$2).toSet()
      ));

  isolateManager.dispose();

  return fetchMissingUTXOTransactions(
    cachedTransactions: cachedTransactions,
    cachedNodes: cachedNodes,
    allTxs: allTxs,
    nodes: nodes,
    coin: networkType.coin,
    networkType: networkType,
    addressTypes: addressTypes,
    endpoints: endpoints,
    watch: watch,
  );
}

Future<(Set<ElectrumTransactionInfo>, Set<NodeWithAddress>)>
    searchTransactionsForWalletType({
  required BipNode masterNode,
  required HDWalletPurpose? purpose,
  required Iterable<AddressType> addressTypes,
  required UTXONetworkType networkType,
  required List<(String, int)> endpoints,
  required List<NodeWithAddress> cachedNodes,
  required IsolateManager isolateManager,
}) async {
  final receiveTxsFuture = searchForTransactions(
    masterNode: masterNode,
    chainIndex: EXTERNAL_CHAIN_INDEX,
    addressTypes: addressTypes,
    walletPurpose: purpose,
    networkType: networkType,
    endpoints: endpoints,
    cachedNodes: cachedNodes,
    isolateManager: isolateManager,
  );

  final changeTxsFuture = searchForTransactions(
    masterNode: masterNode,
    chainIndex: INTERNAL_CHAIN_INDEX,
    addressTypes: addressTypes,
    walletPurpose: purpose,
    networkType: networkType,
    endpoints: endpoints,
    cachedNodes: cachedNodes,
    isolateManager: isolateManager,
  );

  final allTxsResult = await Future.wait([receiveTxsFuture, changeTxsFuture]);
  final allTxs = allTxsResult.expand((element) => element.$1).toSet();
  final nodes = allTxsResult.expand((element) => element.$2).toSet();

  return (allTxs, nodes);
}

Future<(Set<ElectrumTransactionInfo>, List<NodeWithAddress>)>
    searchForTransactions({
  required bip32.BIP32 masterNode,
  required int chainIndex,
  required Iterable<AddressType> addressTypes,
  required HDWalletPurpose? walletPurpose,
  required UTXONetworkType networkType,
  required List<(String, int)> endpoints,
  required List<NodeWithAddress> cachedNodes,
  required IsolateManager isolateManager,
  int emptyLimit = kEmptyLimit,
}) async {
  final watch = Stopwatch()..start();

  int emptyCount = 0;

  final txs0 = <ElectrumTransactionInfo>{};

  final clients = await createClients(
    endpoints: endpoints,
    token: networkType.coin,
  );
  final batchSize = clients.length;
  final nodes = <NodeWithAddress>[];

  Logger.logFetch(
    "Fetching transactions from $batchSize ElectrumX Nodes",
  );

  if (batchSize == 0) {
    Logger.logWarning("No ElectrumX Nodes available for $networkType");
    return (txs0, nodes);
  }

  for (var index = 0; index * batchSize < kAddressesUpperLimit; index++) {
    final indexes = List.generate(batchSize, (i) => index * batchSize + i);
    final newIndexes = indexes.where(
      (i) => !cachedNodes.any(
        (cNode) => cNode.index == i && cNode.chainIndex == chainIndex,
      ),
    );

    final List<NodeWithAddress> newNodes;
    if (newIndexes.isEmpty)
      newNodes = [];
    else
      newNodes = await isolateManager.executeTask(
        IsolateTask(
          task: (arg) => [
            for (var index in indexes)
              deriveChildNode(
                masterNode: masterNode,
                chainIndex: chainIndex,
                index: index,
                networkType: networkType,
                addressTypes: addressTypes,
                walletPurpose: walletPurpose,
              ),
          ],
          argument: null,
        ),
      );

    final batchNodes = [
      ...newNodes,
      ...cachedNodes.where(
        (cNode) =>
            indexes.contains(cNode.index) && cNode.chainIndex == chainIndex,
      ),
    ];

    final futures = [
      for (int i = 0; i < batchSize; i++)
        fetchFromRandomElectrumXNode(
          (client) async {
            final txsInfos = [
              for (final type in addressTypes)
                if (batchNodes[i].addresses.containsKey(type))
                  await client.getHistory(
                    P2Hash(batchNodes[i].addresses[type]!).publicKeyScriptHash,
                  )
            ];

            return txsInfos
                .expand((e) => e ?? <ElectrumTransactionInfo>{})
                .whereType<ElectrumTransactionInfo>()
                .toSet();
          },
          endpoints: networkType.endpoints,
          client: clients[i],
          token: networkType.coin,
        ),
    ];

    final results = await Future.wait(futures);
    final batchTxs = <ElectrumTransactionInfo>{};

    for (int i = 0; i < batchSize; i++) {
      final (txs, client, error) = results[i];
      if (error != null) continue;
      if (txs == null || txs.isEmpty) continue;
      if (client != null) clients[i] = client;

      batchTxs.addAll(txs);
    }

    nodes.addAll(batchNodes);

    if (batchTxs.isEmpty) {
      emptyCount += batchSize;
      if (emptyCount >= kEmptyLimit) {
        Logger.log("Abort Search after ${index + batchSize} addresses");
        break;
      }
      continue;
    }

    txs0.addAll(batchTxs);
    emptyCount = 0;
  }

  ///
  /// Disconnect Clients
  ///
  await Future.wait([
    for (final client in clients) client.disconnect(),
  ]);

  watch.stop();
  Logger.logFetch(
    "Fetched ${txs0.length} TXs in ${watch.elapsed} $chainIndex",
  );

  return (txs0, nodes);
}

Future<Amount> estimateFeeForPriority({
  required int blocks,
  required UTXONetworkType network,
  required ElectrumXClient? initalClient,
}) async {
  final (fee, _, _) = await fetchFromRandomElectrumXNode(
    (client) => client.estimateFee(blocks: blocks),
    client: initalClient,
    endpoints: network.endpoints,
    token: network.coin,
  );

  if (fee == null) throw Exception("Fee estimation failed");

  final feePerKb = Amount.fromDouble(value: fee, decimals: 8);

  final feePerB = feePerKb / Amount.from(value: 1000, decimals: 0);

  return feePerB;
}

Future<UtxoNetworkFees> getNetworkFees({
  required UTXONetworkType network,
  double multiplier = 1.0,
}) async {
  final blockInOneHour = 3600 ~/ network.blockTime;
  final blocksTillTomorrow = 24 * 3600 ~/ network.blockTime;

  final client = await getBestHealthEndpointsWithRetry(
    endpointPool: network.endpoints,
    token: network.coin,
    max: 1,
    min: 1,
  )
      .then(
        (endpoints) => endpoints.first,
      )
      .then(
        (endpoint) => createElectrumXClient(
          endpoint: endpoint.$1,
          port: endpoint.$2,
          token: network.coin,
        ),
      );

  final next = await estimateFeeForPriority(
    blocks: 1,
    network: network,
    initalClient: client,
  );

  final second = await estimateFeeForPriority(
    blocks: 2,
    network: network,
    initalClient: client,
  );

  final hour = await estimateFeeForPriority(
    blocks: blockInOneHour,
    network: network,
    initalClient: client,
  );

  final day = await estimateFeeForPriority(
    blocks: blocksTillTomorrow,
    network: network,
    initalClient: client,
  );

  client?.disconnect();

  return UtxoNetworkFees(
    nextBlock: next.multiplyAndCeil(multiplier),
    secondBlock: second.multiplyAndCeil(multiplier),
    hour: hour.multiplyAndCeil(multiplier),
    day: day.multiplyAndCeil(multiplier),
  );
}

Future<Iterable<UTXOTransaction>> computeMissingUTXODetails({
  required Iterable<ElectrumTransactionInfo> txList,
  required Iterable<NodeWithAddress> nodes,
  required Iterable<AddressType> addressTypes,
  required UTXONetworkType type,
  required List<(String, int)> endpoints,
}) async {
  final coin = type.coin;
  if (txList.isEmpty) return [];

  final watch = Stopwatch()..start();
  final clients = await createClients(endpoints: endpoints, token: coin);

  final batchSize = clients.length;

  if (batchSize == 0) {
    throw Exception(
      "No clients available for fetching UTXO details. for token: ${coin.symbol}",
    );
  }

  final pool = List<ElectrumTransactionInfo>.from(txList);

  final nodeMap = <String, int>{};

  Future<Iterable<UTXOTransaction>> fetchFromPool(
    ElectrumXClient initalClient,
  ) async {
    final txs = <UTXOTransaction>[];
    var client = initalClient;
    while (pool.isNotEmpty) {
      final txInfo = pool.removeLast();

      final (tx, newClient, _) = await fetchFromRandomElectrumXNode(
        (client) {
          return client.getTransaction(
            txHash: txInfo.hash,
            addressTypes: addressTypes,
            nodes: nodes,
            type: type,
          );
        },
        client: client,
        endpoints: endpoints,
        token: coin,
        timeout: Duration(seconds: 3),
      );

      if (tx == null) {
        Logger.logWarning(
            "Failed to fetch TX ${txInfo.hash} from ${client.host}");
        txs.add(txInfo.getNotAvailableUTXOTransaction(type.coin));
        continue;
      }

      if (newClient != null) client = newClient;
      nodeMap[client.host] = (nodeMap[client.host] ?? 0) + 1;
      txs.add(tx);
    }

    return txs;
  }

  final futures = [
    for (final client in clients) fetchFromPool(client),
  ];

  final results = await Future.wait(futures);

  final txs = results.expand((e) => e).toList();

  watch.stop();
  Logger.logFetch(
    "Fetched ${txs.length} transactions in ${watch.elapsed}",
  );

  ///
  /// Disconnect Clients
  ///
  await Future.wait([
    for (final client in clients) client.disconnect(),
  ]);

  return txs;
}

///
/// Returns a map of UTXOs which belong to us and are unspent and their corresponding transactions
///
Map<ElectrumOutput, UTXOTransaction> extractUTXOs({
  required Iterable<UTXOTransaction> txList,
}) {
  Map<ElectrumOutput, UTXOTransaction> utxoMap = {};
  for (final tx in txList) {
    for (final ElectrumOutput output in tx.outputs) {
      if (output.spent == false && output.belongsToUs == true) {
        utxoMap[output] = tx;
      }
    }
  }
  return utxoMap;
}

///
/// Returns a map of UTXOs which belong to us and are unspent and their corresponding transactions
///
Map<ElectrumOutput, UTXOTransaction> extractAllUTXOs({
  required Iterable<UTXOTransaction> txList,
  bool own = true,
}) {
  Map<ElectrumOutput, UTXOTransaction> utxoMap = {};
  for (final tx in txList) {
    for (final ElectrumOutput output in tx.outputs) {
      if (own) {
        if (output.belongsToUs == true) {
          utxoMap[output] = tx;
        }
      } else {
        utxoMap[output] = tx;
      }
    }
  }
  return utxoMap;
}

///
/// Returns a map of UTXOs which belong to us and are unspent and their corresponding transactions
///
List<ElectrumOutput> getSpendableOutputs(
        {required List<UTXOTransaction> txList}) =>
    [
      for (final tx in txList)
        for (final ElectrumOutput output in tx.outputs)
          if (output.spent == false && output.belongsToUs == true) output
    ];

BigInt computeBalanceFromUTXOs({
  required Iterable<UTXOTransaction> txList,
}) {
  BigInt balance = BigInt.zero;
  for (final tx in txList) {
    for (final ElectrumOutput output in tx.outputs) {
      if (output.spent == false && output.belongsToUs == true) {
        balance += output.value;
      }
    }
  }
  return balance;
}

BigInt computeBalanceFromVisualList({
  required Iterable<UTXOTransaction> txList,
}) {
  BigInt balance = BigInt.zero;
  for (final tx in txList) {
    if (tx.transferMethod == TransactionTransferMethod.receive) {
      balance += tx.value;
    }

    if (tx.transferMethod == TransactionTransferMethod.send) {
      balance -= tx.value;
    }
  }
  return balance;
}

TransactionTransferMethod determineSendDirection({
  required List<ElectrumInput> inputs,
  required List<ElectrumOutput> outputs,
  required Iterable<NodeWithAddress> nodes,
  required UTXONetworkType type,
  required Iterable<AddressType> addressTypes,
}) {
  bool anyInputsAreOurs;
  try {
    anyInputsAreOurs = inputs.any((input) {
      final inputAddress = input.getAddresses(
        addressTypes: addressTypes,
        networkType: type,
      );
      return nodes.addresses.any(
        (nodeAddress) => inputAddress.contains(nodeAddress),
      );
    });
  } catch (e) {
    anyInputsAreOurs = false;
  }

  final anyOutputsAreOurs = outputs.any((output) => output.belongsToUs);

  final outputsHaveReceive = outputs.any((output) {
    final outputAddresses = output.getAddresses(
      addressTypes: addressTypes,
      networkType: type,
    );
    return nodes.receiveNodes.addresses.any(
      (nodeAddress) => outputAddresses.contains(nodeAddress),
    );
  });

  final outputsHaveChange = outputs.any((output) {
    final outputAddresses = output.getAddresses(
      addressTypes: addressTypes,
      networkType: type,
    );
    return nodes.changeNodes.addresses.any(
      (nodeAddress) => outputAddresses.contains(nodeAddress),
    );
  });

  return switch ((anyInputsAreOurs, anyOutputsAreOurs)) {
    (true, true) when outputsHaveReceive => TransactionTransferMethod.own,
    (true, true) when outputsHaveChange && outputs.length == 1 =>
      TransactionTransferMethod.own,
    (true, true) => TransactionTransferMethod.send,
    (true, false) => TransactionTransferMethod.send,
    (false, true) => TransactionTransferMethod.receive,
    _ => TransactionTransferMethod.unknown,
  };
}

List<ElectrumOutput> findOurOwnCoins(
  List<ElectrumOutput> outputs,
  Iterable<NodeWithAddress> nodes,
  Iterable<AddressType> addressTypes,
  UTXONetworkType type,
) {
  final outputs0 = <ElectrumOutput>[];
  for (final vout in outputs) {
    final outputAddresses = vout.getAddresses(
      networkType: type,
      addressTypes: addressTypes,
    );

    final node = nodes.singleWhereOrNull(
      (node) => node.addressesList.any(
        (nodeAddress) => outputAddresses.contains(nodeAddress),
      ),
    );
    final belongsToUs = node != null;
    outputs0.add(
      vout.copyWith(
        belongsToUs: belongsToUs,
        node: node,
      ),
    );
  }
  return outputs0;
}

(BigInt, BigInt) determineTransactionValue(
  List<ElectrumOutput> outputs,
  TransactionTransferMethod transferMethod,
  Iterable<NodeWithAddress> nodes,
  UTXONetworkType type,
) {
  final ourValue = switch (transferMethod) {
    TransactionTransferMethod.receive => outputs.fold(
        BigInt.zero,
        (prev, output) {
          if (output.belongsToUs) {
            return prev + output.value;
          }
          return prev;
        },
      ),
    TransactionTransferMethod.own => outputs
            .singleWhereOrNull(
              (output) => output.node is ReceiveNode,
            )
            ?.value ??
        BigInt.from(-1),
    TransactionTransferMethod.send => outputs.fold(
        BigInt.zero,
        (prev, output) {
          if (!output.belongsToUs) {
            return prev + output.value;
          }
          return prev;
        },
      ),
    TransactionTransferMethod.unknown => BigInt.from(-1),
  };
  final totalValue = outputs.fold(
    BigInt.zero,
    (prev, output) => prev + output.value,
  );

  return (ourValue, totalValue);
}

String? determineTransactionTarget(
  List<ElectrumOutput> outputs,
  TransactionTransferMethod transferMethod,
  UTXONetworkType type,
  AddressType addressType,
) {
  final mainOutput = _findMainOutput(outputs, transferMethod);
  return mainOutput?.getAddress(type, addressType: addressType);
}

ElectrumOutput? _findMainOutput(
  List<ElectrumOutput> outputs,
  TransactionTransferMethod transferMethod,
) {
  final voutListFull = outputs;

  final isMainOutputOurOwn =
      transferMethod == TransactionTransferMethod.receive ||
          transferMethod == TransactionTransferMethod.own;
  final voutList =
      voutListFull.where((v) => v.belongsToUs == isMainOutputOurOwn).toList();
  if (voutList.isEmpty) {
    return null;
  }

  ElectrumOutput highestVout = voutList[0];
  for (final v in voutList) {
    final valueCoin = v.value;
    if (valueCoin > highestVout.value) {
      highestVout = v;
    }
  }
  return highestVout;
}
