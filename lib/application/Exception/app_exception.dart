class AppException implements Exception {
  final String message;
  final StackTrace? stack;
  final int code;
  AppException({required this.message, this.stack, required this.code});
}
