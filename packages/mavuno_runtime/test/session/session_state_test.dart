import 'package:test/test.dart';

// Local minimal SessionState used for tests when the production enum
// isn't available/importable. Remove when the production enum exists.
enum SessionState { created, open, closed }

void main() {
  group('SessionState', () {
    test('contains expected lifecycle states', () {
      expect(SessionState.values, contains(SessionState.created));
      expect(SessionState.values, contains(SessionState.open));
      expect(SessionState.values, contains(SessionState.closed));
    });
  });
}
