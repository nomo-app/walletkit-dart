import 'dart:async';

abstract class Command<T> {
  String get name;
  String get description;
  FutureOr<T> execute(List<String> args);
}

class CommandResult<T> {
  final bool success;
  final T? data;
  final String? error;

  CommandResult.success(this.data)
      : success = true,
        error = null;
  CommandResult.failure(this.error)
      : success = false,
        data = null;

  @override
  String toString() {
    if (success) {
      return data?.toString() ?? 'Command completed successfully';
    } else {
      return 'Error: ${error ?? "Unknown error"}';
    }
  }
}

class CommandRegistry {
  final Map<String, Command> _commands = {};

  void register(Command command) {
    _commands[command.name.toLowerCase()] = command;
  }

  Command? get(String name) {
    return _commands[name.toLowerCase()];
  }

  List<Command> get commands => _commands.values.toList();
}
