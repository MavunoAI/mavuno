import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:ffi/ffi.dart';

final class WindowsDllLoader {
  WindowsDllLoader._();

  static final _kernel32 = ffi.DynamicLibrary.open('kernel32.dll');

  static final _setDefaultDllDirectories = _kernel32
      .lookupFunction<ffi.Int32 Function(ffi.Uint32), int Function(int)>(
        'SetDefaultDllDirectories',
      );

  static final _addDllDirectory = _kernel32
      .lookupFunction<
        ffi.Pointer<ffi.Void> Function(ffi.Pointer<Utf16>),
        ffi.Pointer<ffi.Void> Function(ffi.Pointer<Utf16>)
      >('AddDllDirectory');

  static const int loadLibrarySearchDefaultDirs = 0x00001000;

  static void registerDirectory(String directory) {
    if (!Platform.isWindows) {
      return;
    }

    _setDefaultDllDirectories(loadLibrarySearchDefaultDirs);

    final ptr = directory.toNativeUtf16();

    try {
      _addDllDirectory(ptr);
    } finally {
      malloc.free(ptr);
    }
  }
}
