Architectural Decision Record

ADR-0006 — Foundation Package First

I recommend making foundation the only package allowed to have zero dependencies.

foundation
      │
      ▼
contracts
      │
      ▼
platform
      │
      ▼
common
      │
      ▼
core

Everything else builds upward from there.
