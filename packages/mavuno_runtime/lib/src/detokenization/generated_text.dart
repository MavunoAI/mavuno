/// Immutable decoded model output.
final class GeneratedText {
  const GeneratedText(this.value);

  final String value;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;

  @override
  String toString() => value;
}
