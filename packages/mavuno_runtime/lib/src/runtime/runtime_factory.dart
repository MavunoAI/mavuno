import '../generation/llama_generator.dart';
import '../generation/llama_greedy_sampler.dart';
import '../prompt/llama_prompt_decoder.dart';
import '../generation/llama_token_decoder.dart';
import '../generation/stop/default_stop_condition_factory.dart';
import '../native/llama_compat.dart';
import '../native/llama_native.dart';
import '../detokenization/llama_detokenizer.dart';

import '../native/runtime/llama_native_decoder.dart';
import '../native/runtime/llama_native_logits_reader.dart';
import '../chat/default_prompt_builder.dart';
import '../chat/llama_chat_service.dart';

import 'runtime.dart';

Runtime createRuntime({required LlamaNative native, required LlamaCompat compat}) {
  //
  // Logits reader
  //
  final logitsReader = LlamaNativeLogitsReader(compat);

  //
  // Native decoder
  //
  final nativeDecoder = LlamaNativeDecoder(compat: compat, logitsReader: logitsReader);

  // Prompt decoder
  //
  final promptDecoder = LlamaPromptDecoder(decoder: nativeDecoder);

  // Detokenizer
  //
  final detokenizer = LlamaDetokenizer(native: native);
  //
  // Token decoder
  //
  final tokenDecoder = LlamaTokenDecoder(decoder: nativeDecoder);

  //
  // Sampler
  //
  const sampler = LlamaGreedySampler();

  //
  // Generator
  //
  final stopConditionFactory = DefaultStopConditionFactory(native: native);

  final generator = LlamaGenerator(
    native: native,
    promptDecoder: promptDecoder,
    tokenDecoder: tokenDecoder,
    sampler: sampler,
    stopConditionFactory: stopConditionFactory,
  );
  const promptBuilder = DefaultPromptBuilder();

  // Chat service
  //
  final chatService = LlamaChatService(
    promptBuilder: promptBuilder,
    generator: generator,
    detokenizer: detokenizer,
  );

  return Runtime(generator: generator, chatService: chatService);
}
