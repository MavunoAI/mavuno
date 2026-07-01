import 'chat_role.dart';

/// Immutable chat message.
final class ChatMessage {
  const ChatMessage({required this.role, required this.content});

  final ChatRole role;

  final String content;

  @override
  String toString() => '${role.name}: $content';

  @override
  bool operator ==(Object other) {
    return other is ChatMessage && other.role == role && other.content == content;
  }

  @override
  int get hashCode => Object.hash(role, content);
}
