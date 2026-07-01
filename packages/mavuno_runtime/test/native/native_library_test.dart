import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('NativeLibrary', () {
    test('throws NativeException when library loading fails', () {
      expect(
        () => NativeLibrary.open(candidates: const ['this_file_does_not_exist.dll']),
        throwsA(
          isA<NativeException>().having((e) => e.code, 'code', NativeErrorCode.libraryNotFound),
        ),
      );
    });
  });
}
