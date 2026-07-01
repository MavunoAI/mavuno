import '../inference/logits.dart';

/// Result produced after decoding one generated token.
///
/// Carries the logits used to sample the next token.
final class TokenDecodeResult {
  const TokenDecodeResult({required this.logits});

  final Logits logits;
}
