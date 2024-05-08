import 'package:http/http.dart' as http;

typedef HTTPClient = http.Client;

abstract class HTTPService {
  static HTTPClient? _client;

  static HTTPClient get client {
    _client ??= HTTPClient();
    return _client!;
  }

  //Add headers to the request
  static Future<http.Response> getWithHeaders(String url,
      {Map<String, String>? headers}) {
    return client.get(Uri.parse(url), headers: headers);
  }
}
