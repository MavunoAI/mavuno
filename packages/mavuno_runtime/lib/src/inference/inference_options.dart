import '../generation/generation_session.dart';

import 'inference_result.dart';

/// Executes a single inference step.
abstract interface class InferenceEngine {
  InferenceResult infer(GenerationSession session);
}
