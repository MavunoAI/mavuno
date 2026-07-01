import 'package:mavuno_runtime/src/chat/chat.dart';
import 'package:test/test.dart';

void main() {
  group('ChatSession', () {
    test('starts empty', () {
      final session = ChatSession();

      expect(session.isEmpty, isTrue);
      expect(session.length, 0);
    });

    test('stores conversation history', () {
      final session = ChatSession();

      session.addSystem('You are Mavuno.');
      session.addUser('Hello');
      session.addAssistant('Hi there!');

      expect(session.length, 3);

      expect(session[0].role, ChatRole.system);
      expect(session[1].role, ChatRole.user);
      expect(session[2].role, ChatRole.assistant);

      expect(session[1].content, 'Hello');
    });

    test('clears conversation', () {
      final session = ChatSession();

      session.addUser('Hello');

      expect(session.isNotEmpty, isTrue);

      session.clear();

      expect(session.isEmpty, isTrue);
    });

    test('messages are immutable', () {
      final session = ChatSession();

      session.addUser('Hello');

      expect(
        () => session.messages.add(const ChatMessage(role: ChatRole.user, content: 'Hack')),
        throwsUnsupportedError,
      );
    });
  });
}
