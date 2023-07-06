class RequestException implements Exception {
  final int statusCode;
  final int? responseCode;
  final Map<String, String>? translationArgs;
  final dynamic message;
  RequestException(
      {this.message = "Error",
      this.statusCode = 500,
      this.responseCode = 0,
      this.translationArgs});

  @override
  String toString() => message.toString();
  int getResponseCode() =>
      message is RequestException ? (message.responseCode ?? 0) : -1;
  int getStatusCode() => message is RequestException ? message.statusCode : 500;
  Map<String, String>? getTranslationArgs() =>
      message is RequestException ? message.translationArgs : null;
}

class InternalException extends RequestException {
  InternalException(
      {dynamic message = "Internal Error",
      int? responseCode,
      Map<String, String>? translationArgs})
      : super(
            statusCode: 500,
            responseCode: responseCode,
            message: message,
            translationArgs: translationArgs);
}

class RequestInternalException extends RequestException {
  RequestInternalException(
      {dynamic message = "Request Internal Error",
      int? responseCode,
      Map<String, String>? translationArgs})
      : super(
            statusCode: 500,
            responseCode: responseCode,
            message: message,
            translationArgs: translationArgs);
}

class ConnectionException extends RequestException {
  ConnectionException(
      {dynamic message = "Exception connecting to the internet",
      int? responseCode,
      Map<String, String>? translationArgs})
      : super(
            statusCode: 503,
            responseCode: responseCode,
            message: message,
            translationArgs: translationArgs);
}

class AutorizationException extends RequestException {
  AutorizationException(
      {dynamic message = "User not authorized",
      int? responseCode,
      Map<String, String>? translationArgs})
      : super(
            statusCode: 401,
            responseCode: responseCode,
            message: message,
            translationArgs: translationArgs);
}

class NotFoundException extends RequestException {
  NotFoundException(
      {dynamic message = "Endpoint not found",
      int? responseCode,
      Map<String, String>? translationArgs})
      : super(
            statusCode: 404,
            responseCode: responseCode,
            message: message,
            translationArgs: translationArgs);
}
