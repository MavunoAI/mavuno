import '../sampling/sampling_result.dart';

/// Result of a single inference step.
final class InferenceResult {
  const InferenceResult({required this.sample});

  final SamplingResult sample;
}
