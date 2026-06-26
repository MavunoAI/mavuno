import '../token/token.dart';

import 'sampler.dart';
import 'sampling_request.dart';
import 'sampling_result.dart';

final class GreedySampler implements Sampler {
  const GreedySampler();

  @override
  SamplingResult sample(SamplingRequest request) {
    final logits = request.logits.values;

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
