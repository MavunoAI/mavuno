import 'dart:ffi';

import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

DynamicLibrary failingLoader(String _) {
  throw Exception('Unable to load native library.');
}

void main() {
  group('NativeLibrary', () {
    test('throws NativeException when library loading fails', () {
      expect(
        () => NativeLibrary.open(loader: failingLoader),
        throwsA(
          isA<NativeException>().having((e) => e.code, 'code', NativeErrorCode.libraryNotFound),
        ),
      );
    });
  });
}
