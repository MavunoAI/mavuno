import '../model/model_handle.dart';
import '../prompt/prompt.dart';
import '../token/token_sequence.dart';

/// Converts prompts into model tokens.
abstract interface class Tokenizer {
  TokenSequence tokenize(ModelHandle model, Prompt prompt);
}
