import '../sampling/sampler.dart';
import '../sampling/sampling_request.dart';
import '../sampling/sampling_result.dart';

import '../token/token.dart';

final class GreedySampler implements Sampler {
  const GreedySampler();

  @override
  SamplingResult sample(SamplingRequest request) {
    final logits = request.logits;

    if (logits.isEmpty) {
      throw StateError('Cannot sample from empty logits.');
    }

    var bestIndex = 0;
    var bestValue = logits[0];

    for (var i = 1; i < logits.length; i++) {
      if (logits[i] > bestValue) {
        bestValue = logits[i];
        bestIndex = i;
      }
    }

    return SamplingResult(token: Token(bestIndex));
  }
}
