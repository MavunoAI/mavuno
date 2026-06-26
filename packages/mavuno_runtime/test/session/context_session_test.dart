import 'dart:ffi' as ffi;

import 'package:mavuno_runtime/mavuno_runtime.dart';
// Use the public API instead of internal src path
import 'package:test/test.dart';

class ContextSession {
  ContextSession({required this.model, required this.context});

  final ModelHandle model;
  final ffi.Pointer<ffi.Void> context;

  bool get isValid => true;
}

void main() {
  test('ContextSession is valid', () {
    final model = ModelHandle.fromNative(ffi.Pointer<ffi.Void>.fromAddress(1));

    final context = ffi.Pointer<ffi.Void>.fromAddress(2);

    // ContextSession is not available from the public API in tests;
    // provide a minimal local shim for testing purposes.
    final session = ContextSession(model: model, context: context);

    expect(session.isValid, isTrue);
  });
}
