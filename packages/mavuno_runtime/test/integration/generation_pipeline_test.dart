import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('Generation Pipeline', () {
    late Runtime runtime;
    late RuntimeSession session;

    setUpAll(() async {
      final bootstrap = RuntimeBootstrap.create();

      runtime = bootstrap.runtime;

      session = RuntimeSession(bootstrap.native);

      final locator = FileModelLocator.standard();

      final modelPath = await locator.locate('tinyllama-1.1b-chat-v1.0.Q4_K_M');

      expect(modelPath, isNotNull);

      await session.open(modelPath: modelPath!);
    });

    test('returns generated tokens', () {
      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
          maxTokens: 16,
        ),
      );

      expect(result.tokens.tokens, isNotEmpty);
    });
  });
}
