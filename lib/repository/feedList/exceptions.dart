import 'package:misoilia/repository/baseException.dart';

class NoInternetException extends BaseException {
  String message;

  NoInternetException(this.message) : super(message);
}

class ServiceNotFoundException extends BaseException {
  String message;

  ServiceNotFoundException(this.message) : super(message);
}

class InvalidJsonFormatException extends BaseException {
  String message;

  InvalidJsonFormatException(this.message) : super(message);
}

class UnknownException extends BaseException {
  String message;

  UnknownException(this.message) : super(message);
}
