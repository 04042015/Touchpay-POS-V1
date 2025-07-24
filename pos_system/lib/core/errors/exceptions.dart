class AppException implements Exception {
  final String message;
  final String? code;
  
  const AppException(this.message, {this.code});
  
  @override
  String toString() => 'AppException: $message';
}

class ServerException extends AppException {
  const ServerException(String message, {String? code}) 
      : super(message, code: code);
}

class NetworkException extends AppException {
  const NetworkException(String message, {String? code}) 
      : super(message, code: code);
}

class LocalStorageException extends AppException {
  const LocalStorageException(String message, {String? code}) 
      : super(message, code: code);
}

class AuthenticationException extends AppException {
  const AuthenticationException(String message, {String? code}) 
      : super(message, code: code);
}

class AuthorizationException extends AppException {
  const AuthorizationException(String message, {String? code}) 
      : super(message, code: code);
}

class ValidationException extends AppException {
  const ValidationException(String message, {String? code}) 
      : super(message, code: code);
}

class NotFound extends AppException {
  const NotFound(String message, {String? code}) 
      : super(message, code: code);
}

class DataParsingException extends AppException {
  const DataParsingException(String message, {String? code}) 
      : super(message, code: code);
}

class TimeoutException extends AppException {
  const TimeoutException(String message, {String? code}) 
      : super(message, code: code);
}

class PaymentException extends AppException {
  const PaymentException(String message, {String? code}) 
      : super(message, code: code);
}

class PrinterException extends AppException {
  const PrinterException(String message, {String? code}) 
      : super(message, code: code);
}

class OrderException extends AppException {
  const OrderException(String message, {String? code}) 
      : super(message, code: code);
}

class MenuException extends AppException {
  const MenuException(String message, {String? code}) 
      : super(message, code: code);
}

class TableException extends AppException {
  const TableException(String message, {String? code}) 
      : super(message, code: code);
}