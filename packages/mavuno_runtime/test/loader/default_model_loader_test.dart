import 'dart:io';

import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('DefaultModelLoader', () {
    test('returns failure when file does not exist', () async {
      const model = Model(id: 'missing', path: 'does/not/exist.gguf');

      const metadata = ModelMetadata(
        name: 'Missing',
        author: 'Test',
        version: '1.0.0',
      );

      const manifest = ModelManifest(
        model: model,
        metadata: metadata,
        format: ModelFormat.gguf,
      );

      const loader = DefaultModelLoader(manifest);

      final result = await loader.load();

      expect(result.isFailure, isTrue);
    });

    test('returns success for valid gguf file', () async {
      final temp = await Directory.systemTemp.createTemp('mavuno_');

      addTearDown(() async {
        if (await temp.exists()) {
          await temp.delete(recursive: true);
        }
      });

      final file = File('${temp.path}${Platform.pathSeparator}model.gguf');

      await file.writeAsString('dummy');

      final model = Model(id: 'demo', path: file.path);

      const metadata = ModelMetadata(
        name: 'Demo',
        author: 'Test',
        version: '1.0.0',
      );

      final manifest = ModelManifest(
        model: model,
        metadata: metadata,
        format: ModelFormat.gguf,
      );

      final loader = DefaultModelLoader(manifest);

      final result = await loader.load();

      expect(result.isSuccess, isTrue);
      expect(result.model, equals(model));
    });

    test('rejects non-gguf files', () async {
      final temp = await Directory.systemTemp.createTemp('mavuno_');

      addTearDown(() async {
        if (await temp.exists()) {
          await temp.delete(recursive: true);
        }
      });

      final file = File('${temp.path}${Platform.pathSeparator}model.bin');

      await file.writeAsString('dummy');

      final model = Model(id: 'demo', path: file.path);

      const metadata = ModelMetadata(
        name: 'Demo',
        author: 'Test',
        version: '1.0.0',
      );

      final manifest = ModelManifest(
        model: model,
        metadata: metadata,
        format: ModelFormat.gguf,
      );

      final loader = DefaultModelLoader(manifest);

      final result = await loader.load();

      expect(result.isFailure, isTrue);
    });
  });
}
