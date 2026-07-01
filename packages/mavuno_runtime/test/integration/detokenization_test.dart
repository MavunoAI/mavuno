import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('detokenizes generated tokens', () async {
    final bootstrap = RuntimeBootstrap.create();

    try {
      final runtime = bootstrap.runtime;
      final native = bootstrap.native;

      final runtimeSession = RuntimeSession(native);

      final locator = FileModelLocator.standard();

      final modelPath = await locator.locate('tinyllama-1.1b-chat-v1.0.Q4_K_M');

      expect(modelPath, isNotNull);

      await runtimeSession.open(modelPath: modelPath!);

      try {
        final result = runtime.generate(
          GenerationRequest(
            model: runtimeSession.model,
            context: runtimeSession.context,
            prompt: const Prompt('Hello'),
          ),
        );

        final detokenizer = LlamaDetokenizer(native: native);

        final decoded = detokenizer.detokenize(
          DetokenizeRequest(model: runtimeSession.model, tokens: result.tokens),
        );

        expect(decoded.text.isNotEmpty, isTrue);
      } finally {
        runtimeSession.close();
      }
    } finally {
      bootstrap.dispose();
    }
  });
}
