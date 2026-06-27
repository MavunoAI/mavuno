# Mavuno AI Model Repository

This directory contains all GGUF models used by the Mavuno AI Runtime.

Large model files **must not** be committed to Git. They should be downloaded into this directory using the documented commands.

---

## Directory Layout

```text
models/
│
├── README.md
│
├── tinyllama/
│   ├── tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
│   └── manifest.json
│
├── qwen/
│
├── gemma/
│
├── mistral/
│
└── agriculture/
```

Each model lives inside its own directory.

Future releases may include:

- manifest.json
- tokenizer metadata
- checksum
- benchmark results

---

# Runtime Validation Model

The current runtime validation model is:

```
TinyLlama-1.1B-Chat-v1.0
```

Quantization:

```
Q4_K_M
```

Purpose:

- Runtime validation
- Integration testing
- Smoke testing
- Benchmarking

This model is **not** intended to be the final production model for Mavuno AI.

---

# Download

The recommended download method is the Hugging Face CLI.

Windows:

```powershell
C:\Users\<USERNAME>\AppData\Local\Programs\Python\Python314\Scripts\hf.exe download `
TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF `
tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf `
--local-dir models/tinyllama
```

Linux/macOS:

```bash
hf download \
TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF \
tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
--local-dir models/tinyllama
```

---

# Verify

Windows:

```powershell
Get-FileHash `
models\tinyllama\tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf `
-Algorithm SHA256
```

Linux/macOS:

```bash
sha256sum \
models/tinyllama/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
```

---

# Git

GGUF models are intentionally excluded from Git.

Ensure your `.gitignore` contains:

```gitignore
models/**/*.gguf
```

---

# Runtime

The runtime expects models to reside beneath the `models/` directory.

Example:

```text
models/tinyllama/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
```

---

# Future Models

The planned progression for Mavuno AI is:

1. TinyLlama 1.1B
2. Qwen2.5 3B
3. Agriculture Fine-tuned Model
4. Mavuno Production Model

TinyLlama is used exclusively to validate the runtime while larger and domain-specialized models are evaluated.
