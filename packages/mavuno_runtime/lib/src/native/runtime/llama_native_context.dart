import 'dart:ffi' as ffi;

import '../../model/model_handle.dart';
import '../../session/context_handle.dart';

import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';

import 'native_context.dart';

final class LlamaNativeContext implements NativeContext {
  LlamaNativeContext(this._compat);

  final LlamaCompat _compat;

  @override
  ContextHandle create(ModelHandle model) {
    final context = _compat.createContext(model.cast<llama_model>());

    if (context.address == 0) {
      throw NativeException(
        code: NativeErrorCode.contextCreationFailed,
        message: 'Failed to create inference context.',
      );
    }

    return ContextHandle.fromNative(context.cast<ffi.Void>());
  }

  @override
  void destroy(ContextHandle context) {
    _compat.freeContext(context.cast<llama_context>());
  }
}
