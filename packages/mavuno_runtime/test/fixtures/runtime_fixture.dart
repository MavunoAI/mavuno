import 'package:mavuno_runtime/mavuno_runtime.dart';

/// Shared integration-test fixture.
///
/// Loads the native library once, opens the model once,
/// and exposes a ready-to-use runtime session.
final class RuntimeFixture {
  RuntimeFixture({required this.modelPath});

  final String modelPath;

  late final NativeLibrary nativeLibrary;
  late final LlamaNative native;
  late final Runtime runtime;
  late final RuntimeSession session;

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    nativeLibrary = NativeLibrary.open();

    native = LlamaNativeImpl(nativeLibrary: nativeLibrary);

    session = RuntimeSession(native);

    await session.open(modelPath: modelPath);

    _initialized = true;
  }

  Future<void> dispose() async {
    if (!_initialized) {
      return;
    }

    session.close();

    _initialized = false;
  }
}
