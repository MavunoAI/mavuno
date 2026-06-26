import 'token.dart';

/// Immutable sequence of model tokens.
final class TokenSequence {
  TokenSequence(Iterable<Token> tokens) : _tokens = List.unmodifiable(tokens);

  final List<Token> _tokens;

  int get length => _tokens.length;

  bool get isEmpty => _tokens.isEmpty;

  bool get isNotEmpty => _tokens.isNotEmpty;

  Token operator [](int index) => _tokens[index];

  List<Token> get tokens => _tokens;

  List<int> get ids => _tokens.map((token) => token.id).toList(growable: false);

  @override
  String toString() => 'TokenSequence(length: $length)';
}
