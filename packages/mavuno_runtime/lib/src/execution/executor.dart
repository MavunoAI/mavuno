import 'execution_backend.dart';
import 'execution_request.dart';
import 'execution_result.dart';

abstract interface class Executor implements ExecutionBackend {
  ExecutionResult execute(ExecutionRequest request);
}
