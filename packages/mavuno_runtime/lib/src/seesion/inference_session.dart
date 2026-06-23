import 'inference_request.dart';
import 'inference_response.dart';
import 'session_state.dart';

/// Represents an active inference session.
///
/// The session manages conversation lifecycle.
/// It does not perform inference itself.
abstract interface class InferenceSession {
  /// Current session state.
  SessionState get state;

  /// Opens the session.
  Future<void> open();

  /// Closes the session.
  Future<void> close();

  /// Executes an inference request.
  ///
  /// Backend implementations will provide the actual generation.
  Future<InferenceResponse> infer(InferenceRequest request);
}
