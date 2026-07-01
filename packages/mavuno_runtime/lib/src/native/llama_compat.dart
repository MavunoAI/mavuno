import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as pkgffi;
import 'package:ffi/ffi.dart';
import 'ffi/llama_bindings.dart';
import 'dart:typed_data';

import '../token/token_sequence.dart';

final class LlamaCompat {
  LlamaCompat(this._bindings);
  ffi.Pointer<llama_model> loadModel(ffi.Pointer<ffi.Char> path) {
    final params = _bindings.llama_model_default_params();

    return _bindings.llama_model_load_from_file(path, params);
  }

  final LlamaBindings _bindings;
  static const int _defaultDetokenizeBufferSize = 8192;

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

  int eosToken(ffi.Pointer<llama_model> model) {
    return _bindings.llama_vocab_eos(_bindings.llama_model_get_vocab(model));
  }

  void freeContext(ffi.Pointer<llama_context> context) {
    _bindings.llama_free(context);
  }

  ffi.Pointer<llama_vocab> vocabulary(ffi.Pointer<llama_model> model) {
    return _bindings.llama_model_get_vocab(model);
  }

  int vocabularySize(ffi.Pointer<llama_vocab> vocab) {
    return _bindings.llama_vocab_n_tokens(vocab);
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

  ffi.Pointer<ffi.Float> logits(ffi.Pointer<llama_context> context) {
    return _bindings.llama_get_logits(context);
  }

  ffi.Pointer<ffi.Float> logitsAt(ffi.Pointer<llama_context> context, int index) {
    return _bindings.llama_get_logits_ith(context, index);
  }

  Float32List logitsAsList(ffi.Pointer<llama_context> context, int vocabularySize) {
    return logits(context).asTypedList(vocabularySize);
  }

  llama_batch createSingleTokenBatch(ffi.Pointer<llama_token> tokens, int count) {
    return _bindings.llama_batch_get_one(tokens, count);
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

  String detokenize(ffi.Pointer<llama_model> model, TokenSequence tokens) {
    final vocab = _bindings.llama_model_get_vocab(model);
    if (tokens.tokens.isEmpty) {
      return '';
    }

    final tokenBuffer = pkgffi.calloc<llama_token>(tokens.tokens.length);

    try {
      for (var i = 0; i < tokens.tokens.length; i++) {
        tokenBuffer[i] = tokens.tokens[i].id;
      }

      //
      // Start with the default buffer.
      //
      var bufferSize = _defaultDetokenizeBufferSize;

      while (true) {
        final textBuffer = pkgffi.calloc<ffi.Char>(bufferSize);

        try {
          final written = _bindings.llama_detokenize(
            vocab,
            tokenBuffer,
            tokens.tokens.length,
            textBuffer,
            bufferSize,
            true,
            false,
          );

          //
          // Success.
          //
          if (written >= 0) {
            return textBuffer.cast<pkgffi.Utf8>().toDartString();
          }

          //
          // The API returns the negative number of bytes
          // required.
          //
          bufferSize = (-written) + 1;
        } finally {
          pkgffi.calloc.free(textBuffer);
        }
      }
    } finally {
      pkgffi.calloc.free(tokenBuffer);
    }
  }
}
