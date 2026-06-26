import 'dart:ffi' as ffi;

import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  test('ModelHandle reports valid pointer', () {
    final pointer = ffi.Pointer<ffi.Void>.fromAddress(1);

    final handle = ModelHandle.fromNative(pointer);

    expect(handle.isValid, isTrue);
  });

  test('ModelHandle rejects null pointer', () {
    expect(() => ModelHandle.fromNative(ffi.Pointer<ffi.Void>.fromAddress(0)), throwsArgumentError);
  });
}
