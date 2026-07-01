import '../runtime/runtime_session.dart';

import 'chat_session.dart';

/// Combines a conversation with a native runtime session.
///
/// This class owns no generation logic. It simply keeps the
/// conversation history and the native runtime session together
/// so they can be reused across multiple chat turns.
final class ChatRuntimeSession {
  ChatRuntimeSession({required RuntimeSession runtime, ChatSession? conversation})
    : _runtime = runtime,
      _conversation = conversation ?? ChatSession();

  final RuntimeSession _runtime;

  final ChatSession _conversation;

  /// Native runtime session.
  RuntimeSession get runtime => _runtime;

  /// Conversation history.
  ChatSession get conversation => _conversation;

  /// Clears only the conversation history.
  ///
  /// The runtime session remains open.
  void clearConversation() {
    _conversation.clear();
  }

  /// Closes the runtime session.
  void close() {
    _runtime.close();
  }
}
