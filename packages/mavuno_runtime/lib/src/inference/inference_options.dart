import '../generation/generation_state.dart';

import 'inference_result.dart';

/// Executes a single inference step.
abstract interface class InferenceEngine {
  InferenceResult infer(GenerationState session);
}
