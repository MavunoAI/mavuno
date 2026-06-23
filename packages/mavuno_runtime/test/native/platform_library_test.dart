import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('PlatformLibrary', () {
    test('windows library', () {
      expect(PlatformLibrary.libraryName(OperatingSystem.windows), 'llama.dll');
    });

    test('linux library', () {
      expect(PlatformLibrary.libraryName(OperatingSystem.linux), 'libllama.so');
    });

    test('android library', () {
      expect(
        PlatformLibrary.libraryName(OperatingSystem.android),
        'libllama.so',
      );
    });

    test('macos library', () {
      expect(
        PlatformLibrary.libraryName(OperatingSystem.macos),
        'libllama.dylib',
      );
    });
  });
}
