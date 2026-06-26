import 'dart:ffi' as ffi;

import 'ffi/llama_bindings.dart';
import 'dart:typed_data';

final class LlamaCompat {
  LlamaCompat(this._bindings);
  ffi.Pointer<llama_model> loadModel(ffi.Pointer<ffi.Char> path) {
    final params = _bindings.llama_model_default_params();

    return _bindings.llama_model_load_from_file(path, params);
  }

  final LlamaBindings _bindings;

  void initializeBackend() {
    _bindings.llama_backend_init();
  }

  void shutdownBackend() {
    _bindings.llama_backend_free();
  }

  void freeModel(ffi.Pointer<llama_model> model) {
    _bindings.llama_model_free(model);
  }

  ffi.Pointer<llama_context> createContext(ffi.Pointer<llama_model> model) {
    final params = _bindings.llama_context_default_params();

    return _bindings.llama_init_from_model(model, params);
  }

  void freeContext(ffi.Pointer<llama_context> context) {
    _bindings.llama_free(context);
  }

  ffi.Pointer<llama_vocab> vocabulary(ffi.Pointer<llama_model> model) {
    return _bindings.llama_model_get_vocab(model);
  }

  llama_batch createBatch({required int capacity}) {
    return _bindings.llama_batch_init(capacity, 0, 1);
  }

  void freeBatch(llama_batch batch) {
    _bindings.llama_batch_free(batch);
  }

  int decode(ffi.Pointer<llama_context> context, llama_batch batch) {
    return _bindings.llama_decode(context, batch);
  }

  int sampledLogitsCount(ffi.Pointer<llama_context> context, int index) {
    return _bindings.llama_get_sampled_logits_count_ith(context, index);
  }

  ffi.Pointer<ffi.Float> sampledLogits(ffi.Pointer<llama_context> context, int index) {
    return _bindings.llama_get_sampled_logits_ith(context, index);
  }

  Float32List sampledLogitsAsList(ffi.Pointer<llama_context> context, int index) {
    final count = sampledLogitsCount(context, index);

    if (count <= 0) {
      return Float32List(0);
    }

    final pointer = sampledLogits(context, index);

    return pointer.asTypedList(count);
  }

  int tokenize(
    ffi.Pointer<llama_vocab> vocab,
    ffi.Pointer<ffi.Char> text,
    int textLength,
    ffi.Pointer<llama_token> tokens,
    int maxTokens,
    bool addBos,
    bool parseSpecial,
  ) {
    return _bindings.llama_tokenize(
      vocab,
      text,
      textLength,
      tokens,
      maxTokens,
      addBos,
      parseSpecial,
    );
  }
}
