import 'dart:async';

import 'package:walletkit_dart/walletkit_dart.dart';

abstract class QueuedRpcInterface {
  final List<EvmRpcClient> clients;

  QueuedRpcInterface({
    required this.clients,
  });

  final taskQueue = TaskQueue<dynamic, EvmRpcClient>();

  int currentClientIndex = 0;
  bool isWorking = false;

  Future<void> workOnQueue() async {
    if (isWorking) return;
    isWorking = true;

    while (taskQueue.isNotEmpty) {
      final task = taskQueue.dequeue();
      if (task == null) continue;

      final currentClient = clients[currentClientIndex];

      try {
        final result = await task.task(currentClient);
        task.completer.complete(result);
      } catch (e, s) {
        if (e is RateLimitingException) {
          // If the client is rate limited, switch to the next client
          currentClientIndex = (currentClientIndex + 1) % clients.length;
          taskQueue.enqueue(task);
          continue;
        }
        task.completer.completeError(e, s);
      }
    }

    isWorking = false;
  }

  Future<T> performTask<T>(
    Future<T> Function(EvmRpcClient client) task,
  ) {
    final _task = Task(task);
    taskQueue.enqueue(_task);

    workOnQueue();

    return _task.future;
  }
}

class Task<T, C> {
  final Future<T> Function(C client) task;
  final Completer<T> completer = Completer();

  Future<T> get future => completer.future;

  Task(this.task);
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
