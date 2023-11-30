import 'package:http/http.dart' as http;

typedef HTTPClient = http.Client;

abstract class HTTPService {
  static HTTPClient? _client;

  static HTTPClient get client {
    _client ??= HTTPClient();
    return _client!;
  }
}
