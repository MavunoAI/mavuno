import '../model/model_handle.dart';
import '../prompt/prompt.dart';
import '../session/context_handle.dart';

import 'generation_options.dart';
import 'token_listener.dart';

final class GenerationRequest {
  const GenerationRequest({
    required this.model,
    required this.context,
    required this.prompt,
    this.maxTokens = 128,
    this.options = const GenerationOptions(),
    this.onToken,
  });

  final ModelHandle model;

  final ContextHandle context;

  final Prompt prompt;

  final GenerationOptions options;

  final int maxTokens;
  final TokenListener? onToken;
}
