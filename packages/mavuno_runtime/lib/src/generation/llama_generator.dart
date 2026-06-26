import '../inference/inference_engine.dart';
import '../native/runtime/native_tokenizer.dart';

import 'generation_request.dart';
import 'generation_result.dart';
import 'generation_session.dart';
import 'generator.dart';

/// High-level orchestrator for a single generation request.
///
/// The generator is responsible for:
/// - Tokenizing the prompt.
/// - Creating a generation session.
/// - Executing one inference step.
/// - Appending the sampled token.
/// - Returning the updated token sequence.
///
/// It deliberately delegates inference to [InferenceEngine]
/// to keep orchestration separate from native runtime logic.
final class LlamaGenerator implements Generator {
  LlamaGenerator({required NativeTokenizer tokenizer, required InferenceEngine engine})
    : _tokenizer = tokenizer,
      _engine = engine;

  final NativeTokenizer _tokenizer;
  final InferenceEngine _engine;

  @override
  GenerationResult generate(GenerationRequest request) {
    final promptTokens = _tokenizer.tokenize(request.model, request.prompt);

    final session = GenerationSession(context: request.context, promptTokens: promptTokens);

    while (!session.hasReachedLimit(request.options.maxTokens)) {
      final result = _engine.infer(session);

      session.append(result.sample.token);
    }

    return GenerationResult(tokens: session.snapshot());
  }
}
