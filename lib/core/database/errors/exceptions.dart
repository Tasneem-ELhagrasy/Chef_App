import 'package:chef_app/core/database/errors/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;

  ServerExceptions(this.errorModel);
}

class BadCertificateException extends ServerExceptions{
  BadCertificateException(super.errorModel);  
}
class BadResponseException extends ServerExceptions{
  BadResponseException(super.errorModel);  
}
class CancelException extends ServerExceptions{
  CancelException(super.errorModel);  
}
class ConnectionErrorException extends ServerExceptions{
  ConnectionErrorException(super.errorModel);  
}
class ConnectionTimeoutException extends ServerExceptions{
  ConnectionTimeoutException(super.errorModel);  
}
class ReceiveTimeoutException extends ServerExceptions{
  ReceiveTimeoutException(super.errorModel);  
}
class SendTimeoutException extends ServerExceptions{
  SendTimeoutException(super.errorModel);  
}
class UnknownException extends ServerExceptions{
  UnknownException(super.errorModel);  
}
class BadRequestException extends ServerExceptions{
  BadRequestException(super.errorModel);  
}
class UnauthorizedException extends ServerExceptions{
  UnauthorizedException(super.errorModel);  
}
class ForbbidenException extends ServerExceptions{
  ForbbidenException(super.errorModel);  
}
class NotFoundException extends ServerExceptions{
  NotFoundException(super.errorModel);  
}
class ConflictException extends ServerExceptions{
  ConflictException(super.errorModel);  
}
