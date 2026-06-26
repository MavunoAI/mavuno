import '../sampling/sampling_request.dart';
import '../sampling/sampling_result.dart';

abstract interface class NativeSampler {
  SamplingResult sample(SamplingRequest request);
}
