import '../native/llama_native.dart';
import '../native/native_library.dart';

import 'runtime.dart';
import 'runtime_factory.dart';

/// Bootstraps a production Mavuno runtime.
///
/// Owns the native library and runtime wiring, while leaving
/// model/session lifecycle under the caller's control.
final class RuntimeBootstrap {
  RuntimeBootstrap._({required this.nativeLibrary, required this.native, required this.runtime});

  final NativeLibrary nativeLibrary;
  final LlamaNativeImpl native;
  final Runtime runtime;

  factory RuntimeBootstrap.create() {
    final nativeLibrary = NativeLibrary.open();

    final native = LlamaNativeImpl(nativeLibrary: nativeLibrary);

    native.initialize();

    final runtime = createRuntime(native: native, compat: native.compat);

    return RuntimeBootstrap._(nativeLibrary: nativeLibrary, native: native, runtime: runtime);
  }

  void dispose() {
    native.shutdown();
  }
}
