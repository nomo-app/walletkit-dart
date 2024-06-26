import 'dart:typed_data';
import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/contract/contract_abi.dart';
import 'package:walletkit_dart/src/crypto/evm/transaction/internal_evm_transaction.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/transaction_information.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

const _maxTxNumber = 100;
const _batchSize = 10;

final class EvmRpcInterface {
  final EvmRpcClient client;
  final EVMNetworkType type;
  final Map<int, int> blockTimestampCache = {};
  final Map<String, ConfirmationStatus> txStatusCache = {};

  EvmRpcInterface(this.type) : client = EvmRpcClient(type.rpcUrl);

  EvmRpcInterface.fromURL(String rpcURL)
      : client = EvmRpcClient(rpcURL),
        type = ETHEREUM_NETWORK();

  ///
  /// Fetch Balance
  ///
  Future<Amount> fetchBalance({
    required String address,
  }) async {
    final balance = await client.getBalance(address);
    return Amount(
      value: balance,
      decimals: type.coin.decimals,
    );
  }

  ///
  /// Fetch Token Balance
  ///
  Future<Amount> fetchTokenBalance(
    String address,
    EthBasedTokenEntity token,
  ) async {
    final erc20Contract = ERC20Contract(
      contractAddress: token.contractAddress,
      rpc: this,
    );
    final balance = await erc20Contract.getBalance(address);
    return Amount(value: balance, decimals: token.decimals);
  }

  ///
  /// Fetch Transactions
  ///
  Future<List<ZeniqSmartChainTransaction>> fetchAllTransactionsZSC({
    required String address,
    int? block,
  }) async {
    block = block == null ? 1 : ++block;

    var txs = await _fetchTransactionsOrNull(address: address, block: block);
    if (txs != null) {
      txs.sort((a, b) => b.timeMilli.compareTo(a.timeMilli));
      return txs; // normal case: no binary search needed
    }

// binary search for circumventing issue VGI-1719
    final lastBlock = await client.getBlockNumber();
    int start = block;
    int end = lastBlock;

    while (start <= end) {
      int mid = start + (end - start) ~/ 2;
      final tryTXs =
          await _fetchTransactionsOrNull(address: address, block: mid);
      if (tryTXs == null) {
        start = mid + 1;
      } else {
        if (tryTXs.length >= _maxTxNumber) {
          return tryTXs; // abort binary search if limit is already attained
        }
        txs = tryTXs;
        end = mid - 1;
      }
    }

    txs!.sort((a, b) => b.timeMilli.compareTo(a.timeMilli));

    return txs;
  }

  ///
  /// Fetch ERC721 Tokens
  ///
  Future<List<ERC721Entity>> fetchZEN721Transfers({
    required String nftContractAddress,
    required String address,
  }) async {
    const String _block = "0x0";
// keccak256("Transfer(address,address,uint256)") = 0xddf2...
    const eventSignature =
        "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef";
    final topicAddress =
        address.replaceFirst("0x", "0x000000000000000000000000");
    final incomingTransfersFuture = client.getLogs(
      fromBlock: _block,
      toBlock: "latest",
      address: nftContractAddress,
      topics: [eventSignature, null, topicAddress, null],
    );
    final outgoingTransfersFuture = client.getLogs(
      fromBlock: _block,
      toBlock: "latest",
      address: nftContractAddress,
      topics: [eventSignature, topicAddress, null, null],
    );
    final results = await Future.wait(
      [incomingTransfersFuture, outgoingTransfersFuture],
    );
    final transferLogs = _extractOwnedNFTsFromTransferLogs(
      address: address,
      incomingTransfers: results[0],
      outgoingTransfers: results[1],
    );
    return transferLogs
        .map(
          (transferLog) => _mapTransferLogToERC721Entity(
            transferLog: transferLog,
            nftContractAddress: nftContractAddress,
          ),
        )
        .toList();
  }

  ///
  /// Fetch ERC721 Transacions
  ///
  Future<List<ZeniqSmartChainTransaction>> fetchZEN20Transfers({
    required EthBasedTokenEntity token,
    required String address,
    int? block,
  }) async {
    block = block == null ? 1 : ++block;
    final _block = block.toHexWithPrefix;
// keccak256("Transfer(address,address,uint256)") = 0xddf2...
    const eventSignature =
        "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef";
    final topicAddress = address.replaceFirst(
      "0x",
      "0x000000000000000000000000",
    );
    final outgoingTransfersFuture = client.getLogs(
      fromBlock: _block,
      toBlock: "latest",
      address: token.contractAddress,
      topics: [eventSignature, topicAddress],
    );
    final incomingTransfersFuture = client.getLogs(
      fromBlock: _block,
      toBlock: "latest",
      address: token.contractAddress,
      topics: [eventSignature, null, topicAddress],
    );
    final res = await Future.wait(
      [outgoingTransfersFuture, incomingTransfersFuture],
    );
    var outgoingTransfers = res.first.toList();
    var incomingTransfers = res.last.toList();

    var allTransfersSorted = [
      ...outgoingTransfers
          .map((transfer) => (TransactionTransferMethod.send, transfer)),
      ...incomingTransfers
          .map((transfer) => (TransactionTransferMethod.receive, transfer)),
    ]..sort((a, b) {
        final aBlock = int.parse(a.$2["blockNumber"]);
        final bBlock = int.parse(b.$2["blockNumber"]);
        return bBlock.compareTo(aBlock);
      });

    allTransfersSorted = allTransfersSorted.take(_maxTxNumber).toList();

    outgoingTransfers = allTransfersSorted
        .where((transfer) => transfer.$1 == TransactionTransferMethod.send)
        .map((transfer) => transfer.$2)
        .toList();

    incomingTransfers = allTransfersSorted
        .where((transfer) => transfer.$1 == TransactionTransferMethod.receive)
        .map((transfer) => transfer.$2)
        .toList();

    assert(
      outgoingTransfers.length + incomingTransfers.length <= _maxTxNumber,
    ); // sanity check

    final currentBlockNumber = await client.getBlockNumber();
    final transfers = [
      ...await Future.wait(
        outgoingTransfers.map(
          (transferLog) => _mapTransferLogToZSCTransaction(
            transferLog: transferLog,
            direction: TransactionTransferMethod.send,
            token: token,
            currentBlockNumber: currentBlockNumber,
          ),
        ),
      ),
      ...await Future.wait(
        incomingTransfers.map(
          (transferLog) => _mapTransferLogToZSCTransaction(
            transferLog: transferLog,
            direction: TransactionTransferMethod.receive,
            token: token,
            currentBlockNumber: currentBlockNumber,
          ),
        ),
      ),
    ]..sort((a, b) => b.timeMilli.compareTo(a.timeMilli));
    return transfers;
  }

  Future<(Amount, int)> estimateNetworkFees({
    required String recipient,
    required String sender,
    required Uint8List? data,
    required BigInt? value,
  }) async {
    return await client.getGasPrice().then(
          (gasPrice) async => (
            Amount(value: gasPrice, decimals: 18),
            await estimateGasLimit(
              recipient: recipient,
              sender: sender,
              data: data,
              gasPrice: gasPrice,
              value: value,
            )
          ),
        );
  }

  ///
  /// Send Currency
  ///
  Future<String> sendCoin({
    required TransferIntent<EvmFeeInformation> intent,
    required String from,
    required Uint8List seed,
  }) async {
    final tx = await buildTransaction(
      sender: from,
      recipient: intent.recipient,
      seed: seed,
      feeInfo: intent.feeInfo,
      data: intent.encodedMemo,
      value: intent.amount.value,
    );

    final balance = await client.getBalance(toChecksumAddress(from));

    final estimatedFee = tx.gasPrice * tx.gasLimit;

    if (balance < estimatedFee + tx.value) {
      throw Failure("Insufficient funds to pay native gas fee");
    }

    return await client.sendRawTransaction(
      tx.serializedTransactionHex,
    );
  }

  ///
  /// Send ERC20 Token
  ///
  Future<String> sendERC20Token({
    required TransferIntent<EvmFeeInformation> intent,
    required String from,
    required Uint8List seed,
  }) async {
    assert(intent.token is EthBasedTokenEntity);
    assert(intent.memo == null);

    final erc20 = intent.token as EthBasedTokenEntity;
    final tokenContractAddress = erc20.contractAddress;

    final erc20Contract = ERC20Contract(
      contractAddress: tokenContractAddress,
      rpc: this,
    );

    return erc20Contract.transfer(
      seed: seed,
      sender: from,
      to: intent.recipient,
      value: intent.amount.value,
      feeInfo: intent.feeInfo,
    );

    // final data = contractAbiErc20.encodedFunctionForString(
    //   'transfer',
    //   [
    //     intent.recipient,
    //     intent.amount.value,
    //   ],
    // );

    // final signedTx = await buildTransaction(
    //   sender: from,
    //   recipient: tokenContractAddress,
    //   seed: seed,
    //   feeInfo: intent.feeInfo,
    //   data: data,
    //   value: BigInt.zero,
    // );

    // final result = await client.sendRawTransaction(
    //   signedTx.serializedTransactionHex,
    // );

    // return result;
  }

  ///
  /// Used to create a raw Transactions
  /// Fetches the gasPrice and gasLimit from the network
  /// Fetches the nonce from the network
  /// Signs the transaction
  ///
  Future<InternalEVMTransaction> buildTransaction({
    required String sender,
    required String recipient,
    required Uint8List seed,
    required EvmFeeInformation? feeInfo,
    required Uint8List? data,
    required BigInt? value,
  }) async {
    final (gasPrice, gasLimit) = feeInfo != null
        ? (feeInfo.gasPrice, feeInfo.gasLimit)
        : await estimateNetworkFees(
            recipient: recipient,
            sender: sender,
            data: data,
            value: value,
          );

    final nonce = await client.getTransactionCount(sender);

    final unsignedTx = RawEVMTransaction(
      nonce: nonce,
      gasPrice: gasPrice.value,
      gasLimit: gasLimit.toBI,
      to: recipient,
      value: value ?? BigInt.zero,
      chainId: type.chainId.toBigInt,
      data: data,
    );

    final signedTx = InternalEVMTransaction.signTransaction(
      unsignedTx,
      derivePrivateKeyETH(
        seed,
      ), // TODO: Derivation shouldnt happen here as it will block the main thread
    );

    return signedTx;
  }

  Future<String> buildAndBroadcastTransaction({
    required String sender,
    required String recipient,
    required Uint8List seed,
    required EvmFeeInformation? feeInfo,
    required Uint8List? data,
    required BigInt? value,
  }) async {
    final signedTx = await buildTransaction(
      sender: sender,
      recipient: recipient,
      seed: seed,
      feeInfo: feeInfo,
      data: data,
      value: value,
    );

    final result = await client.sendRawTransaction(
      signedTx.serializedTransactionHex,
    );

    return result;
  }

  Future<String> readContract({
    required String contractAddress,
    required ContractFunction function,
    required List<dynamic> params,
  }) async {
    assert(
      function.stateMutability == StateMutability.view ||
          function.stateMutability == StateMutability.pure,
      "Invalid function",
    );

    final data = function.encodeFunction(params).hexToBytes;

    return await client.call(
      contractAddress: contractAddress,
      data: data,
    );
  }

  ///
  /// Interact with Contract
  ///
  Future<String> interactWithContract({
    required String contractAddress,
    required ContractFunction function,
    required List<dynamic> params,
    required String sender,
    required Uint8List seed,
    required EvmFeeInformation? feeInfo,
    BigInt? value,
  }) async {
    final valid = switch ((function.stateMutability, value)) {
      (StateMutability.nonpayable, BigInt? value) => value == null ||
          value == BigInt.zero, // If nonpayable, value must be 0 or null
      (StateMutability.payable, BigInt? value) =>
        value != null && value != BigInt.zero, // If payable, value must be set
      _ => false,
    };
    assert(valid, "Invalid value for state mutability of function");

    final data = function.encodeFunction(params).hexToBytes;

    return await buildAndBroadcastTransaction(
      sender: sender,
      recipient: contractAddress,
      seed: seed,
      feeInfo: feeInfo,
      data: data,
      value: value ?? BigInt.zero,
    );
  }

  Future<int> estimateGasLimit({
    required String sender,
    required String recipient,
    required Uint8List? data,
    required BigInt? value,
    required BigInt? gasPrice,
  }) async {
    final dataHex = data != null ? "0x" + data.toHex : null;

    // if (type is ZKSYNC_NETWORK) {
    //   return await client
    //       .estimateZkSyncFee(
    //         from: sender,
    //         to: recipient,
    //         data: dataHex,
    //       )
    //       .then((value) => value.toInt());
    // }

    return await client
        .estimateGasLimit(
          from: sender,
          to: recipient,
          data: dataHex,
          amount: value,
          gasPrice: gasPrice,
        )
        .then((value) => value.toInt());
  }

  ///
  /// Send ERC721
  ///
  Future<String> sendERC721Nft({
    required String recipient,
    required String from,
    required int tokenId,
    required String contractAddress,
    required Uint8List seed,
  }) async {
    final function = ContractFunction(
      name: "transferFrom",
      parameters: [
        FunctionParam(name: "from", type: FunctionParamType.address),
        FunctionParam(name: "to", type: FunctionParamType.address),
        FunctionParam(name: "tokenId", type: FunctionParamType.uint),
      ],
      stateMutability: StateMutability.nonpayable,
      outputs: [],
    );

    return await interactWithContract(
      contractAddress: contractAddress,
      function: function,
      params: [from, recipient, tokenId],
      sender: from,
      seed: seed,
      feeInfo: null,
    );
  }

  ///
  /// UTILS
  ///

  BigInt _getTokenID(dynamic transferLog) {
    return BigInt.parse(transferLog["topics"][3]);
  }

  String _getTransferTarget(dynamic transferLog) {
    return transferLog["topics"][2]
        .replaceFirst("0x000000000000000000000000", "0x");
  }

  String _getTransferSource(dynamic transferLog) {
    return transferLog["topics"][1]
        .replaceFirst("0x000000000000000000000000", "0x");
  }

  int _getBlockNumber(dynamic transferLog) {
    return int.parse(transferLog["blockNumber"]);
  }

  List<dynamic> _extractOwnedNFTsFromTransferLogs({
    required String address,
    required List<dynamic> incomingTransfers,
    required List<dynamic> outgoingTransfers,
  }) {
    final Map<BigInt, int> sentAwayTimestamps =
        _extractMapFromTokenIDToBlockNumber(outgoingTransfers, (from, to) {
      return (from.toLowerCase() == address.toLowerCase() &&
          to.toLowerCase() != address.toLowerCase());
    });
    final Map<BigInt, int> receivedTimestamps =
        _extractMapFromTokenIDToBlockNumber(incomingTransfers, (from, to) {
      return to.toLowerCase() == address.toLowerCase();
    });

    return incomingTransfers.where((transferLog) {
      final BigInt tokenID = _getTokenID(transferLog);
      final int timeStamp = _getBlockNumber(transferLog);
      final int? timeOfReceive = receivedTimestamps[tokenID];
      if (timeOfReceive == null) {
        return true; // should never happen
      }
      if (timeStamp != timeOfReceive) {
        return false; // deduplication
      }
      final int? timeOfSend = sentAwayTimestamps[tokenID];
      return timeOfSend == null || timeOfSend <= timeOfReceive;
    }).toList();
  }

  Map<BigInt, int> _extractMapFromTokenIDToBlockNumber(
    List<dynamic> transferLogs,
    bool Function(String, String) filter,
  ) {
    final Map<BigInt, int> map = {};
    for (final log in transferLogs) {
      final from = _getTransferSource(log);
      final to = _getTransferTarget(log);
      if (filter(from, to)) {
        final BigInt tokenID = _getTokenID(log);
        final int blockNumber = _getBlockNumber(log);
        if (map.containsKey(tokenID) == false || map[tokenID]! < blockNumber) {
          map[tokenID] = blockNumber;
        }
      }
    }
    return map;
  }

  ERC721Entity _mapTransferLogToERC721Entity({
    required dynamic transferLog,
    required String nftContractAddress,
  }) {
    final blockNumber = int.parse(transferLog["blockNumber"]);
    final from = _getTransferSource(transferLog);
    final to = _getTransferTarget(transferLog);
    final tokenID = _getTokenID(transferLog);
// some of those fields are largely ignored
    return ERC721Entity(
      blockNumber: blockNumber,
      hash: transferLog["transactionHash"],
      tokenID: tokenID,
      contractAddress: nftContractAddress,
      to: to,
      from: from,
      tokenName: avinocZSC.name,
      dateTime: DateTime.now(),
    );
  }

  Future<ZeniqSmartChainTransaction> _mapTransferLogToZSCTransaction({
    required Json transferLog,
    required TransactionTransferMethod direction,
    required TokenEntity token,
    required int currentBlockNumber,
  }) async {
    final blockNumber = int.parse(transferLog["blockNumber"]);
    final hash = transferLog["transactionHash"];

    final time = await _getBlockTimestamp(blockNumber);
    final confirmations = currentBlockNumber - blockNumber;
    final status = await getConfirmationStatus(hash);

    return ZeniqSmartChainTransaction.fromJson(
      transferLog,
      token: token,
      transferMethod: direction,
      confirmations: confirmations,
      timestamp: time,
      status: status,
    );
  }

  Future<List<ZeniqSmartChainTransaction>?> _fetchTransactionsOrNull({
    required String address,
    required int block,
  }) async {
    try {
      final txs = await _fetchTransactionsRaw(address: address, block: block);
      return txs;
    } catch (e, s) {
      if (e.toString().contains("too many potential results")) {
        return null; // special error for the binary-search algorithm
      }
      Logger.logError(e, s: s, hint: "Fetch ZSC TXs");
      rethrow; // regular network error -> rethrow and handle error outside
    }
  }

  Future<List<ZeniqSmartChainTransaction>> _fetchTransactionsRaw({
    required String address,
    required int block,
  }) async {
    final result = await client.queryTxByAddr(
      address: address,
      startBlock: "latest",
      endBlock: block.toHexWithPrefix,
      maxTx: _maxTxNumber,
    );

    final rawTxs = [
      for (final Json map in result) TransactionInformation.fromMap(map)
    ];

    Logger.log(rawTxs.length.toString() + " ZSC TXs found");

    final currentBlockNumber = await client.getBlockNumber();
    final txs = <ZeniqSmartChainTransaction>[];
    while (rawTxs.isNotEmpty) {
      final _txs = await Future.wait([
        for (int i = 0; i < _batchSize; i++)
          if (rawTxs.isNotEmpty)
            _extractTx(
              rawTx: rawTxs.removeLast(),
              address: address,
              currentBlockNumber: currentBlockNumber,
            )
      ]);

      txs.addAll(_txs);
    }

    return txs;
  }

  Future<ZeniqSmartChainTransaction> _extractTx({
    required TransactionInformation rawTx,
    required String address,
    required int currentBlockNumber,
  }) async {
    final blockNumber = rawTx.blockNumber.blockNum;

    final time = await _getBlockTimestamp(blockNumber);
    final confirmations = currentBlockNumber - blockNumber;
    final status = await getConfirmationStatus(rawTx.hash);

    final amount = Amount(
      value: rawTx.value,
      decimals: zeniqSmart.decimals,
    );

    final feeVal = rawTx.gasPrice * rawTx.gas.toBI;
    final fee = Amount(
      value: feeVal,
      decimals: zeniqSmart.decimals,
    );

    // when "to" is null, then it is probably a contract creation transaction
    final recipient = rawTx.to ?? "Contract Creation";
    final sender = rawTx.from;
    final transferMethod = TransactionTransferMethod.fromAddress(
      address,
      recipient,
      sender,
    );
    return ZeniqSmartChainTransaction(
      block: blockNumber,
      timeMilli: time * 1000,
      amount: amount,
      status: status,
      hash: rawTx.hash,
      sender: sender,
      recipient: recipient,
      transferMethod: transferMethod,
      fee: fee,
      token: zeniqSmart,
      confirmations: confirmations,
      input: rawTx.input,
    );
  }

  Future<int> _getBlockTimestamp(int blockNumber) async {
    if (blockTimestampCache[blockNumber] == null) {
      blockTimestampCache[blockNumber] =
          await client.getBlockTimestamp(blockNumber);
    }
    return blockTimestampCache[blockNumber]!;
  }

  Future<ConfirmationStatus> getConfirmationStatus(String hash) async {
    if (txStatusCache[hash] == null ||
        txStatusCache[hash] == ConfirmationStatus.pending) {
      final json = await client.getTransactionReceipt(hash);
      txStatusCache[hash] = _confirmationStatusFromJson(json);
    }
    return txStatusCache[hash]!;
  }

  ConfirmationStatus _confirmationStatusFromJson(Json json) {
    if (json
        case {
          "status": String status_s,
        }) {
      final status = status_s.toBigIntOrNull;
      if (status == null) throw Exception('Could not parse status');
      if (status == BigInt.from(0)) return ConfirmationStatus.failed;
      if (status == BigInt.from(1)) return ConfirmationStatus.confirmed;
    }

    return ConfirmationStatus.pending;
  }
}
