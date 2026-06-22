import 'dart:io';

import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('FileModelLocator', () {
    test('returns null when directory does not exist', () async {
      final locator = FileModelLocator(
        searchDirectories: [Directory('does_not_exist')],
      );

      final result = await locator.locate('llama');

      expect(result, isNull);
    });

    test('finds a matching gguf model', () async {
      final temp = await Directory.systemTemp.createTemp('mavuno_test_');

      addTearDown(() async {
        if (await temp.exists()) {
          await temp.delete(recursive: true);
        }
      });

      final model = File('${temp.path}${Platform.pathSeparator}llama-3b.gguf');

      await model.writeAsString('dummy');

      final locator = FileModelLocator(searchDirectories: [temp]);

      final result = await locator.locate('llama');

      expect(result, isNotNull);
      expect(result, model.path);
    });

    test('ignores non-gguf files', () async {
      final temp = await Directory.systemTemp.createTemp('mavuno_test_');

      addTearDown(() async {
        if (await temp.exists()) {
          await temp.delete(recursive: true);
        }
      });

      final text = File('${temp.path}${Platform.pathSeparator}notes.txt');

      await text.writeAsString('hello');

      final locator = FileModelLocator(searchDirectories: [temp]);

      final result = await locator.locate('notes');

      expect(result, isNull);
    });
  });
}
