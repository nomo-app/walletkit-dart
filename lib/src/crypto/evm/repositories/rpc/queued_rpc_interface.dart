import 'dart:async';

import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

enum RefreshType { onInit, onTask }

abstract class RpcManager {
  /// All clients available to the manager
  final List<EvmRpcClient> allClients;

  final RefreshType refreshType;

  final bool eagerError;

  /// Whether to wait for the clients to be refreshed before performing a task
  final bool awaitRefresh;

  /// Clients which successfully returned the current block number
  List<EvmRpcClient> clients;

  /// The rate at which the clients are refreshed. Only applicable if [refreshType] is [RefreshType.onInit]
  final Duration? clientRefreshRate;

  final Completer<void> _refreshCompleter = Completer();

  /// Future that completes when the clients are refreshed at least once
  Future<void> get refreshFuture => _refreshCompleter.future;

  bool _isRefreshingClients = false;

  RpcManager({
    required this.allClients,
    required this.eagerError,
    required this.awaitRefresh,
    required this.clientRefreshRate,
    required this.refreshType,
  }) : clients = List.from(allClients) {
    if (refreshType == RefreshType.onInit) {
      refreshClients();
      if (clientRefreshRate != null) {
        Timer.periodic(clientRefreshRate!, (_) => refreshClients());
      }
    }
  }

  void refreshClients() async {
    if (_isRefreshingClients) return;
    _isRefreshingClients = true;
    final futures = allClients.map((client) async {
      try {
        await client.getBlockNumber().timeout(const Duration(seconds: 10));
        return client;
      } catch (e, s) {
        Logger.logError(e, s: s, hint: 'Client Refresh Error');
        return null;
      }
    });

    final results = await Future.wait(futures);

    clients = results.whereType<EvmRpcClient>().toList();

    if (!_refreshCompleter.isCompleted) {
      _refreshCompleter.complete();
    }
    _isRefreshingClients = false;
    Logger.log('Selected clients: ${clients.map((e) => e.rpcUrl).toList()}');
  }

  Future<T> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  });
}

final class SimpleRpcManager extends RpcManager {
  SimpleRpcManager({
    required super.allClients,
    required super.awaitRefresh,
    required super.clientRefreshRate,
    required super.eagerError,
    required super.refreshType,
  });

  Future<T> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  }) async {
    if (refreshType == RefreshType.onTask &&
        _refreshCompleter.isCompleted == false) {
      refreshClients();
    }

    if (awaitRefresh) await refreshFuture;

    final currentClients = [...clients];

    if (clients.isEmpty) {
      throw Exception("No working clients available");
    }

    final errors = <String, (Object, StackTrace)>{};

    for (final client in currentClients) {
      try {
        final result = await task(client).timeout(timeout);
        return result;
      } catch (e, s) {
        errors[client.rpcUrl] = (e, s);

        if (eagerError) {
          throw Exception("Error performing task: $errors");
        }

        Logger.logError(e, s: s, hint: 'RPC Task Error');
      }
    }

    throw Exception("All clients failed to perform the task: $errors");
  }
}

final class QueuedRpcManager extends RpcManager {
  QueuedRpcManager({
    required super.allClients,
    required super.awaitRefresh,
    required super.clientRefreshRate,
    required super.eagerError,
    required super.refreshType,
  });

  final taskQueue = TaskQueue<dynamic, EvmRpcClient>();

  int currentClientIndex = 0;
  bool isWorking = false;

  Future<void> workOnQueue() async {
    if (isWorking) return;
    isWorking = true;

    if (refreshType == RefreshType.onTask &&
        _refreshCompleter.isCompleted == false) {
      refreshClients();
    }

    if (awaitRefresh) await refreshFuture;

    final currentClients = [...clients];

    final errors = <String, (Object, StackTrace)>{};

    while (taskQueue.isNotEmpty) {
      final task = taskQueue.dequeue();
      if (task == null) continue;

      if (currentClients.isEmpty) {
        task.completer.completeError(Exception("No working clients available"));
        continue;
      }

      final currentClient = currentClients[currentClientIndex];

      try {
        task.startTime ??= DateTime.now();
        if (task.isTimedOut()) throw TimeoutException("Task timed out");
        task.tries++;
        if (task.isMaxTriesReached) throw Exception("Max tries reached");

        final result = await task.task(currentClient).timeout(task.timeout);
        task.completer.complete(result);
        errors.clear(); // Clear errors if the task was successful
      } catch (e, s) {
        errors[currentClient.rpcUrl] = (e, s);
        if (eagerError) {
          final error = Exception("Error performing task: $errors");
          task.completer.completeError(error);
          errors.clear();
          continue;
        }

        if (task.tries == currentClients.length) {
          final error =
              Exception("All clients failed to perform the task: $errors");
          errors.clear();
          Logger.logError(error, hint: 'RPC Task Error');
          task.completer.completeError(error);
          continue;
        }

        // Switch to the next client
        currentClientIndex = (currentClientIndex + 1) % currentClients.length;
        taskQueue.enqueue(task);
        continue;
      }
    }

    isWorking = false;
  }

  Future<T> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  }) {
    final _task = Task(task, timeout, maxTries ?? clients.length);
    taskQueue.enqueue(_task);

    workOnQueue();

    return _task.future;
  }
}

class Task<T, C> {
  final Future<T> Function(C client) task;
  final Completer<T> completer = Completer();

  final Duration timeout;
  DateTime? startTime;

  final int maxTries;
  int tries = 0;

  bool get isMaxTriesReached => tries > maxTries;

  bool isTimedOut() {
    if (startTime == null) return false;
    return DateTime.now().difference(startTime!) > timeout;
  }

  Future<T> get future => completer.future;

  Task(this.task, this.timeout, this.maxTries);
}

class TaskQueue<T, C> {
  final List<Task<T, C>> _list = [];

  void enqueue(Task<T, C> task) {
    _list.add(task);
  }

  Task<T, C>? dequeue() {
    if (_list.isEmpty) {
      return null;
    }
    return _list.removeAt(0);
  }

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  Task<T, C>? peek() {
    return _list.isNotEmpty ? _list.first : null;
  }

  int get length => _list.length;
}
