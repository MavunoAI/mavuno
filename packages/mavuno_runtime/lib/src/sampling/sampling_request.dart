import '../inference/logits.dart';

/// Immutable request passed to a sampler.
final class SamplingRequest {
  const SamplingRequest({required this.logits});

  final Logits logits;
}
