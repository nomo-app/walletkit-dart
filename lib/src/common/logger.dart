import 'dart:developer' as dev;
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart' show Level;

// TODO: Improve
const red = "31";
const blue = "34";
const magenta = "35";
const cyan = "36";

abstract class Logger {
  static void log(String message, [String? location]) {
    dev.log(
      "[INFO]${_formatMessage(message, location)}",
      level: Level.INFO.value,
    );
  }

  static void logFetch(String message, [String? location]) {
    dev.log(
      _colorize("[FETCH]${_formatMessage(message, location)}", cyan),
      level: Level.SHOUT.value,
    );
  }

  static void logError(
    Object? error, {
    StackTrace? s,
    String? hint,
  }) {
    dev.log(
      _colorize("[ERROR]${_formatMessage(error.toString(), hint)}", red),
      level: Level.SEVERE.value,
      stackTrace: s,
      time: DateTime.now(),
      error: error,
    );
  }

  static void logWarning(String message, [String? location]) {
    dev.log(
      _colorize("[WARNING]${_formatMessage(message, location)}", blue),
      level: Level.WARNING.value,
    );
  }

  static String _formatMessage(String message, String? location) {
    if (location == null) {
      return message;
    }
    return " @$location: $message";
  }

  static String _colorize(String message, String color) {
    return "\x1B[${color}m$message\x1B[0m";
  }
}
