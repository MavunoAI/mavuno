import '../../inference/decode_batch.dart';

import '../native_batch.dart';
import '../native_batch_factory.dart';

import 'llama_native_batch_allocator.dart';
import 'llama_native_batch_writer.dart';

/// Production implementation of [NativeBatchFactory].
///
/// Responsible for allocating a native batch and
/// copying a DecodeBatch into native memory.
final class LlamaNativeBatchFactory implements NativeBatchFactory {
  LlamaNativeBatchFactory({
    required LlamaNativeBatchAllocator allocator,
    required LlamaNativeBatchWriter writer,
  }) : _allocator = allocator,
       _writer = writer;

  final LlamaNativeBatchAllocator _allocator;
  final LlamaNativeBatchWriter _writer;

  @override
  NativeBatch create(DecodeBatch batch) {
    final nativeBatch = _allocator.allocate(tokenCount: batch.length);

    _writer.write(source: batch, destination: nativeBatch);

    return nativeBatch;
  }
}
