# Engine

The engine layer owns the AI lifecycle.

Responsibilities:

- Backend initialization
- Backend shutdown
- Model loading (future)
- Context creation (future)
- Inference execution (future)

The engine does **not** perform FFI.

Native interop belongs exclusively to `src/native`.
