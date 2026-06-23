import 'dart:ffi';

import 'native_exception.dart';
import 'platform_library.dart';

typedef LibraryLoader = DynamicLibrary Function(String libraryName);

/// Loads and owns the native shared library.
///
/// This is the only class allowed to call
/// [DynamicLibrary.open].
final class NativeLibrary {
  NativeLibrary._(this._library);

  final DynamicLibrary _library;

  factory NativeLibrary.open({LibraryLoader? loader}) {
    final libraryName = PlatformLibrary.currentLibraryName();

    loader ??= DynamicLibrary.open;

    try {
      return NativeLibrary._(loader(libraryName));
    } on Object catch (error) {
      throw NativeException(
        code: NativeErrorCode.libraryNotFound,
        message: 'Unable to load native library: $libraryName',
        cause: error,
      );
    }
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
