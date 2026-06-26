import '../session/context_handle.dart';
import '../token/token_sequence.dart';

/// Immutable request passed to a decoder.
final class DecodeRequest {
  const DecodeRequest({required this.context, required this.tokens});

  final ContextHandle context;
  final TokenSequence tokens;
}
