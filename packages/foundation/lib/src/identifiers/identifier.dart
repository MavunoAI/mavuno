final class Identifier {
  const Identifier(this.value);

  final String value;

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) => other is Identifier && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
