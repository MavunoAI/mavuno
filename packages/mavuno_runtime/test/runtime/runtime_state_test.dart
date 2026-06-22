import 'package:test/test.dart';
import 'package:mavuno_runtime/mavuno_runtime.dart';

void main() {
  group('RuntimeState', () {
    test('contains expected lifecycle states', () {
      expect(RuntimeState.values, contains(RuntimeState.uninitialized));
      expect(RuntimeState.values, contains(RuntimeState.initializing));
      expect(RuntimeState.values, contains(RuntimeState.ready));
      expect(RuntimeState.values, contains(RuntimeState.busy));
      expect(RuntimeState.values, contains(RuntimeState.shuttingDown));
      expect(RuntimeState.values, contains(RuntimeState.disposed));
    });
  });
}
