import 'package:walletkit_dart/src/common/types.dart';
import 'package:walletkit_dart/src/domain/repository/endpoint_utils.dart';
import 'package:walletkit_dart/src/domain/repository/models/electrum_peer.dart';
import 'package:walletkit_dart/src/domain/repository/models/electrum_transaction.dart';
import 'package:walletkit_dart/src/domain/repository/utxo_in_memory_cache.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

import 'json_rpc_client.dart';

class ElectrumXClient {
  final TcpJsonRpcClient _client;

  ElectrumXClient(this._client);

  Future<int?> getCurrentBlock() async {
    final response = await _client.sendRequest(
      {"method": "blockchain.headers.subscribe", "params": []},
    );
    if (response == null || response is! Json) return null;
    final block = response["height"];
    return block;
  }

  Future<List<ElectrumPeer>?> fetchPeers() async {
    final response = await _client.sendRequest(
      {"method": "server.peers.subscribe", "params": []},
    );
    if (response == null || response is! JsonList) return null;

    return [
      for (var [_, String host, [String version, ...args]] in response)
        if (args.whereType<String>().any((args) => args.startsWith("t")))
          ElectrumPeer.fromJson(
            host: host,
            version: version,
            args: args,
          )
    ];
  }

  Future<UTXOTransaction> getTransaction({
    required String txHash,
    required Iterable<AddressType> addressTypes,
    required UTXONetworkType type,
    required Iterable<NodeWithAddress> nodes,
    bool verbose = true,
  }) async {
    final cache = getUtxoInMemoryCache(type.coin);
    final cachedTx = cache.getTx(txHash: txHash);
    if (cachedTx != null) {
      return cachedTx;
    }
    assert(nodes.isNotEmpty, "Nodes must not be empty");

    Future<Json> blockchainTransactionGet(String txHash) async {
      final response = await _client.sendRequest(
        {
          "method": "blockchain.transaction.get",
          "params": [txHash, verbose]
        },
      );
      if (response == null || response is! Json) {
        throw Exception("Could not fetch transaction $txHash from ElectrumX");
      }

      return response;
    }

    ///
    /// Get Initial Transaction
    ///
    try {
      final mainTxJson = await blockchainTransactionGet(txHash);

      ///
      /// Get Transaction Inputs
      ///
      // final inputs = <(String, int)>[];
      // if (mainTxJson case {"vin": JsonList _inputs}) {
      //   for (final {"txid": String txid, "vout": int index} in _inputs) {
      //     inputs.add((txid, index));
      //   }
      // }
      // final outputsFutures = [
      //   for (final (hash, index) in inputs)
      //     blockchainTransactionGet(hash).then((tx) {
      //       if (tx case {"vout": JsonList _outputs}) {
      //         return ElectrumOutput.fromJson(_outputs[index]);
      //       }
      //     })
      // ];

      // Logger.logWarning("Fetching ${outputsFutures.length} outputs for $txHash");

      // final outputs = await Future.wait(outputsFutures);

      final tx = UTXOTransaction.create(
        json: mainTxJson,
        addressTypes: addressTypes,
        type: type,
        nodes: nodes,
        spentOutputs: [],
      );

      /// P2SH Addresses ?

      cache.insertTxIfConfirmed(tx);
      return tx;
    } catch (e) {
      throw Exception("Could not fetch transaction $txHash from ElectrumX");
    }
  }

  Future<UTXOTransaction> getTransactionForSimulation({
    required String txHash,
    required Iterable<AddressType> addressTypes,
    required UTXONetworkType type,
    required Iterable<NodeWithAddress> nodes,
    bool verbose = true,
  }) async {
    Future<Json> blockchainTransactionGet(String txHash) async {
      final response = await _client.sendRequest(
        {
          "method": "blockchain.transaction.get",
          "params": [txHash, verbose]
        },
      );
      if (response == null || response is! Json) {
        throw Exception("Could not fetch transaction $txHash from ElectrumX");
      }

      return response;
    }

    ///
    /// Get Initial Transaction
    ///
    final mainTxJson = await blockchainTransactionGet(txHash);

    ///
    /// Get Transaction Inputs
    ///
    final inputs = <(String, int)>[];
    if (mainTxJson case {"vin": JsonList _inputs}) {
      for (final input in _inputs) {
        if (input case {"txid": String txid, "vout": int index})
          inputs.add((txid, index));
      }
    }
    final outputs = [
      for (final (hash, index) in inputs)
        await blockchainTransactionGet(hash).then((tx) {
          if (tx case {"vout": JsonList _outputs}) {
            return ElectrumOutput.fromJson(_outputs[index]);
          }
        })
    ];

    return UTXOTransaction.create(
      json: mainTxJson,
      addressTypes: addressTypes,
      type: type,
      nodes: nodes,
      spentOutputs: outputs.whereType<ElectrumOutput>(),
    );
  }

  // do not use getRaw because it does not use an in-memory-cache !
  Future<String?> getRaw(
    String txHash, {
    bool verbose = false,
  }) async {
    final response = await _client.sendRequest(
      {
        "method": "blockchain.transaction.get",
        "params": [txHash, verbose]
      },
    );
    return response.toString();
  }

  Future<Set<ElectrumTransactionInfo>?> getHistory(
    String publicKeyScriptHash,
  ) async {
    final response = await _client.sendRequest(
      {
        "method": "blockchain.scripthash.get_history",
        "params": [publicKeyScriptHash]
      },
    );
    if (response == null || response is! List<dynamic>) return null;
    return {
      for (final json in response) ElectrumTransactionInfo.fromJson(json),
    };
  }

  Future<String> broadcastTransaction({required String rawTxHex}) async {
    final response = await _client.sendRawRequest(
      {
        "method": "blockchain.transaction.broadcast",
        "params": [rawTxHex]
      },
    );
    return response;
  }

  Future<double> estimateFee({required int blocks}) async {
    final response = await _client.sendRequest(
      {
        "method": "blockchain.estimatefee",
        "params": [blocks]
      },
    );
    final fee = response as double?;
    if (fee == null || fee == 0) throw Exception("Fee estimation failed");
    return fee;
  }

  Future<bool> disconnect() async {
    await _client.disconnect();
    return true;
  }

  String get host => _client.host;
}

Future<String> fetchRawTxByHash(
  String hash,
  UTXONetworkType networkType,
) async {
  final (result, _client, _) = await fetchFromRandomElectrumXNode(
    (client) async {
      return await client.getRaw(hash);
    },
    client: null,
    endpoints: networkType.endpoints,
    token: networkType.coin,
    timeout: Duration(seconds: 20),
  );
  await _client?.disconnect();
  if (result == null || result.isEmpty || result == "null") {
    throw Exception("No result for $hash");
  }

  return result;
}
