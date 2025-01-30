import 'dart:io';

import 'command.dart';

class HelpCommand extends Command<String> {
  final CommandRegistry registry;

  HelpCommand(this.registry);

  @override
  String get name => 'help';

  @override
  String get description => 'Show available commands';

  @override
  String execute(List<String> args) {
    final buffer = StringBuffer('Available commands:\n');
    for (final command in registry.commands) {
      buffer.writeln('  ${command.name.padRight(10)} - ${command.description}');
    }
    return buffer.toString();
  }
}

class ExitCommand extends Command<void> {
  @override
  String get name => 'exit';

  @override
  String get description => 'Exit the application';

  @override
  Future<void> execute(List<String> args) async {
    print('Goodbye!');
    exit(0);
  }
}
