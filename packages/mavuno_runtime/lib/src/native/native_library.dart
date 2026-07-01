import 'dart:ffi';
import 'dart:io';

import 'native_exception.dart';
import 'windows/windows_dll_loader.dart';

typedef LibraryLoader = DynamicLibrary Function(String libraryName);

/// Loads and owns the native shared library.
///
/// This is the only class allowed to call
/// [DynamicLibrary.open].
final class NativeLibrary {
  NativeLibrary._(this._library);

  final DynamicLibrary _library;
  DynamicLibrary get dynamicLibrary => _library;
  factory NativeLibrary.open({List<String>? candidates}) {
    final searchPaths =
        candidates ??
        const [
          //
          // Running from repository root
          //
          'third_party/llama.cpp/build/bin/Release/llama.dll',
          'third_party/llama.cpp/build/bin/llama.dll',

          //
          // Running from packages/mavuno_runtime
          //
          '../../third_party/llama.cpp/build/bin/Release/llama.dll',
          '../../third_party/llama.cpp/build/bin/llama.dll',

          //
          // Installed runtime
          //
          'native/windows/llama.dll',
          '../../native/windows/llama.dll',

          //
          // PATH
          //
          'llama.dll',
        ];

    Object? lastError;

    for (final candidate in searchPaths) {
      try {
        final file = File(candidate);

        if (!file.existsSync()) {
          continue;
        }

        final absolute = file.absolute;

        WindowsDllLoader.registerDirectory(absolute.parent.path);

        final library = DynamicLibrary.open(absolute.path);

        return NativeLibrary._(library);
      } catch (error) {
        lastError = error;
      }
    }

    throw NativeException(
      code: NativeErrorCode.libraryNotFound,
      message:
          'Unable to load llama.dll.\n'
          'Search paths:\n'
          '${searchPaths.join('\n')}',
      cause: lastError,
    );
  }

  Pointer<T> lookup<T extends NativeType>(String symbol) {
    try {
      return _library.lookup<T>(symbol);
    } on Object catch (error) {
      throw NativeException(
        code: NativeErrorCode.symbolNotFound,
        message: 'Native symbol not found: $symbol',
        cause: error,
      );
    }
  }
}
