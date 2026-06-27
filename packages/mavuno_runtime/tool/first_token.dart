import 'package:mavuno_runtime/mavuno_runtime.dart';

Future<void> main() async {
  const modelPath = 'models/tinyllama/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf';

  //
  // Load native library
  //
  final nativeLibrary = NativeLibrary.open();

  //
  // Create native runtime
  //
  final native = LlamaNativeImpl(nativeLibrary: nativeLibrary);

  //
  // Compose runtime
  //
  final runtime = createRuntime(native: native, compat: native.compat);

  //
  // Open runtime session
  //
  final session = RuntimeSession(native);

  try {
    print('');
    print('====================================');
    print('      Mavuno Runtime Validation');
    print('====================================');
    print('');

    print('Loading model...');
    await session.open(modelPath: modelPath);

    print('Model loaded.');
    print('');

    const prompt = Prompt('Hello');

    print('Prompt: ${prompt.text}');
    print('');

    final request = GenerationRequest(
      model: session.model,
      context: session.context,
      prompt: prompt,
    );

    print('Running inference...');
    print('');

    final result = runtime.generate(request);

    print('Generated Tokens');
    print('----------------');

    for (final token in result.tokens.tokens) {
      print(token);
    }

    print('');
    print('✓ First GGUF inference completed successfully.');
  } catch (e, stackTrace) {
    print('');
    print('✗ Runtime failed');
    print(e);
    print('');
    print(stackTrace);
    rethrow;
  } finally {
    print('');
    print('Cleaning up runtime...');
    session.close();
    print('Done.');
  }
}
