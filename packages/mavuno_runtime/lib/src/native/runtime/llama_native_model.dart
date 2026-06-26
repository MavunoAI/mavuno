import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';

import '../../model/model_handle.dart';
import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';
import 'native_model.dart';

final class LlamaNativeModel implements NativeModel {
  LlamaNativeModel(this._compat);

  final LlamaCompat _compat;

  @override
  ModelHandle load(String path) {
    final pathPtr = path.toNativeUtf8(allocator: malloc).cast<ffi.Char>();

    try {
      final model = _compat.loadModel(pathPtr);

      if (model.address == 0) {
        throw NativeException(
          code: NativeErrorCode.modelLoadFailed,
          message: 'Unable to load model: $path',
        );
      }

      return ModelHandle.fromNative(model.cast<ffi.Void>());
    } finally {
      malloc.free(pathPtr);
    }
  }

  @override
  void unload(ModelHandle model) {
    _compat.freeModel(model.cast<llama_model>());
  }
}
