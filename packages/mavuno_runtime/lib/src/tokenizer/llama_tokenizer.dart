import '../model/model_handle.dart';
import '../native/llama_native.dart';
import '../prompt/prompt.dart';
import '../token/token_sequence.dart' as domain;
import 'tokenizer.dart';

/// Tokenizer implementation backed by the native llama.cpp runtime.
///
/// This class contains no FFI logic. It simply delegates tokenization
/// to the native runtime and returns the resulting domain object.
final class LlamaTokenizer implements Tokenizer {
  const LlamaTokenizer({required LlamaNative native}) : _native = native;

  final LlamaNative _native;

  @override
  domain.TokenSequence tokenize(ModelHandle model, Prompt prompt) {
    return _native.tokenize(model, prompt);
  }
}
