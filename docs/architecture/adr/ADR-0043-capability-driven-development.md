# ADR-0043

## Title

Capability Driven Development

## Status

Accepted

## Decision

The runtime architecture is frozen for the MVP.

Future commits must introduce runtime capabilities rather than architectural changes.

Examples:

- Load model
- Create context
- Tokenize
- Decode
- Generate

## Consequences

Architecture remains stable.

Development velocity increases.

Testing aligns with user-visible capabilities.
