import 'dart:async';
import 'dart:isolate';

///
/// A helper class which starts an Isolate and lets you execute Functions.
///

class IsolateManager {
  Isolate? _isolate;
  SendPort? _sendPort;

  SendPort get sendPort {
    if (!isReady) throw Exception("IsolateManager not ready");
    return _sendPort!;
  }

  final _receivePort = ReceivePort();
  late final _receivePortBroadcast = _receivePort.asBroadcastStream();

  final completer = Completer<void>();

  bool get isReady => completer.isCompleted;

  bool isInitializing = false;

  Future<void> _init() async {
    isInitializing = true;
    Stopwatch stopwatch = Stopwatch()..start();
    ReceivePort receivePort = ReceivePort();
    _isolate = await Isolate.spawn<SendPort>(
      _isolateEntry,
      receivePort.sendPort,
    );
    _sendPort = await receivePort.first;
    _sendPort!.send(_receivePort.sendPort);

    completer.complete();

    print(
      "IsolateManager initialized in ${stopwatch.elapsedMilliseconds}ms",
    );
    isInitializing = false;
    return;
  }

  Future<T> executeTask<T, A>(IsolateTask<T, A> task) async {
    if (!isReady && !isInitializing) _init();
    await completer.future;

    sendPort.send(task);
    final result = await _receivePortBroadcast.firstWhere((result) {
      if (result is IsolateResult) {
        return result.id == task.id;
      }
      return false;
    });

    if (result is IsolateResult) {
      return result.result;
    }
    throw Exception("IsolateResult not found");
  }

  void dispose() {
    _isolate?.kill(priority: Isolate.immediate);
  }

  static void _isolateEntry(
    SendPort sendPort,
  ) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    Stream receiveBroadcast = receivePort.asBroadcastStream();
    SendPort responsePort = await receiveBroadcast.first;

    receiveBroadcast.listen((task) async {
      if (task is IsolateTask) {
        try {
          final result = await task.call();
          responsePort.send(IsolateResult(
            result: result,
            id: task.id,
          ));
        } catch (e, s) {
          print("task failed: $task; $e $s");
        }
      }
    });
  }
}

class IsolateTask<T, A> {
  final FutureOr<T> Function(A arg) task;
  final A argument;
  final String id;

  IsolateTask({
    required this.task,
    required this.argument,
  }) : id = DateTime.now().microsecondsSinceEpoch.toString();

  FutureOr<T> call() => task(argument);
}

class IsolateResult<T> {
  final T result;
  final String id;

  const IsolateResult({
    required this.result,
    required this.id,
  });
}
