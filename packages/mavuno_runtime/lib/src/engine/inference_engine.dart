import 'engine_state.dart';

abstract interface class InferenceEngine {
  /// Current lifecycle state.
  EngineState get state;

  /// Returns true when the engine is ready to perform inference.
  bool get isInitialized;

  /// Initializes the inference backend.
  Future<void> initialize();

  /// Stops the backend while allowing future reinitialization.
  Future<void> shutdown();

  /// Permanently releases all owned resources.
  Future<void> dispose();
}
