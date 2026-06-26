import 'dart:ffi' as ffi;
import '../../inference/decode_batch.dart';
import '../native_batch.dart';

import 'native_batch_writer.dart';

final class LlamaNativeBatchWriter implements NativeBatchWriter {
  const LlamaNativeBatchWriter();

  @override
  void write({required DecodeBatch source, required NativeBatch destination}) {
    if (!source.isValid) {
      throw ArgumentError.value(source, 'source', 'DecodeBatch is inconsistent.');
    }

    final batch = destination.batch;

    for (var i = 0; i < source.length; i++) {
      batch.token.elementAt(i).value = source.tokens[i].id;

      batch.pos.elementAt(i).value = source.positions[i];

      batch.n_seq_id.elementAt(i).value = 1;

      // TODO(Commit 6.1C.3):
      // Populate seq_id after verifying that
      // llama_batch_init() allocates the nested pointers.

      batch.logits.elementAt(i).value = source.requestLogits[i] ? 1 : 0;
    }

    batch.n_tokens = source.length;
  }
}
