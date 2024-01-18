import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:walletkit_dart/src/domain/exceptions.dart';

abstract class JsonRpcClient {
  Future<void> connect(String host, int port);

  Future<bool> disconnect();

  Future<dynamic> sendRequest(Map<String, dynamic> procedure);

  Future<dynamic> sendRawRequest(Map<String, dynamic> procedure);
}

class TcpJsonRpcClient extends JsonRpcClient {
  final Completer<bool> _connected = Completer<bool>();

  Future<bool> get connected => _connected.future;

  final bool isZeniq;

  // final Random rand = Random();

  Socket? _socket;

  Socket get socket {
    if (_connected.isCompleted) return _socket!;
    throw const JsonRpcConnectionNotInitialized();
  }

  Stream? stream;

  final String host;
  final int port;

  TcpJsonRpcClient({
    this.isZeniq = false,
    required this.host,
    required this.port,
  }) {
    connect(host, port);
  }

  @override
  Future<void> connect(String host, int port) async {
    try {
      _socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 5),
      );

      stream = _socket!.asBroadcastStream();

      _connected.complete(true);
    } catch (e) {
      _connected.complete(false);
    }
  }

  @override
  Future<bool> disconnect() async {
    try {
      if (isZeniq) {
        await socket.flush();
      }
      await socket.flush();
      await socket.close();
    } catch (e) {
      print("$e");
      return true;
    }

    return true;
  }

  @override
  Future<dynamic> sendRequest(Map<String, dynamic> procedure) async {
    final watch = Stopwatch()..start();

    try {
      final rawResult = await sendRawRequest(procedure);
      final json = jsonDecode(rawResult);
      final result = json['result'];
      if (result == null) {
        final error = json['error'];
        final message = error['message'];
        print(
          "Error from $host:$port in ${watch.elapsedMilliseconds}ms: $message",
        );
        return null;
      }
      return result;
    } catch (e, _) {
      // print(
      //   "error: $e Error from $host:$port in ${watch.elapsedMilliseconds}ms",
      // );
      return null;
    }
  }

  @override
  Future<dynamic> sendRawRequest(Map<String, dynamic> procedure) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    final procedureJson = jsonEncode({
      "id": id,
      ...procedure,
    });

    try {
      socket.writeln(procedureJson);
    } catch (e) {
      return null;
    }

    if (isZeniq) {
      await socket.flush();
    }
    await socket.flush();

    var txJson = "";
    await for (final uIntList in stream!) {
      txJson += String.fromCharCodes(uIntList);
      if (!isCompleteJson(txJson)) continue;
      return txJson;
    }

    throw Exception("Could not fetch result");
  }
}

bool isCompleteJson(String jsonString) {
  int numOpenCurly = 0;
  int numClosedCurly = 0;
  int numOpenSquare = 0;
  int numClosedSquare = 0;

  for (int i = 0; i < jsonString.length; i++) {
    switch (jsonString[i]) {
      case '{':
        numOpenCurly++;
        break;
      case '}':
        numClosedCurly++;
        break;
      case '[':
        numOpenSquare++;
        break;
      case ']':
        numClosedSquare++;
        break;
    }
  }

  return numOpenCurly == numClosedCurly && numOpenSquare == numClosedSquare;
}
