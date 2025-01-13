import 'dart:convert';
import 'dart:io';

import 'command.dart';
import 'commands.dart';

class WalletCLI {
  final CommandRegistry registry = CommandRegistry();
  final String prompt = 'wk> ';

  WalletCLI() {
    registry.register(ExitCommand());
    registry.register(HelpCommand(registry));
  }

  // Custom print function that adds the prompt
  void printWithPrompt(String message, {bool withPrompt = true}) {
    // Split message into lines and add prompt to each line
    final lines = message.split('\n');
    for (final line in lines) {
      if (withPrompt) {
        stdout.writeln('$prompt$line');
      } else {
        stdout.writeln(line);
      }
    }
  }

  void showPrompt() {
    stdout.write(prompt);
  }

  Future<void> run() async {
    printWithPrompt('Welcome to WalletkitDart CLI');
    printWithPrompt('Type "help" for available commands');
    printWithPrompt('Enter commands:');
    showPrompt();

    final inputStream = stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .asBroadcastStream();

    inputStream.listen(
      (String line) async {
        await handleInput(line.trim());
      },
      onError: (error) {
        printWithPrompt('Error reading input: $error');
        showPrompt();
      },
      onDone: () {
        printWithPrompt('Input stream closed');
        exit(0);
      },
    );

    startPeriodicTask();

    await Future.delayed(Duration.zero);
  }

  Future<void> handleInput(String input) async {
    if (input.isEmpty) {
      showPrompt();
      return;
    }

    final parts = input.split(' ');
    final commandName = parts[0].toLowerCase();
    final args = parts.skip(1).toList();

    final command = registry.get(commandName);
    if (command == null) {
      printWithPrompt('Unknown command: $commandName');
      printWithPrompt('Type "help" for available commands');
      showPrompt();
      return;
    }

    try {
      final result = await command.execute(args);
      if (result != null) {
        printWithPrompt(result.toString());
      }
      showPrompt();
    } catch (e) {
      printWithPrompt('Error executing command: $e');
      showPrompt();
    }
  }

  void startPeriodicTask() {
    /// TODO: Start Wallet sync based on args
  }

  void registerCommand(Command command) {
    registry.register(command);
  }
}

void main() async {
  final app = WalletCLI();
  await app.run();
}
