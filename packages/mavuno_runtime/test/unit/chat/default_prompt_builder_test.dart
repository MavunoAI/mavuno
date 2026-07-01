import 'package:mavuno_runtime/src/chat/chat.dart';
import 'package:test/test.dart';

void main() {
  test('builds prompt from conversation', () {
    final session = ChatSession();

    session.addSystem('You are Mavuno.');
    session.addUser('Hello');
    session.addAssistant('Hi!');
    session.addUser('How are you?');

    const builder = DefaultPromptBuilder();

    final prompt = builder.build(session);

    expect(prompt.text, contains('<system>'));

    expect(prompt.text, contains('You are Mavuno.'));

    expect(prompt.text, contains('<user>'));

    expect(prompt.text, contains('Hello'));

    expect(prompt.text, endsWith('<assistant>'));
  });
}
