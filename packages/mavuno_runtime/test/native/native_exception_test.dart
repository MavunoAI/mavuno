import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('NativeException', () {
    test('stores code and message', () {
      const exception = NativeException(
        code: NativeErrorCode.libraryNotFound,
        message: 'Unable to load llama library.',
      );

      expect(exception.code, NativeErrorCode.libraryNotFound);

      expect(exception.message, 'Unable to load llama library.');
    });

    test('supports optional cause', () {
      const exception = NativeException(
        code: NativeErrorCode.initializationFailed,
        message: 'Initialization failed.',
        cause: 'Missing symbol',
      );

      expect(exception.cause, 'Missing symbol');
    });
  });
}
