/// Exception thrown when tokenization fails.
final class TokenizerException implements Exception {
  const TokenizerException(this.message);

  final String message;

  @override
  String toString() => 'TokenizerException: $message';
}
