import '../token/token.dart';

/// Result produced by a sampler.
final class SamplingResult {
  const SamplingResult({required this.token});

  final Token token;
}
