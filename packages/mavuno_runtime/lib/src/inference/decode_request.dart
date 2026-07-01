import '../session/context_session.dart';
import '../token/token_sequence.dart';

/// Immutable request passed to a decoder.
///
/// A decode operation requires an active inference session
/// (loaded model + native context) together with the tokens
/// to decode.
final class DecodeRequest {
  const DecodeRequest({required this.session, required this.tokens});

  /// Active inference session.
  final ContextSession session;

  /// Tokens to decode.
  final TokenSequence tokens;
}
