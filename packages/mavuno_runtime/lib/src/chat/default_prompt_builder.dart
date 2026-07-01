import '../prompt/prompt.dart';

import 'chat_message.dart';
import 'chat_role.dart';
import 'chat_session.dart';
import 'prompt_builder.dart';

/// Default prompt builder.
///
/// This implementation produces a generic tagged conversation.
/// Later model-specific builders (TinyLlama, Llama3, Qwen, etc.)
/// can replace it without changing ChatSession.
final class DefaultPromptBuilder implements PromptBuilder {
  const DefaultPromptBuilder();

  @override
  Prompt build(ChatSession session) {
    final buffer = StringBuffer();

    for (final ChatMessage message in session.messages) {
      switch (message.role) {
        case ChatRole.system:
          buffer.writeln('<system>');
          break;

        case ChatRole.user:
          buffer.writeln('<user>');
          break;

        case ChatRole.assistant:
          buffer.writeln('<assistant>');
          break;
      }

      buffer.writeln(message.content);

      switch (message.role) {
        case ChatRole.system:
          buffer.writeln('</system>');
          break;

        case ChatRole.user:
          buffer.writeln('</user>');
          break;

        case ChatRole.assistant:
          buffer.writeln('</assistant>');
          break;
      }

      buffer.writeln();
    }

    //
    // Tell the model it is now the assistant's turn.
    //
    buffer.write('<assistant>');

    return Prompt(buffer.toString());
  }
}
