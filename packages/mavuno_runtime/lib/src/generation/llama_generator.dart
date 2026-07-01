import '../native/llama_native.dart';
import '../session/context_session.dart';
import '../generation/stop/stop_condition_factory.dart';
import 'generation_request.dart';
import 'generation_result.dart';
import 'generation_sampler.dart';
import 'generation_state.dart';
import 'generator.dart';
import 'token_decode_request.dart';
import 'token_decoder.dart';

import '../prompt/prompt_decode_request.dart';
import '../prompt/prompt_decoder.dart';

/// High-level orchestration of autoregressive generation.
///
/// Responsibilities:
/// - tokenize the prompt;
/// - create the generation state;
/// - prefill the KV cache;
/// - sample the first token;
/// - perform one incremental decode;
/// - return the updated token sequence.
///
/// Multi-token generation will be introduced in M2.3C.4.
final class LlamaGenerator implements Generator {
  const LlamaGenerator({
    required LlamaNative native,
    required PromptDecoder promptDecoder,
    required TokenDecoder tokenDecoder,
    required GenerationSampler sampler,
    required StopConditionFactory stopConditionFactory,
  }) : _native = native,
       _promptDecoder = promptDecoder,
       _tokenDecoder = tokenDecoder,
       _sampler = sampler,
       _stopConditionFactory = stopConditionFactory;

  final LlamaNative _native;

  final PromptDecoder _promptDecoder;

  final TokenDecoder _tokenDecoder;

  final GenerationSampler _sampler;
  final StopConditionFactory _stopConditionFactory;

  @override
  GenerationResult generate(GenerationRequest request) {
    //
    // Tokenize prompt.
    //
    final promptTokens = _native.tokenize(request.model, request.prompt);

    //
    // Create generation state.
    //
    final state = GenerationState(
      session: ContextSession(model: request.model, context: request.context),
      promptTokens: promptTokens,
    );
    final stopCondition = _stopConditionFactory.create(request);

    //
    // Prompt prefill.
    //
    var logits = _promptDecoder.decode(PromptDecodeRequest(state: state)).logits;

    //
    // Autoregressive generation loop.
    //
    while (true) {
      //
      // Sample next token.
      //
      final token = _sampler.sample(logits);

      //
      // Append to generation history.
      //
      state.append(token);
      request.onToken?.call(token);

      //
      // Stop?
      //
      if (stopCondition.shouldStop(state: state, latestToken: token)) {
        break;
      }

      //
      // Decode only the newly generated token.
      //
      logits = _tokenDecoder.decode(TokenDecodeRequest(state: state, token: token)).logits;
    }

    return GenerationResult(tokens: state.snapshot());
  }
}
