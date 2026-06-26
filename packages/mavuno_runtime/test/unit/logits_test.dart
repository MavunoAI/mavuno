import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:mavuno_runtime/src/inference/logits.dart';

void main() {
  test('stores logits', () {
    final logits = Logits(Float32List.fromList([0.1, 0.3, 0.6]));

    expect(logits.length, 3);
    expect(logits[2], closeTo(0.6, 1e-6));
    expect(logits.isNotEmpty, isTrue);
  });
}
