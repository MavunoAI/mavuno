import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('stores exception message', () {
    const exception = BackendException('Initialization failed.');

    expect(exception.message, 'Initialization failed.');
    expect(exception.toString(), contains('Initialization failed.'));
  });
}
