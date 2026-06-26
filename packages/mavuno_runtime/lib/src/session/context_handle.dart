import 'dart:ffi' as ffi;

/// Opaque handle to a native llama.cpp context.
final class ContextHandle {
  const ContextHandle._(this._pointer);

  final ffi.Pointer<ffi.Void> _pointer;

  factory ContextHandle.fromNative(ffi.Pointer<ffi.Void> pointer) {
    return ContextHandle._(pointer);
  }

  /// Returns true if the native pointer is valid.
  bool get isValid => _pointer.address != 0;

  /// Returns the native pointer cast to the requested type.
  ffi.Pointer<T> cast<T extends ffi.NativeType>() {
    return _pointer.cast<T>();
  }
}
