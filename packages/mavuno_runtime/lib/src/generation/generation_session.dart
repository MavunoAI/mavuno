import '../session/context_handle.dart';
import '../token/token.dart';
import '../token/token_sequence.dart';

/// Holds the mutable state for a single generation run.
final class GenerationSession {
  GenerationSession({required this.context, required TokenSequence promptTokens})
    : _tokens = List<Token>.from(promptTokens.tokens);

  /// Native inference context.
  final ContextHandle context;

  final List<Token> _tokens;

  /// Current generated token sequence.
  TokenSequence snapshot() {
    return TokenSequence(List<Token>.unmodifiable(_tokens));
  }

  void append(Token token) {
    _tokens.add(token);
    _generatedTokens++;
  }

  /// Appends the next generated token.

  int _generatedTokens = 0;

  int get generatedTokens => _generatedTokens;

  int get length => _tokens.length;

  bool get isEmpty => _tokens.isEmpty;

  bool get isNotEmpty => _tokens.isNotEmpty;

  Token get lastToken => _tokens.last;

  bool hasReachedLimit(int maxTokens) => _generatedTokens >= maxTokens;
}
