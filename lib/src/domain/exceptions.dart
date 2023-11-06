class JsonRpcConnectionNotInitialized implements Exception {
  const JsonRpcConnectionNotInitialized();
}

class SendFailure extends Failure {
  const SendFailure(super.message);

  @override
  String toString() {
    return 'SendFailure   =>   $message';
  }
}

class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() {
    return "Failure: " + message;
  }
}

class ClientNullException extends Error {
  final String message;

  ClientNullException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoWorkingHostsException extends Error {
  final String message;

  NoWorkingHostsException(this.message);

  @override
  String toString() {
    return message;
  }
}
