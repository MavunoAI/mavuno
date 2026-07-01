import 'dart:typed_data';

import '../token/token.dart';

/// Output probabilities produced by the decoder.
final class Logits {
  const Logits(this.values);

  final Float32List values;

  int get length => values.length;

  double operator [](int index) {
    return values[index];
  }

  bool get isEmpty => values.isEmpty;

  bool get isNotEmpty => values.isNotEmpty;
  Token argmax() {
    if (values.isEmpty) {
      throw StateError('Cannot sample from empty logits.');
    }

    var bestIndex = 0;
    var bestScore = values.first;

    for (var i = 1; i < values.length; i++) {
      if (values[i] > bestScore) {
        bestScore = values[i];
        bestIndex = i;
      }
    }

    return Token(bestIndex);
  }
}
