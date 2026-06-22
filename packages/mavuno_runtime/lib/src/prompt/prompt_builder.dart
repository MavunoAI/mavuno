import 'prompt.dart';
import 'system_prompt.dart';

final class PromptBuilder {
  const PromptBuilder();

  Prompt build({required SystemPrompt system, required String userPrompt}) {
    return Prompt('${system.text}\n\n$userPrompt');
  }
}
