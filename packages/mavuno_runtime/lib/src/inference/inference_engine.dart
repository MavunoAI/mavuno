import '../generation/generation_session.dart';

import 'inference_result.dart';

abstract interface class InferenceEngine {
  InferenceResult infer(GenerationSession session);
}
