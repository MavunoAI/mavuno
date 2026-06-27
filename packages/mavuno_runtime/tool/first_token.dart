import 'package:mavuno_runtime/mavuno_runtime.dart';

Future<void> main() async {
  const modelPath = 'models/tinyllama/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf';

  //
  // Native Library
  //
  final nativeLibrary = NativeLibrary.open();

  //
  // Native Runtime
  //
  final native = LlamaNativeImpl(nativeLibrary: nativeLibrary);

  //
  // Runtime
  //
  final runtime = createRuntime(native: native, compat: native.compat);

  //
  // Runtime Session
  //
  final session = RuntimeSession(native);

  try {
    await session.open(modelPath: modelPath);

    print('');
    print('========================================');
    print('        Mavuno Runtime');
    print('========================================');
    print('');
    print('Model : $modelPath');
    print('Prompt: Hello');
    print('');

    final result = runtime.generate(
      GenerationRequest(
        model: session.model,
        context: session.context,
        prompt: const Prompt('Hello'),
      ),
    );

    print('Generated Tokens');
    print('----------------');

    for (final token in result.tokens.tokens) {
      print(token);
    }

    print('');
    print('Inference completed successfully.');
  } finally {
    session.close();
  }
}
