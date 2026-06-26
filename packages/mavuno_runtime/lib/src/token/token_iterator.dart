import 'token.dart';
import 'token_sequence.dart';

/// Iterator over a token sequence.
final class TokenIterator implements Iterator<Token> {
  TokenIterator(TokenSequence sequence) : _tokens = sequence.tokens;

  final List<Token> _tokens;

  int _index = -1;

  @override
  Token get current => _tokens[_index];

  @override
  bool moveNext() {
    if (_index + 1 >= _tokens.length) {
      return false;
    }

    _index++;

    return true;
  }
}
