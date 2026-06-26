/// Immutable inference prompt.
final class Prompt {
  const Prompt(this.text);

  final String text;

  bool get isEmpty => text.isEmpty;

  bool get isNotEmpty => text.isNotEmpty;

  @override
  String toString() => text;
}
