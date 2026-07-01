import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('conversation persists across turns', () {
    final conversation = ChatSession();

    conversation.addUser('Hello');
    conversation.addAssistant('Hi!');
    conversation.addUser('How are you?');

    expect(conversation.messages.length, 3);
  });
}
