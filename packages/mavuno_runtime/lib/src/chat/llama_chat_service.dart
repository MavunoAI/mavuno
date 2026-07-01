import '../generation/generation_request.dart';
import '../generation/generator.dart';
import '../prompt/prompt.dart';
import '../detokenization/detokenize_request.dart';
import '../detokenization/detokenizer.dart';

import 'chat_request.dart';
import 'chat_response.dart';
import 'chat_runtime_session.dart';
import 'chat_service.dart';
import 'prompt_builder.dart';

final class LlamaChatService implements ChatService {
  const LlamaChatService({
    required PromptBuilder promptBuilder,
    required Generator generator,
    required Detokenizer detokenizer,
  }) : _promptBuilder = promptBuilder,
       _generator = generator,
       _detokenizer = detokenizer;

  final PromptBuilder _promptBuilder;
  final Generator _generator;
  final Detokenizer _detokenizer;

  @override
  ChatResponse chat({required ChatRuntimeSession session, required ChatRequest request}) {
    final Prompt prompt = _promptBuilder.build(session.conversation);

    final result = _generator.generate(
      GenerationRequest(
        model: session.runtime.model,
        context: session.runtime.context,
        prompt: prompt,
        options: request.options,
      ),
    );

    //
    //
    final decoded = _detokenizer.detokenize(
      DetokenizeRequest(model: session.runtime.model, tokens: result.tokens),
    );

    final text = decoded.text.value;

    session.conversation.addAssistant(text);

    return ChatResponse(text: text);
  }
}
