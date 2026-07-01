import '../prompt/prompt.dart';

import 'chat_session.dart';

/// Builds a model prompt from a conversation.
///
/// Different model families can provide different implementations
/// without changing ChatSession.
abstract interface class PromptBuilder {
  Prompt build(ChatSession session);
}
