import 'ffi/llama_bindings.dart';

final class NativeBatch {
  const NativeBatch({required this.batch, required this.capacity});

  final llama_batch batch;

  final int capacity;

  bool get isEmpty => capacity == 0;

  bool get isNotEmpty => capacity > 0;
}
