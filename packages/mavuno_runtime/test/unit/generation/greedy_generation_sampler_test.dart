import 'dart:typed_data';

import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('LlamaGreedySampler', () {
    test('selects highest scoring token', () {
      const sampler = LlamaGreedySampler();

      final logits = Logits(Float32List.fromList([0.2, 1.5, 8.7, 3.4]));

      final token = sampler.sample(logits);

      expect(token.id, 2);
    });

    test('throws for empty logits', () {
      const sampler = LlamaGreedySampler();

      expect(() => sampler.sample(Logits(Float32List(0))), throwsStateError);
    });
  });
}
