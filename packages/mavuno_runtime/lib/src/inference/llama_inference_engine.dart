import '../generation/generation_session.dart';
import '../native/runtime/native_decoder.dart';
import '../sampling/sampler.dart';
import '../sampling/sampling_request.dart';
import 'inference_result.dart';

import 'decode_request.dart';
import 'inference_engine.dart';

final class LlamaInferenceEngine implements InferenceEngine {
  LlamaInferenceEngine({required NativeDecoder decoder, required Sampler sampler})
    : _decoder = decoder,
      _sampler = sampler;

  final NativeDecoder _decoder;
  final Sampler _sampler;

  @override
  InferenceResult infer(GenerationSession session) {
    final logits = _decoder.decode(
      DecodeRequest(context: session.context, tokens: session.snapshot()),
    );

    final sample = _sampler.sample(SamplingRequest(logits: logits));

    return InferenceResult(sample: sample);
  }
}
