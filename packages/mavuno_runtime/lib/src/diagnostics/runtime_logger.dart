enum RuntimeStage {
  loadingModel,
  tokenizing,
  creatingBatch,
  decoding,
  readingLogits,
  sampling,
  detokenizing,
}

abstract interface class RuntimeLogger {
  void stage(RuntimeStage stage, String message);
}

final class ConsoleRuntimeLogger implements RuntimeLogger {
  const ConsoleRuntimeLogger();

  @override
  void stage(RuntimeStage stage, String message) {
    print('[${stage.name}] $message');
  }
}

final class SilentRuntimeLogger implements RuntimeLogger {
  const SilentRuntimeLogger();

  @override
  void stage(RuntimeStage stage, String message) {}
}
