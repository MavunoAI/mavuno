import '../sampling/greedy_sampler.dart';
import '../sampling/sampling_request.dart';
import '../sampling/sampling_result.dart';

import 'native_sampler.dart';

final class GreedyNativeSampler implements NativeSampler {
  const GreedyNativeSampler();

  final GreedySampler _sampler = const GreedySampler();

  @override
  SamplingResult sample(SamplingRequest request) {
    return _sampler.sample(request);
  }
}
