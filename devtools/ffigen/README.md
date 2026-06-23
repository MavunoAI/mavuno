# Mavuno FFI Generator

This project generates Dart FFI bindings for the vendored
`llama.cpp` source.

## Prerequisites

- Dart SDK
- Vendored `third_party/llama.cpp`
- `include/llama.h`

## Generate bindings

```bash
dart pub get
dart run tool/generate.dart
```

Generated output:

```
packages/mavuno_runtime/lib/src/native/ffi/llama_bindings.dart
```

Do not edit generated bindings manually.

All changes must originate from `llama.h`.
