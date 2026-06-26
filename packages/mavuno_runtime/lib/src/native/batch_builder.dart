import '../inference/decode_batch.dart';
import '../token/token_sequence.dart';

/// Builds a platform-independent decoder batch.
abstract interface class BatchBuilder {
  DecodeBatch build(TokenSequence tokens);
}
