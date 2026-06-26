import 'engine_state.dart';
import 'inference_engine.dart';

abstract class LlamaNative {
  void initialize();
  void shutdown();
}

final class LlamaCppEngine implements InferenceEngine {
  LlamaCppEngine({required LlamaNative native}) : _native = native;

  final LlamaNative _native;

  EngineState _state = EngineState.uninitialized;

  @override
  EngineState get state => _state;

  @override
  bool get isInitialized => _state == EngineState.ready;

  @override
  Future<void> initialize() async {
    if (_state == EngineState.ready) {
      return;
    }

    _state = EngineState.initializing;

    try {
      _native.initialize();
      _state = EngineState.ready;
    } catch (_) {
      _state = EngineState.failed;
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    await shutdown();
  }

  @override
  Future<void> shutdown() async {
    if (_state != EngineState.ready) {
      return;
    }

    _state = EngineState.shuttingDown;

    try {
      _native.shutdown();
      _state = EngineState.uninitialized;
    } catch (_) {
      _state = EngineState.failed;
      rethrow;
    }
  }
}
