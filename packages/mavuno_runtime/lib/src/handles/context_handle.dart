import 'dart:ffi';

final class ContextHandle {
  const ContextHandle._(this._native);

  final Pointer<Void> _native;

  Pointer<T> cast<T extends NativeType>() => _native.cast<T>();
}
