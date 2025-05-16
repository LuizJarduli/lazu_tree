/// {@template franquia_logger}
/// Logger interface for logging messages with different severity levels.
/// {@endtemplate}
abstract class Logger {
  final _appendedMessages = <dynamic>[];

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void append(dynamic message) {
    _appendedMessages.add(message);
  }

  void releaseAppended([
    LogMethod method = LogMethod.debug,
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    final appendedMessagesJoined = _appendedMessages.join('\n');
    final logFunction = switch (method) {
      LogMethod.debug => debug,
      LogMethod.info => info,
      LogMethod.warning => warning,
      LogMethod.error => this.error,
    };
    logFunction(appendedMessagesJoined, error, stackTrace);
    _appendedMessages.clear();
  }
}

enum LogMethod {
  debug,
  info,
  warning,
  error,
}
