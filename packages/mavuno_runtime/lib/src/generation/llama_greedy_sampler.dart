import '../inference/logits.dart';
import '../token/token.dart';

import 'generation_sampler.dart';

final class LlamaGreedySampler implements GenerationSampler {
  const LlamaGreedySampler();

  @override
  Token sample(Logits logits) {
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

    return Token(bestIndex);
  }
}
