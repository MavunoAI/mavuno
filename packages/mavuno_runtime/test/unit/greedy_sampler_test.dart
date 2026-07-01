import 'dart:typed_data';

import 'package:mavuno_runtime/src/generation/llama_greedy_sampler.dart';
import 'package:mavuno_runtime/src/inference/logits.dart';
import 'package:test/test.dart';

void main() {
  group('LlamaGreedySampler', () {
    test('returns highest probability token', () {
      const sampler = LlamaGreedySampler();

      final logits = Logits(Float32List.fromList([0.2, 0.8, 0.1]));

      final token = sampler.sample(logits);

      expect(token.id, 1);
    });

    test('throws for empty logits', () {
      const sampler = LlamaGreedySampler();

      expect(() => sampler.sample(Logits(Float32List(0))), throwsStateError);
    });
  });
}
