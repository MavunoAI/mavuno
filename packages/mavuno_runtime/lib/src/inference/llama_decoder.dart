import 'decode_request.dart';
import 'decoder.dart';
import 'logits.dart';

/// Decoder backed by llama.cpp.
///
/// Native decoding is implemented in Commit 6.1.
final class LlamaDecoder implements Decoder {
  const LlamaDecoder();

  @override
  Logits decode(DecodeRequest request) {
    throw UnimplementedError('Native decoding will be implemented in Commit 6.1.');
  }
}
