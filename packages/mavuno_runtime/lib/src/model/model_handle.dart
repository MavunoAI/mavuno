import 'dart:ffi' as ffi;

/// Opaque handle to a native llama.cpp model.
///
/// This class intentionally hides the underlying native pointer from
/// higher layers. Only the native runtime should cast the pointer back
/// to its concrete type.
final class ModelHandle {
  const ModelHandle._(this._pointer);

  final ffi.Pointer<ffi.Void> _pointer;

  factory ModelHandle.fromNative(ffi.Pointer<ffi.Void> pointer) {
    if (pointer.address == 0) {
      throw ArgumentError.value(pointer, 'pointer', 'Model pointer cannot be null.');
    }

    return ModelHandle._(pointer);
  }

  /// Internal use by the native layer only.
  ffi.Pointer<T> cast<T extends ffi.NativeType>() {
    return _pointer.cast<T>();
  }

  bool get isValid => _pointer.address != 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ModelHandle && other._pointer.address == _pointer.address;

  @override
  int get hashCode => _pointer.address.hashCode;

  @override
  String toString() => 'ModelHandle(address: 0x${_pointer.address.toRadixString(16)})';
}
