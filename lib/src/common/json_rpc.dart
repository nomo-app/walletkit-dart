import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

// ignore: one_member_abstracts

/// RPC Service base class.
abstract class RpcService {
  /// Constructor.
  RpcService(this.url);

  /// Url.
  final String url;

  /// Performs an RPC request, asking the server to execute the function with
  /// the given name and the associated parameters, which need to be encodable
  /// with the [json] class of dart:convert.
  ///
  /// When the request is successful, an [RPCResponse] with the request id and
  /// the data from the server will be returned. If not, an RPCError will be
  /// thrown. Other errors might be thrown if an IO-Error occurs.
  Future<RPCResponse> call(String function, [List<dynamic>? params]);
}

/// Json RPC Service.
class JsonRPC extends RpcService {
  /// Constructor.
  JsonRPC(String url, this.client) : super(url);

  /// Http client.
  final Client client;

  int _currentRequestId = 1;

  /// Performs an RPC request, asking the server to execute the function with
  /// the given name and the associated parameters, which need to be encodable
  /// with the [json] class of dart:convert.
  ///
  /// When the request is successful, an [RPCResponse] with the request id and
  /// the data from the server will be returned. If not, an RPCError will be
  /// thrown. Other errors might be thrown if an IO-Error occurs.
  @override
  Future<RPCResponse> call(String function, [List<dynamic>? params]) async {
    params ??= [];

    final requestPayload = {
      'jsonrpc': '2.0',
      'method': function,
      'params': params,
      'id': _currentRequestId++,
    };

    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestPayload),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (data.containsKey('error')) {
      final error = data['error'];

      final code = error['code'] as int;
      final message = error['message'] as String;
      final errorData = error['data'];

      throw RPCError(code, message, errorData);
    }

    final id_d = data['id'];
    final id = id_d is int ? id_d : int.tryParse(id_d as String);
    final result = data['result'];
    return RPCResponse(id ?? -1, result);
  }
}

/// Response from the server to an rpc request. Contains the id of the request
/// and the corresponding result as sent by the server.
class RPCResponse {
  /// Constructor.
  const RPCResponse(this.id, this.result);

  /// Id.
  final int id;

  /// Result.
  final dynamic result;
}

/// Exception thrown when an the server returns an error code to an rpc request.
class RPCError implements Exception {
  /// Constructor.
  const RPCError(this.errorCode, this.message, this.data);

  /// Error code.
  final int errorCode;

  /// Message.
  final String message;

  /// Data.
  final dynamic data;

  @override
  String toString() {
    return 'RPCError: got code $errorCode with msg "$message".';
  }
}
