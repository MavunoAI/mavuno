/// Error categories for native runtime failures.
enum NativeErrorCode {
  initializationFailed,

  libraryNotFound,

  symbolNotFound,

  modelLoadFailed,

  contextCreationFailed,

  tokenizationFailed,

  decodeFailed,
}

/// Exception thrown by the native runtime.
final class NativeException implements Exception {
  const NativeException({required this.code, required this.message, this.cause});

  final NativeErrorCode code;
  final String message;
  final Object? cause;

  @override
  String toString() {
    return 'NativeException('
        'code: $code, '
        'message: $message'
        '${cause != null ? ', cause: $cause' : ''}'
        ')';
  }
}
