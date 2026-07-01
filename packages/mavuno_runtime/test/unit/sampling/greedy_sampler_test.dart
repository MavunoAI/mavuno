import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:mavuno_runtime/src/inference/logits.dart';
import 'package:mavuno_runtime/src/sampling/greedy_sampler.dart';
import 'package:mavuno_runtime/src/sampling/sampling_request.dart';

void main() {
  group('GreedySampler', () {
    test('returns highest logit token', () {
      final sampler = GreedySampler();

      final result = sampler.sample(
        SamplingRequest(logits: Logits(Float32List.fromList([-1.0, 0.4, 8.7, 3.2]))),
      );

      expect(result.token.id, 2);
    });

    test('throws for empty logits', () {
      final sampler = GreedySampler();

      expect(
        () => sampler.sample(SamplingRequest(logits: Logits(Float32List(0)))),
        throwsStateError,
      );
    });
  });
}
