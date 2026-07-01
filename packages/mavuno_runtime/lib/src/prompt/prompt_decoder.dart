import 'prompt_decode_request.dart';
import 'prompt_decode_result.dart';

/// High-level prompt prefill abstraction.
///
/// Implementations convert a prompt into KV-cache state by
/// delegating to the native decode pipeline.
abstract interface class PromptDecoder {
  PromptDecodeResult decode(PromptDecodeRequest request);
}
