import 'sampling_request.dart';
import 'sampling_result.dart';

abstract interface class Sampler {
  SamplingResult sample(SamplingRequest request);
}
