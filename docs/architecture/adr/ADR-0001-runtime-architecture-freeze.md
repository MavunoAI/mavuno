# ADR-0001: Runtime Architecture Freeze

Status: Accepted

Date: 2026-06-25

## Context

The Mavuno Runtime has reached a stable architecture after the
implementation of:

- Native Runtime
- Generated FFI Bindings
- Compatibility Layer
- Runtime Engine
- Model Loading
- Tokenizer Service
- Domain Model

The remaining work is capability implementation rather than
architectural evolution.

## Decision

The runtime architecture is frozen.

Future changes to the architecture require a new ADR.

## Consequences

Future commits should add runtime capabilities only:

- Tokenization
- Context creation
- Decode
- Sampling
- Generation

No package restructuring without an ADR.
