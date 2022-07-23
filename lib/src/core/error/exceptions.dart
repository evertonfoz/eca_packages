class ServerException implements Exception {
  final String? errorMessage;

  ServerException({this.errorMessage});
}

class NotFoundException implements Exception {}

class NotAuthorizedException implements Exception {}

class NotUniqueDataException implements Exception {
  final String message;
  NotUniqueDataException({required this.message});
}

class TimeOutException implements Exception {}

class DomainValidationException implements Exception {
  final String? errorMessage;

  DomainValidationException({this.errorMessage});
}

class RemoveConstraintException implements Exception {
  final String? errorMessage;

  RemoveConstraintException({this.errorMessage});
}
