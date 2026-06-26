import '../../inference/logits.dart';
import '../../session/context_handle.dart';

import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';

import 'native_logits_reader.dart';

final class LlamaNativeLogitsReader implements NativeLogitsReader {
  const LlamaNativeLogitsReader(this._compat);

  final LlamaCompat _compat;

  @override
  Logits read(ContextHandle context) {
    final values = _compat.sampledLogitsAsList(context.cast<llama_context>(), 0);

    if (values.isEmpty) {
      throw NativeException(code: NativeErrorCode.decodeFailed, message: 'No logits returned.');
    }

    return Logits(values);
  }
}
