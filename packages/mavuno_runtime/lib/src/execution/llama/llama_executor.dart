import '../backend_type.dart';
import '../execution_request.dart';
import '../execution_result.dart';
import '../executor.dart';

import '../../native/ffi/llama_bindings.dart';
import '../../native/llama_compat.dart';
import '../../native/native_exception.dart';
import '../../native/runtime/native_logits_reader.dart';

final class LlamaExecutor implements Executor {
  const LlamaExecutor({required LlamaCompat compat, required NativeLogitsReader logitsReader})
    : _compat = compat,
      _logitsReader = logitsReader;

  final LlamaCompat _compat;
  final NativeLogitsReader _logitsReader;

  @override
  BackendType get backendType => BackendType.llamaCpp;

  @override
  ExecutionResult execute(ExecutionRequest request) {
    final result = _compat.decode(request.session.context.cast<llama_context>(), request.batch);

    if (result != 0) {
      throw NativeException(code: NativeErrorCode.decodeFailed, message: 'llama_decode() failed.');
    }

    final logits = _logitsReader.read(request.session);

    return ExecutionResult(logits: logits);
  }
}
