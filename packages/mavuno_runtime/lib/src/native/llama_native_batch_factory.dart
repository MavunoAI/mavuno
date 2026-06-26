import '../inference/decode_batch.dart';

import 'native_batch.dart';
import 'native_batch_factory.dart';

import 'runtime/native_batch_allocator.dart';
import 'runtime/native_batch_writer.dart';

final class LlamaNativeBatchFactory implements NativeBatchFactory {
  LlamaNativeBatchFactory({
    required NativeBatchAllocator allocator,
    required NativeBatchWriter writer,
  }) : _allocator = allocator,
       _writer = writer;

  final NativeBatchAllocator _allocator;
  final NativeBatchWriter _writer;

  @override
  NativeBatch create(DecodeBatch batch) {
    final native = _allocator.allocate(tokenCount: batch.length);

    _writer.write(source: batch, destination: native);

    return native;
  }
}
