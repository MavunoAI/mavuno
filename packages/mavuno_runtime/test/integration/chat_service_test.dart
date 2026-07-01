import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('ChatRuntimeSession', () {
    test('assistant message is stored in the conversation', () async {
      final bootstrap = RuntimeBootstrap.create();

      try {
        final runtimeSession = RuntimeSession(bootstrap.native);

        final locator = FileModelLocator.standard();

        final modelPath = await locator.locate('tinyllama-1.1b-chat-v1.0.Q4_K_M');

        expect(modelPath, isNotNull);

        await runtimeSession.open(modelPath: modelPath!);

        try {
          final session = ChatRuntimeSession(runtime: runtimeSession);

          session.conversation.addUser('Hello');

          session.conversation.addAssistant('Simulated reply');

          expect(session.conversation.messages.last.content, 'Simulated reply');

          expect(session.conversation.messages.last.role, ChatRole.assistant);
        } finally {
          runtimeSession.close();
        }
      } finally {
        bootstrap.dispose();
      }
    });
  });
}
