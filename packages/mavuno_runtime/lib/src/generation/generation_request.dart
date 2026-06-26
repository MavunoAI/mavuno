import '../model/model_handle.dart';
import '../prompt/prompt.dart';
import '../session/context_handle.dart';

import 'generation_options.dart';

final class GenerationRequest {
  const GenerationRequest({
    required this.model,
    required this.context,
    required this.prompt,
    this.options = const GenerationOptions(),
  });

  final ModelHandle model;
  final ContextHandle context;
  final Prompt prompt;
  final GenerationOptions options;
}
