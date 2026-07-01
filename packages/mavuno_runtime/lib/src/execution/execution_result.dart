import '../inference/logits.dart';

final class ExecutionResult {
  const ExecutionResult({required this.logits});

  final Logits logits;
}
