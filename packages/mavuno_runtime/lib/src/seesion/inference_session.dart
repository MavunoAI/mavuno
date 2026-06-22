import 'inference_request.dart';
import 'inference_response.dart';

abstract interface class InferenceSession {
  Future<void> open();

  Future<void> close();

  Future<InferenceResponse> infer(InferenceRequest request);
}
