import '../../model/model_handle.dart';
import '../../prompt/prompt.dart';
import '../../token/token_sequence.dart';

abstract interface class NativeTokenizer {
  TokenSequence tokenize(ModelHandle model, Prompt prompt);
}
