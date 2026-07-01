import '../../inference/logits.dart';
import '../../session/context_session.dart';

import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';

import 'native_logits_reader.dart';

final class LlamaNativeLogitsReader implements NativeLogitsReader {
  const LlamaNativeLogitsReader(this._compat);

  final LlamaCompat _compat;

  @override
  Logits read(ContextSession session) {
    final context = session.context.cast<llama_context>();

    final model = session.model.cast<llama_model>();

    final vocab = _compat.vocabulary(model);

    final vocabularySize = _compat.vocabularySize(vocab);

    final values = _compat.logitsAsList(context, vocabularySize);

    if (values.isEmpty) {
      throw NativeException(code: NativeErrorCode.decodeFailed, message: 'No logits returned.');
    }

    return Logits(values);
  }
}
