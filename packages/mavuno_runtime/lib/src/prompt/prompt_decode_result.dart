import '../inference/logits.dart';

/// Result produced after decoding a prompt.
///
/// Carries the logits of the final prompt token,
/// which are used to sample the first generated token.
final class PromptDecodeResult {
  const PromptDecodeResult({required this.logits});

  final Logits logits;
}
