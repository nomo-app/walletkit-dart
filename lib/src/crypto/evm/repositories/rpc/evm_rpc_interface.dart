import 'dart:async';
import 'dart:typed_data';
import 'package:walletkit_dart/src/crypto/evm/entities/block_number.dart';
import 'package:walletkit_dart/src/crypto/evm/repositories/rpc/queued_rpc_interface.dart';
import 'package:walletkit_dart/src/domain/exceptions.dart';
import 'package:walletkit_dart/src/utils/int.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final class EvmRpcInterface {
  final EVMNetworkType type;
  final Map<int, int> blockTimestampCache = {};
  final Map<String, ConfirmationStatus> txStatusCache = {};
  final RpcManager _manager;

  Future<void> get refreshFuture => _manager.refreshFuture;

  ///
  /// [clients] - A list of clients to use for the manager
  /// [useQueuedManager] - If true, the manager will use a QueuedRpcManager and requests will be queued
  /// [awaitRefresh] - If true, the manager will wait for the clients to be refreshed before performing a task
  /// [refreshIntervall] - The rate at which the clients are refreshed if null the clients will only be refreshed once
  /// [eagerError] - If true a task will throw the first error it encounters, if false it will try all clients before throwing an error
  ///
  EvmRpcInterface({
    bool useQueuedManager = true,
    bool awaitRefresh = true,
    Duration? refreshIntervall,
    bool eagerError = false,
    RefreshType refreshType = RefreshType.onTask,
    required List<EvmRpcClient> clients,
    required this.type,
  }) : _manager = useQueuedManager
            ? QueuedRpcManager(
                awaitRefresh: awaitRefresh,
                clientRefreshRate: refreshIntervall,
                allClients: clients,
                eagerError: eagerError,
                refreshType: refreshType,
              )
            : SimpleRpcManager(
                awaitRefresh: awaitRefresh,
                clientRefreshRate: refreshIntervall,
                allClients: clients,
                eagerError: eagerError,
                refreshType: refreshType,
              );

  Future<T> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  }) =>
      _manager.performTask(task, timeout: timeout, maxTries: maxTries);

  ///
  /// eth_call
  ///
  Future<String> call({
    String? sender,
    required String contractAddress,
    required Uint8List data,
    BlockNum? atBlock,
  }) {
    return performTask(
      (client) => client.call(
        sender: sender,
        contractAddress: contractAddress,
        data: data,
        atBlock: atBlock,
      ),
    );
  }

  ///
  /// Fetch Balance
  ///
  Future<Amount> fetchBalance({
    required String address,
  }) async {
    final balance = await performTask((client) => client.getBalance(address));
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
    ERC20Entity token,
  ) async {
    final erc20Contract = ERC20Contract(
      contractAddress: token.contractAddress,
      rpc: this,
    );
    final balance = await erc20Contract.getBalance(address);
    return Amount(value: balance, decimals: token.decimals);
  }

  Future<(Amount, int)> estimateNetworkFees({
    required String recipient,
    required String sender,
    required Uint8List? data,
    required BigInt? value,
  }) async {
    final gasPrice = await getGasPrice();
    final gasLimit = await estimateGasLimit(
      recipient: recipient,
      sender: sender,
      data: data,
      value: value,
      gasPrice: gasPrice,
    );

    return (Amount(value: gasPrice, decimals: 18), gasLimit);
  }

  ///
  /// Get Gas Price
  ///
  Future<BigInt> getGasPrice() async {
    return await performTask(
      (client) => client.getGasPrice(),
    );
  }

  ///
  /// Get Transaction Count (Nonce)
  ///
  Future<BigInt> getTransactionCount(String address) async {
    return await performTask(
      (client) => client.getTransactionCount(address),
    );
  }

  ///
  /// Get Transaction By Hash
  ///
  Future<RawEvmTransaction> getTransactionByHash(String hash) async {
    return await performTask(
      (client) => client.getTransactionByHash(hash),
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
      accessList: intent.accessList,
    );
    final balance = await fetchBalance(address: toChecksumAddress(from)).then(
      (amount) => amount.value,
    );

    if (balance < tx.gasFee + tx.value) {
      throw Failure("Insufficient funds to pay native gas fee");
    }

    return await sendRawTransaction(tx.serialized.toHex);
  }

  ///
  /// Send ERC20 Token
  ///
  Future<String> sendERC20Token({
    required TransferIntent<EvmFeeInformation> intent,
    required String from,
    required Uint8List seed,
  }) async {
    assert(intent.token is ERC20Entity);
    assert(intent.memo == null);

    final erc20 = intent.token as ERC20Entity;
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
      accessList: intent.accessList,
    );
  }

  ///
  /// Used to create a raw Transactions
  /// Fetches the gasPrice and gasLimit from the network
  /// Fetches the nonce from the network
  /// If Transaction Type is not provided, it will use Legacy
  ///
  Future<RawEvmTransaction> buildUnsignedTransaction({
    required String sender,
    required String recipient,
    required EvmFeeInformation feeInfo,
    required Uint8List? data,
    required BigInt? value,
    List<AccessListItem>? accessList,
  }) async {
    final (gasPrice, gasLimit) = switch ((feeInfo.gasPrice, feeInfo.gasLimit)) {
      (Amount gasPrice, int gasLimit) => (gasPrice, gasLimit),
      (Amount gasPrice, null) => (
          gasPrice,
          await estimateGasLimit(
            recipient: recipient,
            sender: sender,
            data: data,
            value: value,
          )
        ),
      (null, int gasLimit) => (
          Amount(value: await getGasPrice(), decimals: 18),
          gasLimit
        ),
      (null, null) => await estimateNetworkFees(
          recipient: recipient, sender: sender, data: data, value: value),
    };

    final nonce = await performTask(
      (client) => client.getTransactionCount(sender),
    );

    if (type is ZENIQ_SMART_NETWORK) {
      return RawEVMTransactionType0.unsigned(
        nonce: nonce,
        gasPrice: gasPrice.value,
        gasLimit: gasLimit.toBI,
        to: recipient,
        value: value ?? BigInt.zero,
        data: data ?? Uint8List(0),
      );
    }

    if (feeInfo is EvmType2FeeInformation &&
        gasPrice.value < feeInfo.maxPriorityFeePerGas!.value) {
      throw Failure("Gas price is less than max priority fee");
    }

    return switch (feeInfo) {
      EvmType2FeeInformation() => RawEVMTransactionType2.unsigned(
          nonce: nonce,
          maxFeePerGas: gasPrice.value,
          maxPriorityFeePerGas:
              feeInfo.maxPriorityFeePerGas?.value ?? Amount.zero.value,
          gasLimit: gasLimit.toBI,
          to: recipient,
          value: value ?? BigInt.zero,
          data: data ?? Uint8List(0),
          accessList: accessList ?? [],
          chainId: type.chainId,
        ),
      EvmFeeInformation() => accessList != null
          ? RawEVMTransactionType1.unsigned(
              nonce: nonce,
              gasPrice: gasPrice.value,
              gasLimit: gasLimit.toBI,
              to: recipient,
              value: value ?? BigInt.zero,
              data: data ?? Uint8List(0),
              accessList: accessList,
              chainId: type.chainId,
            )
          : RawEVMTransactionType0.unsigned(
              nonce: nonce,
              gasPrice: gasPrice.value,
              gasLimit: gasLimit.toBI,
              to: recipient,
              value: value ?? BigInt.zero,
              data: data ?? Uint8List(0),
            ),
    };
  }

  ///
  /// Used to create a raw Transactions
  /// Fetches the gasPrice and gasLimit from the network
  /// Fetches the nonce from the network
  /// Signs the transaction
  ///
  Future<RawEvmTransaction> buildTransaction({
    required String sender,
    required String recipient,
    required Uint8List seed,
    required EvmFeeInformation feeInfo,
    required Uint8List? data,
    required BigInt? value,
    List<AccessListItem>? accessList,
  }) async {
    final unsignedTx = await buildUnsignedTransaction(
      sender: sender,
      recipient: recipient,
      feeInfo: feeInfo,
      data: data,
      value: value,
      accessList: accessList,
    );

    final signature = Signature.createSignature(
      switch (unsignedTx) {
        RawEVMTransactionType0() => unsignedTx.serializedUnsigned(type.chainId),
        RawEVMTransactionType1() => unsignedTx.serializedUnsigned,
        RawEVMTransactionType2() => unsignedTx.serializedUnsigned,
      },
      txType: switch (unsignedTx) {
        RawEVMTransactionType0() => TransactionType.Legacy,
        RawEVMTransactionType1() => TransactionType.Type1,
        RawEVMTransactionType2() => TransactionType.Type2,
      },
      derivePrivateKeyETH(seed),
      chainId: type.chainId,
    );

    final signedTx = unsignedTx.addSignature(signature);

    return signedTx;
  }

  Future<String> sendRawTransaction(String serializedTransactionHex) {
    serializedTransactionHex = serializedTransactionHex.startsWith("0x")
        ? serializedTransactionHex
        : "0x$serializedTransactionHex";
    return performTask(
      (client) => client.sendRawTransaction(serializedTransactionHex),
    );
  }

  Future<String> buildAndBroadcastTransaction({
    required String sender,
    required String recipient,
    required Uint8List seed,
    required EvmFeeInformation feeInfo,
    required Uint8List? data,
    required BigInt? value,
    List<AccessListItem>? accessList,
  }) async {
    final signedTx = await buildTransaction(
      sender: sender,
      recipient: recipient,
      seed: seed,
      feeInfo: feeInfo,
      data: data,
      value: value,
      accessList: accessList,
    );

    final result = await sendRawTransaction(signedTx.serialized.toHex);

    return result;
  }

  Future<String> readContract({
    required String contractAddress,
    required LocalContractFunctionWithValues function,
  }) async {
    assert(
      function.stateMutability == StateMutability.view ||
          function.stateMutability == StateMutability.pure,
      "Invalid function",
    );

    final data = function.buildDataField();

    return await call(
      contractAddress: contractAddress,
      data: data,
    );
  }

  ///
  /// Interact with Contract
  ///
  Future<String> interactWithContract({
    required String contractAddress,
    required LocalContractFunctionWithValues function,
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

    final data = function.buildDataField();

    return await buildAndBroadcastTransaction(
      sender: sender,
      recipient: contractAddress,
      seed: seed,
      feeInfo: feeInfo ?? EvmFeeInformation.zero,
      data: data,
      value: value ?? BigInt.zero,
    );
  }

  Future<int> estimateGasLimit({
    required String sender,
    required String recipient,
    Uint8List? data,
    BigInt? value,
    BigInt? gasPrice,
  }) async {
    final dataHex = data != null ? "0x${data.toHex}" : null;

    return await performTask(
      (client) => client
          .estimateGasLimit(
            from: sender,
            to: recipient,
            data: dataHex,
            amount: value,
            gasPrice: gasPrice,
          )
          .then(
            (value) => value.toInt(),
          ),
    );
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
    final function = LocalContractFunctionWithValues(
      name: "transferFrom",
      parameters: [
        FunctionParamWithValue(
          name: "from",
          type: FunctionParamAddress(),
          value: from,
        ),
        FunctionParamWithValue(
          name: "to",
          type: FunctionParamAddress(),
          value: recipient,
        ),
        FunctionParamWithValue(
          name: "tokenId",
          type: FunctionParamInt(),
          value: tokenId,
        ),
      ],
      stateMutability: StateMutability.nonpayable,
      outputTypes: [],
    );

    return await interactWithContract(
      contractAddress: contractAddress,
      function: function,
      sender: from,
      seed: seed,
      feeInfo: EvmFeeInformation.zero,
    );
  }

  Future<ConfirmationStatus> getConfirmationStatus(String hash) async {
    if (txStatusCache[hash] == null ||
        txStatusCache[hash] == ConfirmationStatus.pending) {
      final json = await performTask(
        (client) => client.getTransactionReceipt(hash),
      );
      txStatusCache[hash] = _confirmationStatusFromJson(json ?? {});
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

  ///
  /// Get Current Block
  ///
  Future<Json> getCurrentBlock() async {
    final blockNumber = await getBlockNumber();
    return await performTask(
      (client) => client.getBlockByNumber(blockNumber),
    );
  }

  ///
  /// Get Block Number
  ///
  Future<int> getBlockNumber() async {
    return await performTask(
      (client) => client.getBlockNumber(),
    );
  }

  Future<bool> waitForTxConfirmation(
    String hash, {
    Duration interval = const Duration(seconds: 5),
  }) async {
    while (true) {
      await Future.delayed(interval);

      final receipt = await performTask(
        (client) => client.getTransactionReceipt(hash),
      );

      switch (receipt?['status']) {
        case '0x1':
          return true;
        case '0x0':
          return false;
        default:
      }
    }
  }

  Future<String?> resolveENS({
    required String name,
    required String contractAddress,
  }) async {
    name = name.toLowerCase();
    final contract = EnsRegistryContract(
      rpc: this,
      contractAddress: contractAddress,
    );

    final resolverAddress = await contract.resolver(name: name);

    if (resolverAddress == null) {
      return null;
    }

    final resolver = EnsResolverContract(
      contractAddress: resolverAddress,
      rpc: this,
    );

    final addr = await resolver.addr(name: name);

    return addr;
  }
}
