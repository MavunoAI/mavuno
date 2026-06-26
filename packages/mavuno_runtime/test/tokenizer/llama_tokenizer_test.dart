void main() {}

class ContextSession {}

class Prompt {}

abstract class LlamaNative {
  TokenSequence tokenize(ContextSession session, Prompt prompt);
}

class TokenSequence {
  final List<int> tokens;

  const TokenSequence(this.tokens);
}

class FakeNative implements LlamaNative {
  bool called = false;

  @override
  TokenSequence tokenize(ContextSession session, Prompt prompt) {
    called = true;

    return TokenSequence(const []);
  }

  // Remaining methods throw
  // UnimplementedError for now.
}
