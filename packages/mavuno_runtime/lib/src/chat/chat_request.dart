import '../generation/generation_options.dart';

/// High-level request for a chat completion.
///
/// Conversation history is owned by ChatRuntimeSession.
final class ChatRequest {
  const ChatRequest({this.options = const GenerationOptions()});

  final GenerationOptions options;
}
