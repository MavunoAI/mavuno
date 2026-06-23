import 'dart:ffi';

import 'ffi/llama_bindings.dart';

final class LlamaNativeImpl {
  LlamaNativeImpl(DynamicLibrary library) : _bindings = LlamaBindings(library);

  final LlamaBindings _bindings;

  bool _initialized = false;

  bool get isInitialized => _initialized;

  void initialize() {
    if (_initialized) {
      return;
    }

    _bindings.llama_backend_init();

    _initialized = true;
  }

  void shutdown() {
    if (!_initialized) {
      return;
    }

    _bindings.llama_backend_free();

    _initialized = false;
  }
}
