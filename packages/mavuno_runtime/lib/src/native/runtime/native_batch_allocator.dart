import '../native_batch.dart';

/// Allocates and releases native llama_batch resources.
abstract interface class NativeBatchAllocator {
  NativeBatch allocate({required int tokenCount});

  void release(NativeBatch batch);
}
