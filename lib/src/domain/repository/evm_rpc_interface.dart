import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/src/crypto/evm/address_validation.dart';
import 'package:walletkit_dart/src/crypto/evm/evm_client.dart';
import 'package:walletkit_dart/src/crypto/network_type.dart';
import 'package:walletkit_dart/src/domain/constants.dart';
import 'package:walletkit_dart/src/domain/entities/asset/token_entity.dart';
import 'package:walletkit_dart/src/domain/predefined_assets.dart';
import 'package:walletkit_dart/src/crypto/evm/abi/erc20_contract.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/amount.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/generic_transaction.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/transfer_intent.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/utxo_transaction.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/domain/extensions.dart';
import 'package:walletkit_dart/src/domain/entities/erc721_entity.dart';
import 'package:walletkit_dart/src/domain/entities/transactions/zsc_transaction.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:web3dart/web3dart.dart';

const _maxTxNumber = 1E3;
const _batchSize = 10;

final class EvmRpcInterface {
  final EvmRpcClient client;
  final EVMNetworkType type;
  final Map<int, int> blockTimestampCache = {};

  EvmRpcInterface(this.type) : client = EvmRpcClient(type.rpcUrl);

  ///
  /// Fetch Balance
  ///
  Future<Amount> fetchBalance({
    required String address,
  }) async {
    final balance = await client.getBalance(address);
    return Amount(
      value: balance,
      decimals: zeniqSmart.decimals,
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
      address: token.contractAddress.toEVMAddress,
      client: client.asWeb3,
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
    final outgoingTransfers = res.first;
    final incomingTransfers = res.last;
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

  ///
  /// Send Currency
  ///
  Future<String> sendCoin({
    required TransferIntent intent,
    required Credentials credentials,
  }) async {
    final ethAddress = credentials.address;

    final gasPrice = await client.getGasPrice();
    final balance = await client.getBalance(toChecksumAddress(ethAddress.hex));

    final gasPriceEther = EtherAmount.fromBigInt(EtherUnit.wei, gasPrice);

    BigInt amountWei = intent.amount.value;

    // native EVM sending should always consume 21000 gas
    final BigInt estimatedFee = BigInt.from(GasLimits.ethSend.value) * gasPrice;
    if (balance < (estimatedFee + amountWei)) {
      // subtract the fee if the transaction would otherwise fail!
      amountWei -= estimatedFee;
      if (amountWei < BigInt.from(0)) {
        throw Failure("Insufficient funds to pay native gas fee");
      }
    }

    return await client.asWeb3.sendTransaction(
      credentials,
      Transaction(
        from: ethAddress,
        to: EthereumAddress.fromHex(toChecksumAddress(intent.recipient)),
        value: EtherAmount.fromBigInt(EtherUnit.wei, amountWei),
        gasPrice: gasPriceEther,
        maxGas: GasLimits.ethSend.value,
      ),
      chainId: type.chainId,
    );
  }

  ///
  /// Send ERC20 Token
  ///
  Future<String> sendERC20Token({
    required TransferIntent intent,
    required Credentials credentials,
  }) async {
    assert(intent.token is EthBasedTokenEntity);
    final token = intent.token as EthBasedTokenEntity;
    final contractAddress = EthereumAddress.fromHex(token.contractAddress);

    final tokenContract = ERC20Contract(
      address: contractAddress,
      client: client.asWeb3,
      chainId: type.chainId,
    );

    final gasPrice = await client.getGasPrice();
    final gasPriceEther = EtherAmount.fromBigInt(EtherUnit.wei, gasPrice);
    final amountInWei = intent.amount.value;

    final data = erc20TransferSig +
        intent.recipient.substring(2).padLeft(64, '0') +
        intent.amount.value.toHex.padLeft(64, '0');

    final gasLimit = await client
        .estimateGasFee(
          from: credentials.address.hex,
          to: token.contractAddress,
          data: data,
        )
        .then((value) => value.toInt());

    return await tokenContract.sendToken(
      EthereumAddress.fromHex(toChecksumAddress(intent.recipient)),
      amountInWei,
      credentials: credentials,
      transaction: Transaction(
        gasPrice: gasPriceEther,
        maxGas: gasLimit,
      ),
    );
  }

  ///
  /// Send ERC721
  ///
  Future<String> sendERC721Nft({
    required TransferIntent intent,
    required Credentials credentials,
  }) async {
    final token = intent.token.asEthBased!;
    final stakingNft = token.stakingNft!;
    final tokenId = stakingNft.tokenId;

    final contractAddress = EthereumAddress.fromHex(token.contractAddress);

    // see https://docs.openzeppelin.com/contracts/2.x/api/token/erc721
    final List<FunctionParameter> params = [
      FunctionParameter("from", AddressType()),
      FunctionParameter("to", AddressType()),
      FunctionParameter("tokenId", UintType())
    ];
    final function = ContractFunction("transferFrom", params);

    final from = credentials.address;
    final to = EthereumAddress.fromHex(intent.recipient);
    final arguments = [from, to, tokenId];
    final data = function.encodeCall(arguments);

    final gasPrice = await client.getGasPrice();
    final gasPriceEther = EtherAmount.fromBigInt(EtherUnit.wei, gasPrice);

    final transaction = Transaction(
      from: from,
      to: contractAddress,
      data: data,
      gasPrice: gasPriceEther,
      maxGas: 500000,
    );
    return client.asWeb3.sendTransaction(
      credentials,
      transaction,
      chainId: type.chainId,
      fetchChainIdFromNetworkId: false,
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
    final status = await _getConfirmationStatus(hash);

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
    final status = await _getConfirmationStatus(rawTx.hash);

    final amount = Amount(
      value: rawTx.value.getValueInUnitBI(EtherUnit.wei),
      decimals: zeniqSmart.decimals,
    );

    final feeVal = rawTx.gasPrice.getInWei * rawTx.gas.toBI;
    final fee = Amount(
      value: feeVal,
      decimals: zeniqSmart.decimals,
    );

    // when "to" is null, then it is probably a contract creation transaction
    final recipient = rawTx.to?.hex ?? "Contract Creation";
    final sender = rawTx.from.hex;
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

  Future<ConfirmationStatus> _getConfirmationStatus(String hash) async {
    final a = await client.getTransactionReceipt(hash);

    if (a
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
