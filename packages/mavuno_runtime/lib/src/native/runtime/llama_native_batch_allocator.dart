import '../llama_compat.dart';
import '../native_batch.dart';

import 'native_batch_allocator.dart';

final class LlamaNativeBatchAllocator implements NativeBatchAllocator {
  LlamaNativeBatchAllocator({required LlamaCompat compat}) : _compat = compat;

  final LlamaCompat _compat;

  @override
  NativeBatch allocate({required int tokenCount}) {
    final batch = _compat.createBatch(capacity: tokenCount);

    return NativeBatch(batch: batch, capacity: tokenCount);
  }

  @override
  void release(NativeBatch batch) {
    _compat.freeBatch(batch.batch);
  }
}
