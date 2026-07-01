import 'chat_message.dart';
import 'chat_role.dart';

/// Mutable conversation history.
///
/// This class deliberately contains no prompt formatting,
/// inference logic, or runtime dependencies.
final class ChatSession {
  ChatSession();

  final List<ChatMessage> _messages = [];

  /// Immutable conversation history.
  List<ChatMessage> get messages => List.unmodifiable(_messages);

  bool get isEmpty => _messages.isEmpty;

  bool get isNotEmpty => _messages.isNotEmpty;

  int get length => _messages.length;

  void clear() {
    _messages.clear();
  }

  void addSystem(String content) {
    _messages.add(ChatMessage(role: ChatRole.system, content: content));
  }

  void addUser(String content) {
    _messages.add(ChatMessage(role: ChatRole.user, content: content));
  }

  void addAssistant(String content) {
    _messages.add(ChatMessage(role: ChatRole.assistant, content: content));
  }

  ChatMessage operator [](int index) {
    return _messages[index];
  }
}
