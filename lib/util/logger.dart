import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

// ??? logger 这段代码值得研究

// 启动app之前配置日志
configureLogger() {
  if (!kReleaseMode) {
    Logger.addClient(DebugLoggerClient());
  } else {
    // release version logger
    // FlutterError.onError = Crashlytics.instance.recordFlutterError;
    // Logger.addClient(CrashlyticsLoggerClient());
  }
}

// debug logger that just prints to console
class DebugLoggerClient implements LoggerClient {
  static final dateFormat = DateFormat("HH:mm:ss");

  String _timestamp() {
    return dateFormat.format(DateTime.now());
  }

  @override
  onLog({LogLevel level, String message, e, StackTrace s}) {
    switch (level) {
      case LogLevel.debug:
        debugPrint("${_timestamp()} [DEBUG] $message");
        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s.toString() ?? StackTrace.current);
        }
        break;
      case LogLevel.warning:
        debugPrint("${_timestamp()} [WARNING] $message");
        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s.toString() ?? StackTrace.current);
        }
        break;
      case LogLevel.error:
        debugPrint("${_timestamp()} [ERROR] $message");
        if (e != null) {
          debugPrint(e.toString());
        }
        // Errors always show a StackTrace
        debugPrint(s.toString() ?? StackTrace.current);
        break;
    }
  }
}

testsLogger() {
  Logger.addClient(DebugLoggerClient());
}

class Logger {
  static final _clients = <LoggerClient>[];

  // debug level logs
  static d(
    String message, {
    dynamic e,
    StackTrace s,
  }) {
    _clients.forEach((c) => c.onLog(
          level: LogLevel.debug,
          message: message,
          e: e,
          s: s,
        ));
  }

  // warning level logs
  static w(
    String message, {
    dynamic e,
    StackTrace s,
  }) {
    _clients.forEach((c) => c.onLog(
          level: LogLevel.warning,
          message: message,
          e: e,
          s: s,
        ));
  }

  // error level logs
  static e(
    String message, {
    dynamic e,
    StackTrace s,
  }) {
    _clients.forEach((c) => c.onLog(
          level: LogLevel.error,
          message: message,
          e: e,
          s: s,
        ));
  }

  static addClient(LoggerClient client) {
    _clients.add(client);
  }
}

enum LogLevel { debug, warning, error }

abstract class LoggerClient {
  onLog({
    LogLevel level,
    String message,
    dynamic e,
    StackTrace s,
  });
}

class LoggerMiddleware<State> implements MiddlewareClass<State> {
  @override
  call(Store<State> store, action, next) {
    next(action);

    Logger.d("Middleware: { ${action.runtimeType} }");
  }
}
