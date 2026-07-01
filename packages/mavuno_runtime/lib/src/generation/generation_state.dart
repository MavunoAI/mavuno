import '../session/context_session.dart';
import '../token/token.dart';
import '../token/token_sequence.dart';

/// Mutable state for a single generation.
///
/// GenerationState owns all mutable state that changes during
/// autoregressive generation.
///
/// It deliberately contains no inference logic.
final class GenerationState {
  GenerationState({required this.session, required TokenSequence promptTokens})
    : _tokens = List<Token>.from(promptTokens.tokens);

  /// Native runtime session.
  final ContextSession session;

  /// Complete token history.
  final List<Token> _tokens;

  /// Number of prompt tokens already prefetched into the KV cache.
  int _decodedPromptTokens = 0;

  /// Number of generated tokens.
  int _generatedTokens = 0;

  /// Immutable snapshot.
  TokenSequence snapshot() {
    return TokenSequence(List<Token>.unmodifiable(_tokens));
  }

  /// Append one generated token.
  void append(Token token) {
    _tokens.add(token);
    _generatedTokens++;
  }

  /// Mark the prompt as having been prefetched.
  void markPromptDecoded() {
    _decodedPromptTokens = _tokens.length;
  }

  bool get promptDecoded => _decodedPromptTokens > 0;

  int get promptLength => _decodedPromptTokens;

  int get generatedLength => _generatedTokens;

  int get totalLength => _tokens.length;

  Token get lastToken => _tokens.last;

  bool hasReachedLimit(int maxTokens) => _generatedTokens >= maxTokens;
}
