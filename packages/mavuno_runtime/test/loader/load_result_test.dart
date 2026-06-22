import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('LoadResult', () {
    test('creates a failure result', () {
      final result = LoadResult.failure('Model not found.');

      expect(result.isFailure, isTrue);
      expect(result.isSuccess, isFalse);
      expect(result.model, isNull);
      expect(result.message, 'Model not found.');
    });

    test('creates a success result', () {
      const model = Model(id: 'llama-3b', path: '/models/llama-3b.gguf');

      final result = LoadResult.success(model);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.model, equals(model));
      expect(result.message, isNull);
    });
  });
}
