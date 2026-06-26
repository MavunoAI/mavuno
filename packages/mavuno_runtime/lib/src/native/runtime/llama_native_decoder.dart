import '../../inference/decode_request.dart';
import '../../inference/logits.dart';

import '../batch_builder.dart';
import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_batch_factory.dart';
import '../native_exception.dart';

import 'native_decoder.dart';
import 'native_logits_reader.dart';

final class LlamaNativeDecoder implements NativeDecoder {
  LlamaNativeDecoder({
    required LlamaCompat compat,
    required BatchBuilder batchBuilder,
    required NativeBatchFactory batchFactory,
    required NativeLogitsReader logitsReader,
  }) : _compat = compat,
       _batchBuilder = batchBuilder,
       _nativeBatchFactory = batchFactory,
       _logitsReader = logitsReader;

  final LlamaCompat _compat;

  final BatchBuilder _batchBuilder;

  final NativeBatchFactory _nativeBatchFactory;

  final NativeLogitsReader _logitsReader;

  @override
  Logits decode(DecodeRequest request) {
    final decodeBatch = _batchBuilder.build(request.tokens);

    final nativeBatch = _nativeBatchFactory.create(decodeBatch);

    final result = _compat.decode(request.context.cast<llama_context>(), nativeBatch.batch);

    if (result != 0) {
      throw NativeException(code: NativeErrorCode.decodeFailed, message: 'llama_decode() failed.');
    }

    return _logitsReader.read(request.context);
  }
}
