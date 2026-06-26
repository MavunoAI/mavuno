import 'dart:io';

import 'package:test/test.dart';

import 'package:mavuno_runtime/src/native/llama_native.dart';
import 'package:mavuno_runtime/src/native/native_library.dart';

const modelPath = 'test/models/tiny.gguf';

void main() {
  if (!File(modelPath).existsSync()) {
    test('Context creation', () {}, skip: 'GGUF model not found.');
    return;
  }

  test('creates a native context', () {
    final native = LlamaNativeImpl(nativeLibrary: NativeLibrary.open());

    native.initialize();

    final model = native.loadModel(modelPath);

    final context = native.createContext(model);

    expect(context.isValid, isTrue);

    native.destroyContext(context);

    native.unloadModel(model);

    native.shutdown();
  });
}
