import 'dart:typed_data';

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
}
