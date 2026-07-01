import '../native/ffi/llama_bindings.dart';
import '../session/context_session.dart';

final class ExecutionRequest {
  const ExecutionRequest({required this.session, required this.batch});

  final ContextSession session;

  final llama_batch batch;
}
