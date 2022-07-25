abstract class AppException implements Exception {
  String get errorMessage;
  AppException() : super();
}
