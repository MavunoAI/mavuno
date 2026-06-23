import '../model/entities/model.dart';
import 'backend_state.dart';

class InferenceRequest {}

/// Contract implemented by all inference backends.
///
/// The MVP will provide a llama.cpp implementation.
abstract interface class InferenceBackend {
  /// Current backend state.
  BackendState get state;

  /// Initializes the backend with a loaded model.
  Future<void> initialize(Model model);

  /// Executes inference.
  Future<dynamic> infer(InferenceRequest request);

  /// Releases backend resources.
  Future<void> dispose();
}
