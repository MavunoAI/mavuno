import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('backend lifecycle states exist', () {
    expect(
      BackendState.values,
      containsAll([
        BackendState.uninitialized,
        BackendState.initialized,
        BackendState.disposed,
      ]),
    );
  });
}
