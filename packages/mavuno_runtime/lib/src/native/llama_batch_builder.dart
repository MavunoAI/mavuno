import '../inference/decode_batch.dart';
import '../token/token_sequence.dart';
import 'batch_builder.dart';

/// Default batch builder for llama.cpp.
///
/// Converts a sequence of tokens into a DecodeBatch.
/// No native allocations occur here.
final class LlamaBatchBuilder implements BatchBuilder {
  const LlamaBatchBuilder();

  @override
  DecodeBatch build(TokenSequence sequence) {
    final count = sequence.length;

    return DecodeBatch(
      tokens: List.unmodifiable(sequence.tokens),

      positions: List<int>.generate(count, (index) => index, growable: false),

      sequenceIds: List<int>.filled(count, 0, growable: false),

      requestLogits: List<bool>.generate(count, (index) => index == count - 1, growable: false),
    );
  }
}
