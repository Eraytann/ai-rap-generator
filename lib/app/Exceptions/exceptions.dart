class AppException implements Exception {
  String? message;
  String? detailedMessage;
  AppException([this.message, this.detailedMessage]);

  @override
  String toString() {
    if (detailedMessage == null) {
      return 'Exception: $message';
    } else {
      return 'Exception: $detailedMessage';
    }
  }
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ApiException extends AppException {
  ApiException(super.detailedMessage);
}
