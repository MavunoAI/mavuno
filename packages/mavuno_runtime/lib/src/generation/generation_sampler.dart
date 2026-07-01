import '../inference/logits.dart';
import '../token/token.dart';

/// Selects the next token from a logits distribution.
///
/// Implementations may perform greedy, top-k, top-p,
/// temperature, beam search, etc.
abstract interface class GenerationSampler {
  Token sample(Logits logits);
}
