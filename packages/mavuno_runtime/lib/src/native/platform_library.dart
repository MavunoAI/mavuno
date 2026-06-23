import 'dart:io';

import 'operating_system.dart';

/// Resolves the platform-specific native library name.
final class PlatformLibrary {
  const PlatformLibrary._();

  /// Detects the current operating system.
  static OperatingSystem current() {
    if (Platform.isWindows) {
      return OperatingSystem.windows;
    }

    if (Platform.isAndroid) {
      return OperatingSystem.android;
    }

    if (Platform.isMacOS) {
      return OperatingSystem.macos;
    }

    return OperatingSystem.linux;
  }

  /// Returns the expected native library filename.
  static String libraryName(OperatingSystem operatingSystem) {
    switch (operatingSystem) {
      case OperatingSystem.windows:
        return 'llama.dll';

      case OperatingSystem.android:
      case OperatingSystem.linux:
        return 'libllama.so';

      case OperatingSystem.macos:
        return 'libllama.dylib';
    }
  }

  /// Returns the library filename for the current platform.
  static String currentLibraryName() {
    return libraryName(current());
  }
}
