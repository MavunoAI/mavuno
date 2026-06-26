/// Represents one model token.
final class Token {
  const Token(this.id);

  final int id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Token && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Token($id)';
}
