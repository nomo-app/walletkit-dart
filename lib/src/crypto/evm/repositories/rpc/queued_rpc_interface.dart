import 'dart:async';

import 'package:walletkit_dart/src/common/logger.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

sealed class ValueOrError<T, E> {
  final E? extra;

  const ValueOrError({this.extra});

  factory ValueOrError.value(
    T value, {
    E? extra,
  }) =>
      Value(value, extra: extra);

  factory ValueOrError.error(
    Object error, {
    StackTrace? stackTrace,
    E? extra,
  }) =>
      Error<T, E>(
        error,
        stackTrace: stackTrace,
        extra: extra,
      );

  R when<R>({
    required R Function(Value<T, E> value) value,
    required R Function(Error<T, E> error) error,
  }) {
    return switch (this) {
      Value<T, E> v => value(v),
      Error<T, E> e => error(e),
    };
  }
}

final class Value<T, E> extends ValueOrError<T, E> {
  final T value;

  const Value(this.value, {super.extra});
}

final class Error<T, E> extends ValueOrError<T, E> {
  final Object error;
  final StackTrace? stackTrace;
  final List<Error<T, E>>? children;

  const Error(
    this.error, {
    this.stackTrace,
    this.children,
    super.extra,
  });
}

extension ValueOrErrorExtension<T> on Future<T> {
  Future<ValueOrError<T, E>> toValueOrError<E>({
    E? extra,
  }) {
    return then(
      (value) => ValueOrError<T, E>.value(value),
    ).catchError(
      (e, s) => Error<T, E>(
        e,
        stackTrace: s,
        extra: extra,
      ),
    );
  }
}

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

  Future refreshClients() async {
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

  ///
  /// Perform a single task using one of the available clients
  /// Retries the task on the next client if the current client fails
  ///
  Future<ValueOrError<T, EvmRpcClient>> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  });

  ///
  /// Perform a single task on all available clients
  ///
  Future<R> performTaskForClients<T, R>(
    Future<T> Function(EvmRpcClient client) task, {
    required R Function(
      List<ValueOrError<T, EvmRpcClient>> results,
    ) consilidate,
    Duration timeout = const Duration(seconds: 30),
    int maxTriesPerClient = 2,
    int minClients = 2,
    int? maxClients,
  });

  Future<ValueOrError<T, EvmRpcClient>> performTaskForClient<T>(
    Future<T> Function(EvmRpcClient client) task, {
    required EvmRpcClient client,
    Duration timeout = const Duration(seconds: 30),
    int maxTries = 2,
  }) async {
    if (maxTries == 1) {
      return task(client).timeout(timeout).toValueOrError(extra: client);
    }
    final errors = <Error<T, EvmRpcClient>>[];

    for (int i = 0; i < maxTries; i++) {
      final result =
          await task(client).timeout(timeout).toValueOrError(extra: client);

      switch (result) {
        case Value<T, EvmRpcClient> value:
          return value;
        case Error<T, EvmRpcClient> error:
          errors.add(error);
          Logger.logError(
            error.error,
            s: error.stackTrace,
            hint: 'RPC Task Error',
          );
      }
    }
    return Error(
      "Failed to perform the task after $maxTries tries",
      stackTrace: null,
      children: errors,
    );
  }
}

final class SimpleRpcManager extends RpcManager {
  SimpleRpcManager({
    required super.allClients,
    required super.awaitRefresh,
    required super.clientRefreshRate,
    required super.eagerError,
    required super.refreshType,
  });

  Future<R> performTaskForClients<T, R>(
    Future<T> Function(EvmRpcClient client) task, {
    required R Function(
      List<ValueOrError<T, EvmRpcClient>> results,
    ) consilidate,
    Duration timeout = const Duration(seconds: 30),
    int maxTriesPerClient = 2,
    int minClients = 2,
    int? maxClients,
  }) async {
    assert(
      maxClients == null || maxClients >= minClients,
      "maxClients must be greater than or equal to minClients",
    );
    final clientsToUse = [...clients].take(maxClients ?? clients.length);

    if (clientsToUse.length < minClients) {
      throw Exception("Not enough clients available");
    }

    final results = await Future.wait(
      [
        for (final client in clientsToUse)
          performTaskForClient(
            task,
            client: client,
            timeout: timeout,
            maxTries: maxTriesPerClient,
          ),
      ],
    );

    return consilidate(results);
  }

  Future<ValueOrError<T, EvmRpcClient>> performTask<T>(
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

    final errors = <Error<T, EvmRpcClient>>[];

    for (final client in currentClients) {
      final result =
          await task(client).timeout(timeout).toValueOrError(extra: client);

      switch (result) {
        case Value<T, EvmRpcClient> value:
          return value;
        case Error<T, EvmRpcClient> error:
          errors.add(error);
          Logger.logError(
            error.error,
            s: error.stackTrace,
            hint: 'RPC Task Error',
          );
          if (eagerError) {
            return error;
          }
          break;
      }
    }

    return Error(
      "All clients failed to perform the task: $errors",
      children: errors,
    );
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

    final errors = <Error<dynamic, EvmRpcClient>>[];

    while (taskQueue.isNotEmpty) {
      final task = taskQueue.dequeue();
      if (task == null) continue;

      if (currentClients.isEmpty) {
        task.completer.complete(
          Error(
            "No working clients available",
            children: errors,
          ),
        );
        continue;
      }

      final currentClient = task.client ?? currentClients[currentClientIndex];

      task.startTime ??= DateTime.now();
      if (task.isTimedOut()) {
        task.completer.complete(
          Error(
            "Task timed out after ${task.timeout}",
            children: errors,
          ),
        );
        continue;
      }
      task.tries++;

      final result = await performTaskForClient(
        task.task,
        client: currentClient,
        timeout: task.timeout,
        maxTries: 1,
      );

      switch (result) {
        case Value<dynamic, EvmRpcClient> value:
          task.completer.complete(value);
          errors.clear();
          continue;
        case Error<dynamic, EvmRpcClient> error:
          errors.add(error);

          if (eagerError) {
            task.completer.complete(error);
            errors.clear();
            continue;
          }

          if (task.tries >= task.maxTries) {
            task.completer.complete(
              Error(
                "Failed to perform the task: $errors after ${task.tries} tries",
                children: errors,
              ),
            );
            errors.clear();
            continue;
          }

          if (task.tries == currentClients.length) {
            task.completer.complete(
              Error(
                "All clients failed to perform the task: $errors",
                children: errors,
              ),
            );
            errors.clear();
            continue;
          }

          // Switch to the next client
          if (task.client == null) {
            currentClientIndex =
                (currentClientIndex + 1) % currentClients.length;
          }
          taskQueue.enqueueFront(task);
          continue;
      }
    }

    isWorking = false;
  }

  Future<ValueOrError<T, EvmRpcClient>> performTask<T>(
    Future<T> Function(EvmRpcClient client) task, {
    Duration timeout = const Duration(seconds: 30),
    int? maxTries,
  }) {
    final _task = Task(task, timeout, maxTries ?? clients.length);
    taskQueue.enqueue(_task);

    workOnQueue();

    return _task.future;
  }

  @override
  Future<R> performTaskForClients<T, R>(
    Future<T> Function(EvmRpcClient client) task, {
    required R Function(
      List<ValueOrError<T, EvmRpcClient>> results,
    ) consilidate,
    Duration timeout = const Duration(seconds: 30),
    int maxTriesPerClient = 2,
    int minClients = 2,
    int? maxClients,
  }) async {
    assert(
      maxClients == null || maxClients >= minClients,
      "maxClients must be greater than or equal to minClients",
    );

    final clientsToUse = clients.take(maxClients ?? clients.length);

    if (clientsToUse.length < minClients) {
      throw Exception("Not enough clients available");
    }

    final tasks = [
      for (final client in clientsToUse)
        Task(
          task,
          timeout,
          maxTriesPerClient,
          client: client,
        ),
    ];

    taskQueue.enqueueAll(tasks);

    workOnQueue();

    final results = await Future.wait(
      [
        for (final task in tasks) task.future,
      ],
    ).timeout(timeout);

    return consilidate(results);
  }
}

class Task<T, C> {
  final Future<T> Function(C client) task;
  final Completer<ValueOrError<T, EvmRpcClient>> completer = Completer();

  final Duration timeout;
  DateTime? startTime;

  final int maxTries;
  int tries = 0;

  final C? client;

  bool isTimedOut() {
    if (startTime == null) return false;
    return DateTime.now().difference(startTime!) > timeout;
  }

  Future<ValueOrError<T, EvmRpcClient>> get future => completer.future;

  Task(this.task, this.timeout, this.maxTries, {this.client});
}

class TaskQueue<T, C> {
  final List<Task<T, C>> _list = [];

  void enqueue(Task<T, C> task) {
    _list.add(task);
  }

  void enqueueAll(Iterable<Task<T, C>> tasks) {
    _list.addAll(tasks);
  }

  void enqueueFront(Task<T, C> task) {
    _list.insert(0, task);
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
