import 'package:mavuno_runtime/mavuno_runtime.dart';

import 'package:test/test.dart';

void main() {
  group('First Native Token', () {
    late NativeLibrary nativeLibrary;
    late LlamaNativeImpl native;
    late Runtime runtime;
    late String modelPath;

    setUpAll(() async {
      nativeLibrary = NativeLibrary.open();

      native = LlamaNativeImpl(nativeLibrary: nativeLibrary);

      runtime = createRuntime(native: native, compat: native.compat);

      final locator = FileModelLocator.standard();

      final locatedModel = await locator.locate('tinyllama-1.1b-chat-v1.0.Q4_K_M');

      expect(locatedModel, isNotNull, reason: 'TinyLlama model not found.');

      modelPath = locatedModel!;

      print('Using model: $modelPath');
    });

    test('loads model successfully', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      expect(session.model, isNotNull);

      expect(session.context, isNotNull);

      session.close();
    });
    test('streams generated tokens', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final streamed = <Token>[];

      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
          maxTokens: 8,
          onToken: streamed.add,
        ),
      );

      expect(streamed, isNotEmpty);

      expect(streamed.length, equals(result.tokens.tokens.length - 1));

      session.close();
    });
    test('generates multiple tokens', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
          maxTokens: 8,
        ),
      );

      test('generation stops at EOS', () async {
        final session = RuntimeSession(native);

        await session.open(modelPath: modelPath);

        final result = runtime.generate(
          GenerationRequest(
            model: session.model,
            context: session.context,
            prompt: const Prompt('Say only: hello'),
            maxTokens: 512,
          ),
        );

        expect(result.tokens.tokens.length, lessThan(512));

        session.close();
      });

      //
      // Prompt + generated tokens.
      //
      expect(result.tokens.tokens.length, greaterThan(2));

      session.close();
    });
    test('tokenizes prompt', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final tokens = native.tokenize(session.model, const Prompt('Hello'));

      expect(tokens.tokens, isNotEmpty);

      session.close();
    });

    test('decodes first prompt', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
        ),
      );

      expect(result.tokens.tokens, isNotEmpty);

      session.close();
    });

    test('returns at least one generated token', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
        ),
      );

      expect(result.tokens.tokens.length, greaterThan(1));

      session.close();
    });

    test('generated token id is valid', () async {
      final session = RuntimeSession(native);

      await session.open(modelPath: modelPath);

      final result = runtime.generate(
        GenerationRequest(
          model: session.model,
          context: session.context,
          prompt: const Prompt('Hello'),
        ),
      );

      final generated = result.tokens.tokens.last;

      expect(generated.id, greaterThanOrEqualTo(0));

      session.close();
    });
  });
}
