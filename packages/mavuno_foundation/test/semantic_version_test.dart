import 'package:mavuno_foundation/mavuno_foundation.dart';
import 'package:test/test.dart';

void main() {
  test('Version comparison', () {
    const a = SemanticVersion(major: 1, minor: 0, patch: 0);

    const b = SemanticVersion(major: 1, minor: 1, patch: 0);

    expect(a.compareTo(b), lessThan(0));
  });
}
