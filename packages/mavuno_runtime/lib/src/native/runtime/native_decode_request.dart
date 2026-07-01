import 'dart:ffi' as ffi;

import '../ffi/llama_bindings.dart';

final class NativeDecodeRequest {
  const NativeDecodeRequest({required this.context, required this.batch});

  final ffi.Pointer<llama_context> context;

  final llama_batch batch;
}
