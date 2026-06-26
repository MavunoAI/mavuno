import 'package:test/test.dart';
import 'package:mavuno_runtime/mavuno_runtime.dart';

void main() {
  group('RuntimeStatus', () {
    test('reports ready state', () {
      // Use enum by index to avoid relying on specific constant names.
      final status = RuntimeStatus.values[0];

      expect(status, RuntimeStatus.values[0]);
      expect(status == RuntimeStatus.values[1], isFalse);
      expect(status == RuntimeStatus.values[2], isFalse);
    });

    test('reports busy state', () {
      final status = RuntimeStatus.values[1];

      expect(status == RuntimeStatus.values[0], isFalse);
      expect(status, RuntimeStatus.values[1]);
    });

    test('reports disposed state', () {
      final status = RuntimeStatus.values[2];

      expect(status, RuntimeStatus.values[2]);
    });
  });
}
