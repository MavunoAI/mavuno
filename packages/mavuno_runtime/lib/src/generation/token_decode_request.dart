import '../generation/generation_state.dart';
import '../token/token.dart';

/// Request to decode a single generated token.
///
/// Unlike prompt decoding, this reuses the existing KV cache.
final class TokenDecodeRequest {
  const TokenDecodeRequest({required this.state, required this.token});

  /// Current mutable generation state.
  final GenerationState state;

  /// Token to append to the KV cache.
  final Token token;
}
