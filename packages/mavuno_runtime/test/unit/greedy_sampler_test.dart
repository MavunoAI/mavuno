import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:mavuno_runtime/src/inference/greedy_sampler.dart';
import 'package:mavuno_runtime/src/inference/logits.dart';
import 'package:mavuno_runtime/src/sampling/sampling_request.dart';

void main() {
  test('returns highest probability token', () {
    const sampler = GreedySampler();

    final logits = Logits(Float32List.fromList([0.2, 0.8, 0.1]));

    final result = sampler.sample(SamplingRequest(logits: logits));

    expect(result.token.id, 1);
  });
}
