# Coding Rules

## Rule 1

Every domain type has exactly one definition.

## Rule 2

Never redefine domain objects.

Always import them.

## Rule 3

No FFI code outside src/native.

## Rule 4

Engine orchestrates.

Native executes.

Tokenizer tokenizes.

## Rule 5

Every commit must pass:

- dart analyze
- dart test
- integration tests
