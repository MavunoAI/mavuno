import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('supports all expected operating systems', () {
    expect(
      OperatingSystem.values,
      containsAll([
        OperatingSystem.windows,
        OperatingSystem.linux,
        OperatingSystem.macos,
        OperatingSystem.android,
      ]),
    );
  });
}
